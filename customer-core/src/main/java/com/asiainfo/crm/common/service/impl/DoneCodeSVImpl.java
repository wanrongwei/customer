package com.asiainfo.crm.common.service.impl;

import java.rmi.RemoteException;
import java.sql.Timestamp;

import com.ai.appframe2.common.ServiceManager;
import com.asiainfo.crm.common.service.interfaces.IDoneCodeSV;

/**
 * Copyright: Asiainfo-Linkage
 * 
 * @desc: DONE_CODE与ORACLE系统时间类
 * @version: v1.0
 * @author: lvyh
 * @date: 2010.12.20
 */
public class DoneCodeSVImpl implements IDoneCodeSV
{

	public long getDoneCode() throws Exception, RemoteException
	{
		long doneCode = ServiceManager.getDoneCode();
		return doneCode;
	}

	public Timestamp getDoneDate() throws Exception, RemoteException
	{
		Timestamp date = ServiceManager.getIdGenerator().getSysDate(); // 获取数据库时间
		return date;
	}

}
