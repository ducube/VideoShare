package com.video.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MyWebConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        # 修改为自己的电脑绝对路径
        registry.addResourceHandler("/static/video/**").addResourceLocations("file:C:\\disk_D\\idea_item\\springboot+vue\\backend\\src\\main\\resources\\static\\video\\");
        registry.addResourceHandler("/static/uimages/**").addResourceLocations("file:C:\\disk_D\\idea_item\\springboot+vue\\backend\\src\\main\\resources\\static\\uimages\\");
    }
}
