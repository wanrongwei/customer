package com.aie.cm;

import com.ai.common.i18n.CrmLocaleFactory;

public class CrmLocaleTest {

	public static void main(String[] args) {
		String resource = CrmLocaleFactory.getResource("TEST");
		System.out.println(resource);
	}
}
