package com.asiainfo.crm.ds;

import com.ai.appframe2.common.BusinessException;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.pce.ivalues.IOfferRelatRoleValue;
import com.ai.pce.service.interfaces.IProductFSV;
import org.apache.commons.lang.StringUtils;

import java.util.ArrayList;

public class Product4Ds {
    public  IOfferRelatRoleValue[] getMemberRoleListByOfferId(String offerId) throws Exception {

        if (StringUtils.isBlank(offerId)) {
            //��ȡ��Ա��ɫ��Ϣʧ�ܣ�������� offerIdΪ��
            throw new BusinessException("OMS1000185");
        }
        IProductFSV product = (IProductFSV) ServiceFactory.getService(IProductFSV.class);
         IOfferRelatRoleValue[] objIOfferRelatRoleValueSeq =product.getRoleByOfferId(Long.valueOf(offerId));;

        ArrayList list=new ArrayList();
        if(null!=objIOfferRelatRoleValueSeq&&objIOfferRelatRoleValueSeq.length>0){
            for (int i = 0; i < objIOfferRelatRoleValueSeq.length; i++) {
                if(true==objIOfferRelatRoleValueSeq[i].isMain()){
                    continue;
                }
                list.add(objIOfferRelatRoleValueSeq[i]);

            }
        }
        return (IOfferRelatRoleValue[])list.toArray(new IOfferRelatRoleValue[0]);
    }
}
