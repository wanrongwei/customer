package com.asiainfo.crm.cm.bf.impl;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.common.DataContainerInterface;
import com.ai.appframe2.service.ServiceFactory;
import com.asiainfo.crm.agreement.teaminvoke.out.service.interfaces.IAgreementFSV;

public class AgreementBFImpl {
    /**客管合同查询页面action
     * @param custId
     * @return
     * @throws Exception
     */
    public DataContainerInterface[] queryAgreementForCMPage(long custId) throws Exception {
        IAgreementFSV agrFSImpl = (IAgreementFSV) ServiceFactory.getService(IAgreementFSV.class);
        DataContainer[] aryDataContainer = agrFSImpl.getAgreementValueByCust(custId);
        return aryDataContainer;
    }
}
