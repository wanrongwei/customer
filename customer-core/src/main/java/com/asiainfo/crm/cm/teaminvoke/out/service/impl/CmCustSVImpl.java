package com.asiainfo.crm.cm.teaminvoke.out.service.impl;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.complex.center.CenterFactory;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.common.util.CenterUtil;
import com.ai.omframe.common.service.interfaces.CenterConst;
import com.ai.omframe.instance.ivalues.IInsUserValue;
import com.asiainfo.crm.cm.common.CmConstants;
import com.asiainfo.crm.cm.common.util.ws.address;
import com.asiainfo.crm.cm.inner.account.ivalues.IBOCmCustAcctRelValue;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmCustContactMediumValue;
import com.asiainfo.crm.cm.model.ivalues.ICustomerValue;
import com.asiainfo.crm.cm.model.ivalues.IGroupMemberValue;
import com.asiainfo.crm.cm.model.ivalues.IVOCustAddressValue;
import com.asiainfo.crm.cm.model.ivalues.IVOCustValue;
import com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICm2SoSV;
import com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICmCustSV;
import com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICmInterfaceSV;
import com.asiainfo.crm.constant.OrderConst;
import com.asiainfo.crm.inter.exe.remote.bean.*;
import com.asiainfo.crm.so.order.rboss.instance.service.interfaces.IFixedLineInsSV;
import com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmExtFSV;
import com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;



@Component
@Slf4j
public class CmCustSVImpl  implements ICmCustSV {
    public CustSimpleInfo queryCustSimpleInfo(String serviceNum) throws Exception {

        CustSimpleInfo custInfo = null ;
        long custId = 0L;
        String regionId = CenterUtil.getRegionIdByBillId(serviceNum);
        if(StringUtils.isNotBlank(regionId)){
            CenterFactory.setCenterInfoByTypeAndValue(CenterConst.BILL_ID, serviceNum);
            ICrmFSV fsv =  (ICrmFSV) ServiceFactory.getService(ICrmFSV.class);
            IInsUserValue[] users = fsv.getInsUserByBillIdOrUserId(serviceNum, -1, OrderConst.VALID_TYPE_ALL);
            if(null != users && users.length > 0){
                custId = users[0].getCustId();
            }
        }else{
            // Voip  号码
            CenterUtil.generatorRegionId();
            IFixedLineInsSV fixSV = (IFixedLineInsSV)ServiceFactory.getCrossCenterService(IFixedLineInsSV.class);
            regionId = fixSV.getRegionIdByVoIPNum(serviceNum);
            if(StringUtils.isNotBlank(regionId)){
                CenterFactory.setCenterInfoByTypeAndValue(CenterConst.REGION_ID, regionId);
                ICrmFSV fsv =  (ICrmFSV) ServiceFactory.getService(ICrmFSV.class);
                IInsUserValue user = fsv.getDSLUserByVoIPNum(serviceNum, OrderConst.VALID_TYPE_ALL);
                if(null != user ){
                    custId = user.getCustId();
                }
            }else{
                // add by zoudj 2016-1-28 通过副号查询
                ICrmExtFSV crmExtSV = (ICrmExtFSV) ServiceFactory.getCrossCenterService(ICrmExtFSV.class);
                IInsUserValue insUserByMultNumber = crmExtSV.getInsUserByMultNumber(serviceNum);
                if(insUserByMultNumber != null){
                    custId = insUserByMultNumber.getCustId();
                }
            }
        }
        if(custId > 0L){
            ICmInterfaceSV sv = (ICmInterfaceSV)ServiceFactory.getService(ICmInterfaceSV.class);
            ICustomerValue value = sv.queryCustomerByCustId(custId, "");
            if(null != value ){
                custInfo = new CustSimpleInfo();
                custInfo.setCustId(value.getCustId());
                custInfo.setCustType(value.getCustType());
                custInfo.setCustName(value.getCustName());
                custInfo.setCustStatus(value.getCustStatus());
            }
        }

        return custInfo ;
    }
}
