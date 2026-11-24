package com.asiainfo.crm.cm.custrel.dao.interfaces;

import com.asiainfo.crm.cm.common.bo.BOCmInsCmrelBean;

public interface ICmInsCmrel2DAO {
    BOCmInsCmrelBean[] queryCmInsCmrelUserIds(String custIds, long realType) throws Exception;
}
