package com.asiainfo.crm.cm.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan({"com.asiainfo.crm.cm.evaluation.mapper"})
public class CmMapperConfig {
}
