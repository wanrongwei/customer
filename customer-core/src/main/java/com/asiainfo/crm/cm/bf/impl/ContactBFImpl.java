package com.asiainfo.crm.cm.bf.impl;

import com.asiainfo.crm.cm.busimodel.common.ParamUtil;
import com.asiainfo.crm.cm.common.CmServiceFactory;
import com.asiainfo.crm.cm.model.ivalues.IContactValue;
import com.asiainfo.crm.cm.service.interfaces.ICmContactSV;

import java.util.Map;

public class ContactBFImpl {
    public int queryCustContactCount(Map info,String beanName) throws Exception {
        ICmContactSV sv = CmServiceFactory.getContactSV();
        String xmlCondition = ParamUtil.buildQueryXml(beanName,info);
        return sv.queryCustContactCount(xmlCondition);
    }

    public IContactValue[] queryCustContacts(Map info,String beanName, int startNum, int endNum) throws Exception{
        ICmContactSV sv = CmServiceFactory.getContactSV();
        String xmlCondition = ParamUtil.buildQueryXml(beanName,info);
        return sv.queryCustContacts(xmlCondition, startNum, endNum);
    }

}
