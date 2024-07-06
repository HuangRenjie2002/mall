package pers.hrj.item.elastic;


import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.json.jackson.JacksonJsonpMapper;
import co.elastic.clients.transport.ElasticsearchTransport;
import co.elastic.clients.transport.rest_client.RestClientTransport;
import org.apache.http.HttpHost;
import org.elasticsearch.client.RestClient;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.io.StringReader;


public class ElasticIndexTest {

    //    private RestClient client;
    private ElasticsearchClient esClient;

    private static final String MAPPING_TEMPLATE = """
            {
              "mappings": {
                "properties": {
                  "id":{
                    "type": "keyword"
                  },
                  "name":{
                    "type": "text",
                    "analyzer": "ik_smart"
                  },
                  "price":{
                    "type": "integer"
                  },
                  "image":{
                    "type": "keyword",
                    "index": false
                  },
                  "category":{
                    "type": "keyword"
                  },
                  "brand":{
                    "type": "keyword"
                  },
                  "sold":{
                    "type": "integer"
                  },
                  "commentCount":{
                    "type": "integer",
                    "index": false
                  },
                  "isAD":{
                    "type": "boolean"
                  },
                  "updateTime":{
                    "type": "date"
                  }
                }
              }
            }
            """;

    @BeforeEach
    void setUp() {
        RestClient client = RestClient.builder(new HttpHost("localhost", 9200)).build();
        ElasticsearchTransport transport = new RestClientTransport(client, new JacksonJsonpMapper());
        esClient = new ElasticsearchClient(transport);
    }

//    @AfterEach
//    void tearDown() throws IOException {
//        if (esClient != null) {esClient
//            esClient.close();
//        }
//    }

    @Test
    void testConnect() {
        System.out.println(esClient);
    }

    @Test
    void testCreateIndex() throws IOException {
//        CreateIndexRequest request = CreateIndexRequest.of(builder -> builder.index("items").withJson(new StringReader(MAPPING_TEMPLATE)));
        esClient.indices().create(c->c.index("items").withJson(new StringReader(MAPPING_TEMPLATE)));
    }

    @Test
    void testGetIndex() throws IOException {
        System.out.println(esClient.indices().exists(e -> e.index("items")).value());
        System.out.println(esClient.indices().get(g->g.index("items")).result());
    }

    @Test
    void testDelIndex() throws IOException {
//        System.out.println(esClient.delete(d -> d.index("items")));
        esClient.indices().delete(d-> d.index("item"));
    }
}
