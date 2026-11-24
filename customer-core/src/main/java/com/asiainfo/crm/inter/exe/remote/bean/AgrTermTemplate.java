package com.asiainfo.crm.inter.exe.remote.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class AgrTermTemplate implements Serializable {
	
	private static final long serialVersionUID = -3278891328394305308L;
	
	private String templateStatus;
	private long state;
	private long operatorId;
	private String isNewver;
	private Timestamp statusDate;
	private Timestamp expDate;
	private String termTitle;
	private long createOpId;
	private String doneCode;
	private long organizationId;
	private long opId;
	private String description;
	private String termCode;
	private long termTemplateId;
	private Timestamp effDate;
	private String agrDocUrl;
	private long orgId;
	private long createOrgId;
	private String ownerType;
	private long upTermTemplateId;
	private String versionCode;
	private Timestamp doneDate;
	private Timestamp createDate;
	private long isHistory;
	private String termType;
	
	public String getTemplateStatus() {
		return templateStatus;
	}
	public void setTemplateStatus(String templateStatus) {
		this.templateStatus = templateStatus;
	}
	public long getState() {
		return state;
	}
	public void setState(long state) {
		this.state = state;
	}
	public long getOperatorId() {
		return operatorId;
	}
	public void setOperatorId(long operatorId) {
		this.operatorId = operatorId;
	}
	public String getIsNewver() {
		return isNewver;
	}
	public void setIsNewver(String isNewver) {
		this.isNewver = isNewver;
	}
	public Timestamp getStatusDate() {
		return statusDate;
	}
	public void setStatusDate(Timestamp statusDate) {
		this.statusDate = statusDate;
	}
	public Timestamp getExpDate() {
		return expDate;
	}
	public void setExpDate(Timestamp expDate) {
		this.expDate = expDate;
	}
	public String getTermTitle() {
		return termTitle;
	}
	public void setTermTitle(String termTitle) {
		this.termTitle = termTitle;
	}
	public long getCreateOpId() {
		return createOpId;
	}
	public void setCreateOpId(long createOpId) {
		this.createOpId = createOpId;
	}
	public String getDoneCode() {
		return doneCode;
	}
	public void setDoneCode(String doneCode) {
		this.doneCode = doneCode;
	}
	public long getOrganizationId() {
		return organizationId;
	}
	public void setOrganizationId(long organizationId) {
		this.organizationId = organizationId;
	}
	public long getOpId() {
		return opId;
	}
	public void setOpId(long opId) {
		this.opId = opId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTermCode() {
		return termCode;
	}
	public void setTermCode(String termCode) {
		this.termCode = termCode;
	}
	public long getTermTemplateId() {
		return termTemplateId;
	}
	public void setTermTemplateId(long termTemplateId) {
		this.termTemplateId = termTemplateId;
	}
	public Timestamp getEffDate() {
		return effDate;
	}
	public void setEffDate(Timestamp effDate) {
		this.effDate = effDate;
	}
	public String getAgrDocUrl() {
		return agrDocUrl;
	}
	public void setAgrDocUrl(String agrDocUrl) {
		this.agrDocUrl = agrDocUrl;
	}
	public long getOrgId() {
		return orgId;
	}
	public void setOrgId(long orgId) {
		this.orgId = orgId;
	}
	public long getCreateOrgId() {
		return createOrgId;
	}
	public void setCreateOrgId(long createOrgId) {
		this.createOrgId = createOrgId;
	}
	public String getOwnerType() {
		return ownerType;
	}
	public void setOwnerType(String ownerType) {
		this.ownerType = ownerType;
	}
	public long getUpTermTemplateId() {
		return upTermTemplateId;
	}
	public void setUpTermTemplateId(long upTermTemplateId) {
		this.upTermTemplateId = upTermTemplateId;
	}
	public String getVersionCode() {
		return versionCode;
	}
	public void setVersionCode(String versionCode) {
		this.versionCode = versionCode;
	}
	public Timestamp getDoneDate() {
		return doneDate;
	}
	public void setDoneDate(Timestamp doneDate) {
		this.doneDate = doneDate;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public long getIsHistory() {
		return isHistory;
	}
	public void setIsHistory(long isHistory) {
		this.isHistory = isHistory;
	}
	public String getTermType() {
		return termType;
	}
	public void setTermType(String termType) {
		this.termType = termType;
	}

}
