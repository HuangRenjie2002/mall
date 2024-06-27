package pers.hrj.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.List;

@Data
@ConfigurationProperties(prefix = "mll.auth")
public class AuthProperties {
    private List<String> includePaths;
    private List<String> excludePaths;
}
