package pers.hrj.user;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import pers.hrj.api.config.DefaultFeignConfig;

@MapperScan("pers.hrj.user.mapper")
@SpringBootApplication(scanBasePackages = {"pers.hrj"})
@EnableFeignClients(basePackages = "pers.hrj.api.client",defaultConfiguration = DefaultFeignConfig.class)
public class UserApplication {
    public static void main(String[] args) {
        SpringApplication.run(UserApplication.class, args);
    }
}