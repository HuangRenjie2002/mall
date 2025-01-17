package pers.hrj.cart.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties("mall.cart")
public class CartProperties {
    private Integer maxItems;
}
