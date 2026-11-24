package com.asiainfo.crm.cm.bf.impl;

import com.ai.appframe2.common.DataContainerInterface;
import com.ai.appframe2.complex.center.CenterFactory;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.common.util.CenterUtil;
import com.ai.common.util.TimeUtil;
import com.ai.omframe.common.service.interfaces.CenterConst;
import com.ai.omframe.instance.ivalues.IInsSrvAttrValue;
import com.ai.omframe.instance.ivalues.IInsUserValue;
import com.ai.omframe.instance.service.interfaces.IInstanceQrySV;
import com.ai.omframe.order.ivalues.IOrdCustExtValue;
import com.ai.omframe.order.ivalues.IOrdCustValue;
import com.ai.omframe.order.ivalues.IOrdOffOrdUserValue;
import com.ai.omframe.order.ivalues.IOrdUserExtValue;
import com.ai.omframe.order.service.interfaces.IOrderQrySV;
import com.ai.omframe.util.SoServiceFactory;
import com.asiainfo.crm.constant.RBossConst;
import com.asiainfo.crm.res.phone.ivalues.IBOResLeadingNumberValue;
import com.asiainfo.crm.res.phone.service.interfaces.IResPhoneNumFSV;
import com.asiainfo.crm.res.teaminvoke.out.service.interfaces.IRes2InterFSV;
import com.asiainfo.crm.so.instance.bboss.service.interfaces.IInsUserSV;
import com.asiainfo.crm.so.instance.rboss.service.interfaces.IInsQrySV;
import com.asiainfo.crm.so.order.rboss.service.interfaces.IFixedLineSV;
import com.asiainfo.crm.so.order.rboss.service.interfaces.IOrderQuerySV;
import com.asiainfo.crm.so.rule.rboss.FixedLineCommon;
import com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;

import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
public class RbossSoBFImpl {
    /***
     * 查询serviceNumber 是否在实例表中存在
     * @param serviceNum
     * @throws RemoteException
     * @throws Exception
     */
    public Map searchServiceNum(String serviceNum){
        Map cp = new HashMap();
        String retVal="N";
        String retMsg="";
        try{
            CenterFactory.setCenterInfoByTypeAndValue(CenterConst.BILL_ID, serviceNum);
            IInsUserValue InsUserValue=this.getUserInfoByBillId(serviceNum);
            if(InsUserValue!=null){
                retVal="Y";
            }else{
                retMsg="Service number "+ serviceNum +" is not on subscription list";
            }
        }catch(Exception e){
            retMsg="Service number "+ serviceNum +" is not on subscription list";
            log.error("ERROR",e);
        }
        cp.put("retMsg", retMsg);
        cp.put("retVal", retVal);
        return cp;
    }

    public IInsUserValue getUserInfoByBillId(String billId) throws Exception{
        IInstanceQrySV iInsQrySV = (IInstanceQrySV) ServiceFactory.getCrossCenterService(IInstanceQrySV.class);
        return iInsQrySV.getInstUserByBillId(billId);
    }

    public Map checkIsRangeNumberAndSameRange(String billId) throws Exception{
        Map cp = new HashMap();
        boolean isrange = false;
        boolean sameRange = true;
        CenterFactory.setCenterInfoByTypeAndValue(CenterConst.BILL_ID, billId);
        IRes2InterFSV res2Inter = (IRes2InterFSV) ServiceFactory.getService(IRes2InterFSV.class);
        Map inputMap = new HashMap();
        //是否在号段之内
        isrange = res2Inter.checkRangeNumber(billId, inputMap);
        //在号段之内
        if(isrange)
        {
            Map inputNewMap = new HashMap();
            inputNewMap.put("begId", billId);
            inputNewMap.put("endId", billId);
            sameRange =res2Inter.checkSameRange(inputNewMap);
        }
        //是同一个号段 并且有遗漏是false
        if(!sameRange)
        {
            cp.put("retVal", "N");
        }else
        {
            cp.put("retVal", "Y");
        }
        return cp;
    }

