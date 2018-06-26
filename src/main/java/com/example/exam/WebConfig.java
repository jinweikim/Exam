package com.example.exam;

import com.example.exam.Interceptor.SessionInterceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebConfig extends WebMvcConfigurerAdapter{

    private final static Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
//        logger.info("添加拦截器");
//        registry.addInterceptor(new SessionInterceptor()).excludePathPatterns("/account/login");
//        registry.addInterceptor(new SessionInterceptor()).excludePathPatterns("/account/valid");
        registry.addInterceptor(new SessionInterceptor()).addPathPatterns("/**")
                .excludePathPatterns("/error")
                .excludePathPatterns("/account/valid")
                .excludePathPatterns("/account/user")
                .excludePathPatterns("/js/*")
                .excludePathPatterns("/css/*")
                .excludePathPatterns("/lib/**")
                .excludePathPatterns("/images/*");
        super.addInterceptors(registry);
    }

   @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/css**").addResourceLocations("classpath:/css/");
        super.addResourceHandlers(registry);
    }
}
