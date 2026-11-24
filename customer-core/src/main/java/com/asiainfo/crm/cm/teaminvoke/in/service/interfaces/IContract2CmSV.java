package com.asiainfo.crm.cm.teaminvoke.in.service.interfaces;

import com.ai.appframe2.bo.DataContainer;
import com.asiainfo.crm.agreement.agreement.ivalues.IBOAgrAgreementHValue;
import com.asiainfo.crm.agreement.agreement.ivalues.IBOAgrOfferRlaHValue;

import java.sql.Timestamp;

public interface IContract2CmSV extends ICMSV{
    public byte[] previewEshopAgreement(String businessId, DataContainer[] agreementParams)throws Exception;

    /**
     * 企业折扣查询接口
     * @author luanpeng
     * @param agreementId
     * @param agrDate
     * @return
     * @deprecated
     * @throws Exception
     */
    public DataContainer[] getOfferDiscountByAgrId(long agreementId, String agrDate,String ownerId) throws Exception;


    /**
     * 企业折扣查询接口
     * @param agrCode
     * @deprecated
     * @return
     * @throws Exception
     */
    public DataContainer[] getAgreementOfferDiscount(String agrCode) throws Exception;

    /**
     * 根据custId, agreementId获取对应的合同对象(根据合同号查询当前合同信息，返回合同level为100164表示taxfree)
     * 需要把custId对应的cvr no相同的所有客户的合同都查出来
     *@Function:getAgreement
     *@Description:
     *
     *@param custId
     *@param agreementId
     *@return
     *@throws Exception
     *
     *@version: v1.0.0
     *@author: duysheng
     *@date: 2015-8-26 下午9:18:41
     *
     */
    public IBOAgrAgreementHValue getAgreementValueByCust(long custId, long agreementId) throws Exception;

    /**
     * 根据合同编号查询账期
     * 输入参数：合同ID，合同编号，客户ID，输出：合同类型level、账期类型。（合同ID，合同编号两个入参必须有一个传值）
     * KEY:
     * AGR_LEVEL_ID
     * BILL_CYCLE (1: Monthly, 2: Quarterly, 3: PA quarterly)
     * @param agreementId
     * @param agreementCode
     * @param custId
     * @return
     * @throws Exception
     */
    public DataContainer queryAgreementBillCycle(long agreementId,String agreementCode,long custId) throws Exception;

    /**
     * 提供给客管在创建合同账户的时候调用，获取当前合同的账期
     * @param agreementId
     * @param custId
     * @return
     * @throws Exception
     */
    public DataContainer queryCurrentAgreementBillCycle(long agreementId,String agreementCode,long custId) throws Exception;

    /**
     * 根据指定的groupId查询当前生效的合同议价。如果groupId传空或者null，那么就查合同级议价，如果查不到则返回空数组。
     * @param custId
     * @param agreementId
     * @param offerId
     * @param groupId
     * @return
     * @throws Exception
     */
    public IBOAgrOfferRlaHValue[] getOfferBargainParamsByGroupId(long custId, long agreementId, long offerId, String groupId) throws Exception;


    /**
     * 查询Licence议价开关
     * @param agreementId
     * @param offerId
     * @return 1：开          2：关
     * @throws Exception
     */
    public int getLicenseStaircaseFlag(long agreementId,long offerId) throws Exception;
    /**
     * 查询客户下的所有符合条件的合同信息
     * @param custId
     * @param agrName
     * @param agrCode
     * @param agrStatus
     * @param startDate
     * @param endDate
     * @return
     */
    public DataContainer[] getB2BAgreementListForOSByCond(long custId, String agrName, String agrCode, long agrStatus, Timestamp startDate, Timestamp endDate) throws Exception;


}
