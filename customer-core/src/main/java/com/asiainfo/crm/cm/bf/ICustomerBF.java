package com.asiainfo.crm.cm.bf;

import java.util.List;
import java.util.Map;

import com.ai.appframe2.bo.DataContainer;
import com.ai.oneframe.inter.ivalues.CustIndivBean;
import com.ai.secframe.orgmodel.ivalues.IQBOSecCustManagerValue;
import com.asiainfo.crm.cm.common.ivalues.IBOCmCustPermissionClauseValue;
import com.asiainfo.crm.common.vo.CommonTreeNodeVO;
import com.asiainfo.crm.cm.common.ivalues.IBOIdentificationValue;
import com.asiainfo.crm.cm.common.util.ws.address;
import com.asiainfo.crm.cm.customer.group.ivalues.IBOCmGroupRelIndustryValue;
import com.asiainfo.crm.cm.customer.group.ivalues.IBoCmCustSegmentValue;
import com.asiainfo.crm.cm.customer.group.ivalues.IBoCmGroupAccountingValue;
import com.asiainfo.crm.cm.inner.customer.ivalues.IQBOCmCustContMediumAndTypeValue;
import com.asiainfo.crm.cm.inner.log.ivalues.IBOCmHisRecordValue;
import com.asiainfo.crm.cm.model.ivalues.ICustManagerValue;
import com.asiainfo.crm.cm.model.ivalues.ICustomerValue;
import com.asiainfo.crm.cm.vo.CmB2BCustomerVO;
import com.asiainfo.crm.cm.vo.CreateContactMediumVO;
import com.asiainfo.crm.cm.vo.CreateCustAddressVO;
import com.asiainfo.crm.cm.vo.CreateIndustryVO;
import com.asiainfo.crm.cm.vo.CreatePerferInfoVO;
import com.asiainfo.crm.cm.vo.CreatePerferTimeVO;
import com.asiainfo.crm.cm.vo.CreateSFFAddressVO;
import com.asiainfo.crm.cm.vo.CustRelVO;
import com.asiainfo.crm.cm.vo.CustRelsVO;
import com.asiainfo.crm.cm.vo.ModifyCustAddressVO;
import com.asiainfo.crm.cm.vo.QueryB2BCustomerVO;
import com.asiainfo.crm.cm.vo.QuerySFFAddressVO;
import com.asiainfo.crm.cm.vo.SaveCustOrganizeVO;
import com.asiainfo.crm.cm.vo.SelectCmInsCmrelVO;
import com.asiainfo.crm.cm.vo.SelectedCustDeptMemberVO;
import com.asiainfo.crm.cm.vo.SffAddressKeywordResult;

public interface ICustomerBF {
        public Long getCustId(int custType) throws Exception;

        public IQBOSecCustManagerValue[] queryCustManager(String code, String staffName, String orgName,
                        String districtId,
                        String countyId, String ownerArea, String billId, int pageNum, int pageSize) throws Exception;

        public IBOCmCustPermissionClauseValue[] qryCmCustPermissionClause(String parentClauseId, int pageNum,
                        int pageSize)
                        throws Exception;

        public IBOCmHisRecordValue[] queryHisRecordByCdn(long id, String name, int type, String startDate,
                        String endDate,
                        int start, int end) throws Exception;

        public IQBOCmCustContMediumAndTypeValue[] queryCustContactMediumsForPage(long custId, long mediumType,
                        long upMediumType, int pageNum, int pageSize) throws Exception;

        public IQBOCmCustContMediumAndTypeValue[] queryCustElectronicMediumForPage(long custId, int pageNum,
                        int pageSize)
                        throws Exception;

        public IBoCmCustSegmentValue[] querySegmentByParentIdfromCache(long segId, String segName, long parentSegId,
                        String regionId) throws Exception;

        public IBoCmCustSegmentValue querySegment(long segId, String segName) throws Exception;

        public ICustomerValue queryCustomerMaskByCustIdAndLog(long custId) throws Exception;

        public IBOCmGroupRelIndustryValue[] queryGroupIndustryForPage(long custId, int pageNum, int pageSize)
                        throws Exception;

