package com.asiainfo.crm.cm.bf.impl;

import com.ai.appframe2.service.ServiceFactory;
import com.ai.appframe2.web.CustomProperty;
import com.ai.appframe2.web.HttpUtil;
import com.ai.common.i18n.CrmLocaleFactory;
import com.asiainfo.appframe.ext.flyingserver.org.apache.commons.lang.StringUtils;
import com.asiainfo.crm.cm.common.CmConstants;
import com.asiainfo.crm.cm.model.ivalues.ICustomerValue;
import com.asiainfo.crm.so.order.rboss.service.interfaces.IChgOwnerShipSV;
import com.asiainfo.crm.so.teaminvoke.in.service.interfaces.ICust2CrmSV;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.Map;

@Slf4j
public class Cust2CrmBFImpl {
    /**
     * @Function:checkTransferDonner
     * @Description:校验过户下家
     *
     * @param: HttpServletRequest request,HttpServletResponse response
     * @return： CustomProperty
     * @throws：异常描述
     *
     * @version: v1.0.0
     * @author: zhangxiang3
     * @date: 2014-5-5 下午10:51:36
     *
     * Modification History:
     * Date         Author          Version            Description
     *---------------------------------------------------------*
     * 2014-5-5      zhangxiang3        v1.0.0               修改原因
     */
    public Map checkTransferDonner(long custId, long oldCustId, String billId) throws Exception {
        Map cp = new HashMap();
        String retVal = "Y";
        String retMsg = "";

        //判断客户状态是否有效（在网）
        ICust2CrmSV iCust2CrmSV = (ICust2CrmSV) ServiceFactory.getService(ICust2CrmSV.class);
        ICustomerValue customerValue = iCust2CrmSV.queryCustInfoById(custId);
        if(customerValue.getCustStatus() != CmConstants.CustomerStatus.INDIV_ACTIVE
                && customerValue.getCustStatus() !=  CmConstants.CustomerStatus.INDIV_POTENTIAL
                && customerValue.getCustStatus() !=  CmConstants.CustomerStatus.INDIV_INACTIVE){
            retVal = "N";
            if(customerValue.getCustStatus() == CmConstants.CustomerStatus.GROUP_PAUSE){
                retMsg = CrmLocaleFactory.getResource("SOS20044221");//该客户为停机状态 ，不允许过户
            }else{
                retMsg = CrmLocaleFactory.getResource("SOS20044219");//无效客户，不能受理
            }
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
            return cp;
        }
        //判断是否匿名客户
        if(customerValue.getAnonymousFlag() == 1){
            retVal = "N";
            retMsg = CrmLocaleFactory.getResource("SOS2000429");//不能过户给匿名客户
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
            return cp;
        }

        //判断B2B Single 号段内客户
        //加个判断，批量过户流程内校验
        if (StringUtils.isNotBlank(billId)) {
            IChgOwnerShipSV chgOwerShipSv = (IChgOwnerShipSV) ServiceFactory.getService(IChgOwnerShipSV.class);
            if (!chgOwerShipSv.checkRangeNumber(billId, custId, oldCustId)) {
                retVal = "N";
                retMsg = CrmLocaleFactory.getResource("SOS0000987");// B2B号码段内不允许过户!
                cp.put("retVal", retVal);
                cp.put("retMsg", retMsg);
                return cp;
            }
        }

        //其余返回true
        cp.put("retVal", retVal);
        cp.put("retMsg", retMsg);
        return cp;
    }
}
