package com.xeasywork.tinyflow;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class XEasyWorkApplication {

    public static void main(String[] args) {
        SpringApplication.run(XEasyWorkApplication.class, args);
    }

}
