package com.asiainfo.crm.inter.exe.remote.bean;

import java.io.Serializable;

public class WholesaleRouterCfg implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String regionId;

	private String wsName;

	private long orgId;

	private long opId;

	private long wsAccountId;

	private String state;

	private String tenantId;

	private String operatorCode;

	private String centerId;

	private long wsCustId;

	private long wsId;

	private String serviceOperatorCode;

	public String getRegionId() {
		return regionId;
	}

	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}

	public String getWsName() {
		return wsName;
	}

	public void setWsName(String wsName) {
		this.wsName = wsName;
	}

	public long getOrgId() {
		return orgId;
	}

	public void setOrgId(long orgId) {
		this.orgId = orgId;
	}

	public long getOpId() {
		return opId;
	}

	public void setOpId(long opId) {
		this.opId = opId;
	}

	public long getWsAccountId() {
		return wsAccountId;
	}

	public void setWsAccountId(long wsAccountId) {
		this.wsAccountId = wsAccountId;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getOperatorCode() {
		return operatorCode;
	}

	public void setOperatorCode(String operatorCode) {
		this.operatorCode = operatorCode;
	}

	public String getCenterId() {
		return centerId;
	}

	public void setCenterId(String centerId) {
		this.centerId = centerId;
	}

	public long getWsCustId() {
		return wsCustId;
	}

	public void setWsCustId(long wsCustId) {
		this.wsCustId = wsCustId;
	}

	public long getWsId() {
		return wsId;
	}

	public void setWsId(long wsId) {
		this.wsId = wsId;
	}

	public String getServiceOperatorCode() {
		return serviceOperatorCode;
	}

	public void setServiceOperatorCode(String serviceOperatorCode) {
		this.serviceOperatorCode = serviceOperatorCode;
	}
	
	
	
}
