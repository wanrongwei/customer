package com.asiainfo.crm.cm.service.interfaces;

import com.ai.appframe2.common.DataContainerInterface;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.common.util.TimeUtil;
import com.aie.test.BaseTest;
import com.asiainfo.crm.cm.busimodel.common.ParamUtil;
import com.asiainfo.crm.cm.common.bo.BOCmPartyRoleBean;
import com.asiainfo.crm.cm.common.ivalues.IQBOCmPartyValue;
import com.asiainfo.crm.cm.common.util.CmCommonUtil;
import com.asiainfo.crm.cm.common.util.ws.address;
import com.asiainfo.crm.cm.inner.customer.bo.BOCmContactContMediumBean;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmContactContMediumValue;
import com.asiainfo.crm.cm.inner.party.bo.BOCmPartyBean;
import com.asiainfo.crm.cm.inner.party.bo.BOCmPartyContactBean;
import com.asiainfo.crm.cm.inner.party.ivalues.IBOCmPartyContactValue;
import com.asiainfo.crm.cm.inner.party.ivalues.IBOCmPartyRoleValue;
import com.asiainfo.crm.cm.inner.util.CmInnerServiceFactory;
import com.asiainfo.crm.cm.model.bean.VOPartyBean;
import com.asiainfo.crm.cm.model.bo.PartyBean;
import com.asiainfo.crm.cm.model.bo.PartyContactBean;
import com.asiainfo.crm.cm.model.bo.PartyRoleBean;
import com.asiainfo.crm.cm.model.ivalues.*;
import com.asiainfo.crm.common.util.CMUserInfoUtil;
import com.asiainfo.isub.base.common.DataTypeUtils;
import org.junit.jupiter.api.*;

