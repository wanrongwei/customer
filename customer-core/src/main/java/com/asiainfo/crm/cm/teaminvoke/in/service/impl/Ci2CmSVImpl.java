package com.asiainfo.crm.cm.teaminvoke.in.service.impl;

import com.ai.appframe2.service.ServiceFactory;
import com.asiainfo.crm.ci.inter.out.bo.CustomerInteractionBean;
import com.asiainfo.crm.ci.inter.out.service.interfaces.ICustomerInteractionSV;
import com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.ICi2CmSV;


public class Ci2CmSVImpl implements ICi2CmSV {

    private static ICustomerInteractionSV getCustomerInteractionSV() {
        return (ICustomerInteractionSV) ServiceFactory.getService(ICustomerInteractionSV.class);
    }
    public void createCustomerInteraction(CustomerInteractionBean interaction) throws Exception{
        if(shouldCall){
            getCustomerInteractionSV().createCustomerInteraction(interaction);
        }
    }

}
