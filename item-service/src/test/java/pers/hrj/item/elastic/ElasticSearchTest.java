package pers.hrj.item.elastic;


import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch._types.SortOrder;
import co.elastic.clients.elasticsearch._types.aggregations.Aggregate;
import co.elastic.clients.elasticsearch.core.SearchResponse;
import co.elastic.clients.elasticsearch.core.search.Hit;
import co.elastic.clients.json.JsonData;
import co.elastic.clients.json.jackson.JacksonJsonpMapper;
import co.elastic.clients.transport.ElasticsearchTransport;
import co.elastic.clients.transport.rest_client.RestClientTransport;
import org.apache.http.HttpHost;
import org.elasticsearch.client.RestClient;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import pers.hrj.item.domain.po.ItemDoc;

import java.io.IOException;
import java.util.List;
import java.util.Map;


public class ElasticSearchTest {

    private ElasticsearchClient esClient;


    @BeforeEach
    void setUp() {
        RestClient client = RestClient.builder(new HttpHost("localhost", 9200)).build();
        ElasticsearchTransport transport = new RestClientTransport(client, new JacksonJsonpMapper());
        esClient = new ElasticsearchClient(transport);
    }

    @Test
    void testMatchAll() throws IOException {
        SearchResponse<ItemDoc> response = esClient.search(s -> s.query(q -> q.matchAll(t -> t)).index("items"), ItemDoc.class);
        parseResult(response);
    }

    private static void parseResult(SearchResponse<ItemDoc> response) {
        System.out.println(response.hits().total().value());
        List<Hit<ItemDoc>> hits = response.hits().hits();
        for (Hit<ItemDoc> hit : hits) {
//            System.out.println(hit.highlight());
            System.out.println(hit.source());
        }
    }

    @Test
    void testSearch() throws IOException {
        SearchResponse<ItemDoc> response = esClient.search(s -> s.query(query -> query
                .bool(b -> b.must(q -> q.match(m -> m.field("name").query("脱脂牛奶")))
                        .filter(q -> q.term(t -> t.field("brand").value("德亚")))
                        .filter(q -> q.range(r -> r.field("price").lt(JsonData.of(10000)))))), ItemDoc.class);
        parseResult(response);
    }

    @Test
    void testSortAndPage() throws IOException {
        int pageNum = 2;
        int pageSize = 5;
        SearchResponse<ItemDoc> response = esClient.search(s -> s
                .query(q -> q.matchAll(t -> t)).index("items")
                .from((pageNum - 1) * pageSize).size(pageSize)
                .sort(sort -> sort.field(f->f.field("sold").order(SortOrder.Desc)))
                .sort(sort -> sort.field(f->f.field("price").order(SortOrder.Asc))),
                ItemDoc.class);
        parseResult(response);
    }

    @Test
    void testHighlight() throws IOException {
        SearchResponse<ItemDoc> response = esClient.search(search -> search.index("items")
                        .query(query -> query.match(match -> match.field("name").query("脱脂牛奶")))
                        .highlight(highlight -> highlight.fields("name", f -> f.preTags("<em>").postTags("</em>")))
                , ItemDoc.class);
        parseResult(response);
    }

    @Test
    void testAgg() throws IOException {
        SearchResponse<ItemDoc> response = esClient.search(search -> search
                        .index("items")
                        .aggregations("brandAgg", agg -> agg.terms(t -> t.field("brand").size(10)))
                        .size(0)
                , ItemDoc.class);
        Map<String, Aggregate> aggregations = response.aggregations();
        System.out.println(aggregations.get("brandAgg"));
//        JSONObject brandAgg = JSONObject.parseObject(aggregations.get("brandAgg")._get().toString());

//        System.out.println(brandAgg);
    }
}