    /**
     * 点击菜单时用户状态
     * @author gexy
     * @param userId
     * @throws Exception
     */
    public Map checkUserStateOnClickMenu(long userId) throws Exception {
        Map cp = new HashMap();
        String retVal = "Y";
        String retMsg = "";
        try {
            CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.USER_ID,String.valueOf(userId));
            /* TODO
            ISoRuleReturnData ruleData = new ISoRuleReturnDataImpl();
            ruleData.setResultCode(OrderConst.JAVA_RULE_RETURN_CODE_YES);
            if (!FixedLineEnterMenuRule.judgeUserOutState(userId,ruleData)) {//用户预销/销户状态判断
                retVal = "N";
                retMsg = ruleData.getMsg();
            }
            IInstanceQrySV  insQrySV =(IInstanceQrySV) ServiceFactory.getService(IInstanceQrySV.class);
            IInsUserValue insUserValue=insQrySV.getInstUserByUserId(userId);
            if (!FixedLineEnterMenuRule.judgeOfferState("",insUserValue,ruleData,null)) {//用户在途单判断
                retVal = "N";
                retMsg = ruleData.getMsg();
            }*/

        }catch(Exception e) {
            log.error("ERROR",e);
            retVal = "N";
            retMsg = e.getMessage();
            // e.printStackTrace();
        }
        cp.put("retVal", retVal);
        cp.put("retMsg", retMsg);
        return cp;
    }

    public Map checIsHasRangesOpen(String serviceNum,String functionId)
    {
        Map cp = new HashMap();
        String retVal="Y";
        try {
            if (!StringUtils.isBlank(serviceNum)) {
                IRes2InterFSV res =(IRes2InterFSV) ServiceFactory.getService(IRes2InterFSV.class);
                IResPhoneNumFSV iResPhoneNumFSV = (IResPhoneNumFSV)ServiceFactory.getService(IResPhoneNumFSV.class);
                Map map = iResPhoneNumFSV.searchLeadingNum("1", serviceNum);
                List list = (List)map.get("leadingNumList");
                if (list != null && list.size()>0) {
                    String leadNum = (String)list.get(0);
                    if (serviceNum.equals(leadNum)) {
                        if ("10000019".equals(functionId) || "10000022".equals(functionId) || "20000039".equals(functionId) || "20000121".equals(functionId)) {
                            Map paraMap = new HashMap();
                            paraMap.put("operType", "1");
                            IRes2InterFSV resSV = (IRes2InterFSV) ServiceFactory.getService(IRes2InterFSV.class);
                            IBOResLeadingNumberValue[] values = resSV.getLeadingNumInfo(serviceNum, paraMap);
                            if (values != null && values.length > 0) {
                                if ("1".equals(values[0].getCountyId())) {
                                    retVal="Y";
                                }else {
                                    if (res.checkExistUsedNum(serviceNum)) {
                                        retVal="N";
                                    }
                                }
                            }
                        }else {
                            if (res.checkExistUsedNum(serviceNum)) {
                                retVal="N";
                            }
                        }

                    }
                }

            }
        } catch (Exception e) {
            log.error("ERROR",e);
        }
        cp.put("retVal", retVal);
        return cp;
    }

    public Map query360OrdCustByCustIdAndStartEndDateCount(long custId,String startDate,String endDate,String regionId,int type,String billId,String circuitNumber,String CPENumber,String PONumber,String fibiaCustId){
        Map cp = new HashMap();
        String retVal = "Y";
        String retMsg = "";
        ICrmFSV crmFsv = (ICrmFSV)ServiceFactory.getService(ICrmFSV.class);
        int count = 0;
        try{
            count = crmFsv.query360OrdCustByCustIdAndStartEndDateCount(custId, startDate, endDate, regionId, type, billId, circuitNumber, CPENumber, PONumber, fibiaCustId);
        }catch (Exception e){
            log.error("ERROR",e);
            retMsg = e.getMessage();
            retVal = "N";
            count = 0;
        }
        cp.put("retVal", retVal);
        cp.put("retMsg", retMsg);
        cp.put("retCount", String.valueOf(count));
        return cp;

    }

    public Map getAcctIdByInvoiceNumber(String invoice){
        Map cp = new HashMap();

        String retVal ="N";
        String retMsg="";
        try{
            IOrderQuerySV ordQuerySV=(IOrderQuerySV)ServiceFactory.getService(IOrderQuerySV.class);
            //查询银行账户信息
            long acctId = ordQuerySV.getAcctIdByInvoiceNumber(invoice);
            if(acctId != 0){
                String acctIds = String.valueOf(acctId);
                retVal="Y";
                cp.put("acctId",acctIds);
            }else{
                cp.put("acctId","0");
            }
            log.error("invoice numbber"+invoice+acctId);
        }catch(Exception e)
        {
            log.error("ERROR",e);
            log.error("exception when query acctid by invoice number");
            retVal = "N";
            retMsg = e.getCause() == null ? e.getMessage() : e.getCause().getMessage();
        }
        cp.put("retVal", retVal);
        cp.put("retMsg", retMsg);
        return cp;
    }

    public String getVoipNumberByUserIdAndAttrId(String regionId,long userId,long attrId) throws Exception{
        String voipNumber = "";
        CenterFactory.setCenterInfoByTypeAndValue("RegionId", regionId);
        IInsQrySV insQrySV = (IInsQrySV)ServiceFactory.getService(IInsQrySV.class);
        IInsSrvAttrValue[] ins_srv_attr = insQrySV.getInstSrvAttrBatchByUserId(userId,attrId);
        if(ins_srv_attr!=null && ins_srv_attr.length>0){
            voipNumber = ins_srv_attr[0].getAttrValue();
        }
        return voipNumber;
    }

    public DataContainerInterface[] getUsersByInsOfferIdRoleId(long offerInstanceId, String billId, long roleId, int validType, String regionIdsStr, String isMainRole, int startRowIndex, int endRowIndex) throws Exception,RemoteException{
        CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.BILL_ID, billId);
        IInsUserSV insUserSV = (IInsUserSV)ServiceFactory.getService(IInsUserSV.class);
        return insUserSV.getUsersByInsOfferIdRoleId(offerInstanceId, billId, roleId, validType, regionIdsStr, isMainRole, startRowIndex, endRowIndex);
    }
}
