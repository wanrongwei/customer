package com.asiainfo.crm.cm.teaminvoke.in.factory.impl;

import com.ai.appframe2.service.ServiceFactory;
import com.asiainfo.crm.cm.common.config.CmConfigLoader;
import com.asiainfo.crm.cm.common.config.bean.CmTeamInvokeService;
import com.asiainfo.crm.cm.teaminvoke.in.factory.CmInterAdapterFactory;
import com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.ICmTeamInvokeInSV;

public class CmDefaultInterAdapterFactoryImpl extends CmInterAdapterFactory {

	/*
	 * 默认直接根据平台的服务工厂获取实现
	 * (non-Javadoc)
	 * @see com.asiainfo.crm.cm.teaminvoke.in.factory.CmInterAdapterFactory#getService(java.lang.Class)
	 */
	public ICmTeamInvokeInSV getService() throws Exception {
		CmTeamInvokeService service = CmConfigLoader.getInstance().getTeamInvokeService(ICmTeamInvokeInSV.class);
		if (service != null) {
			return (ICmTeamInvokeInSV) ServiceFactory.getSeviceOfLocal(service.getImplService());
		}
		return (ICmTeamInvokeInSV) ServiceFactory.getSeviceOfLocal(ICmTeamInvokeInSV.class);
	}
}
