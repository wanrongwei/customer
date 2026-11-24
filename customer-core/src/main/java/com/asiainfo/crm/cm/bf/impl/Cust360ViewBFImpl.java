package com.asiainfo.crm.cm.bf.impl;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.complex.center.CenterFactory;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.common.util.CenterUtil;
import com.ai.common.util.ExceptionUtil;
import com.ai.common.util.SNUtil;
import com.ai.omframe.instance.ivalues.IInsAccrelValue;
import com.asiainfo.crm.cm.inner.account.ivalues.IBOCmCustAcctRelValue;
import com.asiainfo.crm.cm.service.interfaces.ICmAccountSV;
import com.asiainfo.crm.constant.RBossConst;
import com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV;
import org.apache.commons.lang.StringUtils;
import com.ai.omframe.instance.ivalues.IInsSrvAttrValue;
import com.ai.omframe.instance.service.interfaces.IInstanceQrySV;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.Map;

@Slf4j
public class Cust360ViewBFImpl {
    /**
     * 是否为DM002用户 宽带业务变更判断
     * @param userId
     * @throws Exception
     */
    public Map getDM002UserFlag(String userId ) throws Exception {
        IInstanceQrySV instsv = (IInstanceQrySV) ServiceFactory.getService(IInstanceQrySV.class);
        Map cp = new HashMap();
        cp.put("DM002Flag", "N");
        try {
            if(StringUtils.isNotEmpty(userId)){
                IInsSrvAttrValue[] insSrvAttrValues = instsv.getInstSrvAttrBatchByUserId(Long.valueOf(userId), RBossConst.SO_SRV_ATTR_TECHNOLOGY_TYPE);
                if(insSrvAttrValues != null && insSrvAttrValues.length > 0){
                    if(StringUtils.isNotEmpty(insSrvAttrValues[0].getAttrValue())){
                        cp.put("DM002Flag", "Y");
                        cp.put("TechType_value", insSrvAttrValues[0].getAttrValue());
                    }

                }
            }
        }catch(Exception e){
            log.error("ERROR",e);
            cp.put("DM002Flag", "N");
            String retMsg = e.getMessage();
            cp.put("retMsg", retMsg);
            throw new Exception(e.getMessage().toString());
        }
        return cp;


    }
    public int getCustType(long custId) throws Exception {
        // 更改为直接使用common.jar中的方法 modified by huzq2 at 2012-1-11
        if (custId <= 0) {
            // 客户ID不能为空
            ExceptionUtil.throwBusinessException("CMS95000089");
        }
        int custType = -1;
        try {
            custType = SNUtil.getCustTypeByCustomerId(custId);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            ExceptionUtil.throwBusinessException("CMS0020525");
        }
        return custType;
    }

    public DataContainer[] getUserProdsInfoTree(long userId) throws Exception{
        CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.USER_ID, String.valueOf(userId));
        ICrmFSV sv = (ICrmFSV) ServiceFactory.getService(ICrmFSV.class);
        return sv.getUserProdsInfoTree(userId);
    }

    public DataContainer[] query360UserAccrel(long userId) throws Exception{
        CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.USER_ID, String.valueOf(userId));
        ICrmFSV sv = (ICrmFSV) ServiceFactory.getService(ICrmFSV.class);
        return sv.query360UserAccrel(userId);
    }
    public IBOCmCustAcctRelValue[] queryCustAcctRelFor360New(long relCustd, long acctId, String acctName, int installmentFalg, int paymethod, int cycleType, String custStatus,
                                                             String acctServiceId, String serviceNumber, String pbs, String ean, int start, int end, long userId ) throws Exception {
        ICmAccountSV sv = (ICmAccountSV) ServiceFactory.getCrossCenterService(ICmAccountSV.class);
        IBOCmCustAcctRelValue[] acctRels = sv.queryCustAcctRelFor360(relCustd, acctId, acctName, installmentFalg, paymethod, cycleType, custStatus, acctServiceId, serviceNumber, pbs, ean, start, end);
        IInstanceQrySV iInstanceQrySV = (IInstanceQrySV) ServiceFactory.getCrossCenterService(IInstanceQrySV.class);
        IInsAccrelValue[] iInsAccrels = iInstanceQrySV.getInstAccrelByUserId(userId, 2);
        if (iInsAccrels != null && iInsAccrels.length > 0) {
            for (IBOCmCustAcctRelValue rel : acctRels) {
                for (IInsAccrelValue insRel : iInsAccrels) {
                    if (insRel.getAcctId() == rel.getAcctId()) {
                        rel.setExt4("Split Account");
                    }
                }
            }
        }
        return  acctRels;
    }
}

