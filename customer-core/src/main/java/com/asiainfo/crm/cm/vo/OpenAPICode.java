package com.asiainfo.crm.cm.vo;
import com.fasterxml.jackson.annotation.JsonAlias;

import com.ai.common.i18n.CrmLocaleFactory;

public enum OpenAPICode {
	/**
	 * 客户管理1001001
	 * 资源管理1002001
	 * 订单管理1003001
	 * 产品实例1004001
	 * 其他 1009001
	 */
	SUCCESS("sumit success", 0), SYSTEM_EXCEPTION("APS-1", -1), CUSTOMER_STATUS("customer status is error", 1001001),
	LOGIN_FAIL("Login failed.", 1001002),
	STANDARD_FAIL("Operation failed.", 2);

	 @JsonAlias("MESSAGE")
     private String message;
	 @JsonAlias("CODE")
     private Integer code;

	private OpenAPICode(String message, Integer code) {
		this.message = message;
		this.code = code;
	}

	/**
	 * @return message
	 */
	public String getMessage() {
		String inMessage = CrmLocaleFactory.getResource("APS" + this.code);
		if (inMessage != null && inMessage.length() > 0) {
			return inMessage;
		}
		return message;
	}

	/**
	 * @param message 要设置的 message
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * @return code
	 */
	public Integer getCode() {
		return code;
	}

	/**
	 * @param code 要设置的 code
	 */
	public void setCode(Integer code) {
		this.code = code;
	}

	public static void main(String[] args) {
		System.out.println(OpenAPICode.SUCCESS.getMessage());
		System.out.println(OpenAPICode.SUCCESS.getCode());
		System.out.println(OpenAPICode.LOGIN_FAIL.getMessage());
		System.out.println(OpenAPICode.LOGIN_FAIL.getCode());
	}
}