        public IBOIdentificationValue[] queryCustIdentifications(long partyId, int idenType, String idenCode)
                        throws Exception;

        public IBoCmGroupAccountingValue queryGroupAccountingById(long custId) throws Exception;

        public ICustManagerValue queryMainCustManagersByCustId(long custId) throws Exception;

        public address[] queryAddressList(QuerySFFAddressVO queryVO, int pageNum, int pageSize) throws Exception;

        /**
         * SFF address suggest by single keyword: splits {@code keyWord} on whitespace; uses the first two tokens as
         * {@code ADDR_DESC} for {@link #queryAddressList(QuerySFFAddressVO, int, int)}; keeps rows where every token
         * appears in {@code addrDesc} in order (case-insensitive). Each item has {@code text} plus full SFF fields in
         * {@code address}.
         */
        public List<SffAddressKeywordResult> querySffAddressByKeyword(String keyWord) throws Exception;

        public Map<String, Object> queryAddtionalInfo(long custId) throws Exception;

        public Map<String, Object> validateCPRNum(String cprNum) throws Exception;

        public Map<String, Object> queryOrgId(String custSegment, long segmentId, long zipCode) throws Exception;

        public Map<String, Object> checkStaffAmount(String staffAmountType, String staffAmount, String custCertCode)
                        throws Exception;

        public Map<String, Object> saveGroupCustomer(Map createMap) throws Exception;

        public Map<String, Object> createIndustry(CreateIndustryVO createVO) throws Exception;

        public Map<String, Object> deleteGroupIndustry(long relId) throws Exception;

        public Map<String, Object> checkEmailAddress(String emailAddress) throws Exception;

        public Map<String, Object> saveElecAddress(CreateContactMediumVO createVO) throws Exception;

        public Map<String, Object> checkIsCustMgr(long managerId) throws Exception;

        public Map<String, Object> saveAddress(CreateSFFAddressVO createVO) throws Exception;

        /**
         * Request body is the same as {@link #saveAddress(CreateSFFAddressVO)} (no extra fields).
         * Queries SFF with the same structured fields; if any hit equals the body, returns that
         * {@code addressId} ({@code reused=true}). Otherwise saves a new address ({@code reused=false}).
         * Map keys: {@code retFlag}, {@code retMsg}, {@code addressId} (String), {@code reused} (Boolean).
         */
        public Map<String, Object> saveSffAddressIfChanged(CreateSFFAddressVO vo) throws Exception;

        public Map<String, Object> addCustAddress(CreateCustAddressVO createVO) throws Exception;

        public int queryAddressListCount(QuerySFFAddressVO queryVO) throws Exception;

        public int queryCustManagerCond(String code, String staffName, String orgName, String districtId,
                        String countyId, String ownerArea, String billId) throws Exception;

        public int qryCmCustPermissionClauseCount(String parentClauseId) throws Exception;

        /**
         * Build permission clause tree with one-shot data query.
         *
         * <p>Note: This method is intended to replace the legacy JSP dbtree_new datamodel
         * {@code CmCustPermissionTreeModelImpl} by returning an equivalent tree structure in one response.</p>
         *
         * @return root node map containing {@code children} nodes
         * @throws Exception if query/build fails
         *
         * API Configuration:
         * - sys_id: 10006
         * - API path: /api/cm/permission-clause/tree
         * - HTTP method: GET
         */
        public CommonTreeNodeVO qryCmCustPermissionClauseTree() throws Exception;

        public int queryHisRecordCountByCdn(long id, String name, int type, String startDate, String endDate)
                        throws Exception;

        public int queryCustContactMediumsCount(long custId, long mediumType, long upMediumType) throws Exception;

        public int queryCustElectronicMediumCount(long custId) throws Exception;

        public int queryGroupIndustryCount(long custId) throws Exception;

        public Map<String, Object> deleteCustAddress(long addressRelaId) throws Exception;

        public Map<String, Object> modifyCustAddress(ModifyCustAddressVO modifyVO) throws Exception;

        public IQBOCmCustContMediumAndTypeValue queryCustContactMedium(long contRelaId) throws Exception;

