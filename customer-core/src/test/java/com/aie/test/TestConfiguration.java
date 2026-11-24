package com.aie.test;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@ComponentScan({ "com.asiainfo.crm.cm", "com.asiainfo.crm.cm.vo", "com.asiainfo.crm.common",
"com.ai.appframe2.complex.cache.util" })
@Configuration
public class TestConfiguration {

}
