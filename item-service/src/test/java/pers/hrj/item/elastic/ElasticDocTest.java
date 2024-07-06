package pers.hrj.item.elastic;

import cn.hutool.core.bean.BeanUtil;
import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch._types.Script;
import co.elastic.clients.elasticsearch.core.BulkRequest;
import co.elastic.clients.elasticsearch.core.UpdateRequest;
import co.elastic.clients.json.jackson.JacksonJsonpMapper;
import co.elastic.clients.transport.ElasticsearchTransport;
import co.elastic.clients.transport.rest_client.RestClientTransport;
import co.elastic.clients.util.ObjectBuilder;
import com.baomidou.mybatisplus.core.toolkit.support.SFunction;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.http.HttpHost;
import org.elasticsearch.client.RestClient;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import pers.hrj.common.utils.CollUtils;
import pers.hrj.item.domain.po.Item;
import pers.hrj.item.domain.po.ItemDoc;
import pers.hrj.item.service.IItemService;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@SpringBootTest(properties = "spring.profiles.active=local")
public class ElasticDocTest {

    private ElasticsearchClient esClient;
    @Autowired
    private IItemService itemService;

    @BeforeEach
    void setUp() {
        RestClient client = RestClient.builder(new HttpHost("localhost", 9200)).build();
        ElasticsearchTransport transport = new RestClientTransport(client, new JacksonJsonpMapper());
        esClient = new ElasticsearchClient(transport);
    }

    @Test
    void testIndexDoc() throws IOException {
        Item item = itemService.getById(317578);
        ItemDoc itemDoc = BeanUtil.copyProperties(item, ItemDoc.class);
        itemDoc.setPrice(29900);
        System.out.println(esClient.index(i -> i.index("items").id(itemDoc.getId()).document(itemDoc)));
    }

    @Test
    void testGetDoc() throws IOException {
        System.out.println(esClient.get(g -> g.index("items").id("317578"), ItemDoc.class).source());
    }

    @Test
    void testDelDoc() throws IOException {
        esClient.delete(d->d.index("items").id(String.valueOf(317578)));
    }

    @Test
    void testUpdateDoc() throws IOException {
        HashMap<String, Integer> map = new HashMap<>();
        map.put("price", 30000);
        System.out.println(esClient.update(u -> u.index("items").id("317578").doc(map), ItemDoc.class));
    }

    @Test
    void testBulk() throws IOException {
        int pageNo = 1;
        int size = 1000;
        while (true) {
            Page<Item> page = itemService.lambdaQuery().eq(Item::getStatus, 1).page(new Page<>(pageNo, size));
            List<Item> records = page.getRecords();
            List<Item> items = page.getRecords();
            if (CollUtils.isEmpty(items)) {
                return;
            }
            BulkRequest.Builder builder = new BulkRequest.Builder();
            records.stream()
                    .map(record -> BeanUtil.copyProperties(record, ItemDoc.class))
                    .forEach(itemDoc -> builder.operations(o -> o.index(i -> i.index("items").id(itemDoc.getId()).document(itemDoc))));
            esClient.bulk(builder.build());
            pageNo++;
        }
    }
}
