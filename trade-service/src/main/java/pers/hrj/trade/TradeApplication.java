package pers.hrj.trade;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import pers.hrj.api.config.DefaultFeignConfig;

@MapperScan("pers.hrj.trade.mapper")
@SpringBootApplication
@EnableFeignClients(basePackages = "pers.hrj.api.client",defaultConfiguration = DefaultFeignConfig.class)
public class TradeApplication {
    public static void main(String[] args) {
        SpringApplication.run(TradeApplication.class, args);
    }
}