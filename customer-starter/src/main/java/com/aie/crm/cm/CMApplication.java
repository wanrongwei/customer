package com.aie.crm.cm;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;

import com.aie.common.annotation.EnableFlyingServer;
import com.aie.common.annotation.EnableSmartFrame;
import com.aie.common.config.WebCommonConfig;

@SpringBootApplication
@ComponentScan({ "com.asiainfo.crm.cm", "com.asiainfo.crm.cm.vo", "com.asiainfo.crm.common",
		"com.ai.appframe2", "com.aie.common" })
@EnableFlyingServer
@EnableSmartFrame
@Import({ WebCommonConfig.class })
public class CMApplication {
	public static void main(String[] args) {
		System.setProperty("tenant.id", "21"); // TODO 后续从配置中读取
		SpringApplication.run(CMApplication.class, args);
	}
}
