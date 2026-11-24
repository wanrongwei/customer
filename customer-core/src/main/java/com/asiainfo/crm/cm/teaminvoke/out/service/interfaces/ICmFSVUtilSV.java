package com.asiainfo.crm.cm.teaminvoke.out.service.interfaces;

import java.util.Map;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.common.DataStructInterface;
import com.asiainfo.crm.cm.model.ivalues.IVOCustValue;
import com.asiainfo.crm.cm.teaminvoke.out.busimodel.IConvertBusiModel;

/**
 * CmFSVUtil 工具类方法封装为服务接口
 * 供其他模块使用，避免直接依赖工具类
 * 
 * @author system
 * @date 2026-01-26
 */
public interface ICmFSVUtilSV {
	/**
	 * 利用反射机制，将Map转换为Object
	 * @param clazz 目标类
	 * @param mapInfo Map信息
	 * @return 转换后的对象
	 * @throws Exception
	 */
	public Object map2Object(Class<?> clazz, Map<?,?> mapInfo) throws Exception;
	
	/**
	 * 将map转换为datacontainer
	 * @param paramMap 参数Map
	 * @return DataContainer
	 * @throws Exception
	 */
	public DataContainer makeParam(Map paramMap) throws Exception;
	
	/**
	 * 将Ivalue转换成Map, 其中map的key符合接口文档中定义大小写格式
	 * @param valueInfo 值对象
	 * @return Map
	 * @throws Exception
	 */
	public Map value2Map(DataStructInterface valueInfo) throws Exception;
	
	/**
	 * 将Ivalue转换成Map
	 * @param valueInfo 值对象
	 * @param flag 是否进行toProperName操作  如CustId 转换为 Cust_Id
	 * @return Map
	 * @throws Exception
	 */
	public Map value2Map(DataStructInterface valueInfo, boolean flag) throws Exception;
	
	/**
	 * 将参数转换为匹配的properName
	 * @param key 键名
	 * @return 转换后的properName
	 * @throws Exception
	 */
	public String toProperName(String key) throws Exception;
	
	/**
	 * 修改时处理信息
	 * @param containerFr 源容器
	 * @param containerTo 目标容器
	 * @return DataContainer
	 * @throws Exception
	 */
	public DataContainer modifyUtil(DataContainer containerFr, DataContainer containerTo) throws Exception;
	
	/**
	 * 复制新属性
	 * @param target 目标对象
	 * @param source 源对象
	 * @throws Exception
	 */
	public void copyNewProperties(DataStructInterface target, DataStructInterface source) throws Exception;
	
	/**
	 * 将客户信息Map转换为IVOCustValue对象
	 * @param custinfoMap 客户信息Map
	 * @return IVOCustValue对象
	 * @throws Exception
	 */
	public IVOCustValue convertCustValue(Map custinfoMap) throws Exception;
}
