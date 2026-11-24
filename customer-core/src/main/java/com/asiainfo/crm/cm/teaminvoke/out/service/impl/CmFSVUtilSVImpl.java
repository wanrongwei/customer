package com.asiainfo.crm.cm.teaminvoke.out.service.impl;

import java.util.Map;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.common.DataStructInterface;
import com.asiainfo.crm.cm.model.ivalues.IVOCustValue;
import com.asiainfo.crm.cm.teaminvoke.out.busimodel.IConvertBusiModel;
import com.asiainfo.crm.cm.teaminvoke.out.busimodel.impl.AbstractVOCustCvtBusiModelImpl;
import com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICmFSVUtilSV;
import com.asiainfo.crm.cm.teaminvoke.out.util.CmFSVUtil;

/**
 * CmFSVUtil 工具类方法服务实现
 * 直接调用 CmFSVUtil 的静态方法
 * 
 * @author system
 * @date 2026-01-26
 */
public class CmFSVUtilSVImpl implements ICmFSVUtilSV {

	@Override
	public Object map2Object(Class<?> clazz, Map<?,?> mapInfo) throws Exception {
		return CmFSVUtil.map2Object(clazz, mapInfo);
	}

	@Override
	public DataContainer makeParam(Map paramMap) throws Exception {
		return CmFSVUtil.makeParam(paramMap);
	}

	@Override
	public Map value2Map(DataStructInterface valueInfo) throws Exception {
		return CmFSVUtil.value2Map(valueInfo);
	}

	@Override
	public Map value2Map(DataStructInterface valueInfo, boolean flag) throws Exception {
		return CmFSVUtil.value2Map(valueInfo, flag);
	}

	@Override
	public String toProperName(String key) throws Exception {
		return CmFSVUtil.toProperName(key);
	}

	@Override
	public DataContainer modifyUtil(DataContainer containerFr, DataContainer containerTo) throws Exception {
		return CmFSVUtil.modifyUtil(containerFr, containerTo);
	}

	@Override
	public void copyNewProperties(DataStructInterface target, DataStructInterface source) throws Exception {
		CmFSVUtil.copyNewProperties(target, source);
	}

	@Override
	public IVOCustValue convertCustValue(Map custinfoMap) throws Exception {
		IConvertBusiModel convertBusiModel = CmFSVUtil.getConvertBusiModel(AbstractVOCustCvtBusiModelImpl.class);
		return (IVOCustValue) convertBusiModel.convert(custinfoMap);
	}
}