        /*
         * 2025年4月1日 15:29:55
         */
        public Map<String, Object> getGroupCustStatus(long custId) throws Exception;

        /*
         * 2025年4月1日 15:29:55
         */
        public Map<String, Object> groupAccessControl(long custId) throws Exception;

        /*
         * 2025年4月1日 20:01:04
         */
        public Map<String, Object> manualOffline(long custId) throws Exception;

        public Map<String, Object> deleteCustPreferTime(String custId, String preferPeriodId) throws Exception;

        public Map<String, Object> deleteCustPreference(String custId, String preferChannelId) throws Exception;

        public ICustomerValue[] queryB2BCustomers(QueryB2BCustomerVO queryVO) throws Exception;

        public int countB2BCustomers(QueryB2BCustomerVO queryVO) throws Exception;

        /*
         * 2025年4月2日 14:15:53
         */
        public Map<String, Object> queryIfCanModifySegment(long custId) throws Exception;

        /*
         * 2025年4月3日 09:26:47
         */
        public Map<String, Object> modifyGroupCustState(long custId, long businessId, long partyId) throws Exception;

        public Map<String, Object> checkManagerPrivs() throws Exception;

        /*
         * 2025年4月3日 10:15:34
         */
        public Map<String, Object> queryCustomerInfo(long custId, int custType) throws Exception;

        /*
         * 2025年4月3日 10:54:26
         */
        public Map<String, Object> saveAddtionalInfo(long custId, String popup, String onlyUpdatePopValue,
                        String additionalInfo)
                        throws Exception;

        /*
         * 2025年4月3日 11:09:25
         */
        public Map<String, Object> queryCmCustPutOnRecord(long custId) throws Exception;

        /*
         * 2025年4月3日 11:17:30
         */
        public Map<String, Object> saveAKSInfo(long custId, String aksFlag) throws Exception;

        public Map<String, Object> saveCustRel(CustRelVO custRelvo) throws Exception;

        public Map<String, Object> delCustRel(CustRelsVO custRelvos) throws Exception;

        public Map<String, Object> saveCustPrefeTime(CreatePerferTimeVO createPerferTimeVO) throws Exception;

        public Map<String, Object> saveCustPreference(CreatePerferInfoVO createPerferInfoVO) throws Exception;

        /*
         * 2025年4月8日 16:21:06
         */
        public Map<String, Object> checkHasOngoingOrder(long custId) throws Exception;

        public String validAgreement(long custId, long agrId);

        public Map queryCustSimpleById(long custId) throws Exception;

        /*
         * 2025年4月8日 16:21:50
         */
        public DataContainer[] queryGroupDeptBill(long custId, long deptId, int startNum, int endNum)
                        throws Exception;

        /*
         * 2025年4月8日 16:22:01
         */
        public int queryGroupDeptBillCount(long custId, long deptId) throws Exception;

        /*
         * 2025年4月8日 17:43:46
         */
        public Map<String, Object> saveGroupDeptInfo(SaveCustOrganizeVO saveVO) throws Exception;

        /*
         * 2025年4月8日 20:02:15
         */
        public Map<String, Object> delGroupDeptOfMember(long deptId) throws Exception;

        /*
         * 2025年4月8日 20:23:28
         */
        public Map<String, Object> delGroupCustDept(long deptId) throws Exception;

        /*
         * 2025年4月9日 10:38:33
         */
        public Map<String, Object> delGroupDeptNumMember(SelectedCustDeptMemberVO deleteVO) throws Exception;

        /*
         * 2025年4月9日 10:56:57
         */
        public Map<String, Object> modifyGroupDeptNumMember(long deptId, SelectedCustDeptMemberVO selectVO)
                        throws Exception;

        public Map<String, Object> checkGroupDeptParent(long deptId) throws Exception;

        public String getTTDetailPageUrl() throws Exception;

        public Map<String, Object> checkDeptName(long custId, String deptName) throws Exception;

        /*
         * 2025年4月10日 10:54:06
         */
        public Map<String, Object> saveGroupDeptNumMember(long custId, long deptId, SelectCmInsCmrelVO selectVO)
                        throws Exception;
        public CustIndivBean queryIndivCust(long custId, String opCode) throws Exception;
}
