package pers.hrj.gateway.filters;

import lombok.Data;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.OrderedGatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.stereotype.Component;

import java.util.List;

//@Component
public class CustomGatewayFilterFactory extends AbstractGatewayFilterFactory<CustomGatewayFilterFactory.Config> {
    @Override
    public GatewayFilter apply(CustomGatewayFilterFactory.Config config) {
        return new OrderedGatewayFilter((exchange, chain) -> {
            System.out.println(config.getA());
            System.out.println(config.getB());
            System.out.println(config.getC());
            return chain.filter(exchange);
        }, 1);
    }

    @Data
    public static class Config{
        private String a;
        private String b;
        private String c;
    }

    @Override
    public List<String> shortcutFieldOrder() {
        return List.of("a","b","c");
    }

    public CustomGatewayFilterFactory(){
        super(Config.class);
    }
}
