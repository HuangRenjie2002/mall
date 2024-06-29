package pers.hrj.api.config;

import feign.Logger;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.context.annotation.Bean;
import pers.hrj.common.utils.UserContext;

public class DefaultFeignConfig {
    @Bean
    public Logger.Level feignLoggerLevel(){
        return Logger.Level.FULL;
    }

    @Bean
    public RequestInterceptor userInfoRequestInterceptor(){
        return requestTemplate -> {
            Long userid = UserContext.getUser();
            if(userid != null) {
                requestTemplate.header("user-info", userid.toString());
            }
        };
    }
}
