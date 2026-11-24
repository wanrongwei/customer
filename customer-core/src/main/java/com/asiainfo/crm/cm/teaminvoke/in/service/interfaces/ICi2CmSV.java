package com.asiainfo.crm.cm.teaminvoke.in.service.interfaces;

import com.asiainfo.crm.ci.inter.out.bo.CustomerInteractionBean;

public interface ICi2CmSV extends ICMSV{
    public void createCustomerInteraction(CustomerInteractionBean interaction) throws Exception;

    }
