package pers.hrj.pay;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import pers.hrj.api.config.DefaultFeignConfig;

@MapperScan("pers.hrj.pay.mapper")
@SpringBootApplication
@EnableFeignClients(basePackages = "pers.hrj.api.client",defaultConfiguration = DefaultFeignConfig.class)
public class PayApplication {
    public static void main(String[] args) {
        SpringApplication.run(PayApplication.class, args);
    }
}