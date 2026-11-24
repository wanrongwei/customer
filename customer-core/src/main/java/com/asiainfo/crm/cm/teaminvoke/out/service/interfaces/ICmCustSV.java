package com.asiainfo.crm.cm.teaminvoke.out.service.interfaces;


import com.asiainfo.crm.inter.exe.remote.bean.CustSimpleInfo;
import com.asiainfo.crm.inter.exe.remote.bean.IndivCustInfo;

public interface ICmCustSV {
    public CustSimpleInfo queryCustSimpleInfo(String serviceNum) throws Exception;
}