import java.util.HashMap;
import java.util.Map;
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class ICmPartySVTest extends BaseTest {
    private ICmPartySV cmPartySV = (ICmPartySV) ServiceFactory.getService(ICmPartySV.class); // 假设这是被测试的接口实现
    long partyid=0L;

    @Test
    public void testQueryAsPartyByCertCodeAndLog() throws Exception {
        Map doducer=new HashMap<>() ;
        doducer.put("ACTION","QUERY");
        doducer.put("PARTY_ID",configReader.getProperty("partyId"));
        doducer.put(ICustomerValue.S_CustType,"3");
        String xmlCondition= ParamUtil.buildQueryXml("com.ai.appframe2.bo.DataContainer",  doducer);

        int $startrowindex = 0; // 起始行索引
        int $endrowindex = 10; // 结束行索引

        // 调用方法
        IQBOCmPartyValue partyValue = cmPartySV.queryAsPartyByCertCodeAndLog(
                null, $startrowindex, $endrowindex
        );

        // 断言验证
        Assertions.assertNotNull(partyValue, "查询结果不应为空");

        // 验证第一个机构的属性
        Assertions.assertEquals("K23210013581024", partyValue.getCertCode(), "证书代码不匹配");
        Assertions.assertEquals(configReader.getB2BCustName(), partyValue.getPartyName(), "名称不匹配");
        // 根据实际需求添加更多属性验证
    }
    // testDeleteParty()测试方法要在testSaveParty()之前跑



    /**
     * 创建payer信息
     * @throws Exception
     */
    @Test
    @Order(1)
    public void testSaveParty() throws Exception {
        partyid= CmCommonUtil.getNewSequence(BOCmPartyBean.class);
        System.out.println("partyid======="+partyid);
        // 创建测试对象
        IVOPartyValue partyVo = new VOPartyBean();
        // 参与人基本信息表 CM_PARTY
        setpartyBasicBean(partyVo, partyid);
        //保存角色
        setrole(partyVo,partyid);
            //保存联系人
        setPartyContact(partyVo);
        // 调用保存方法
        cmPartySV.saveParty(partyVo);
        // 断言验证
        Assertions.assertNotNull(partyVo, "保存的partyValue不应为null");
        // 可以添加更多断言来验证保存后的数据
    }

    private void setPartyContact(IVOPartyValue partyVo) throws Exception {
        IPartyContactValue contact=new PartyContactBean();
        contact.setPartyId(partyid);
        contact.setContAddress("5117323");
        contact.setContName(configReader.getB2BCustName());
        contact.setPostCode("4110");
        contact.setState("U");
        contact.setCreateDate(DataTypeUtils.getCurrentDate());
        contact.setDoneCode(CMUserInfoUtil.getDoneCode());
        contact.setDoneDate(DataTypeUtils.getCurrentDate());
        contact.setOpId(CMUserInfoUtil.getOpId());
        contact.setOrgId(CMUserInfoUtil.getOrgId());
        contact.setEffectiveDate(DataTypeUtils.getCurrentDate());
        contact.setExpireDate(TimeUtil.getMaxExpire());
        contact.setRegionId(CMUserInfoUtil.getRegionId());
        contact.setCreateOpId(CMUserInfoUtil.getOpId());
        contact.setCreateOrgId(CMUserInfoUtil.getOrgId());
        partyVo.setPartyContact(contact);
    }

    @Test
    @Order(2)
    public void testDeleteParty() throws Exception {
        IPartyValue cmParty = cmPartySV.queryPartyById(partyid);
        BOCmPartyBean partyBean = new BOCmPartyBean();
        partyBean.copy(cmParty);
        partyBean.delete();
        CmInnerServiceFactory.getCommonInnerSV().saveBean(partyBean);
        IBOCmPartyRoleValue[] partyRoles = cmPartySV.queryPartyRole(partyid);
        DataContainerInterface[] dcs=new DataContainerInterface[partyRoles.length];
        for (int i=0;i<partyRoles.length;i++) {
            partyRoles[i].delete();
            BOCmPartyRoleBean bean = new BOCmPartyRoleBean();
            bean.copy(partyRoles[i]);
            dcs[i]=bean;
        }
        CmInnerServiceFactory.getCommonInnerSV().saveBeans(dcs);
        IBOCmPartyContactValue[] partycontacs = cmPartySV.queryPartyContact(partyid);
        DataContainerInterface[] contas=new DataContainerInterface[partycontacs.length];
        for (int i=0;i<partycontacs.length;i++) {
            partycontacs[i].delete();
            BOCmPartyContactBean bean = new BOCmPartyContactBean();
            bean.copy(partycontacs[i]);
            contas[i]=bean;
        }
        CmInnerServiceFactory.getCommonInnerSV().saveBeans(contas);

    }

    private void setrole(IVOPartyValue partyVo,long partyid) throws Exception {
        //CM_PARTY_ROLE 解释:参与人角色
        IPartyRoleValue role=new PartyRoleBean();
        role.setPartyId(partyid);
        //1：客户
        //2:使用者
        //3：员工
        //4：联系人
        //5：支付者
        role.setRoleType(1);
        role.setEntityId(configReader.getB2BCustId());
        role.setRegionId(CMUserInfoUtil.getRegionId());
        role.setRoleStatus(1);
        role.setCreateDate(DataTypeUtils.getCurrentDate());
        role.setDoneCode(CMUserInfoUtil.getDoneCode());
        role.setDoneDate(DataTypeUtils.getCurrentDate());
        role.setOpId(CMUserInfoUtil.getOpId());
        role.setOrgId(CMUserInfoUtil.getOrgId());
        role.setEffectiveDate(DataTypeUtils.getCurrentDate());
        role.setExpireDate(TimeUtil.getMaxExpire());
        role.setRegionId(CMUserInfoUtil.getRegionId());
        role.setCreateOpId(CMUserInfoUtil.getOpId());
        role.setCreateOrgId(CMUserInfoUtil.getOrgId());
        partyVo.setPartyRole(role);
    }

    private void setpartyBasicBean(IVOPartyValue partyVo,long partyid) throws Exception {
        IPartyValue partyValue=new PartyBean();
        partyValue.setPartyId(partyid);
        partyValue.setPartyType(3);
        partyValue.setPartyName(configReader.getB2BCustName());
        partyValue.setCertType(17);
//        partyValue.setCertCode("K"+configReader.getB2BCustId());
        partyValue.setNationality("00400");
        partyValue.setProvinceId("9999");
        partyValue.setCityId("111");
        partyValue.setCountyId("1001");
        partyValue.setState("U");
        partyValue.setPerferLanguage("1");
        partyValue.setCreateDate(DataTypeUtils.getCurrentDate());
        partyValue.setDoneCode(CMUserInfoUtil.getDoneCode());
        partyValue.setDoneDate(DataTypeUtils.getCurrentDate());
        partyValue.setOpId(CMUserInfoUtil.getOpId());
        partyValue.setOrgId(CMUserInfoUtil.getOrgId());
        partyValue.setEffectiveDate(DataTypeUtils.getCurrentDate());
        partyValue.setExpireDate(TimeUtil.getMaxExpire());
        partyValue.setRegionId(CMUserInfoUtil.getRegionId());
        partyValue.setCreateOpId(CMUserInfoUtil.getOpId());
        partyValue.setCreateOrgId(CMUserInfoUtil.getOrgId());
        partyVo.setParty(partyValue);
    }

    ////根据联系信息编号查询参与人联系信息
    @Test
    public void testQueryPartyContactById() throws Exception {
        // 输入参数
        long contId = 110002386793L;

        // 调用方法
        IPartyContactValue partyValue = cmPartySV.queryPartyContactById(contId);

        // 断言验证
        Assertions.assertNotNull(partyValue, "查询结果不应为空");
        Assertions.assertEquals(contId, partyValue.getContId(), "联系人ID不匹配");
        Assertions.assertEquals(configReader.getLongValue("partyId"), partyValue.getPartyId(), "联系人ID不匹配");

        // 可以添加更多断言来验证返回的数据
    }

    @Test
    public void testQueryMaskPartyById() throws Exception {
        // 输入参数
        long partyId = configReader.getLongValue("partyId");

        // 调用方法
        IPartyValue party = cmPartySV.queryMaskPartyById(partyId);

        // 断言验证
        Assertions.assertNotNull(party, "客户信息不应为空");
        Assertions.assertEquals(3, party.getPartyType(), "客户类型不匹配");
    }
}

