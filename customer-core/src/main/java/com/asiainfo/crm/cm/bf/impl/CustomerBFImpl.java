package com.asiainfo.crm.cm.bf.impl;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.*;

import com.ai.appframe2.web.DataContainerList;
import com.ai.oneframe.remote.service.interfaces.IRemoteTransferSV;
import com.asiainfo.crm.cm.busimodel.common.ParamUtil;
import com.asiainfo.crm.cm.common.bo.BOCmPartyRoleBean;
import com.asiainfo.crm.cm.common.ivalues.IBOCmPartyRoleValue;
import com.asiainfo.crm.cm.common.util.DataContainerUtils;
import com.asiainfo.crm.cm.inner.customer.ivalues.*;
import com.asiainfo.crm.cm.service.interfaces.*;
import com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICmCustSV;
import com.asiainfo.crm.cm.vo.*;
import com.asiainfo.crm.cm.inner.customer.bo.*;
import com.asiainfo.crm.inter.exe.remote.bean.CustSimpleInfo;
import com.asiainfo.crm.inter.exe.webservice.client.cpr.log.ivalues.IBOInterCallLogValue;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.common.DataContainerInterface;
import com.ai.appframe2.common.DataStructInterface;
import com.ai.appframe2.common.DataType;
import com.ai.appframe2.common.ServiceManager;
import com.ai.appframe2.common.SessionManager;
import com.ai.appframe2.complex.cache.CacheFactory;
import com.ai.appframe2.complex.center.CenterFactory;
import com.ai.appframe2.complex.tab.split.TenantIDFactory;
import com.ai.appframe2.privilege.UserInfoInterface;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.common.i18n.CrmLocaleFactory;
import com.ai.common.ivalues.IBOBsDistrictValue;
import com.ai.common.ivalues.IBOBsStaticDataValue;
import com.ai.common.util.CenterUtil;
import com.ai.common.util.DistrictUtil;
import com.ai.common.util.ExceptionUtil;
import com.ai.common.util.StaticDataUtil;
import com.ai.common.util.TimeUtil;
import com.ai.oneframe.common.OFStringConverter;
import com.ai.oneframe.cust.ivalues.IBOOf2CustInfoItemValue;
import com.ai.oneframe.cust.service.interfaces.IOf2CustInfoItemSV;
import com.ai.oneframe.inter.ivalues.CustGroupBean;
import com.ai.oneframe.inter.ivalues.CustIndivBean;
import com.ai.oneframe.view.ivalues.IBOOf2VcCustItemValue;
import com.ai.oneframe.view.service.interfaces.IOf2VcCustItemSV;
import com.ai.secframe.orgmodel.ivalues.IQBOSecCustManagerValue;
import com.aie.api.tool.XmlParameters;
import com.asiainfo.crm.agreement.agreement.ivalues.IBOAgrAgreementHValue;
import com.asiainfo.crm.agreement.teaminvoke.out.service.interfaces.IAgreementFSV;
import com.asiainfo.crm.cm.bf.ICustomerBF;
import com.asiainfo.crm.cm.bi2oneframe.service.interfaces.ICmBi2OneframeSV;
import com.asiainfo.crm.cm.common.CmBusinessOperation;
import com.asiainfo.crm.cm.common.CmConstants;
import com.asiainfo.crm.cm.common.CmConstants.TenantId;
import com.asiainfo.crm.cm.common.CmRecordLog;
import com.asiainfo.crm.cm.common.CmServiceFactory;
import com.asiainfo.crm.cm.common.CmxServiceFactory;
import com.asiainfo.crm.cm.common.bo.BOIdentificationBean;
import com.asiainfo.crm.cm.common.cache.CmIndustryCacheImpl;
import com.asiainfo.crm.cm.common.cache.CmSegmentManagerCacheImpl;
import com.asiainfo.crm.cm.common.ivalues.IBOCmCustPermissionClauseValue;
import com.asiainfo.crm.cm.common.ivalues.IBOIdentificationValue;
import com.asiainfo.crm.cm.common.service.interfaces.IAddressSV;
import com.asiainfo.crm.cm.common.service.interfaces.ICmCommonSV;
import com.asiainfo.crm.cm.common.service.interfaces.ICmCustPermissionClauseSV;
import com.asiainfo.crm.common.vo.CommonTreeNodeVO;
import com.asiainfo.crm.cm.common.util.CmCommonUtil;
import com.asiainfo.crm.cm.common.util.CmStaticDataUtil;
import com.asiainfo.crm.cm.common.util.JexlCalculate;
import com.asiainfo.crm.cm.common.util.ws.address;
import com.asiainfo.crm.cm.common.util.ws.address4QryContion;
import com.asiainfo.crm.cm.custgroup.teaminvoke.out.service.interfaces.ICustGroupOutSV;
import com.asiainfo.crm.cm.customer.custmgr.bo.BOCmCustAdditionalInfoBean;
import com.asiainfo.crm.cm.customer.custmgr.bo.BOCmCustAdditionalInfoHBean;
import com.asiainfo.crm.cm.customer.custmgr.ivalues.IBOCmCustAdditionalInfoHValue;
import com.asiainfo.crm.cm.customer.custmgr.ivalues.IBOCmCustAdditionalInfoValue;
import com.asiainfo.crm.cm.customer.group.bo.BOCmGroupRelIndustryBean;
import com.asiainfo.crm.cm.customer.group.bo.BoCmGroupAccountingBean;
import com.asiainfo.crm.cm.customer.group.ivalues.IBOCmGroupRelIndustryValue;
import com.asiainfo.crm.cm.customer.group.ivalues.IBOCmSegMgrGroupRelValue;
import com.asiainfo.crm.cm.customer.group.ivalues.IBoCmCustSegmentValue;
import com.asiainfo.crm.cm.customer.group.ivalues.IBoCmGroupAccountingValue;
import com.asiainfo.crm.cm.customer.group.service.interfaces.ICmCustSegmentSV;
import com.asiainfo.crm.cm.custrel.bo.BOCmCustRelBean;
import com.asiainfo.crm.cm.custrel.ivalues.IBOCmCustRelValue;
import com.asiainfo.crm.cm.custrel.service.interfaces.ICmCustRelSV;
import com.asiainfo.crm.cm.dk.bo.BOCmGroupApprovalBean;
import com.asiainfo.crm.cm.dk.ivalues.IBOCmCustPutOnRecordValue;
import com.asiainfo.crm.cm.dk.ivalues.IBOCmGroupApprovalValue;
import com.asiainfo.crm.cm.dk.service.interfaces.ICmCustPreferenceInfoSV;
import com.asiainfo.crm.cm.dk.service.interfaces.ICmCustRequestTaskSV;
import com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV;
import com.asiainfo.crm.cm.inner.customer.service.interfaces.ICmCustSegmentRelaSV;
import com.asiainfo.crm.cm.inner.customer.service.interfaces.ICmGroupOrgStructSV;
import com.asiainfo.crm.cm.inner.log.ivalues.IBOCmHisRecordValue;
import com.asiainfo.crm.cm.inner.util.CmInnerServiceFactory;
import com.asiainfo.crm.cm.ln.common.util.CmLnConstants;
import com.asiainfo.crm.cm.ln.common.util.CmLnEnter;
import com.asiainfo.crm.cm.ln.customer.group.bo.BOLnCmxGroupCustBean;
import com.asiainfo.crm.cm.ln.customer.group.ivalues.IBOLnCmxGroupCustValue;
import com.asiainfo.crm.cm.ln.customer.group.service.interfaces.ICmLnGroupSV;
import com.asiainfo.crm.cm.model.bean.VOCustBean;
import com.asiainfo.crm.cm.model.bean.VOPartyBean;
import com.asiainfo.crm.cm.model.bo.ContactBean;
import com.asiainfo.crm.cm.model.bo.CustManagerBean;
import com.asiainfo.crm.cm.model.bo.CustOrganizeBean;
import com.asiainfo.crm.cm.model.bo.CustRelationshipBean;
import com.asiainfo.crm.cm.model.bo.CustomerBean;
import com.asiainfo.crm.cm.model.bo.PartyBean;
import com.asiainfo.crm.cm.model.bo.PartyContactBean;
import com.asiainfo.crm.cm.model.ivalues.IContactValue;
import com.asiainfo.crm.cm.model.ivalues.ICustManagerValue;
import com.asiainfo.crm.cm.model.ivalues.ICustOrganizeValue;
import com.asiainfo.crm.cm.model.ivalues.ICustRelationshipValue;
import com.asiainfo.crm.cm.model.ivalues.ICustomerValue;
import com.asiainfo.crm.cm.model.ivalues.IGroupMemberValue;
import com.asiainfo.crm.cm.model.ivalues.IPartyContactValue;
import com.asiainfo.crm.cm.model.ivalues.IPartyValue;
import com.asiainfo.crm.cm.model.ivalues.IVOCustValue;
import com.asiainfo.crm.cm.model.ivalues.IVOPartyValue;
import com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.ICmTeamInvokeSV;
import com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.ISec2CmSV;
import com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICm2SoSV;
import com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICmInterfaceSV;
import com.asiainfo.crm.common.util.CMUserInfoUtil;
import com.asiainfo.crm.so.common.bboss.service.interfaces.IBbossCustVpnRelSV;
import com.asiainfo.crm.so.query.ivalues.IQUserBaseInfoValue;
import com.asiainfo.crm.so.teaminvoke.in.service.interfaces.ICust2CrmSV;
import com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV;
import com.asiainfo.crm.so.util.RBossUtil;
import com.ai.secframe.client.SecframeClient;
import com.asiainfo.isub.base.common.DataTypeUtils;
import com.asiainfo.isub.base.common.web.RefineBaseAction;

import lombok.extern.slf4j.Slf4j;
import static com.asiainfo.crm.constant.RtnConst.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static com.asiainfo.isub.base.common.web.RefineBaseAction.*;


@Slf4j
@Component
public class CustomerBFImpl implements ICustomerBF {
    public Long getCustId(int custType) throws Exception {
        ICmCommonSV service = (ICmCommonSV) ServiceFactory.getService(ICmCommonSV.class);
        return service.getCustId(CmConstants.CustomerType.GROUP);
    }

    public IQBOSecCustManagerValue[] queryCustManager(String code, String staffName, String orgName, String districtId,
            String countyId, String ownerArea, String billId, int pageNum, int pageSize) throws Exception {
        int startNum = -1;
        int endNum = -1;
        if (pageNum > 0 && pageSize > 0) {
            startNum = pageSize * (pageNum - 1) + 1;
            endNum = pageNum * pageSize;
        }
        ISec2CmSV service = (ISec2CmSV) ServiceFactory.getService(ISec2CmSV.class);
        IQBOSecCustManagerValue[] value = service.queryCustManager(code, staffName, orgName, districtId, countyId,
                ownerArea, billId, startNum, endNum);
        return value;
    }

    public int queryCustManagerCond(String code, String staffName, String orgName, String districtId,
            String countyId, String ownerArea, String billId) throws Exception {
        ISec2CmSV service = (ISec2CmSV) ServiceFactory.getService(ISec2CmSV.class);
        int value = service.queryCustManagerCond(code, staffName, orgName, districtId, countyId, ownerArea, billId);
        return value;
    }

    public IBOCmCustPermissionClauseValue[] qryCmCustPermissionClause(String parentClauseId, int pageNum, int pageSize)
            throws Exception {
        int startNum = -1;
        int endNum = -1;
        if (pageNum > 0 && pageSize > 0) {
            startNum = pageSize * (pageNum - 1) + 1;
            endNum = pageNum * pageSize;
        }
        ICmCustPermissionClauseSV service = (ICmCustPermissionClauseSV) ServiceFactory
                .getService(ICmCustPermissionClauseSV.class);
        IBOCmCustPermissionClauseValue[] values = service.qryCmCustPermissionClause(parentClauseId, startNum, endNum);
        return values;
    }

    public int qryCmCustPermissionClauseCount(String parentClauseId) throws Exception {
        ICmCustPermissionClauseSV service = (ICmCustPermissionClauseSV) ServiceFactory
                .getService(ICmCustPermissionClauseSV.class);
        int value = service.qryCmCustPermissionClauseCount(parentClauseId);
        return value;
    }

    @Override
    public CommonTreeNodeVO qryCmCustPermissionClauseTree() throws Exception {
        ICmCustPermissionClauseSV service = (ICmCustPermissionClauseSV) ServiceFactory
                .getService(ICmCustPermissionClauseSV.class);
        IBOCmCustPermissionClauseValue[] all = service.qryAllCmCustPermissionClause();

        // Legacy JSP tree structure:
        // - root: Permission (value=-1)
        // - level-1: clauses whose parentClauseId == -1
        // - level-2: clauses whose parentClauseId == level-1 clauseId
        Map<Long, List<IBOCmCustPermissionClauseValue>> childrenByParent = new HashMap<>();
        if (all != null && all.length > 0) {
            for (IBOCmCustPermissionClauseValue v : all) {
                if (v == null) {
                    continue;
                }
                long parentId = v.getParentClauseId();
                childrenByParent.computeIfAbsent(parentId, k -> new ArrayList<>()).add(v);
            }
        }

        CommonTreeNodeVO root = new CommonTreeNodeVO();
        root.setValue("-1");
        root.setTreeNodeId("1");
        root.setLabel("Permission");

        List<CommonTreeNodeVO> level1Nodes = new ArrayList<>();
        List<IBOCmCustPermissionClauseValue> level1Values = childrenByParent.getOrDefault(-1L, new ArrayList<>());
        for (IBOCmCustPermissionClauseValue parent : level1Values) {
            CommonTreeNodeVO parentNode = new CommonTreeNodeVO();
            long parentClauseId = parent.getClauseId();
            parentNode.setValue(String.valueOf(parentClauseId));
            parentNode.setTreeNodeId(String.valueOf(parentClauseId));
            parentNode.setLabel(parent.getClauseContent());

            List<CommonTreeNodeVO> childNodes = new ArrayList<>();
            List<IBOCmCustPermissionClauseValue> children = childrenByParent.getOrDefault(parentClauseId,
                    new ArrayList<>());
            for (IBOCmCustPermissionClauseValue child : children) {
                CommonTreeNodeVO childNode = new CommonTreeNodeVO();
                long childClauseId = child.getClauseId();
                childNode.setValue(String.valueOf(childClauseId));
                childNode.setTreeNodeId(String.valueOf(childClauseId));
                childNode.setLabel(child.getClauseContent());
                childNode.setLeaf(true);
                childNodes.add(childNode);
            }
            parentNode.setChildren(childNodes);
            parentNode.setLeaf(childNodes.isEmpty());
            level1Nodes.add(parentNode);
        }
        root.setChildren(level1Nodes);
        root.setLeaf(level1Nodes.isEmpty());
        return root;
    }

    public IBOCmHisRecordValue[] queryHisRecordByCdn(long id, String name, int type, String startDate, String endDate,
            int pageNum, int pageSize) throws Exception {
        int startNum = -1;
        int endNum = -1;
        if (pageNum > 0 && pageSize > 0) {
            startNum = pageSize * (pageNum - 1) + 1;
            endNum = pageNum * pageSize;
        }
        ICmBusiLogSV service = (ICmBusiLogSV) ServiceFactory.getService(ICmBusiLogSV.class);
        IBOCmHisRecordValue[] values = service.queryHisRecordByCdn(id, name, type, startDate, endDate, startNum,
                endNum);
        return values;
    }

    public int queryHisRecordCountByCdn(long id, String name, int type, String startDate, String endDate)
            throws Exception {
        ICmBusiLogSV service = (ICmBusiLogSV) ServiceFactory.getService(ICmBusiLogSV.class);
        int value = service.queryHisRecordCountByCdn(id, name, type, startDate, endDate);
        return value;
    }

    public IQBOCmCustContMediumAndTypeValue[] queryCustContactMediumsForPage(long custId, long mediumType,
            long upMediumType, int pageNum, int pageSize) throws Exception {
        int startNum = -1;
        int endNum = -1;
        if (pageNum > 0 && pageSize > 0) {
            startNum = pageSize * (pageNum - 1) + 1;
            endNum = pageNum * pageSize;
        }
        ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        IQBOCmCustContMediumAndTypeValue[] values = service.queryCustContactMediumsForPage(custId, mediumType,
                upMediumType, startNum, endNum);
        return values;
    }

    public int queryCustContactMediumsCount(long custId, long mediumType, long upMediumType) throws Exception {
        ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        int value = service.queryCustContactMediumsCount(custId, mediumType,
                upMediumType);
        return value;
    }

    public IQBOCmCustContMediumAndTypeValue[] queryCustElectronicMediumForPage(long custId, int pageNum, int pageSize)
            throws Exception {
        int startNum = -1;
        int endNum = -1;
        if (pageNum > 0 && pageSize > 0) {
            startNum = pageSize * (pageNum - 1) + 1;
            endNum = pageNum * pageSize;
        }
        ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        IQBOCmCustContMediumAndTypeValue[] values = service.queryCustElectronicMediumForPage(custId, startNum, endNum);
        return values;
    }

    public int queryCustElectronicMediumCount(long custId) throws Exception {
        ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        int value = service.queryCustElectronicMediumCount(custId);
        return value;
    }

    public IBoCmCustSegmentValue[] querySegmentByParentIdfromCache(long segId, String segName, long parentSegId,
            String regionId) throws Exception {
        ICmCustSegmentSV service = (ICmCustSegmentSV) ServiceFactory.getService(ICmCustSegmentSV.class);
        IBoCmCustSegmentValue[] values = service.querySegmentByParentIdfromCache(segId, segName, parentSegId, regionId);
        return values;
    }

    public IBoCmCustSegmentValue querySegment(long segId, String segName) throws Exception {
        ICmCustSegmentSV service = (ICmCustSegmentSV) ServiceFactory.getService(ICmCustSegmentSV.class);
        IBoCmCustSegmentValue value = service.querySegment(segId, segName);
        return value;
    }

    public ICustomerValue queryCustomerMaskByCustIdAndLog(long custId) throws Exception {
        ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        ICustomerValue value = service.queryCustomerMaskByCustIdAndLog(custId);
        return value;
    }

    public IBOCmGroupRelIndustryValue[] queryGroupIndustryForPage(long custId, int pageNum, int pageSize)
            throws Exception {
        int startNum = -1;
        int endNum = -1;
        if (pageNum > 0 && pageSize > 0) {
            startNum = pageSize * (pageNum - 1) + 1;
            endNum = pageNum * pageSize;
        }
        ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        IBOCmGroupRelIndustryValue[] values = service.queryGroupIndustryForPage(custId, startNum, endNum);
        return values;
    }

    public int queryGroupIndustryCount(long custId) throws Exception {
        ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        int vlaue = service.queryGroupIndustryCount(custId);
        return vlaue;
    }

    public IBOIdentificationValue[] queryCustIdentifications(long partyId, int idenType, String idenCode)
            throws Exception {
        ICmDkCustomerSV service = (ICmDkCustomerSV) ServiceFactory.getService(ICmDkCustomerSV.class);
        IBOIdentificationValue[] values = service.queryCustIdentifications(partyId, idenType, idenCode);
        return values;
    }

    public IBoCmGroupAccountingValue queryGroupAccountingById(long custId) throws Exception {
        ICmLnGroupSV service = (ICmLnGroupSV) ServiceFactory.getService(ICmLnGroupSV.class);
        IBoCmGroupAccountingValue value = service.queryGroupAccountingById(custId);
        return value;
    }

    public ICustManagerValue queryMainCustManagersByCustId(long custId) throws Exception {
        ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        ICustManagerValue value = service.queryMainCustManagersByCustId(custId);
        return value;
    }

    public address[] queryAddressList(QuerySFFAddressVO queryVO, int pageNum, int pageSize) throws Exception {
        if (queryVO == null) {
            throw new IllegalArgumentException("queryVO must not be null");
        }
        Long addressId = parsePositiveSffAddressId(queryVO.getAddressId());
        IAddressSV service = (IAddressSV) ServiceFactory.getService(IAddressSV.class);
        if (addressId != null) {
            String districtId = StringUtils.isNotBlank(queryVO.getDistrictId()) ? queryVO.getDistrictId() : null;
            address one = service.getAddressInfo(addressId.longValue(), districtId);
            if (one == null) {
                return new address[0];
            }
            return new address[] { one };
        }
        address4QryContion condition = buildSffAddressCondition(queryVO);
        //sff地址查询，特殊处理，老系统只支持每页9条分页，修改逻辑,直接传入页数和每页条数
        return service.queryAddressList(condition, null, null, pageNum, pageSize);
    }
    
    /**
     * SFF keyword lookup on {@code ADDR_DESC}: splits {@code keyWord} on whitespace; uses the first two tokens
     * joined by a space as the {@code ADDR_DESC} query sent to SFF; keeps rows where every token appears in
     * {@code addrDesc} in the same order (case-insensitive), without normalizing internal whitespace.
     */
    @Override
    public List<SffAddressKeywordResult> querySffAddressByKeyword(String keyWord) throws Exception {
        if (StringUtils.isBlank(keyWord)) {
            return Collections.emptyList();
        }
        String[] tokens = StringUtils.split(keyWord.trim());
        if (tokens == null || tokens.length == 0) {
            return Collections.emptyList();
        }
        String addrDescQuery = tokens.length >= 2 ? tokens[0] + " " + tokens[1] : tokens[0];
        String[] tokensLower = new String[tokens.length];
        for (int i = 0; i < tokens.length; i++) {
            tokensLower[i] = tokens[i].toLowerCase(Locale.ROOT);
        }
        final int pageSize = 60;
        QuerySFFAddressVO vo = new QuerySFFAddressVO();
        vo.setAddrDesc(addrDescQuery);
        address[] batch = queryAddressList(vo, 1, pageSize);
        if (batch == null || batch.length == 0) {
            return Collections.emptyList();
        }
        LinkedHashMap<String, SffAddressKeywordResult> merged = new LinkedHashMap<>();
        for (address a : batch) {
            if (a == null || !sffAddrDescMatchesOrderedTokens(a, tokensLower)) {
                continue;
            }
            String dedupeKey = sffAddressDedupeKey(a);
            if (!merged.containsKey(dedupeKey)) {
                merged.put(dedupeKey, toSffAddressKeywordResult(a));
            }
        }
        return new ArrayList<>(merged.values());
    }

    /**
     * Each token must appear as a substring of {@code addrDesc} in order (after trim + lower case on the whole
     * description only; internal newlines/spaces are not collapsed).
     */
    private static boolean sffAddrDescMatchesOrderedTokens(address a, String[] tokensLower) {
        if (a == null || tokensLower == null || tokensLower.length == 0) {
            return false;
        }
        if (StringUtils.isBlank(a.getAddrDesc())) {
            return false;
        }
        String haystack = a.getAddrDesc().trim().toLowerCase(Locale.ROOT);
        int from = 0;
        for (String t : tokensLower) {
            if (StringUtils.isEmpty(t)) {
                continue;
            }
            int idx = haystack.indexOf(t, from);
            if (idx < 0) {
                return false;
            }
            from = idx + t.length();
        }
        return true;
    }

    private static String sffAddressDedupeKey(address a) {
        if (a != null && StringUtils.isNotBlank(a.getAddressId())) {
            return a.getAddressId();
        }
        return StringUtils.defaultString(a == null ? null : a.getZipcode()) + "|"
                + StringUtils.defaultString(a == null ? null : a.getStreetName()) + "|"
                + StringUtils.defaultString(a == null ? null : a.getHouseNumber()) + "|"
                + StringUtils.defaultString(a == null ? null : a.getFloor()) + "|"
                + StringUtils.defaultString(a == null ? null : a.getDoorNumber());
    }

    private static SffAddressKeywordResult toSffAddressKeywordResult(address a) {
        SffAddressKeywordResult result = new SffAddressKeywordResult();
        if (a != null) {
            result.setText(buildSffAddressDisplayText(a));
            result.setAddress(SffAddressFullVO.fromAddress(a));
        } else {
            result.setText("");
            result.setAddress(null);
        }
        return result;
    }

    private static String buildSffStreetLine(address a) {
        if (a == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        appendSffToken(sb, a.getStreetName());
        appendSffToken(sb, a.getStreetName2());
        appendSffToken(sb, a.getStreetName3());
        return sb.length() == 0 ? null : sb.toString();
    }

    private static void appendSffToken(StringBuilder sb, String part) {
        if (StringUtils.isBlank(part)) {
            return;
        }
        if (sb.length() > 0) {
            sb.append(' ');
        }
        sb.append(part.trim());
    }

    private static String buildSffAddressDisplayText(address a) {
        if (a == null) {
            return "";
        }
        if (StringUtils.isNotBlank(a.getAddrDesc())) {
            return a.getAddrDesc().trim();
        }
        StringBuilder sb = new StringBuilder();
        appendSffToken(sb, buildSffStreetLine(a));
        appendSffToken(sb, a.getHouseNumber());
        appendSffToken(sb, a.getHouseLetter());
        appendSffToken(sb, a.getFloor());
        appendSffToken(sb, a.getDoorNumber());
        appendSffToken(sb, a.getMainDoor());
        appendSffToken(sb, a.getApartment());
        appendSffToken(sb, a.getZipcode());
        appendSffToken(sb, a.getCity());
        appendSffToken(sb, a.getCounty());
        appendSffToken(sb, a.getMunicipality());
        return sb.length() == 0 ? "" : sb.toString();
    }

    private address4QryContion buildSffAddressCondition(QuerySFFAddressVO queryVO) throws Exception {
        address4QryContion condition = new address4QryContion();
        if (queryVO == null) {
            return condition;
        }
        condition.setZipcode(queryVO.getZipcode());
        condition.setMunicipality(queryVO.getMunicipality());
        if (StringUtils.isNotBlank(queryVO.getDistrictId())) {
            IBOBsDistrictValue distictVal = DistrictUtil.getDistrictByDistrictId(Long.valueOf(queryVO.getDistrictId()));
            condition.setCity(distictVal != null ? distictVal.getDistrictName() : null);
        } else {
            condition.setCity(queryVO.getCity());
        }
        condition.setStreetName(queryVO.getStreetName());
        condition.setHouseNumber(queryVO.getHouseNumber());
        condition.setHouseLetter(queryVO.getHouseLetter());
        condition.setFloor(queryVO.getFloor());
        condition.setApartment(queryVO.getApartment());
        condition.setDoorNumber(queryVO.getDoorNumber());
        condition.setMainDoor(queryVO.getMainDoor());
        condition.setCounty(queryVO.getCounty());
        condition.setPoBox(queryVO.getPoBox());
        condition.setCoName(queryVO.getCoName());
        condition.setCountry(queryVO.getCountry());
        if (StringUtils.isNotBlank(queryVO.getAddrDesc())) {
            condition.setAddrDesc(queryVO.getAddrDesc());
        }
        if (StringUtils.isNotBlank(queryVO.getAddressType())) {
            condition.setAddressType(queryVO.getAddressType());
        }
        if (StringUtils.isNotBlank(queryVO.getBlackState())) {
            condition.setBlackState(queryVO.getBlackState());
        }
        if (StringUtils.isNotBlank(queryVO.getDeliveryState())) {
            condition.setDeliveryState(queryVO.getDeliveryState());
        }
        if (StringUtils.isNotBlank(queryVO.getStreetName2())) {
            condition.setStreetName2(queryVO.getStreetName2());
        }
        if (StringUtils.isNotBlank(queryVO.getStreetName3())) {
            condition.setStreetName3(queryVO.getStreetName3());
        }
        return condition;
    }

    public int queryAddressListCount(QuerySFFAddressVO queryVO) throws Exception {
        if (queryVO == null) {
            throw new IllegalArgumentException("queryVO must not be null");
        }
        Long addressId = parsePositiveSffAddressId(queryVO.getAddressId());
        IAddressSV service = (IAddressSV) ServiceFactory.getService(IAddressSV.class);
        if (addressId != null) {
            String districtId = StringUtils.isNotBlank(queryVO.getDistrictId()) ? queryVO.getDistrictId() : null;
            address one = service.getAddressInfo(addressId.longValue(), districtId);
            return one != null ? 1 : 0;
        }
        address4QryContion condition = buildSffAddressCondition(queryVO);
        return service.queryAddressListCount(condition, null, null);
    }

    /**
     * When {@code ADDRESS_ID} is present and parses to a value &gt; 0, returns it; otherwise {@code null}.
     * Non-blank non-numeric strings throw {@link IllegalArgumentException}.
     */
    private static Long parsePositiveSffAddressId(String addressId) {
        if (StringUtils.isBlank(addressId)) {
            return null;
        }
        try {
            long id = Long.parseLong(addressId.trim());
            return id > 0 ? Long.valueOf(id) : null;
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("ADDRESS_ID must be numeric: " + addressId);
        }
    }

    public Map<String, Object> queryAddtionalInfo(long custId) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        try {
            if (custId > 0) {
                ICm2SoSV cmsv = (ICm2SoSV) ServiceFactory.getCrossCenterService(ICm2SoSV.class);
                ICust2CrmSV cust2CrmSV = (ICust2CrmSV) ServiceFactory.getService(ICust2CrmSV.class);
                ICustomerValue customerInfo = cust2CrmSV.queryCustomerById(custId);
                if (customerInfo != null && StringUtils.isNotBlank(customerInfo.getRemarks())) {
                    cp.put("ADDITIONAL_INFO", customerInfo.getRemarks());
                }
                IBOCmCustAdditionalInfoValue[] addionalInfo = cmsv.queryCustAdditionalInfo(custId);
                if (addionalInfo != null && addionalInfo.length > 0) {
                    cp.put("ADDITIONAL_INFO_POP_UP",
                            StringUtils.isNotBlank(addionalInfo[0].getNoteAutoPopup())
                                    ? addionalInfo[0].getNoteAutoPopup()
                                    : "N");
                    cp.put("ADDITIONAL_INFO", cmsv.getNoteString(addionalInfo));
                }
            }
        } catch (Exception e) {
            log.error("ERROR", e);
            if (log.isErrorEnabled()) {
                log.error(e.getMessage());
            }
        }
        return cp;
    }

    public Map<String, Object> validateCPRNum(String cprNum) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        cp.put("retFlag", "Y");

        // 查询法人联系人
        DataContainer dc = new DataContainer();
        dc.set(ICustomerValue.S_CustType, CmConstants.CustomerType.GROUP);// 集团客户
        dc.set(IContactValue.S_ContType, CmConstants.CmGroupContactType.LEGAL_OWNER);// 联系人类型-法人
        dc.set(IContactValue.S_CertType, CmConstants.CertificateType.CPR);// 证件类型-CPR
        dc.set(IContactValue.S_CertCode, cprNum);// cpr number
        // 直接使用客户综合查询即可！
        ICmContactSV cmGroupInformInfoSV = (ICmContactSV) ServiceFactory.getService(ICmContactSV.class);
        IContactValue[] values = cmGroupInformInfoSV.queryCustContacts(dc, -1, -1);

        if (null != values && values.length > 0) {
            cp.put("msg", "Verified successfully.");
            // CPR在CRM进行验证客户是否存在，存在则不进行创建。
            return cp;
        }
        Map<String, String> params = new HashMap<String, String>();
        params.put("PNR", cprNum);
        // 送CPR进行校验
        ICmIndivCustomerSV indivService = (ICmIndivCustomerSV) ServiceFactory.getService(ICmIndivCustomerSV.class);
        Map cprData = indivService.validateCPR(params);
        String FEJLNR = (String) cprData.get("FEJLNR");
        if (!FEJLNR.equals("00")) {
            // CPR在CPR系统中不存在。
            cp.put("msg", "The CPR number does not exist in CPR system. Please input again.");
            cp.put("retFlag", "N");
        } else {
            cp.put("msg", "Verified successfully.");
        }
        return cp;
    }

    public Map<String, Object> queryOrgId(String custSegment, long segmentId, long zipCode) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        cp.put("retFlag", "N");
        if (segmentId < 0) {
            segmentId = DataType.getAsLong(custSegment);
        }

        if (segmentId > 0) {
            ICmGroupCustomerSV groupCustomerSV = (ICmGroupCustomerSV) ServiceFactory
                    .getService(ICmGroupCustomerSV.class);
            IBOCmSegMgrGroupRelValue segMgrGroupValue = groupCustomerSV.queryOrgIdBySegmentZipCode(segmentId, zipCode);
            String organizeId = "";
            String remark = "";
            if (segMgrGroupValue != null) {
                organizeId = segMgrGroupValue.getGroupCode();
                remark = segMgrGroupValue.getRemarks();
            }
            if (StringUtils.isNotBlank(organizeId)) {
                cp.put("retFlag", "Y");
                cp.put("organizeId", organizeId);
                cp.put("remark", remark);// 有值代表为MA||SA
            } else {
                // 细分对应的客户经理组参数未配置！
                cp.put("retMsg", "Account Manager parameters for this Postcode are not configured.");
            }
        }
        return cp;
    }

    public Map<String, Object> checkStaffAmount(String staffAmountType, String staffAmount, String custCertCode)
            throws Exception {
        Map<String, Object> cp = new HashMap<>();

        if (StringUtils.isNotBlank(custCertCode) && !custCertCode.startsWith("K")) {
            cp.put("retFlag", "Y");
            cp.put("retVal", DataType.getAsString(staffAmount));
            return cp;
        }
        // 查询静态规则配置参数
        IBOBsStaticDataValue staticDataValue = StaticDataUtil.getStaticData("CM_GROUP_STAFF_AMOUNT_TYPE",
                staffAmountType);
        String staticData = "";
        String codeDesc = "";
        if (CmCommonUtil.isNotEmptyObject(staticDataValue)) {
            staticData = staticDataValue.getExternCodeType();
            codeDesc = staticDataValue.getCodeDesc();
        }
        if (StringUtils.isBlank(staticData)) {
            cp.put("retFlag", "Y");
            cp.put("retVal", DataType.getAsString(staffAmount));
            return cp;
        }
        // 规则处理工具
        JexlCalculate jexlCal = new JexlCalculate();
        Map<String, Object> paraMap = new HashMap<String, Object>();
        if (StringUtils.isBlank(staffAmount)) {
            staffAmount = null;
        }
        paraMap.put("STAFF_AMOUNT", staffAmount);
        // 根据员工数量判断与数量类型是否匹配
        String result = jexlCal.evaluateExpression(staticData, paraMap);
        if (!StringUtils.isBlank(result)) {
            if ("-1".equals(result)) {
                cp.put("retFlag", "N");
                cp.put("retMsg", CrmLocaleFactory.getResource("CMS0000160", codeDesc));
                return cp;
            } else {
                cp.put("retFlag", "Y");
                cp.put("retVal", result);
                return cp;
            }
        }
        return cp;
    }

    public Map<String, Object> saveGroupCustomer(Map createMap) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = "";
        String successMsg = "";
        String custId = "";

        IVOCustValue custValue = new VOCustBean();
        ICustomerValue customerValue = new CustomerBean();
        customerValue.setStsToNew();
        IBOLnCmxGroupCustValue customerKZValue = new BOLnCmxGroupCustBean();
        customerKZValue.setStsToNew();
        IBoCmGroupAccountingValue custAccounting = new BoCmGroupAccountingBean();
        custAccounting.setStsToNew();
        ICustManagerValue custManagerValue = new CustManagerBean();
        custManagerValue.setStsToNew();
        IBOIdentificationValue identificationValue = new BOIdentificationBean();
        identificationValue.setStsToNew();
        try {
            Map cmxGroupCustomerMap = (Map)createMap.get("cmxGroupCustomer");
            Map cmGroupAccountingMap = (Map)createMap.get("cmGroupAccounting");
            Map cmGroupManagerMap = (Map)createMap.get("cmGroupManager");
            Map cmIdentificationMap = (Map)createMap.get("cmIdentification");

            DataContainer customerDC = DataContainerUtils.wrap(createMap);
            customerValue.copy(customerDC);
            if(cmxGroupCustomerMap!=null && cmxGroupCustomerMap.size()>0){
                DataContainer cmxGroupCustomerDC = DataContainerUtils.wrap(cmxGroupCustomerMap);
                customerKZValue.copy(cmxGroupCustomerDC);
            }
            if(cmGroupAccountingMap!=null && cmGroupAccountingMap.size()>0){
                DataContainer cmGroupAccountingDC = DataContainerUtils.wrap(cmGroupAccountingMap);
                custAccounting.copy(cmGroupAccountingDC);
            }
            if(cmGroupManagerMap!=null && cmGroupManagerMap.size()>0){
                DataContainer cmGroupManagerDC = DataContainerUtils.wrap(cmGroupManagerMap);
                custManagerValue.copy(cmGroupManagerDC);
            }
            if(cmIdentificationMap!=null && cmIdentificationMap.size()>0){
                DataContainer cmIdentificationDC = DataContainerUtils.wrap(cmIdentificationMap);
                identificationValue.copy(cmIdentificationDC);
            }


            // BeanUtils.copyProperties(createVO, customerValue);
            // if (createVO.getCmxGroupCustomer() != null) {
            //     BeanUtils.copyProperties(createVO.getCmxGroupCustomer(), customerKZValue);
            // }
            // if (createVO.getCmGroupAccounting() != null) {
            //     BeanUtils.copyProperties(createVO.getCmGroupAccounting(), custAccounting);
            // }
            // if (createVO.getCmGroupManager() != null) {
            //     BeanUtils.copyProperties(createVO.getCmGroupManager(), custManagerValue);
            // }
            // if (createVO.getCmIdentification() != null) {
            //     BeanUtils.copyProperties(createVO.getCmIdentification(), identificationValue);
            // }

            String allowInheritable = null;
            String allowRevisable = null;
            String allowCreditCalculated = null;
            String allowApprovable = null;
            if(createMap.get("allowInheritable")!=null){
                allowInheritable = (int)createMap.get("allowInheritable")+"";
            }
            if(createMap.get("allowRevisable")!=null){
                allowRevisable = (int)createMap.get("allowRevisable")+"";
            }
            if(createMap.get("allowCreditCalculated")!=null){
                allowCreditCalculated = (int)createMap.get("allowCreditCalculated")+"";
            }
            if(createMap.get("allowApprovable")!=null){
                allowApprovable = (int)createMap.get("allowApprovable")+"";
            }
            String appleDeptId = identificationValue.getIdenNr();

           

            // String allowInheritable = createVO.getAllowInheritable();
            // String allowRevisable = createVO.getAllowRevisable();
            // String allowCreditCalculated = createVO.getAllowCreditCalculated();
            // String allowApprovabl = createVO.getAllowApprovable();
            // String appleDeptId = identificationValue.getIdenNr();

            // 客户表特殊逻辑
            if (!StringUtils.isNotBlank(customerValue.getCustCertCode())) {
                customerValue.setCustCertCode("K" + customerValue.getCustId());
            }
            custValue.setCustomer(customerValue);
            custId = String.valueOf(custValue.getCustomer().getCustId());

            // 客户扩展表特殊逻辑
            customerKZValue.setCustId(DataType.getAsLong(custId));
            // 判断公司状态是否为空，为空时默认设置为1
            if (CmCommonUtil.isEmptyObj(customerKZValue.getCompanyStatus())
                    || 0 == customerKZValue.getCompanyStatus()) {
                customerKZValue.setCompanyStatus(1);
            }
            custValue.setUserObject("cmxGrpCust", customerKZValue);// 设置集团扩展信息
            // 判断法人识别号--增加对应的联系人
            saveContactByCprNum(custId, customerKZValue);
            custValue.setUserObject(CmLnConstants.DealCustInfo.OP_STATE, CmLnConstants.DealCustInfo.OP_NEW);// 新增集团扩展信息

            // 客户经理特殊逻辑
            custValue.addCustManager(custManagerValue);

            // 会计信息
            custAccounting.setCustId(DataType.getAsLong(custId));
            custValue.addCustAccounting(custAccounting);

            // 调用@chenxq保存集团客户子类型接口
            IBOCmCustSegmentRelaValue custSegmentRela = new BOCmCustSegmentRelaBean();
            custSegmentRela.setCustId(DataType.getAsLong(custId));// 取得集团客户ID
            custSegmentRela.setSegmentId(DataType.getAsLong(custValue.getCustomer().getGroupSegmentId()));
            if (!StringUtils.isBlank(allowInheritable)) {
                custSegmentRela.setIsInheritable(DataType.getAsLong(allowInheritable));
            }
            if (!StringUtils.isBlank(allowRevisable)) {
                custSegmentRela.setIsRevisable(DataType.getAsLong(allowRevisable));
            }
            if (!StringUtils.isBlank(allowCreditCalculated)) {
                custSegmentRela.setIsCreditCalculated(DataType.getAsLong(allowCreditCalculated));
            }
            if (!StringUtils.isBlank(allowApprovable)) {
                custSegmentRela.setIsApprovable(DataType.getAsLong(allowApprovable));
            }
            custValue.setUserObject("cmSegmentRela", custSegmentRela);

            // 设置中心
            String regionId = custValue.getCustomer().getRegionId();
            if (StringUtils.isBlank(regionId)) {
                regionId = CmCommonUtil.getDefaultRegionId();
            }
            custValue.setBusinessId(CmConstants.BusiLogId.GROUP_CREATE);
            if (StringUtils.isNotBlank(appleDeptId)) {
                identificationValue.setIdenType(CmConstants.CustIdenType.APPLE_DEPT_ID);
                identificationValue.setIdenNr(appleDeptId);
                identificationValue.setStsToNew();
                custValue.addCustIdentification(new IBOIdentificationValue[] { identificationValue });
            }

            CmServiceFactory.getCustomerSV().saveCustomer(custValue);

            // 保存记录
            ICmCommonSV commonSV = (ICmCommonSV) ServiceFactory.getService(ICmCommonSV.class);
            String methodDetail = Thread.currentThread().getStackTrace()[1].getClassName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName();
            successMsg = CrmLocaleFactory.getResource("CMS0000081", custId);
            commonSV.saveBusiLog(CmConstants.BusiLogId.GROUP_CREATE, CmConstants.BusiLogType.CUSTOMER_LOG, Long.parseLong(custId), CmConstants.BusiLogOperType.ADD, "",
                    new HashMap(), methodDetail);

        } catch (Exception e) {
            retVal = "N";
            retMsg = CrmLocaleFactory.getResource("CMS0000084",
                    (e.getCause() == null ? e.getMessage() : e.getCause().getMessage()));
            successMsg = retMsg;
            log.error("save error",e);
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", successMsg);
            cp.put("custId", custId);
        }
        return cp;
    }

    /**
     * 创建法人类型的联系人
     * 
     * @param custId
     * @param customerKZValue
     * @throws Exception
     */
    private void saveContactByCprNum(String custId, IBOLnCmxGroupCustValue customerKZValue) throws Exception {
        // 判断法人识别号--增加对应的联系人
        String cprNum = customerKZValue.getCorporateIdentificationNumbe();
        if (StringUtils.isNotBlank(cprNum)) {
            Map<String, String> params = new HashMap<String, String>();
            params.put("PNR", cprNum);
            // 送CPR进行校验
            ICmIndivCustomerSV indivService = (ICmIndivCustomerSV) ServiceFactory.getService(ICmIndivCustomerSV.class);
            Map cprData = indivService.validateCPR(params);
            String FEJLNR = (String) cprData.get("FEJLNR");
            if ("00".equals(FEJLNR)) {
                Map data1 = (Map) cprData.get("DATA");
                Map data2 = (Map) data1.get("INFO");
                Map currentData = (Map) data2.get("Current_data");
                // 从CPR返回的客户名称
                String firstName = (String) currentData.get("FORNVN");
                String lastName = (String) currentData.get("EFTERNVN");
                // 从CPR返回的生日
                String birthDay = (String) currentData.get("FOEDDTO");
                // 查询法人联系人
                DataContainer dc = new DataContainer();
                dc.set(IContactValue.S_ContType, CmConstants.CmGroupContactType.LEGAL_OWNER);// 联系人类型-法人
                dc.set(ICustomerValue.S_CustType, CmConstants.CustomerType.GROUP);// 集团客户
                dc.set(IContactValue.S_CustId, custId);// 客户ID
                // 直接使用客户综合查询即可！
                ICmContactSV cmGroupInformInfoSV = (ICmContactSV) ServiceFactory.getService(ICmContactSV.class);
                IContactValue[] values = cmGroupInformInfoSV.queryCustContacts(dc, -1, -1);
                IContactValue iContactValue;
                // 判断联系人是否存在
                if (values != null && values.length > 0 && cprNum.equals(values[0].getCertCode())) {// 存在做更新
                    iContactValue = values[0];
                } else {// 不存在-新增
                    // 创建类型为法人的联系人
                    iContactValue = new ContactBean();
                }
                if (iContactValue != null) {
                    iContactValue.setCustId(DataType.getAsLong(custId));
                    iContactValue.setFirstName(CmCommonUtil.capitalizeFirstLetter(firstName));// 联系人名称
                    iContactValue.setLastName(CmCommonUtil.capitalizeFirstLetter(lastName));
                    iContactValue.setPrioryLevel(1);// 优先级默认设为1
                    iContactValue.setContType(CmConstants.CmGroupContactType.LEGAL_OWNER);// 法人
                    iContactValue.setCertType(CmConstants.CertificateType.CPR);// 8---cpr number
                    iContactValue.setCertCode(cprNum);// cpr number
                    iContactValue.setBirthday(TimeUtil.getTimstampByString(birthDay, "yyyyMMdd"));// 生日
                    iContactValue.setRegionId(CmCommonUtil.getDefaultRegionId());
                    CmCommonUtil.convertName(new IContactValue[] { iContactValue });
                    // 处理联系人参与信息
                    dealParty(iContactValue);
                    // 直接调用客户联系人管理的服务处理
                    dealCustContacts(iContactValue);
                }
            }
        }
    }

    // 处理联系人参与信息
    private void dealParty(IContactValue contactValue) throws Exception {
        if (CmCommonUtil.isNotEmptyObject(contactValue)) {
            ICmPartySV partySV = CmServiceFactory.getPartySV();
            // 跳过删除的情况
            if (contactValue.isDeleted() || CmConstants.RecordState.ERASE.equalsIgnoreCase(contactValue.getState())) {
                return;
            }
            IVOPartyValue ivoPartyValue = new VOPartyBean();
            IPartyValue partyValue = new PartyBean();
            partyValue.copy(contactValue);
            partyValue.setRemarks("CPR");
            if (contactValue.isNew()) {
                partyValue.setPartyType(CmConstants.PartyType.INDIVIDUAL);
            } else {
                partyValue.initProperty(IPartyValue.S_PartyType, CmConstants.PartyType.INDIVIDUAL);
            }
            IPartyContactValue partyContactValue = new PartyContactBean();
            partyContactValue.copy(contactValue);

            ivoPartyValue.setParty(partyValue);
            ivoPartyValue.setPartyContact(partyContactValue);
            try {
                // 调用参与人处理model处理参与人信息
                IVOPartyValue partyNew = partySV.savePartyNew(ivoPartyValue);
                contactValue.setPartyId(partyNew.getParty().getPartyId());
                contactValue.setContId(partyNew.getPartyContacts()[0].getContId());
            } catch (Exception e) {
                throw e;
            }
        }
    }

    // 直接调用客户联系人管理的服务处理
    private void dealCustContacts(IContactValue contactValue) throws Exception {
        if (CmCommonUtil.isNotEmptyObject(contactValue)) {
            // cpr效验新增法人标识---给联系人界面使用
            contactValue.setRemarks("CPR");
            IContactValue[] contactValues = new IContactValue[] { contactValue };
            List<BOCmIndivContactBean> indivContactList = new ArrayList<>();
            List<BOCmFamilyContactBean> familyContactList = new ArrayList<>();
            List<BOCmGroupContactBean> groupContactList = new ArrayList<>();
            for (int i = 0; i < contactValues.length; i++) {
                if (contactValues[i].getCustId() <= 0) {
                    continue;
                }
                switch (CmCommonUtil.getCustType(contactValues[i].getCustId())) {
                    case CmConstants.CustomerType.INDIVIDUAL:
                        BOCmIndivContactBean indivContactValue = new BOCmIndivContactBean();
                        indivContactValue.copy(contactValues[i]);
                        // add by shitian 解决联系人关系表新增，但是联系人信息不需要
                        if (indivContactValue.getCustContId() <= 0) {
                            indivContactValue.setCustContId(CmCommonUtil.getNewSequence(BOCmIndivContactBean.class));
                            indivContactValue.setStsToNew();
                        }
                        indivContactList.add(indivContactValue);
                        break;
                    case CmConstants.CustomerType.FAMILY:
                        BOCmFamilyContactBean familyContactValue = new BOCmFamilyContactBean();
                        familyContactValue.copy(contactValues[i]);
                        if (familyContactValue.getCustContId() <= 0) {
                            familyContactValue.setCustContId(CmCommonUtil.getNewSequence(BOCmFamilyContactBean.class));
                            familyContactValue.setStsToNew();
                        }
                        familyContactList.add(familyContactValue);
                        break;
                    case CmConstants.CustomerType.GROUP:
                        BOCmGroupContactBean groupContactValue = new BOCmGroupContactBean();
                        groupContactValue.copy(contactValues[i]);
                        if (groupContactValue.getCustContId() <= 0) {
                            groupContactValue.setCustContId(CmCommonUtil.getNewSequence(BOCmGroupContactBean.class));
                            groupContactValue.setStsToNew();
                        }
                        groupContactList.add(groupContactValue);
                        break;
                    default:
                        break;
                }
            }
            if (CmCommonUtil.isNotEmptyObject(indivContactList)) {
                BOCmIndivContactBean[] contactBeans = indivContactList.toArray(new BOCmIndivContactBean[0]);
                CmInnerServiceFactory.getCommonInnerSV().saveBeans(contactBeans);
                // 回设主键、日志信息等
                for (int i = 0; i < contactBeans.length; i++) {
                    contactValues[i].setCreateDate(contactBeans[i].getCreateDate());
                    contactValues[i].setDoneCode(contactBeans[i].getDoneCode());
                    contactValues[i].setDoneDate(contactBeans[i].getDoneDate());
                    contactValues[i].setOpId(contactBeans[i].getOpId());
                    contactValues[i].setOrgId(contactBeans[i].getOrgId());
                    contactValues[i].setEffectiveDate(contactBeans[i].getEffectiveDate());
                    contactValues[i].setExpireDate(contactBeans[i].getExpireDate());
                }
            }
            if (CmCommonUtil.isNotEmptyObject(familyContactList)) {
                BOCmFamilyContactBean[] contactBeans = familyContactList.toArray(new BOCmFamilyContactBean[0]);
                CmInnerServiceFactory.getCommonInnerSV().saveBeans(contactBeans);
                for (int i = 0; i < familyContactList.size(); i++) {
                    // 回设主键、日志信息等
                    contactValues[i].setCreateDate(contactBeans[i].getCreateDate());
                    contactValues[i].setDoneCode(contactBeans[i].getDoneCode());
                    contactValues[i].setDoneDate(contactBeans[i].getDoneDate());
                    contactValues[i].setOpId(contactBeans[i].getOpId());
                    contactValues[i].setOrgId(contactBeans[i].getOrgId());
                    contactValues[i].setEffectiveDate(contactBeans[i].getEffectiveDate());
                    contactValues[i].setExpireDate(contactBeans[i].getExpireDate());
                }
            }
            if (CmCommonUtil.isNotEmptyObject(groupContactList)) {
                BOCmGroupContactBean[] contactBeans = groupContactList.toArray(new BOCmGroupContactBean[0]);
                CmInnerServiceFactory.getCommonInnerSV().saveBeans(contactBeans);
                for (int i = 0; i < groupContactList.size(); i++) {
                    // 回设主键、日志信息等
                    contactValues[i].setCreateDate(contactBeans[i].getCreateDate());
                    contactValues[i].setDoneCode(contactBeans[i].getDoneCode());
                    contactValues[i].setDoneDate(contactBeans[i].getDoneDate());
                    contactValues[i].setOpId(contactBeans[i].getOpId());
                    contactValues[i].setOrgId(contactBeans[i].getOrgId());
                    contactValues[i].setEffectiveDate(contactBeans[i].getEffectiveDate());
                    contactValues[i].setExpireDate(contactBeans[i].getExpireDate());
                    // delete AO联系人需要记录交互记录
                    if (CmConstants.GroupContType.AO_CONTACT == contactBeans[i].getContType()) {
                        long busiId = 0L;
                        if (contactBeans[i].isDeleted()) {
                            busiId = CmBusinessOperation.CM_AO_CONTACT_DEL;
                        }
                        String[] objName = new String[] { "Administrator email:",
                                "Administrator name:" + contactBeans[i].getCustContId() };
                        CmRecordLog.saveRecord(busiId, contactBeans[i].getCustId(), objName);
                    }
                }
            }
        }
    }

    public Map<String, Object> createIndustry(CreateIndustryVO createVO) throws Exception {
        Map<String, Object> cp = new HashMap<>();// 用于向界面返回数据
        try {
            // 取得界面传参
            long custId = createVO.getCustId();
            List<IBOCmGroupRelIndustryValue> list = new ArrayList<IBOCmGroupRelIndustryValue>();
            List<IndustryVO> industryVOs = createVO.getIndustrys();
            for (int i = 0; i < industryVOs.size(); i++) {
                String industryId = industryVOs.get(i).getIndustryId();
                if (StringUtils.isBlank(industryId)) {
                    ExceptionUtil.throwBusinessException("CMS1100020");// 请正确选择行业类别！
                } else {
                    try {
                        DataType.getAsLong(industryId);
                    } catch (Exception e) {
                        log.info(e.getMessage(), e);
                        ExceptionUtil.throwBusinessException("CMS1100020");// 请正确选择行业类别！
                    }
                }
                // 取得rel_id
                String relId = industryVOs.get(i).getRelId();
                IBOCmGroupRelIndustryValue industryValue = new BOCmGroupRelIndustryBean();
                // 查询是否已存在
                StringBuilder condition = new StringBuilder();
                HashMap<String, Object> paraMap = new HashMap<String, Object>();
                DataContainerInterface[] dcs = null;
                if (StringUtils.isNotBlank(relId)) {
                    condition.append(IBOCmGroupRelIndustryValue.S_CustId).append(" = :custId ");
                    condition.append(" AND ");
                    condition.append(IBOCmGroupRelIndustryValue.S_RelId).append(" = :relId ");
                    paraMap.put("custId", custId);
                    paraMap.put("relId", relId);
                    dcs = CmInnerServiceFactory.getCommonInnerSV().getBeans(BOCmGroupRelIndustryBean.class,
                            condition.toString(), paraMap, -1, -1);
                }
                // 已存在 做修改处理
                if (dcs != null && dcs.length > 0) {
                    industryValue.copy(dcs[0]);
                } else {
                    industryValue.setIndustryId(industryId);
                    industryValue.setCustId(custId);
                }
                // 判断是否重复
                condition = new StringBuilder();
                paraMap = new HashMap<String, Object>();
                condition.append(IBOCmGroupRelIndustryValue.S_CustId).append(" = :custId ");
                condition.append(" AND ");
                condition.append(IBOCmGroupRelIndustryValue.S_IndustryId).append(" = :industryId ");
                paraMap.put("custId", custId);
                paraMap.put("industryId", industryId);
                DataContainerInterface[] industryDc = CmInnerServiceFactory.getCommonInnerSV()
                        .getBeans(BOCmGroupRelIndustryBean.class, condition.toString(), paraMap, -1, -1);
                // 存在重复的行业
                if (industryDc != null && industryDc.length > 0) {
                    ExceptionUtil.throwBusinessException("CMS0013091",
                            (String) CacheFactory.get(CmIndustryCacheImpl.class, industryId));// 行业类别不能重复添加！
                }
                UserInfoInterface user = ServiceManager.getUser();
                // 新增
                if (industryValue.isNew()) {
                    industryValue.setRelId(CmCommonUtil.getNewSequence(BOCmGroupRelIndustryBean.class));
                    industryValue.setSort(i + 1);// 排序
                    // 设置regionId和操作员组织信息
                    industryValue.setCreateDate(DataTypeUtils.getCurrentDate());
                    industryValue.setDoneCode(CMUserInfoUtil.getDoneCode());
                    industryValue.setDoneDate(DataTypeUtils.getCurrentDate());
                    industryValue.setOpId(user.getID());
                    industryValue.setOrgId(user.getOrgId());
                    industryValue.setEffectiveDate(DataTypeUtils.getCurrentDate());
                    industryValue.setExpireDate(TimeUtil.getMaxExpire());
                    industryValue.setRegionId(TenantIDFactory.getTenant());
                    industryValue.setCreateOpId(user.getID());
                    industryValue.setCreateOrgId(user.getOrgId());
                    industryValue.setStsToNew();
                    industryValue.setState(CmConstants.RecordState.USE);
                } else {// 修改
                    industryValue.setIndustryId(industryId);
                    industryValue.setDoneCode(CMUserInfoUtil.getDoneCode());
                    industryValue.setDoneDate(DataTypeUtils.getCurrentDate());
                    industryValue.setOpId(user.getID());
                    industryValue.setOrgId(user.getOrgId());
                }

                list.add(industryValue);
            }

            ICmGroupCustomerSV groupCustomerSV = (ICmGroupCustomerSV) ServiceFactory
                    .getService(ICmGroupCustomerSV.class);
            groupCustomerSV.saveGroupRelIndustry(list.toArray(new BOCmGroupRelIndustryBean[0]));
            cp.put("retFlag", "Y");
            cp.put("retVal", CrmLocaleFactory.getResource("CMS0013055"));// 保存成功！
        } catch (Exception e) {
            log.info(e.getMessage(), e);
            cp.put("retFlag", "N");
            // 保存{0}失败！{1}
            cp.put("retVal", CrmLocaleFactory.getResource("CMS0031042", "Industry",
                    e.getCause() == null ? e.getMessage() : e.getCause().getMessage()));
        }
        return cp;
    }

    public Map<String, Object> deleteGroupIndustry(long relId) throws Exception {
        Map<String, Object> cp = new HashMap<>();// 用于向界面返回数据
        try {
            ICmGroupCustomerSV groupCustomerSV = (ICmGroupCustomerSV) ServiceFactory
                    .getService(ICmGroupCustomerSV.class);
            IBOCmGroupRelIndustryValue groupIndustryValue = groupCustomerSV.queryIndustry(relId);
            // 删除操作
            groupIndustryValue.delete();
            List<IBOCmGroupRelIndustryValue> list = new ArrayList<IBOCmGroupRelIndustryValue>();
            list.add(groupIndustryValue);

            groupCustomerSV.saveGroupRelIndustry(list.toArray(new BOCmGroupRelIndustryBean[0]));
            cp.put("retFlag", "Y");
            cp.put("retVal", CrmLocaleFactory.getResource("CMS9988804"));// 删除成功。
        } catch (Exception e) {
            log.info(e.getMessage(), e);
            cp.put("retFlag", "N");
            // 删除失败：{0}。
            cp.put("retVal", CrmLocaleFactory.getResource("CMS0031047", "Industry",
                    e.getCause() == null ? e.getMessage() : e.getCause().getMessage()));
        }
        return cp;
    }

    public Map<String, Object> checkEmailAddress(String emailAddress) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        cp.put("emailCtrl", "N");
        try {
            boolean emailCtrl = RBossUtil.emailWhiteListsCtrl();// 开关
            if (emailCtrl) {
                cp.put("emailCtrl", "Y");
                ICrmFSV crmFsv = (ICrmFSV) ServiceFactory.getService(ICrmFSV.class);
                boolean flag = crmFsv.queryMail(emailAddress);// 校验email
                if (flag) {
                    cp.put("retVal", "Y");// 校验成功
                } else {
                    cp.put("retVal", "N");// 校验失败
                }
            }
        } catch (Exception e) {
            log.error("ERROR", e);
            cp.put("retVal", "N");
            String retMsg = e.getMessage();
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    public Map<String, Object> saveElecAddress(CreateContactMediumVO createVO) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        cp.put("retFlag", "N");
        try {
            String custId = createVO.getCustId() + "";
            List<ContactMediumVO> contactMediums = createVO.getContactMediums();

            if (contactMediums != null && contactMediums.size() == 0) {
                ExceptionUtil.throwBusinessException("CMS9988748");
            }
            List<BOCmCustContactMediumBean> list = new ArrayList<BOCmCustContactMediumBean>();
            ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            for (int i = 0; i < contactMediums.size(); i++) {
                ContactMediumVO contactMediumVO = contactMediums.get(i);
                if (contactMediumVO.getContMedTypeName() == null) {
                    ExceptionUtil.throwBusinessException("CMS9988758");
                }
                if (contactMediumVO.getEmailAddress() == null) {
                    ExceptionUtil.throwBusinessException("CMS9988759");
                }
                if (contactMediumVO.getPriority() < 0) {
                    ExceptionUtil.throwBusinessException("CMS9988760");
                }
                BOCmCustContactMediumBean bean = new BOCmCustContactMediumBean();
                if (contactMediumVO.getCustContRelaId() > 0) {// 做修改处理
                    IBOCmCustContactMediumValue oldValue = service
                            .queryCustContMediumById(contactMediumVO.getCustContRelaId());
                    // new的bean中是没有m_back，老的联系媒介数据都，如果m_back为空会被认为是新增
                    // 所以这里需要先查询老的数据，使用setStsToOld把老数据放入m_back中
                    if (oldValue == null) {
                        // 报错，不应该为空
                        throw new RuntimeException(
                                "根据CustContRelaId=" + contactMediumVO.getCustContRelaId() + "查询原联系媒介为空");
                    }
                    bean.copy(oldValue);
                    bean.setStsToOld();
                    // 然后使用copyProperties，把前端传入新数据contactMediumVO放到bean都m_front中。
                    BeanUtils.copyProperties(contactMediumVO, bean);

                    if (StringUtils.isNotBlank(contactMediumVO.getEffectiveDate())) {
                        bean.setEffectiveDate(Timestamp.valueOf(contactMediumVO.getEffectiveDate()));
                    }
                } else {
                    bean.setStsToNew();
                    bean.setCustContRelaId(CmCommonUtil.getNewSequence(BOCmCustContactMediumBean.class));
                    bean.setState(CmConstants.RecordState.USE);
                    bean.setRegionId(CmCommonUtil.getDefaultRegionId());
                    bean.setCustId(Long.parseLong(custId));
                    if (StringUtils.isNotBlank(contactMediumVO.getEffectiveDate())) {
                        bean.setEffectiveDate(Timestamp.valueOf(contactMediumVO.getEffectiveDate()));
                    }
                    if (StringUtils.isNotBlank(contactMediumVO.getEffectiveDate())) {
                        bean.setEffectiveDate(Timestamp.valueOf(contactMediumVO.getEffectiveDate()));
                    }
                    //bean.setIsNoDisturbing(contactMediumVO.getIsNoDisturbing());
                    // 使用 try-catch 处理异常
                    try {
                        String isNoDisturbingStr = contactMediumVO.getIsNoDisturbing();
                        long isNoDisturbingValue = isNoDisturbingStr != null ? Long.parseLong(isNoDisturbingStr) : -1L;
                        bean.setIsNoDisturbing(isNoDisturbingValue);
                    } catch (NumberFormatException e) {
                        // 日志记录异常，设置默认值
                        //log.error("Failed to parse isNoDisturbing value: {}", contactMediumVO.getIsNoDisturbing(), e);
                        bean.setIsNoDisturbing(-1L);
                    }

                }
                // 以下处理是为了区分email,address,fax的保存
                String type = contactMediumVO.getContMedTypeName();
                String contactInfo = contactMediumVO.getEmailAddress();
                if ("32".equals(type)) {
                    // 针对是fax number
                    bean.setFaxNumber(contactInfo);
                    bean.set("EMAIL_ADDRESS", null);
                    bean.set("CONT_NUMBER", null);
                } else if ("36".equals(type)) {
                    // 针对的是平信
                    bean.setEmailAddress(contactInfo);
                    bean.setAddressId(DataType.getAsLong(contactMediumVO.getAddressCode().trim()));
                    bean.set("CONT_NUMBER", null);
                    bean.set("FAX_NUMBER", null);
                } else if (type.startsWith("3")) {
                    // 针对的是联系电话
                    bean.setContNumber(contactInfo);
                    bean.set("EMAIL_ADDRESS", null);
                    bean.set("FAX_NUMBER", null);
                } else {
                    bean.setEmailAddress(contactInfo);
                    bean.set("CONT_NUMBER", null);
                    bean.set("FAX_NUMBER", null);
                }
                bean.setRemarks(contactMediumVO.getRemarks());
                bean.setPriority(contactMediumVO.getPriority());
                bean.setContMedTypeId(Long.valueOf(contactMediumVO.getContMedTypeName()));

                list.add(bean);
            }
            // 优先级不允许有重复的
            List<BOCmCustContactMediumBean> allList = new ArrayList<BOCmCustContactMediumBean>();
            allList.addAll(list);
            IQBOCmCustContMediumAndTypeValue[] contValues = service
                    .queryCustElectronicMediumForPage(Long.parseLong(custId), -1, -1);
            // 防止做修改时的优先级不允许重复的逻辑
            if (CmCommonUtil.isNotEmptyObject(contValues)) {
                for (int i = 0; i < contValues.length; i++) {
                    String flag = "";
                    long custContId = contValues[i].getCustContRelaId();
                    for (int a = 0; a < list.size(); a++) {
                        long custContIdB = list.get(a).getCustContRelaId();
                        if (custContId == custContIdB) {
                            flag = "Y";
                            break;
                        }
                    }
                    if (!"Y".equals(flag)) {
                        BOCmCustContactMediumBean bean = new BOCmCustContactMediumBean();
                        bean.copy(contValues[i]);
                        allList.add(bean);
                    }

                }
            }
            // 循环不允许有重复的优先级
            for (int i = 0; i < allList.size(); i++) {
                for (int j = i + 1; j < allList.size(); j++) {
                    if (allList.get(i).getPriority() == allList.get(j).getPriority()) {
                        ExceptionUtil.throwBusinessException("CMS9988839");
                    }
                }
            }
            service.saveCustContMedium(list.toArray(new BOCmCustContactMediumBean[0]));

            cp.put("retFlag", "Y");
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("saveElecAddress occur exception.", e);
            }
            cp.put("retMsg", e.getMessage());
            cp.put("retFlag", "N");
        }
        return cp;
    }

    public Map<String, Object> checkIsCustMgr(long managerId) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String isCustMgr = "FALSE";
        try {
            if (managerId > 0) {
                ISec2CmSV sec2CmSV = (ISec2CmSV) ServiceFactory.getService(ISec2CmSV.class);
                IQBOSecCustManagerValue val = sec2CmSV.getEffectAmInfo(managerId, CmLnConstants.CM_MANAGER_TYPE.TYPE_3);
                if (val != null) {
                    isCustMgr = "TRUE";
                }
            }
            cp.put("isCustMgr", isCustMgr);
        } catch (Exception e) {
            log.error(e.getCause() == null ? e.getMessage() : e.getCause().getMessage());
        }
        return cp;
    }

    public Map<String, Object> saveAddress(CreateSFFAddressVO createVO) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        cp.put("retFlag", "Y");
        try {
            String isForeign = createVO.getIsForeign();
            IAddressSV addressSV = (IAddressSV) ServiceFactory.getService(IAddressSV.class);
            address condition = new address();
            if (createVO != null) {
                condition.setZipcode(createVO.getZipcode());
                condition.setMunicipality(createVO.getMunicipality());
                condition.setDistrictId(createVO.getDistrictId());
                condition.setStreetName(createVO.getStreetName());
                condition.setHouseNumber(createVO.getHouseNumber());
                condition.setHouseLetter(createVO.getHouseLetter());
                condition.setFloor(createVO.getFloor());
                condition.setApartment(createVO.getApartment());
                condition.setDoorNumber(createVO.getDoorNumber());
                condition.setMainDoor(createVO.getMainDoor());
                condition.setCounty(createVO.getCounty());
                condition.setPoBox(createVO.getPoBox());
                condition.setCoName(createVO.getCoName());
                condition.setAddressType(createVO.getAddressType());
                condition.setCountry(createVO.getCountry());
                condition.setCity(createVO.getCity());
                condition.setStreetName2(createVO.getStreetName2());
                condition.setStreetName3(createVO.getStreetName3());
                condition.setIsForeign(isForeign);// 新增，是否外国客户,Y/N
            }
            addressSV.saveAddress(condition, null, null);
            cp.put("retMsg", " add address is  Success");
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("saveAddress exception.", e);
            }
            cp.put("retFlag", "N");
            cp.put("retMsg", e.getMessage());
        }
        return cp;
    }
    
    @Override
    public Map<String, Object> saveSffAddressIfChanged(CreateSFFAddressVO vo) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        cp.put("retFlag", "Y");
        try {
            if (vo == null) {
                throw new IllegalArgumentException("request body is required");
            }
            QuerySFFAddressVO queryVo = buildQuerySffVoFromCreateVo(vo);
            address[] candidates = queryAddressList(queryVo, 1, 50);
            if (candidates != null && candidates.length > 0) {
                for (address a : candidates) {
                    if (a != null && StringUtils.isNotBlank(a.getAddressId()) && sffAddressContentEqualsLoaded(a, vo)) {
                        cp.put("addressId", a.getAddressId().trim());
                        cp.put("reused", Boolean.TRUE);
                        cp.put("retMsg", "unchanged");
                        return cp;
                    }
                }
            }
            IAddressSV addressSV = (IAddressSV) ServiceFactory.getService(IAddressSV.class);
            address condition = new address();
            applyCreateSffVoToAddress(vo, condition);
            long newId = addressSV.saveAddress(condition, null, null);
            cp.put("addressId", String.valueOf(newId));
            cp.put("reused", Boolean.FALSE);
            cp.put("retMsg", "saved");
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("saveSffAddressIfChanged failed", e);
            }
            cp.put("retFlag", "N");
            cp.put("retMsg", e.getMessage());
        }
        return cp;
    }
    
    private static QuerySFFAddressVO buildQuerySffVoFromCreateVo(CreateSFFAddressVO vo) {
        QuerySFFAddressVO q = new QuerySFFAddressVO();
        if (vo == null) {
            return q;
        }
        q.setCountry(vo.getCountry());
        q.setAddressType(vo.getAddressType());
        q.setDistrictId(vo.getDistrictId());
        q.setZipcode(vo.getZipcode());
        q.setCity(vo.getCity());
        q.setCounty(vo.getCounty());
        q.setStreetName(vo.getStreetName());
        q.setApartment(vo.getApartment());
        q.setFloor(vo.getFloor());
        q.setHouseLetter(vo.getHouseLetter());
        q.setHouseNumber(vo.getHouseNumber());
        q.setMainDoor(vo.getMainDoor());
        q.setDoorNumber(vo.getDoorNumber());
        q.setMunicipality(vo.getMunicipality());
        q.setCoName(vo.getCoName());
        q.setPoBox(vo.getPoBox());
        q.setStreetName2(vo.getStreetName2());
        q.setStreetName3(vo.getStreetName3());
        return q;
    }

    private static void applyCreateSffVoToAddress(CreateSFFAddressVO createVO, address condition) {
        if (createVO == null || condition == null) {
            return;
        }
        condition.setZipcode(createVO.getZipcode());
        condition.setMunicipality(createVO.getMunicipality());
        condition.setDistrictId(createVO.getDistrictId());
        condition.setStreetName(createVO.getStreetName());
        condition.setHouseNumber(createVO.getHouseNumber());
        condition.setHouseLetter(createVO.getHouseLetter());
        condition.setFloor(createVO.getFloor());
        condition.setApartment(createVO.getApartment());
        condition.setDoorNumber(createVO.getDoorNumber());
        condition.setMainDoor(createVO.getMainDoor());
        condition.setCounty(createVO.getCounty());
        condition.setPoBox(createVO.getPoBox());
        condition.setCoName(createVO.getCoName());
        condition.setAddressType("MANUAL_ADDRESS");
        condition.setCountry(createVO.getCountry());
        condition.setCity(createVO.getCity());
        condition.setStreetName2(createVO.getStreetName2());
        condition.setStreetName3(createVO.getStreetName3());
        condition.setIsForeign(createVO.getIsForeign());
    }

    /**
     * Compare fields that are set from {@link CreateSFFAddressVO} when saving; null/blank-only treated equal.
     */
    private static boolean sffAddressContentEqualsLoaded(address loaded, CreateSFFAddressVO vo) {
        if (loaded == null || vo == null) {
            return false;
        }
        if (!sffAddrStrEq(loaded.getZipcode(), vo.getZipcode())) {
            return false;
        }
        if (!sffAddrStrEq(loaded.getMunicipality(), vo.getMunicipality())) {
            return false;
        }
        if (!sffAddrStrEq(loaded.getDistrictId(), vo.getDistrictId())) {
            return false;
        }
        if (!sffAddrStrEq(loaded.getStreetName(), vo.getStreetName())) {
            return false;
        }
        if (!sffAddrStrEq(loaded.getHouseNumber(), vo.getHouseNumber())) {
            return false;
        }
        if (!sffAddrStrEq(loaded.getHouseLetter(), vo.getHouseLetter())) {
            return false;
        }
        if (!sffAddrStrEq(loaded.getFloor(), vo.getFloor())) {
            return false;
        }
        if (!sffAddrStrEq(loaded.getApartment(), vo.getApartment())) {
            return false;
        }
        if (!sffAddrStrEq(loaded.getDoorNumber(), vo.getDoorNumber())) {
            return false;
        }
        if (!sffAddrStrEq(loaded.getMainDoor(), vo.getMainDoor())) {
            return false;
        }
        if (!sffAddrStrEq(loaded.getCounty(), vo.getCounty())) {
            return false;
        }
        if (!sffAddrStrEq(loaded.getPoBox(), vo.getPoBox())) {
            return false;
        }
        if (!sffAddrStrEq(loaded.getCoName(), vo.getCoName())) {
            return false;
        }
        if (!sffAddrStrEq(loaded.getAddressType(), vo.getAddressType())) {
            return false;
        }
        if (!sffAddrStrEq(loaded.getCountry(), vo.getCountry())) {
            return false;
        }
        if (!sffAddrStrEq(loaded.getCity(), vo.getCity())) {
            return false;
        }
        if (!sffAddrStrEq(loaded.getStreetName2(), vo.getStreetName2())) {
            return false;
        }
        if (!sffAddrStrEq(loaded.getStreetName3(), vo.getStreetName3())) {
            return false;
        }
        return sffAddrForeignEq(loaded.getIsForeign(), vo.getIsForeign());
    }

    private static boolean sffAddrStrEq(String a, String b) {
        return StringUtils.defaultString(a).trim().equals(StringUtils.defaultString(b).trim());
    }

    private static boolean sffAddrForeignEq(String loaded, String voVal) {
        String la = normalizeIsForeign(loaded);
        String vb = normalizeIsForeign(voVal);
        return la.equals(vb);
    }

    private static String normalizeIsForeign(String v) {
        if (StringUtils.isBlank(v)) {
            return "N";
        }
        String t = v.trim();
        if ("Y".equalsIgnoreCase(t)) {
            return "Y";
        }
        return "N";
    }
    

    public Map<String, Object> addCustAddress(CreateCustAddressVO createVO) throws Exception {
        Map<String, Object> cp = new HashMap<>();// 用于向界面返回数据
        try {
            long addressType = createVO.getAddressType();
            long addressId = createVO.getAddressId();
            long custId = createVO.getCustId();
            String addressName = createVO.getAddressName();
            String regionId = createVO.getRegionId();
            String effDate = createVO.getEffDate();
            String expDate = createVO.getExpDate();
            String contactPerson = createVO.getContactPerson();
            IBOCmCustContactMediumValue contactMediumValue = new BOCmCustContactMediumBean();
            contactMediumValue.setAddressId(addressId);
            contactMediumValue.setContMedTypeId(addressType);
            contactMediumValue.setCustId(custId);
            contactMediumValue.setRegionId(regionId);
            contactMediumValue.setAddressDetail(addressName);
            if (StringUtils.isNotBlank(effDate)) {
                contactMediumValue.setProtectEffDate(Timestamp.valueOf(effDate));
            }
            if (StringUtils.isNotBlank(expDate)) {
                contactMediumValue.setProtectExpDate(Timestamp.valueOf(expDate));
            }
            if (StringUtils.isNotBlank(contactPerson)) {
                contactMediumValue.setContactPerson(contactPerson);
            }
            ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            IBOCmCustContactMediumValue[] contactMediumArra = null;
            if (custId > 0) {
                // 对地址进行校验，不允许相同类型相同addressId的地址
                contactMediumArra = customerSV.queryContactMediumByCondition(custId, (int) addressType);
                if (CmCommonUtil.isNotEmptyObject(contactMediumArra)) {
                    for (int i = 0; i < contactMediumArra.length; i++) {
                        if (contactMediumArra[i].getAddressId() == addressId) {
                            // 新增地址失败。
                            ExceptionUtil.throwBusinessException("CMS9988855");
                        }
                    }
                }
                if (addressType == CmConstants.AddressId.legalAddress) {
                    if (null != contactMediumArra && contactMediumArra.length > 0) {
                        cp.put("retFlag", "N");
                        // 新增地址失败。
                        cp.put("retVal", CrmLocaleFactory.getResource("CMS0013090"));
                    } else {
                        customerSV.saveCustContMedium(new IBOCmCustContactMediumValue[] { contactMediumValue });
                        cp.put("retFlag", "Y");
                        // 新增地址成功。
                        cp.put("retVal", CrmLocaleFactory.getResource("CMS0013079"));
                    }
                } else {
                    customerSV.saveCustContMedium(new IBOCmCustContactMediumValue[] { contactMediumValue });
                    cp.put("retFlag", "Y");
                    // 新增地址成功。
                    cp.put("retVal", CrmLocaleFactory.getResource("CMS0013079"));
                }
            } else {
                // batch changesimcard和batch changenumber 2个场景时，custId=0
                // 根据custId=0，addressId查询地址库，如果已存在，不保存
                // 如果地址库不存在，保存地址到地址库custId=0的客户下。
                contactMediumArra = customerSV.queryContactMediumByAddressId(custId, addressId, (int) addressType);
                if (contactMediumArra == null || contactMediumArra.length == 0) {
                    customerSV.saveCustContMedium(new IBOCmCustContactMediumValue[] { contactMediumValue });
                }
                cp.put("retFlag", "Y");
                // 新增地址成功。
                cp.put("retVal", CrmLocaleFactory.getResource("CMS0013079"));
            }
        } catch (Exception e) {
            log.info(e.getMessage(), e);
            cp.put("retFlag", "N");
            // 新增地址失败：{0}。
            cp.put("retVal", CrmLocaleFactory.getResource("CMS0013080",
                    e.getCause() == null ? e.getMessage() : e.getCause().getMessage()));
        }
        return cp;
    }

    public Map<String, Object> deleteCustAddress(long addressRelaId) throws Exception {
        Map<String, Object> cp = new HashMap<>();// 用于向界面返回数据
        try {
            ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            IBOCmCustContactMediumValue contactMediumValue = customerSV.queryCustContMediumById(addressRelaId);
            contactMediumValue.delete();
            customerSV.saveCustContMedium(new IBOCmCustContactMediumValue[] { contactMediumValue });
            cp.put("retFlag", "Y");
            // 删除地址成功。
            cp.put("retVal", CrmLocaleFactory.getResource("CMS0013082"));
        } catch (Exception e) {
            log.info(e.getMessage(), e);
            cp.put("retFlag", "N");
            // 删除地址失败：{0}。
            cp.put("retVal", CrmLocaleFactory.getResource("CMS0013083",
                    e.getCause() == null ? e.getMessage() : e.getCause().getMessage()));
        }
        return cp;
    }

    public Map<String, Object> modifyCustAddress(ModifyCustAddressVO modifyVO) throws Exception {
        Map<String, Object> cp = new HashMap<>();// 用于向界面返回数据
        cp.put("retFlag", "Y");
        long contRelaId = modifyVO.getContRelaId();
        String address = modifyVO.getAddress();
        int isProtected = modifyVO.getIsProtected();
        String effDate = modifyVO.getEffDate();
        String expDate = modifyVO.getExpDate();
        String addressType = modifyVO.getAddressType();
        String addressId = modifyVO.getAddressId();
        String contactPerson = modifyVO.getContactPerson();
        String oldContactPerson = modifyVO.getOldContactPerson();
        long custId = modifyVO.getCustId();
        Timestamp s1 = null;
        Timestamp s2 = null;
        if (StringUtils.isNotBlank(effDate)) {
            s1 = Timestamp.valueOf(effDate);
        }
        if (StringUtils.isNotBlank(expDate)) {
            s2 = Timestamp.valueOf(expDate);
        }
        ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        IQBOCmCustContMediumAndTypeValue value = service.queryCustContactMedium(contRelaId);
        long oldAddressType = value.getContMedTypeId();
        long oldAddressId = value.getAddressId();
        try {
            // 如果地址类型与地址ID都一样，则没有更改不需要保存
            if ((contactPerson==null && oldContactPerson==null)  || contactPerson.equals(oldContactPerson)) {
                if (Long.parseLong(addressType) == oldAddressType && oldAddressId == Long.parseLong(addressId)) {
                    cp.put("retFlag", "N");
                    cp.put("retMsg", CrmLocaleFactory.getResource("CMS1100147"));
                    return cp;
                }
                IBOCmCustContactMediumValue[] contactMediumArra = service.queryContactMediumByCondition(custId,
                        Integer.parseInt(addressType));
                // 不允许相同的地址类型与addressId存在
                if (CmCommonUtil.isNotEmptyObject(contactMediumArra)) {
                    for (int i = 0; i < contactMediumArra.length; i++) {
                        if (contactMediumArra[i].getAddressId() == Long.parseLong(addressId)) {
                            // 修改地址失败
                            ExceptionUtil.throwBusinessException("CMS9988855");
                        }
                    }
                }
                // add by huangqun 在修改地址时，只有在原有地址类型不为法律地址并且改为法律地址的情况下做校验
                if (Integer.parseInt(addressType) == CmConstants.AddressId.legalAddress
                        && oldAddressType != CmConstants.AddressId.legalAddress) {

                    if (null != contactMediumArra && contactMediumArra.length > 0) {
                        cp.put("retFlag", "N");
                        // 修改地址失败。
                        cp.put("retMsg", CrmLocaleFactory.getResource("CMS0013090"));
                    } else {
                        service.modifyCustAddress(contRelaId, address, isProtected, s1, s2, addressType, addressId,
                                contactPerson);
                    }
                } else {
                    service.modifyCustAddress(contRelaId, address, isProtected, s1, s2, addressType, addressId,
                            contactPerson);
                }
                // 修改地址的时候，重新送CPR
                ICmCustRequestTaskSV taskSV = (ICmCustRequestTaskSV) ServiceFactory
                        .getService(ICmCustRequestTaskSV.class);
                IBOCmCustRequestTaskValue[] taskValues = taskSV.queryByCustId(custId);
                if (null != taskValues && taskValues.length > 0 && custId != CmConstants.ANONYMOUS_CUST_ID) {
                    taskValues[0].setRequestStatus("C");
                    taskValues[0].setStatusDate(TimeUtil.getPrimaryDataSourceSysDate());
                    taskValues[0].setResults("");
                    taskSV.saveCmCustRequestTask(taskValues[0]);
                }
            } else {
                if (Integer.parseInt(addressType) == CmConstants.AddressId.legalAddress
                        && oldAddressType != CmConstants.AddressId.legalAddress) {
                    cp.put("retFlag", "N");
                    // 修改地址失败。
                    cp.put("retMsg", CrmLocaleFactory.getResource("CMS0013090"));
                } else {
                    service.modifyCustAddress(contRelaId, address, isProtected, s1, s2, addressType, addressId,
                            contactPerson);

                    // 修改地址的时候，重新送CPR
                    ICmCustRequestTaskSV taskSV = (ICmCustRequestTaskSV) ServiceFactory
                            .getService(ICmCustRequestTaskSV.class);
                    IBOCmCustRequestTaskValue[] taskValues = taskSV.queryByCustId(custId);
                    if (null != taskValues && taskValues.length > 0 && custId != CmConstants.ANONYMOUS_CUST_ID) {
                        taskValues[0].setRequestStatus("C");
                        taskValues[0].setStatusDate(TimeUtil.getPrimaryDataSourceSysDate());
                        taskValues[0].setResults("");
                        taskSV.saveCmCustRequestTask(taskValues[0]);
                    }
                }
            }
        } catch (Exception e) {
            log.info(e.getMessage(), e);

            cp.put("retMsg", e.getMessage());
            cp.put("retFlag", "N");
        }
        return cp;
    }

    public IQBOCmCustContMediumAndTypeValue queryCustContactMedium(long contRelaId) throws Exception {
        ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        IQBOCmCustContMediumAndTypeValue value = service.queryCustContactMedium(contRelaId);
        return value;
    }

    public Map<String, Object> getGroupCustStatus(long custId) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        try {
            ICustomerValue customerValue = CmServiceFactory.getCustomerSV().queryCustomerByCustId(custId);
            if (customerValue != null) {
                cp.put("custStatus", String.valueOf(customerValue.getCustStatus()));
            }

        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("getGroupCustStatus exception.", e);
            }
        }
        return cp;
    }

    public Map<String, Object> groupAccessControl(long custId) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        cp.put("retFlag", "N");
        cp.put("retMsg", "");
        cp.put("onlyCanViewCust", "");
        // 获取细分类型
        if (TenantIDFactory.getTenantId().equals(CmConstants.TenantId.TENANT_21)) {
            ICmCustomerSV custService = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            ICustomerValue custValue = custService.queryCustomerMaskByCustId(custId);
            String groupSegmentId = custValue.getGroupSegmentId();
            if (groupSegmentId.equals("NO_SEGMENT")) {
                cp.put("retFlag", "Y");
                return cp;
            }
        }
        try {
            ICmGroupCustomerSV sv = (ICmGroupCustomerSV) ServiceFactory.getService(ICmGroupCustomerSV.class);
            boolean viewAllWholeCustomer = false;
            // 针对91租户
            if (TenantIDFactory.getTenantId().equals(CmConstants.TenantId.TENANT_91)) {
                viewAllWholeCustomer = SecframeClient.checkEntityPermission(ServiceManager.getUser().getID(),
                        CmConstants.controlQueryALLWholeCustomer.ent_id,
                        CmConstants.controlQueryALLWholeCustomer.priv_id);
            }
            if (sv.queryGroupAccess(custId) || viewAllWholeCustomer) {
                cp.put("retFlag", "Y");
                // 查询是不是只能查看的权限
                ICmCommonSV commonSV = (ICmCommonSV) ServiceFactory.getService(ICmCommonSV.class);
                boolean onlyCanViewCust = commonSV.queryIfOnlyCanViewCustomer(custId);
                cp.put("onlyCanViewCust", DataType.getAsString(onlyCanViewCust));
            } else {
                cp.put("retFlag", "N");
            }
        } catch (Exception e) {
            log.info(e.getMessage(), e);
            cp.put("retMsg", e.getMessage());
            cp.put("retFlag", "N");
        }
        return cp;
    }

    public Map<String, Object> manualOffline(long custId) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retFlag = "Y";
        String retMsg = "Successful operation";
        try {
            // 查询集团下时候有成员
            ICmGroupCustomerSV grpCustSV = (ICmGroupCustomerSV) ServiceFactory.getService(ICmGroupCustomerSV.class);
            IBOCmGroupMemberValue[] temp = grpCustSV.queryGroupMemberByCustId(custId);
            if (temp != null && temp.length > 0) {
                retFlag = "N";
                retMsg = "There is still Has Members Belong to this GroupCustomer,Can not set to offline !";
                return cp;
            }

            // 查看是否有有效合同
            IAgreementFSV fservice = (IAgreementFSV) ServiceFactory.getService(IAgreementFSV.class);
            DataContainer[] dc = fservice.getB2BAgreementListForOSByCond(custId, "", "", 0L, null, null);
            if (null != dc && dc.length > 0) {
                retFlag = "N";
                retMsg = "There is still a valid contract,Can not set to offline !";
                return cp;
            }

            // 设置集团客户离网状态
            ICmGroupCustomerSV groupService = (ICmGroupCustomerSV) ServiceFactory.getService(ICmGroupCustomerSV.class);
            IBOCmGroupCustomerValue groupvalue = groupService.queryGroupCustInfoByCustId(custId);
            groupvalue.setCustStatus(2);
            ICustomerValue customerValue = new CustomerBean();
            customerValue.copy(groupvalue);
            customerValue.setCustType(CmConstants.CustomerType.GROUP);

            ICmCustomerSV custSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            IVOCustValue custValue = new VOCustBean(customerValue);
            custValue.setBusinessId(CmConstants.BusiLogId.GROUP_OFFLINE);
            custSV.saveCustomer(custValue);

        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("manualOffline exception.", e);
            }
            retFlag = "N";
            retMsg = e.getMessage();
        } finally {
            cp.put("retFlag", retFlag);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    public Map<String, Object> queryIfCanModifySegment(long custId) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        cp.put("ifCanModifySegment", "Y");
        cp.put("retFlag", "Y");
        try {
            ICmCommonSV commonSV = (ICmCommonSV) ServiceFactory.getService(ICmCommonSV.class);
            if (commonSV.queryIfOnlyCanViewCustomer(custId)) {
                cp.put("ifCanModifySegment", "N");
            }
        } catch (Exception e) {
            log.info(e.getMessage(), e);

            cp.put("retFlag", "N");
            cp.put("retMsg", e.getMessage());
        }
        return cp;
    }

    public Map<String, Object> modifyGroupCustomer(Map modifyMap) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = "";
        String successMsg = "";
        String custId = "";
        String zipCode = "";

        try {
            ICmGroupCustomerSV groupCustomerSV = (ICmGroupCustomerSV) ServiceFactory.getService(ICmGroupCustomerSV.class);
            if (modifyMap == null) {
                // 您已对数据进行过保存或从未对数据进行过修改，无需再次保存。
                ExceptionUtil.throwBusinessException("CMS0000080");
            }
            IVOCustValue custValue = new VOCustBean();
            ICustomerValue customerValue = new CustomerBean();
            IBOLnCmxGroupCustValue customerKZValue = new BOLnCmxGroupCustBean();
            IBOIdentificationValue identificationValue = new BOIdentificationBean();

            Map newCmGroupCustomerMap = (Map)modifyMap.get("newData");
            Map oldCmGroupCustomerMap = (Map)modifyMap.get("oldData");
            // 构建bean对象，要包含新的和老的数据
            // 塞老数据
            if (oldCmGroupCustomerMap != null && oldCmGroupCustomerMap.size()>0) {
                Map cmxGroupCustomerMap = (Map)oldCmGroupCustomerMap.get("cmxGroupCustomer");
                Map cmIdentificationMap = (Map)oldCmGroupCustomerMap.get("cmIdentification");

                DataContainer customerDC = DataContainerUtils.wrap(oldCmGroupCustomerMap);
                customerValue.copy(customerDC);
                customerValue.setStsToOld();
                if(cmxGroupCustomerMap!=null && cmxGroupCustomerMap.size()>0){
                    DataContainer cmxGroupCustomerDC = DataContainerUtils.wrap(cmxGroupCustomerMap);
                    customerKZValue.copy(cmxGroupCustomerDC);
                    customerKZValue.setStsToOld();
                }
                if(cmIdentificationMap!=null && cmIdentificationMap.size()>0){
                    DataContainer cmIdentificationDC = DataContainerUtils.wrap(cmIdentificationMap);
                    identificationValue.copy(cmIdentificationDC);
                    identificationValue.setStsToOld();
                }
            }

            String allowInheritable = null;
            String allowRevisable = null;
            String lastSegementId = null;
            String lastZipCode = null;
            String remarks = null;
            // 塞新数据
            if (newCmGroupCustomerMap != null && newCmGroupCustomerMap.size()>0) {
                Map cmxGroupCustomerMap = (Map)newCmGroupCustomerMap.get("cmxGroupCustomer");
                Map cmIdentificationMap = (Map)newCmGroupCustomerMap.get("cmIdentification");

                DataContainer newCustomerDC = DataContainerUtils.wrap(newCmGroupCustomerMap);
                DataContainerUtils.setFontMap((CustomerBean)customerValue,newCustomerDC);
                if(cmxGroupCustomerMap!=null && cmxGroupCustomerMap.size()>0){
                    DataContainer cmxGroupCustomerDC = DataContainerUtils.wrap(cmxGroupCustomerMap);
                    DataContainerUtils.setFontMap((BOLnCmxGroupCustBean)customerKZValue,cmxGroupCustomerDC);
                }
                if(cmIdentificationMap!=null && cmIdentificationMap.size()>0){
                    DataContainer cmIdentificationDC = DataContainerUtils.wrap(cmIdentificationMap);
                    DataContainerUtils.setFontMap((BOIdentificationBean)identificationValue,cmIdentificationDC);
                }

                if(newCmGroupCustomerMap.get("allowInheritable")!=null){
                    allowInheritable = (int)newCmGroupCustomerMap.get("allowInheritable")+"";
                }
                if(newCmGroupCustomerMap.get("allowRevisable")!=null){
                    allowRevisable = (int)newCmGroupCustomerMap.get("allowRevisable")+"";
                }
                if(newCmGroupCustomerMap.get("lastSegementId")!=null){
                    lastSegementId = (int)newCmGroupCustomerMap.get("lastSegementId")+"";
                }
                if(newCmGroupCustomerMap.get("lastZipCode")!=null){
                    lastZipCode = (int)newCmGroupCustomerMap.get("lastZipCode")+"";
                }
                if(newCmGroupCustomerMap.get("remarks")!=null){
                    remarks = (String)newCmGroupCustomerMap.get("remarks");
                }
            }
            String appleDeptId = null;
            if (identificationValue != null) {
                appleDeptId = identificationValue.getIdenNr();
            }

            // 数据特殊处理
            String segementId = "";
            if (newCmGroupCustomerMap != null && newCmGroupCustomerMap.size()>0) {
                segementId = String.valueOf(customerValue.getCustSegment());
                custValue.setCustomer(customerValue);
                custId = String.valueOf(custValue.getCustomer().getCustId());

                Map cmxGroupCustomerMap = (Map)newCmGroupCustomerMap.get("cmxGroupCustomer");
                if (cmxGroupCustomerMap != null && cmxGroupCustomerMap.size()>0) {
                    if ("".equals(custId)) {
                        custId = String.valueOf(customerKZValue.getCustId());
                    }
                    customerKZValue.setOpId(SessionManager.getUser().getID());
                    customerKZValue.setOrgId(SessionManager.getUser().getOrgId());
                    customerKZValue.setDoneDate(DataTypeUtils.getCurrentDate());
                    custValue.setUserObject("cmxGrpCust", customerKZValue);// 设置集团扩展信息
                    // 判断法人识别号--增加对应的联系人
                    if (StringUtils.isNotBlank(customerKZValue.getCorporateIdentificationNumbe())) {// modify at
                        // 2015-6-26
                        // 法人识别号模糊化处理
                        if (customerKZValue.getCorporateIdentificationNumbe().contains("*")) {
                            String corporateIdentificationNumbe = (String)cmxGroupCustomerMap.get("CORPORATE_IDENTIFICATION_TEXT");
                            customerKZValue.setCorporateIdentificationNumbe(corporateIdentificationNumbe);
                        }
                    }
                    saveContactByCprNum(custId, customerKZValue);
                    custValue.setUserObject(CmLnConstants.DealCustInfo.OP_STATE, CmLnConstants.DealCustInfo.OP_MODIFY);// 修改集团扩展信息
                }
            }

            ISec2CmSV iseCm = (ISec2CmSV) ServiceFactory.getService(ISec2CmSV.class);
            UserInfoInterface userInfo = ServiceManager.getUser();
            IQBOSecCustManagerValue loginSecStaff = iseCm.getEffectAmInfo(DataType.getAsLong(userInfo.getID()),
                    CmLnConstants.CM_MANAGER_TYPE.TYPE_3);
            // 超级管理员修改细分不需要审批
            long opId = ServiceManager.getUser().getID();
            boolean secFlag = SecframeClient.checkEntityPermission(opId, CmConstants.controlOperateB2B.ent_id,
                    CmConstants.controlOperateB2B.priv_id);
            // 调用@chenxq保存集团客户子类型接口
            if (custValue.getCustomer() != null) {
                // 当前不替换客户的细分，等审批结束了再替换
                String groupSegmentId = null;
                if (secFlag) {
                    // 不需要审批
                    if (StringUtils.isNotBlank(allowRevisable)) {
                        allowRevisable = "0";// 不需要审批，修改细分后，这边就要设置成否
                    }
                    groupSegmentId = custValue.getCustomer().getGroupSegmentId();
                    // 如果新的细分是SA则自动映射到SA GROUP
                    if (CmConstants.segment.SA.equals(groupSegmentId)) {
                        String groupCode = (String) CacheFactory.get(CmSegmentManagerCacheImpl.class,
                                Long.parseLong(groupSegmentId));
                        groupCustomerSV.saveManager(Long.parseLong(custId), Long.parseLong(groupCode));
                    }
                } else {
                    // 需要审批
                    groupSegmentId = lastSegementId;
                }
                if (StringUtils.isNotBlank(groupSegmentId) && StringUtils.isNumeric(groupSegmentId)) {
                    custValue.getCustomer().setCustSegment(DataType.getAsLong(groupSegmentId));
                    IBOCmCustSegmentRelaValue custSegmentRela = ((ICmCustSegmentRelaSV) ServiceFactory
                            .getService(ICmCustSegmentRelaSV.class))
                            .querySegmentRelaByCustId(DataType.getAsLong(custId));
                    if (custSegmentRela != null) {
                        custSegmentRela.setSegmentId(DataType.getAsLong(groupSegmentId));
                        if (!StringUtils.isBlank(allowInheritable)) {
                            custSegmentRela.setIsInheritable(DataType.getAsLong(allowInheritable));
                        }
                        if (!StringUtils.isBlank(allowRevisable)) {
                            custSegmentRela.setIsRevisable(DataType.getAsLong(allowRevisable));
                        }
                        custValue.setUserObject("cmSegmentRela", custSegmentRela);
                    }
                }
            }

            if (newCmGroupCustomerMap == null && oldCmGroupCustomerMap == null) {
                customerValue = CmServiceFactory.getCustomerSV().queryCustomerByCustId(DataType.getAsLong(custId));
                custValue.setCustomer(customerValue);
            }

            // 设置中心
            String regionId = CmCommonUtil.getDefaultRegionId();
            if (StringUtils.isBlank(regionId)) {
                regionId = CmCommonUtil.getDefaultRegionId();
            }

            CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.REGION_ID, regionId);
            custValue.setBusinessId(CmConstants.BusiLogId.GROUP_MODIFY);

            // 保存客户认证信息
            long partyId = custValue.getCustomer().getPartyId();
            ICmDkCustomerSV dkCustomerSV = (ICmDkCustomerSV) ServiceFactory.getService(ICmDkCustomerSV.class);
            IBOIdentificationValue[] identificationValues = dkCustomerSV.queryCustIdentifications(partyId,
                    CmConstants.CustIdenType.APPLE_DEPT_ID, null);
            IBOIdentificationValue temp = null;
            if (!CmCommonUtil.isEmptyObject(identificationValues)) {
                // 做修改
                temp = new BOIdentificationBean();
                temp.copy(identificationValues[0]);
                if (StringUtils.isNotBlank(appleDeptId)) {
                    temp.setIdenNr(appleDeptId);
                } else {
                    temp.delete();
                }
                custValue.addCustIdentification(new IBOIdentificationValue[] { temp });
            } else if (CmCommonUtil.isEmptyObject(identificationValues) && StringUtils.isNotBlank(appleDeptId)) {
                // 做新增
                temp = new BOIdentificationBean();
                temp.setPartyId(partyId);
                temp.setIdenType(CmConstants.CustIdenType.APPLE_DEPT_ID);
                temp.setIdenNr(appleDeptId);
                temp.setStsToNew();
                custValue.addCustIdentification(new IBOIdentificationValue[] { temp });
            }
            CmServiceFactory.getCustomerSV().saveCustomer(custValue);

            // 保存记录
            ICmCommonSV commonSV = (ICmCommonSV) ServiceFactory.getService(ICmCommonSV.class);
            String methodDetail = Thread.currentThread().getStackTrace()[1].getClassName() + " "
                    + Thread.currentThread().getStackTrace()[1].getMethodName();
            if ((customerValue != null && customerValue.isNew())
                    || (customerKZValue != null && customerKZValue.isNew())) {
                successMsg = CrmLocaleFactory.getResource("CMS0000081", custId);
                commonSV.saveBusiLog(CmConstants.BusiLogId.GROUP_CREATE, CmConstants.BusiLogType.CUSTOMER_LOG,
                        Long.parseLong(custId), CmConstants.BusiLogOperType.ADD, "",
                        new HashMap(), methodDetail);
            } else if ((customerValue != null && customerValue.isModified())
                    || (customerKZValue != null && customerKZValue.isModified())) {
                successMsg = CrmLocaleFactory.getResource("CMS0000082", custId);
                commonSV.saveBusiLog(CmConstants.BusiLogId.GROUP_MODIFY, CmConstants.BusiLogType.CUSTOMER_LOG,
                        Long.parseLong(custId), CmConstants.BusiLogOperType.MODIFY, "",
                        new HashMap(), methodDetail);
            } else if ((customerValue != null && customerValue.isDeleted())
                    || (customerKZValue != null && customerKZValue.isDeleted())) {
                successMsg = CrmLocaleFactory.getResource("CMS0000083", custId);
                commonSV.saveBusiLog(CmConstants.BusiLogId.GROUP_DELETE, CmConstants.BusiLogType.CUSTOMER_LOG,
                        Long.parseLong(custId), CmConstants.BusiLogOperType.DELETE, "",
                        new HashMap(), methodDetail);
            }
            zipCode = lastZipCode;
            // 触发审批工单1
            if (customerValue != null) {
                if (!secFlag) {
                    if (null != lastSegementId && !"".equals(segementId) && null != segementId
                            && !lastSegementId.equals(segementId) && loginSecStaff != null
                            && loginSecStaff.getStaffType() == 1) {
                        IBOCmGroupApprovalValue groupApproval = new BOCmGroupApprovalBean();
                        groupApproval.setCustId(DataType.getAsLong(custId));
                        groupApproval.setCurrentInfo(lastSegementId);
                        groupApproval.setApplyChangeInfo(segementId);
                        groupApproval.setResource(CmConstants.PsResource.forwardModify);
                        groupApproval.setPsType(CmConstants.PsType.custTSMChange);
                        ICmGroupOrgStructSV cmGroupOrgStructSV = (ICmGroupOrgStructSV) ServiceFactory
                                .getService(ICmGroupOrgStructSV.class);

                        groupApproval.setOpId(SessionManager.getUser().getID());
                        groupApproval.setOrgId(SessionManager.getUser().getOrgId());
                        // TSM的organizeId
                        zipCode = customerValue.getCustZipcode();
                        if (null == zipCode || "".equals(zipCode)) {
                            zipCode = "0";
                        }
                        groupApproval.setApprover(getManagerId(segementId));
                        IBOCmGroupOrgStructValue cmGroupOrgStructValue = cmGroupOrgStructSV
                                .queryGroupOrg(DataType.getAsLong(custId));
                        // 设置rootCustId
                        if (null != cmGroupOrgStructValue) {
                            groupApproval.setRootCustId(cmGroupOrgStructValue.getCustId());
                        }
                        groupApproval.setWkFlowName(zipCode);
                        groupApproval.setRemarks(remarks);
                        groupCustomerSV.CmStartGroupManagerWorkFlow(groupApproval);
                    } else if (null != lastSegementId && !"".equals(segementId) && null != segementId
                            && !lastSegementId.equals(segementId)) {
                        IBOCmGroupApprovalValue groupApproval = new BOCmGroupApprovalBean();
                        groupApproval.setCustId(DataType.getAsLong(custId));
                        groupApproval.setCurrentInfo(lastSegementId);
                        groupApproval.setApplyChangeInfo(segementId);
                        groupApproval.setResource(CmConstants.PsResource.forwardModify);
                        groupApproval.setPsType(CmConstants.PsType.segementChange);
                        ICmGroupOrgStructSV cmGroupOrgStructSV = (ICmGroupOrgStructSV) ServiceFactory
                                .getService(ICmGroupOrgStructSV.class);
                        IBOCmGroupOrgStructValue cmGroupOrgStructValue = cmGroupOrgStructSV
                                .queryGroupOrg(DataType.getAsLong(custId));
                        // 设置rootCustId
                        if (null != cmGroupOrgStructValue) {
                            groupApproval.setRootCustId(cmGroupOrgStructValue.getCustId());
                        }
                        groupApproval.setOpId(SessionManager.getUser().getID());
                        groupApproval.setOrgId(SessionManager.getUser().getOrgId());
                        zipCode = customerValue.getCustZipcode();
                        if (null == zipCode || "".equals(zipCode)) {
                            zipCode = "0";
                        }
                        groupCustomerSV.CmStartGroupSegmentWorkFlow(groupApproval, getManagerId(lastSegementId),
                                getManagerId(segementId), zipCode, remarks);
                    }
                }
            }
        } catch (Exception e) {
            retVal = "N";
            // 客户修改失败
            if (log.isErrorEnabled()) {
                log.error(CrmLocaleFactory.getResource("CMS0000084"), e);
            }
            retMsg = CrmLocaleFactory.getResource("CMS0000084",
                    (e.getCause() == null ? e.getMessage() : e.getCause().getMessage()));
            successMsg = retMsg;
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", successMsg);
            cp.put("custId", custId);
            cp.put("zipCode", zipCode);
        }
        return cp;
    }

    // 获取TSM的id
    private String getManagerId(String lastSegementId) throws Exception {
        String groupCode = (String) CacheFactory.get(CmSegmentManagerCacheImpl.class, Long.parseLong(lastSegementId));
        return CmCommonUtil.getTSM(DataType.getAsLong(groupCode));
    }

    public Map<String, Object> modifyGroupCustState(long custId, long businessId, long partyId) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = "";
        try {
            DataContainer dContainer = new DataContainer();
            dContainer.set("CUST_ID", custId);
            String tenantId = TenantIDFactory.getTenantId();
            if (tenantId.equals(TenantId.TENANT_91)) {// 91租户只是修改客户状态，不做任何逻辑校验
                retVal = "Y";
                retMsg = CrmLocaleFactory.getResource("CMS0094014") + custId
                        + CrmLocaleFactory.getResource("CMS0084115");// 删除成功
                dContainer.set(CmConstants.CommonPageParamName.BUSIOPER_ID, businessId);
                CmxServiceFactory.getCmxCustomerSV().modifyGroupCustState(dContainer);
            } else {// 21租户逻辑校验
                // 判断集团客户有没有关联的层级信息
                ICmCustomerSV sv = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
                int count = sv.queryCustOrganizeCountByCustId(custId);
                if (count > 1 || count == 0) {
                    throw new Exception("cust:" + custId + " has correlative Hierarchy,Please delete the hierarchy!");
                }
                // 判断该客户是否还有其他角色
                ICmCommonSV commonSV = (ICmCommonSV) ServiceFactory.getService(ICmCommonSV.class);
                commonSV.ifCanTerminateCust(custId, partyId);
                // isUserByCustIdState
                ICmTeamInvokeSV cmTeamInvok = (ICmTeamInvokeSV) ServiceFactory.getService(ICmTeamInvokeSV.class);
                if (cmTeamInvok.isUserByCustIdState(custId))// 返回true表示没有办理业务
                {
                    // 判断是否有集团成员
                    int memberCount = CmServiceFactory.getCustomerSV().queryGroupMembersCount(dContainer);
                    if (memberCount <= 0) {
                        retVal = "Y";
                        retMsg = CrmLocaleFactory.getResource("CMS0094014") + custId
                                + CrmLocaleFactory.getResource("CMS0084115");// 删除成功
                        dContainer.set(CmConstants.CommonPageParamName.BUSIOPER_ID, businessId);
                        CmxServiceFactory.getCmxCustomerSV().modifyGroupCustState(dContainer);
                    } else {
                        retVal = "N";
                        // retMsg = "集团【" + custId + "】有集团成员,不能销户!";
                        retMsg = CrmLocaleFactory.getResource("CMS0094014") + custId
                                + CrmLocaleFactory.getResource("CMS0084117");
                    }
                } else {
                    retVal = "N";
                    // retMsg = "集团【" + custId + "】订购了相应业务,不能销户!";
                    retMsg = CrmLocaleFactory.getResource("CMS0094014") + custId
                            + CrmLocaleFactory.getResource("CMS0084118");
                }
                // 客户信息 删除成功后
                // 如果客户在群组中, 则出群、解散群、转让群
                if ("Y".equals(retVal)) {
                    ICustGroupOutSV groupOutSV = (ICustGroupOutSV) ServiceFactory.getService(ICustGroupOutSV.class);
                    groupOutSV.groupMemberTerminate(custId);
                }
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("B2B客户销户失败", e);
            }
            retVal = "N";
            retMsg = e.getCause() == null ? e.getMessage() : e.getCause().getMessage();
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    public Map<String, Object> checkManagerPrivs() throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y"; // Y表示成功，其他表示失败
        String retIsProvin = "0";// 0不是省级工号；1是省级工号
        String retIsRegion = "0";// 0不是市级工号；1是地市工号
        String retIsCounty = "0";// 0不是区县级工号；1是区县级工号
        String regionId = ""; // 当前操作员登录地市
        String countyId = ""; // 当前操作员登录区县
        try {
            long opId = 0;
            if (SessionManager.getUser() != null) {
                opId = SessionManager.getUser().getID();
                regionId = CmCommonUtil.getDefaultRegionId();// 获取当前操作员的地州
                countyId = SessionManager.getUser().get("COUNTY_ID").toString();// 获取当前操作员的区县
                ISec2CmSV iSec2CmSV = (ISec2CmSV) ServiceFactory.getService(ISec2CmSV.class);
                boolean hasProvin = iSec2CmSV.queryExistsEntId(opId,
                        CmLnEnter.enterUserSpeuser.CUST_MANAGER_PROVINCE_ENTID);
                if (hasProvin) {
                    // 省级工号
                    retIsProvin = "1";
                    retIsRegion = "1";
                    retIsCounty = "1";
                } else {
                    // 不是省级工号
                    retIsProvin = "0";
                    boolean hasRegion = iSec2CmSV.queryExistsEntId(opId,
                            CmLnEnter.enterUserSpeuser.CUST_MANAGER_REGION_ENTID);
                    if (hasRegion) {
                        // 是地市级工号
                        retIsRegion = "1";
                        retIsCounty = "1";
                    } else {
                        // 不是地市级工号
                        retIsRegion = "0";
                        boolean hasCounty = iSec2CmSV.queryExistsEntId(opId,
                                CmLnEnter.enterUserSpeuser.CUST_MANAGER_COUNTY_ENTID);
                        if (hasCounty) {
                            // 是区县级工号
                            retIsCounty = "1";
                        } else {
                            // 不是区县级工号
                            retIsCounty = "0";
                        }
                    }
                }
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("checkManagerPrivs exception.", e);
            }
            retVal = "N";
        } finally {
            cp.put("retVal", retVal);
            cp.put("retIsProvin", retIsProvin);
            cp.put("retIsRegion", retIsRegion);
            cp.put("retIsCounty", retIsCounty);
            cp.put("regionId", regionId);
            cp.put("countId", countyId);
        }
        return cp;
    }

    public Map<String, Object> queryCustomerInfo(long custId, int custType) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        IOf2VcCustItemSV vcSV = (IOf2VcCustItemSV) ServiceFactory.getService(IOf2VcCustItemSV.class);
        String retflag = "Y";
        String retMsg = "";
        StringBuilder htmlBuilder = new StringBuilder();
        String custAgents = "";
        String custPwd = "";

        try {
            UserInfoInterface user = SessionManager.getUser();
            int ownSys = 1;
            CustIndivBean custIndivBean = null;
            CustGroupBean custGroupBean = null;
            if (Integer.valueOf("1") == custType) {
                custIndivBean = queryIndivCust(custId, user.getCode());
                String tenantId = TenantIDFactory.getTenantId();
                if ("21".equals(tenantId) && custIndivBean != null && custIndivBean.getCustCertCode() != null
                        && custIndivBean.getCustCertCode().length() > 4
                        && custIndivBean.getCustCertCode().length() == 10) {
                    custIndivBean.setCustCertCode(
                            custIndivBean.getCustCertCode().substring(0, custIndivBean.getCustCertCode().length() - 4)
                                    + "****");
                }

                this.setIndivCustomerProperty(cp, custIndivBean);
                if (custIndivBean != null) {
                    custAgents = custIndivBean.getCustAgents();
                    custPwd = custIndivBean.getCustPassword();
                    if ("0".equals(custIndivBean.getCustCertType())) {
                        custIndivBean.setCustCertType("");
                    }
                }
            } else if (Integer.valueOf("3") == custType) {
                custGroupBean = queryGroupCust(custId, user.getCode());
                if (custGroupBean != null) {
                    this.setGroupCustomerProperty(cp, custGroupBean);
                    custAgents = custGroupBean.getCustAgents();
                    custPwd = custGroupBean.getCustPassword();
                }
            }

            (new StringBuilder(String.valueOf(ownSys))).append(":").append(custType).toString();
            IOf2CustInfoItemSV sv = (IOf2CustInfoItemSV) ServiceFactory.getService(IOf2CustInfoItemSV.class);
            IBOOf2CustInfoItemValue[] cachedInfoItemValues = sv.QueryCustInfoItem(ownSys, custType);

            String itemLabel;
            for (int i = 0; i < cachedInfoItemValues.length; ++i) {
                itemLabel = cachedInfoItemValues[i].getItemLabel();

                try {
                    log.debug("calling QueryCustInfoItem begion : " + itemLabel);
                    itemLabel = CrmLocaleFactory.getResource(itemLabel);
                    log.debug("calling QueryCustInfoItem end : " + itemLabel);
                } catch (Exception var34) {
                }

                cachedInfoItemValues[i].setItemLabel(itemLabel);
            }

            IBOOf2VcCustItemValue[] vcCustItems = vcSV.getVcCustItem(user.getID(), ownSys, custType);
            itemLabel = null;
            int i;
            int count;
            IBOOf2CustInfoItemValue[] custInfoItemValues;
            if (vcCustItems != null && vcCustItems.length > 0) {
                custInfoItemValues = new IBOOf2CustInfoItemValue[vcCustItems.length];

                for (i = 0; i < vcCustItems.length; ++i) {
                    String itemCode = vcCustItems[i].getItemCode();
                    count = vcCustItems[i].getItemType();
                    int ii = 0;
                    for (int j = cachedInfoItemValues.length; ii < j; ++ii) {
                        if (cachedInfoItemValues[ii].getItemCode().equalsIgnoreCase(itemCode)
                                && cachedInfoItemValues[ii].getItemType() == count) {
                            custInfoItemValues[i] = cachedInfoItemValues[ii];
                            break;
                        }
                    }
                }
            } else {
                custInfoItemValues = cachedInfoItemValues;
            }

            if (custInfoItemValues != null && custInfoItemValues.length > 0) {
                i = 0;
                int j = custInfoItemValues.length;

                for (count = 0; i < j; ++i) {
                    if (custInfoItemValues[i].getIsVisible() != 0) {
                        if (count % 4 == 0) {
                            htmlBuilder.append("<tr valign=\"top\">");
                        }

                        htmlBuilder.append("<td width=\"10%\" class=\"view_Hd_cont_tit_row\">");
                        htmlBuilder.append(custInfoItemValues[i].getItemLabel());
                        if ("Customer Password".equalsIgnoreCase(custInfoItemValues[i].getItemLabel())) {
                            htmlBuilder.append(
                                    "</td><td width=\"15%\"  class=\"view_Hd_cont_tit_col\" style='font-weight:bold;color:red;'>");
                        } else {
                            htmlBuilder.append("</td><td width=\"15%\"  class=\"view_Hd_cont_tit_col\">");
                        }

                        String realValue = null;

                        try {
                            ConvertUtils.register(new OFStringConverter(), String.class);
                            if (Integer.valueOf("1") == custType && custIndivBean != null) {
                                realValue = org.apache.commons.beanutils.BeanUtils.getProperty(custIndivBean,
                                        custInfoItemValues[i].getFieldName());
                            } else if (Integer.valueOf("3") == custType && custGroupBean != null) {
                                realValue = org.apache.commons.beanutils.BeanUtils.getProperty(custGroupBean,
                                        custInfoItemValues[i].getFieldName());
                            }
                        } catch (Exception var35) {
                            log.error("", var35);
                        }

                        String dsiaplayValue = realValue;
                        if (realValue == null) {
                            dsiaplayValue = " ";
                        }

                        if (!com.ai.appframe2.util.StringUtils.isEmptyString(custInfoItemValues[i].getCodeType())) {
                            IBOBsStaticDataValue staticDataValue = StaticDataUtil
                                    .getStaticData(custInfoItemValues[i].getCodeType(), realValue);
                            if (staticDataValue != null) {
                                dsiaplayValue = staticDataValue.getCodeName();
                            }
                        }

                        String tenantId = TenantIDFactory.getTenantId();
                        if ("21".equals(tenantId) && "ID Number".equalsIgnoreCase(custInfoItemValues[i].getItemLabel())
                                && dsiaplayValue.length() > 4) {
                            dsiaplayValue = dsiaplayValue.substring(0, dsiaplayValue.length() - 4) + "****";
                        }

                        htmlBuilder.append(dsiaplayValue);
                        htmlBuilder.append("</td>");
                        if (count % 4 == 3) {
                            htmlBuilder.append("</tr>");
                        }

                        ++count;
                    }
                }

                i = htmlBuilder.toString().lastIndexOf("</tr>");
                if (i + 6 != htmlBuilder.toString().length()) {
                    htmlBuilder.append("</tr>");
                }
            }
        } catch (Exception var36) {
            log.error("", var36);
            retflag = "N";
            retMsg = CrmLocaleFactory.getResource("OFS2000121") + ":" + var36.getLocalizedMessage();
        } finally {
            cp.put("retFlag", retflag);
            cp.put("retMsg", retMsg);
            cp.put("output", htmlBuilder.toString());
            cp.put("custAgents", custAgents);
            if (custPwdAlertCtrl(custType)) {
                cp.put("custpwd", custPwd);
            }
        }
        return cp;
    }

    private void setGroupCustomerProperty(Map<String, Object> cp, CustGroupBean custGroupBean) {
        DecimalFormat df = new DecimalFormat("#");
        cp.put("GROUP_CUST_ID", df.format(custGroupBean.getCustId()));
        cp.put("GROUP_NAME", custGroupBean.getCustName());
        cp.put("GROUP_LEVEL", df.format(custGroupBean.getCustServiceLevel()));
        cp.put("MANAGER_ID", custGroupBean.getManagerCode());
        cp.put("MANAGER_NAME", custGroupBean.getManagerName());
        cp.put("MANAGER_DEPT_ID", df.format(custGroupBean.getManagerOrgId()));
        cp.put("MANAGER_DEPT_NAME", custGroupBean.getManagerOrgName());
        cp.put("MANAGER_PHONE", custGroupBean.getManagerTel());
        cp.put("GROUP_CONT_MOBILE", custGroupBean.getContTel());
        cp.put("GROUP_CONT_ID", df.format(custGroupBean.getContId()));
        cp.put("GROUP_CONT_NAME", custGroupBean.getContName());
        cp.put("CUST_SERVICE_ID", custGroupBean.getCustServiceId());
    }

    private void setIndivCustomerProperty(Map<String, Object> cp, CustIndivBean custIndivBean) {
        cp.put("CUST_ID", custIndivBean.getCustId());
        cp.put("CUST_NAME", custIndivBean.getCustomerName());
        cp.put("CUST_LEVEL_CODE", custIndivBean.getCustValueLevel());
        cp.put("CUST_LANAGUE", custIndivBean.getCustLanague());
        cp.put("CONTACT_ADDRESS", custIndivBean.getCustAddress());
        cp.put("CUST_CERT_CODE", custIndivBean.getCustCertCode());
        cp.put("CUST_CERT_TYPE", custIndivBean.getCustCertType());
        cp.put("GENDER", custIndivBean.getGender());
        cp.put("CUST_TYPE_CODE", custIndivBean.getCustType());
    }

    private boolean custPwdAlertCtrl(int custType) throws Exception {
        boolean sendFlag = true;
        IBOBsStaticDataValue[] busiOperData = null;
        if (custType == 1) {
            busiOperData = StaticDataUtil.getStaticData("SO_CUSTPWD_B2C_CONTROL");
        } else {
            busiOperData = StaticDataUtil.getStaticData("SO_CUSTPWD_B2B_CONTROL");
        }

        if (busiOperData != null && busiOperData.length != 0) {
            if (busiOperData != null && busiOperData.length > 0 && "N".equals(busiOperData[0].getCodeValue())) {
                sendFlag = false;
            }
        } else {
            sendFlag = false;
        }
        return sendFlag;
    }

    public Map<String, Object> saveAddtionalInfo(long custId, String popup, String onlyUpdatePopValue,
            String additionalInfo)
            throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String popupFlag = popup;

        try {
            if (custId > 0) {
                ICm2SoSV cmsv = (ICm2SoSV) ServiceFactory.getCrossCenterService(ICm2SoSV.class);
                IBOCmCustAdditionalInfoValue[] addionalInfo = cmsv.queryCustAdditionalInfo(custId);
                if (addionalInfo != null && addionalInfo.length > 0) {
                    boolean isUpdate = false;
                    if (popupFlag != null && !popupFlag.equalsIgnoreCase(addionalInfo[0].getNoteAutoPopup())) {
                        for (int i = 0; i < addionalInfo.length; i++) {
                            addionalInfo[i].setNoteAutoPopup(popupFlag);
                        }
                        cmsv.saveCustAdditionalInfo(addionalInfo);
                        isUpdate = true;
                    }
                    if (!"Y".equalsIgnoreCase(onlyUpdatePopValue) && additionalInfo != null) {
                        // 修改之前 删掉可能多余的custId记录
                        if (addionalInfo != null && addionalInfo.length > 0) {
                            for (int i = 0; i < addionalInfo.length; i++) {
                                addionalInfo[i].delete();
                                cmsv.saveCustAdditionalInfo(addionalInfo);
                            }
                        }
                        if (addionalInfo != null && addionalInfo.length > 0) {
                            IBOCmCustAdditionalInfoHValue[] hisValue = new IBOCmCustAdditionalInfoHValue[addionalInfo.length];
                            for (int i = 0; i < addionalInfo.length; i++) {
                                UserInfoInterface userInfo = SessionManager.getUser();
                                if (userInfo != null) {
                                    addionalInfo[i].setOpId(userInfo.getID());
                                    addionalInfo[i].setOrgId(userInfo.getOrgId());
                                    addionalInfo[i].setCreateDate(TimeUtil.getPrimaryDataSourceSysDate());
                                }
                                hisValue[i] = new BOCmCustAdditionalInfoHBean();
                                hisValue[i].copy(addionalInfo[i]);
                                hisValue[i].setStsToNew();
                            }
                            cmsv.saveCustAdditionalHisInfo(hisValue);
                        }
                        IBOCmCustAdditionalInfoValue[] newAdditionalInfoArray = setAdditionalInfoToNote(additionalInfo,
                                addionalInfo[0]);
                        cmsv.saveCustAdditionalInfo(newAdditionalInfoArray);
                        isUpdate = true;
                    }
                    if (!isUpdate) {
                        cp.put("FLAG", "E");
                        cp.put("DESC", "No content is changed!");
                    } else {
                        // cmsv.saveCustAdditionalInfo(addionalInfo);
                        cp.put("FLAG", "Y");
                    }
                } else {
                    IBOCmCustAdditionalInfoValue custAddionalInfo = new BOCmCustAdditionalInfoBean();
                    custAddionalInfo.setCustId(custId);
                    custAddionalInfo.setNoteAutoPopup(popupFlag);
                    UserInfoInterface userInfo = SessionManager.getUser();
                    if (userInfo != null) {
                        custAddionalInfo.setOpId(userInfo.getID());
                        custAddionalInfo.setOrgId(userInfo.getOrgId());
                        custAddionalInfo.setCreateDate(TimeUtil.getPrimaryDataSourceSysDate());
                    }
                    if (additionalInfo != null) {
                        addionalInfo = setAdditionalInfoToNote(additionalInfo, custAddionalInfo);
                    }
                    cmsv.saveCustAdditionalInfo(addionalInfo);
                    cp.put("FLAG", "Y");
                }
            }
        } catch (Exception e) {
            log.error("ERROR", e);
            if (log.isErrorEnabled()) {
                log.error(e.getMessage());
            }
            cp.put("FLAG", "N");
            cp.put("DESC", e.getMessage());
        }
        return cp;
    }

    private IBOCmCustAdditionalInfoValue[] setAdditionalInfoToNote(String additionalInfo,
            IBOCmCustAdditionalInfoValue addionalInfo) throws Exception {
        int singleLength = 20000;
        int contentLength = additionalInfo.length();
        int modVal = contentLength % singleLength;
        int index = modVal == 0 ? contentLength / singleLength : contentLength / singleLength + 1;
        List<IBOCmCustAdditionalInfoValue> additinalInfoList = new ArrayList<IBOCmCustAdditionalInfoValue>();
        if (index == 1 || index == 0) {
            IBOCmCustAdditionalInfoValue additionalInfoCopy = new BOCmCustAdditionalInfoBean();
            additionalInfoCopy.setNote(additionalInfo);
            additionalInfoCopy.setExt1("1");
            additionalInfoCopy.setCustId(addionalInfo.getCustId());
            additionalInfoCopy.setNoteAutoPopup(addionalInfo.getNoteAutoPopup());
            additionalInfoCopy.setOpId(addionalInfo.getOpId());
            additionalInfoCopy.setOrgId(addionalInfo.getOrgId());
            additionalInfoCopy.setCreateDate(TimeUtil.getPrimaryDataSourceSysDate());
            additinalInfoList.add(additionalInfoCopy);
            return additinalInfoList.toArray(new IBOCmCustAdditionalInfoValue[] {});
        }
        for (int i = 0; i < index; i++) {

            IBOCmCustAdditionalInfoValue additionalInfoCopy = new BOCmCustAdditionalInfoBean();
            additionalInfoCopy.setCustId(addionalInfo.getCustId());
            additionalInfoCopy.setNoteAutoPopup(addionalInfo.getNoteAutoPopup());
            additionalInfoCopy.setOpId(addionalInfo.getOpId());
            additionalInfoCopy.setOrgId(addionalInfo.getOrgId());
            additionalInfoCopy.setCreateDate(TimeUtil.getPrimaryDataSourceSysDate());
            if (i == index - 1) {
                additionalInfoCopy.setNote(additionalInfo.substring(singleLength * i, contentLength));
            } else {
                additionalInfoCopy.setNote(additionalInfo.substring(singleLength * i, singleLength * (i + 1)));
            }
            additionalInfoCopy.setExt1(String.valueOf(i + 1));
            additinalInfoList.add(additionalInfoCopy);
        }
        return additinalInfoList.toArray(new IBOCmCustAdditionalInfoValue[] {});
    }

    public Map<String, Object> deleteCustPreferTime(String custId, String preferPeriodId) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        try {
            IBOCmPreferPeriodValue value = new BOCmPreferPeriodBean();
            value.initProperty(IBOCmPreferPeriodValue.S_PreferPeriodId, DataType.getAsLong(preferPeriodId));
            value.delete();
            ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            customerSV.saveCustPreferTime(new IBOCmPreferPeriodValue[] { value });
            // 保存业务记录
            ICmCommonSV commonSV = (ICmCommonSV) ServiceFactory.getService(ICmCommonSV.class);
            commonSV.saveCommonBusiLog(CmConstants.BusiLogId.CUST_PREFER, new IBOCmPreferPeriodValue[] { value },
                    CmConstants.BusiLogType.CUSTOMER_LOG, Long.parseLong(custId));
            cp.put("retFlag", "Y");
            // 删除成功。
            cp.put("retVal", CrmLocaleFactory.getResource("CMS0013241"));
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("deleteCustPreferTime exception.", e);
            }
            cp.put("retFlag", "N");
            if (e.getMessage() == null || "".equals(e.getMessage())) {
                cp.put("retVal", CrmLocaleFactory.getResource("CMS0013242"));
            } else {
                cp.put("retVal", e.getMessage());
            }
        }
        return cp;
    }

    public Map<String, Object> deleteCustPreference(String custId, String preferChannelId) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        try {
            ICmCustPreferenceInfoSV custPreferSV = (ICmCustPreferenceInfoSV) ServiceFactory
                    .getService(ICmCustPreferenceInfoSV.class);
            IBOCmCustPerferInfoValue[] preferTime = custPreferSV
                    .queryCustPreferTimeInforDeal(DataType.getAsLong(preferChannelId), -1, -1);
            if (null != preferTime && preferTime.length > 0) {
                ExceptionUtil.throwBusinessException("CMS0013243");
            }
            IBOCmCustPreferChannelValue value = new BOCmCustPreferChannelBean();
            value.initProperty(IBOCmCustPreferChannelValue.S_PreferChannelId, DataType.getAsLong(preferChannelId));
            value.initProperty(IBOCmCustPreferChannelValue.S_CustId, custId);
            value.delete();
            ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            customerSV.saveCustPreferChannel(new IBOCmCustPreferChannelValue[] { value });
            cp.put("retFlag", "Y");
            // 删除成功。
            cp.put("retVal", CrmLocaleFactory.getResource("CMS0013241"));
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("deleteCustPreference exception.", e);
            }
            cp.put("retFlag", "N");
            // 删除失败：{0}。
            if (e.getMessage() == null || "".equals(e.getMessage())) {
                cp.put("retVal", CrmLocaleFactory.getResource("CMS0013242"));
            } else {
                cp.put("retVal", e.getMessage());
            }
        }
        return cp;
    }

    public ICustomerValue[] queryB2BCustomers(QueryB2BCustomerVO queryVO) throws Exception {
        String custId = queryVO.getCustId();
        String custName = queryVO.getCustName();
        String custCertCode = queryVO.getCustCertCode();
        String startCreateDate = queryVO.getStartCreateDate();
        String endCreateDate = queryVO.getEndCreateDate();
        String custStatus = queryVO.getCustStatus();
        String managerId = queryVO.getManagerId();
        String cvrNumber = queryVO.getCvrNumber();
        String contMobile = queryVO.getContMobile();
        String custServiceId = queryVO.getCustServiceId();
        String billId = queryVO.getBillId();
        String countyId = queryVO.getCountyId();
        String custCertLevel = queryVO.getCustServiceLevel();
        String custCertAddress = queryVO.getCustCertAddress();
        String cityId = queryVO.getCityId();
        String prodName = queryVO.getProdName();
        String effectDate = queryVO.getEffectiveDate();
        String expirDate = queryVO.getExpirieDate();
        String manageCode = queryVO.getManagerCode();
        String countyCode = queryVO.getCountyCode();
        String memberType = queryVO.getMemberType();
        String memberBillId = queryVO.getMemberBillId();
        String accountId = queryVO.getAccountId();

        int num = queryVO.getSize();
        int page = queryVO.getPage();
        int startNum = -1;
        int endNum = -1;
        if (page > 0 && num > 0) {
            startNum = num * (page - 1) + 1;
            endNum = num * page;
        }

        String beanClass = "com.ai.appframe2.bo.DataContainer";
        XmlParameters xmlParam = new XmlParameters();
        xmlParam.setBeanProp(beanClass, 0, "QRY_TYPE", "1");
        xmlParam.setBeanProp(beanClass, 0, "CUST_ID", custId);
        xmlParam.setBeanProp(beanClass, 0, "CUST_NAME", custName);
        xmlParam.setBeanProp(beanClass, 0, "CUST_CERT_CODE", custCertCode);
        xmlParam.setBeanProp(beanClass, 0, "START_CREATE_DATE", startCreateDate);
        xmlParam.setBeanProp(beanClass, 0, "END_CREATE_DATE", endCreateDate);
        xmlParam.setBeanProp(beanClass, 0, "MANAGER_ID", managerId);
        xmlParam.setBeanProp(beanClass, 0, "CVR_NUMBER", cvrNumber);
        xmlParam.setBeanProp(beanClass, 0, "CONT_MOBILE", contMobile);
        xmlParam.setBeanProp(beanClass, 0, "CUST_SERVICE_ID", custServiceId);
        xmlParam.setBeanProp(beanClass, 0, "BILL_ID", billId);
        xmlParam.setBeanProp(beanClass, 0, "COUNTY_ID", countyId);
        xmlParam.setBeanProp(beanClass, 0, "CITY_ID", cityId);
        xmlParam.setBeanProp(beanClass, 0, "CUST_SERVICE_LEVEL", custCertLevel);
        xmlParam.setBeanProp(beanClass, 0, "CUST_CERT_ADDRESS", custCertAddress);
        xmlParam.setBeanProp(beanClass, 0, "PROD_NAME", prodName);
        xmlParam.setBeanProp(beanClass, 0, "EFFTIVE_DATE", effectDate);
        xmlParam.setBeanProp(beanClass, 0, "EXPERIE_DATE", expirDate);
        xmlParam.setBeanProp(beanClass, 0, "COUNTY_CODE", countyCode);
        xmlParam.setBeanProp(beanClass, 0, "MANAGER_CODE", manageCode);
        xmlParam.setBeanProp(beanClass, 0, "MEMBER_TYPE", memberType);
        xmlParam.setBeanProp(beanClass, 0, "MEMBER_BILL_ID", memberBillId);
        xmlParam.setBeanProp(beanClass, 0, "ACCOUNT_ID", accountId);
        xmlParam.setBeanProp(beanClass, 0, "IS_VPMN", "0");
        xmlParam.setBeanProp(beanClass, 0, "MEMBER_TYPE", "1");
        xmlParam.setBeanProp(beanClass, 0, "CUST_TYPE", "3");
        xmlParam.setBeanProp(beanClass, 0, "MATCH_TYPE", "2");

        ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getCrossCenterService(ICmCustomerSV.class);
        return customerSV.queryCusts4GroupAndLog(xmlParam.toXml(), custStatus, startNum, endNum);
    }

    public int countB2BCustomers(QueryB2BCustomerVO queryVO) throws Exception {
        String custId = queryVO.getCustId();
        String custName = queryVO.getCustName();
        String custCertCode = queryVO.getCustCertCode();
        String startCreateDate = queryVO.getStartCreateDate();
        String endCreateDate = queryVO.getEndCreateDate();
        String custStatus = queryVO.getCustStatus();
        String managerId = queryVO.getManagerId();
        String cvrNumber = queryVO.getCvrNumber();
        String contMobile = queryVO.getContMobile();
        String custServiceId = queryVO.getCustServiceId();
        String billId = queryVO.getBillId();
        String countyId = queryVO.getCountyId();
        String custCertLevel = queryVO.getCustServiceLevel();
        String custCertAddress = queryVO.getCustCertAddress();
        String cityId = queryVO.getCityId();
        String prodName = queryVO.getProdName();
        String effectDate = queryVO.getEffectiveDate();
        String expirDate = queryVO.getExpirieDate();
        String manageCode = queryVO.getManagerCode();
        String countyCode = queryVO.getCountyCode();
        String memberType = queryVO.getMemberType();
        String memberBillId = queryVO.getMemberBillId();
        String accountId = queryVO.getAccountId();

        String beanClass = "com.ai.appframe2.bo.DataContainer";
        XmlParameters xmlParam = new XmlParameters();
        xmlParam.setBeanProp(beanClass, 0, "QRY_TYPE", "1");
        xmlParam.setBeanProp(beanClass, 0, "CUST_ID", custId);
        xmlParam.setBeanProp(beanClass, 0, "CUST_NAME", custName);
        xmlParam.setBeanProp(beanClass, 0, "CUST_CERT_CODE", custCertCode);
        xmlParam.setBeanProp(beanClass, 0, "START_CREATE_DATE", startCreateDate);
        xmlParam.setBeanProp(beanClass, 0, "END_CREATE_DATE", endCreateDate);
        xmlParam.setBeanProp(beanClass, 0, "MANAGER_ID", managerId);
        xmlParam.setBeanProp(beanClass, 0, "CVR_NUMBER", cvrNumber);
        xmlParam.setBeanProp(beanClass, 0, "CONT_MOBILE", contMobile);
        xmlParam.setBeanProp(beanClass, 0, "CUST_SERVICE_ID", custServiceId);
        xmlParam.setBeanProp(beanClass, 0, "BILL_ID", billId);
        xmlParam.setBeanProp(beanClass, 0, "COUNTY_ID", countyId);
        xmlParam.setBeanProp(beanClass, 0, "CITY_ID", cityId);
        xmlParam.setBeanProp(beanClass, 0, "CUST_SERVICE_LEVEL", custCertLevel);
        xmlParam.setBeanProp(beanClass, 0, "CUST_CERT_ADDRESS", custCertAddress);
        xmlParam.setBeanProp(beanClass, 0, "PROD_NAME", prodName);
        xmlParam.setBeanProp(beanClass, 0, "EFFTIVE_DATE", effectDate);
        xmlParam.setBeanProp(beanClass, 0, "EXPERIE_DATE", expirDate);
        xmlParam.setBeanProp(beanClass, 0, "COUNTY_CODE", countyCode);
        xmlParam.setBeanProp(beanClass, 0, "MANAGER_CODE", manageCode);
        xmlParam.setBeanProp(beanClass, 0, "MEMBER_TYPE", memberType);
        xmlParam.setBeanProp(beanClass, 0, "MEMBER_BILL_ID", memberBillId);
        xmlParam.setBeanProp(beanClass, 0, "ACCOUNT_ID", accountId);
        xmlParam.setBeanProp(beanClass, 0, "IS_VPMN", "0");
        xmlParam.setBeanProp(beanClass, 0, "MEMBER_TYPE", "1");
        xmlParam.setBeanProp(beanClass, 0, "CUST_TYPE", "3");
        xmlParam.setBeanProp(beanClass, 0, "MATCH_TYPE", "2");

        ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getCrossCenterService(ICmCustomerSV.class);
        return customerSV.queryCustomers4GroupByMultiCount(xmlParam.toXml(), custStatus);
    }

    public Map<String, Object> queryCmCustPutOnRecord(long custId)
            throws Exception {
        Map<String, Object> cp = new HashMap<>();
        ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        try {
            IBOCmCustPutOnRecordValue cmCustPutOnRecordValue = service.qryCustPutOnRecordByCustId(custId);

            if (null != cmCustPutOnRecordValue) {
                String kreditflag = cmCustPutOnRecordValue.getKreditadvarsel();
                if (kreditflag.equals("J")) {
                    cp.put("Kreditadvarsel", "YES");
                    String kreditDato = cmCustPutOnRecordValue.getKreditadvarselAendretdato();
                    cp.put("KreditadvarselAendretDato", kreditDato.substring(0, 2) + "-" + kreditDato.substring(2, 4)
                            + "-" + kreditDato.substring(4, 8));
                } else { // N 代表取消
                    cp.put("Kreditadvarsel", "NO");
                }

            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("queryCmCustPutOnRecord exception.", e);
            }

            cp.put("retFlag", "N");
        }
        return cp;
    }

    public Map<String, Object> saveAKSInfo(long custId, String aksFlag) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        try {
            String flag = aksFlag;
            ICmCustRequestTaskSV taskSV = (ICmCustRequestTaskSV) ServiceFactory.getService(ICmCustRequestTaskSV.class);
            if (custId > 0 && StringUtils.isNotBlank(flag)) {
                taskSV.saveSubscribeAKSInfo(custId, Integer.parseInt(flag));
            }
            cp.put("retFlag", "Y");
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("saveAKSInfo exception.", e);
            }
            cp.put("retFlag", "N");
        }
        return cp;
    }

    @Override
    public Map<String, Object> saveCustRel(CustRelVO custRelvo) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = CrmLocaleFactory.getResource("CMS9988797");

        try {
            if (custRelvo.getRelCustId() < 0) {
                retVal = "N";
                // 您已对数据进行过保存或从未对数据进行过修改，无需再次保存。
                retMsg = CrmLocaleFactory.getResource("CMS0000080");
            } else {
                BOCmCustRelBean value = new BOCmCustRelBean();
                BeanUtils.copyProperties(custRelvo, value);
                // 如果客户id跟关联客户id一样
                if (value.getCustId() == value.getRelCustId()) {
                    // 操作失敗
                    retVal = "N";
                    // 自己不能是自己的供应商或者合作伙伴
                    retMsg = CrmLocaleFactory.getResource("CMS9988837");
                } else {
                    ICmCustRelSV service = (ICmCustRelSV) ServiceFactory.getService(ICmCustRelSV.class);
                    service.saveCustRel(value);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            // 操作失敗
            retVal = "N";
            // 关系已经存在
            retMsg = CrmLocaleFactory.getResource("CMS9988802",
                    (e.getCause() == null ? e.getMessage() : e.getCause().getMessage()));
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    @Override
    public Map<String, Object> delCustRel(CustRelsVO custRelvos) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = CrmLocaleFactory.getResource("CMS9988804");
        try {
            if (custRelvos == null || custRelvos.getCustRels().length < 1) {
                retVal = "N";
                retMsg = CrmLocaleFactory.getResource("CMS0000080");
            } else {
                // 修改为批量删除
                CustRelVO[] custRels = custRelvos.getCustRels();
                ICmCustRelSV service = (ICmCustRelSV) ServiceFactory
                        .getService(ICmCustRelSV.class);
                IBOCmCustRelValue[] vals = null;
                if (custRelvos != null && custRels.length > 0) {
                    vals = new IBOCmCustRelValue[custRels.length];
                    for (int i = 0; i < custRels.length; i++) {
                        vals[i] = new BOCmCustRelBean();
                        BeanUtils.copyProperties(custRels[i], vals[i]);
                        vals[i].setStsToOld();
                        vals[i].delete();
                    }
                    service.saveBatchCustRel(vals);
                }

            }

        } catch (Exception e) {
            // 操作失敗
            retVal = "N";
            if (log.isErrorEnabled()) {
                log.error(CrmLocaleFactory.getResource("CMS9988803"), e);
            }
            retMsg = CrmLocaleFactory.getResource("CMS9988803",
                    (e.getCause() == null ? e.getMessage()
                            : e.getCause()
                                    .getMessage()));
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    public Map<String, Object> saveCustPrefeTime(CreatePerferTimeVO createPerferTimeVO) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        cp.put("retFlag", "N");
        try {
            String custId = createPerferTimeVO.getCustId();
            String preferChannelId = createPerferTimeVO.getPreferChannelId();
            List<BOCmPreferPeriodBean> list = new ArrayList<BOCmPreferPeriodBean>();
            ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            List<CmCustPerferTimeVO> container = createPerferTimeVO.getCustPerferInfoVOList();
            BOCmPreferPeriodBean bean = null;
            List<BOCmPreferPeriodBean> workDayList = new ArrayList<BOCmPreferPeriodBean>();
            List<BOCmPreferPeriodBean> offDayList = new ArrayList<BOCmPreferPeriodBean>();
            List<BOCmPreferPeriodBean> timeList = new ArrayList<BOCmPreferPeriodBean>();
            for (CmCustPerferTimeVO perferTimeVO : container) {
                if (perferTimeVO.getTimeType() == null) {
                    // 时间类型为空
                    ExceptionUtil.throwBusinessException("CMS0013234");
                }
                if (perferTimeVO.getTimeBeginUnit() == null) {
                    // 起始时间为空
                    ExceptionUtil.throwBusinessException("CMS0013235");
                }
                if (perferTimeVO.getTimeEndUnit() == null) {
                    // 结束时间为空
                    ExceptionUtil.throwBusinessException("CMS0013236");
                }
                bean = new BOCmPreferPeriodBean();
                if (!StringUtils.isBlank(perferTimeVO.getPreferPeriodId())) {// 做修改处理
                    bean.copy((DataStructInterface) perferTimeVO);
                } else {
                    bean.setPreferPeriodId(CmCommonUtil.getNewSequence(BOCmPreferPeriodBean.class));
                    bean.setState("U");
                    bean.setRegionId(CmCommonUtil.getDefaultRegionId());
                }
                bean.setTimeType(DataType.getAsLong(perferTimeVO.getTimeType()));
                bean.setTimeBeginUnit(DataType.getAsLong(perferTimeVO.getTimeBeginUnit()));
                bean.setTimeEndUnit(DataType.getAsLong(perferTimeVO.getTimeEndUnit()));
                // 对所选时间段不能交叉进行校验处理
                String timeType = perferTimeVO.getTimeType();
                if (CmConstants.CustPreferTimeType.workDay.equals(timeType)) {
                    workDayList.add(bean);
                } else if (CmConstants.CustPreferTimeType.offDay.equals(timeType)) {
                    offDayList.add(bean);
                } else if (CmConstants.CustPreferTimeType.timeInterval.equals(timeType)) {
                    timeList.add(bean);
                }
                if (perferTimeVO.getRemarks() != null) {
                    bean.setRemarks(perferTimeVO.getRemarks().trim());
                }
                bean.setPreferChannelId(DataType.getAsLong(preferChannelId));
                list.add(bean);
            }
            checkTime(workDayList);
            checkTime(offDayList);
            checkTime(timeList);
            service.saveCustPreferTime(list.toArray(new BOCmPreferPeriodBean[0]));
            // 保存业务记录
            ICmCommonSV commonSV = (ICmCommonSV) ServiceFactory.getService(ICmCommonSV.class);
            commonSV.saveCommonBusiLog(CmConstants.BusiLogId.CUST_PREFER,
                    (DataStructInterface[]) list.toArray(new BOCmPreferPeriodBean[0]),
                    CmConstants.BusiLogType.CUSTOMER_LOG,
                    Long.parseLong(custId));
            cp.put("retFlag", "Y");
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("saveCustPrefeTime exception.", e);
            }
            cp.put("retMsg", e.getMessage());
            cp.put("retFlag", "N");
        }
        return cp;
    }

    private void checkTime(List<BOCmPreferPeriodBean> beanList) throws Exception {
        if (beanList != null && beanList.size() > 1) {
            boolean checkFlag = true;
            for (int i = 0; i < beanList.size() - 1; i++) {
                for (int j = i + 1; j < beanList.size(); j++) {
                    if (beanList.get(j).getTimeBeginUnit() >= beanList.get(i).getTimeBeginUnit()
                            && beanList.get(j).getTimeBeginUnit() < beanList.get(i).getTimeEndUnit()) {
                        checkFlag = false;
                    } else if (beanList.get(j).getTimeEndUnit() > beanList.get(i).getTimeBeginUnit()
                            && beanList.get(j).getTimeEndUnit() <= beanList.get(i).getTimeEndUnit()) {
                        checkFlag = false;
                    } else if (beanList.get(j).getTimeEndUnit() <= beanList.get(i).getTimeBeginUnit()
                            && beanList.get(j).getTimeEndUnit() >= beanList.get(i).getTimeEndUnit()) {
                        checkFlag = false;
                    }
                }
            }
            if (!checkFlag) {
                ExceptionUtil.throwBusinessException("CMS0013233");
            }
        }
    }

    public Map<String, Object> saveCustPreference(CreatePerferInfoVO createPerferInfoVO) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        cp.put("retFlag", "N");

        try {
            if (createPerferInfoVO == null) {
                cp.put("retMsg", "Request body must not be null");
                return cp;
            }
            String custId = createPerferInfoVO.getCustId();
            if (StringUtils.isBlank(custId)) {
                cp.put("retMsg", "custId must not be blank");
                return cp;
            }

            List<CmCustPerferInfoVO> container = createPerferInfoVO.getCustPerferInfoVOList();
            if (container == null || container.isEmpty()) {
                cp.put("retMsg", "custPerferInfoVOList must not be empty");
                return cp;
            }

            for (CmCustPerferInfoVO vo : container) {
                validateCustPreferenceRow(vo, cp);
            }

            checkCustPreferenceDuplicatesInRequest(container, cp);

            ICmCustPreferenceInfoSV preferenceInfoSV = (ICmCustPreferenceInfoSV) ServiceFactory.getService(ICmCustPreferenceInfoSV.class);
            IBOCmCustPerferInfomationValue[] oldPreInfos = preferenceInfoSV.queryCustPreferInformation(Long.parseLong(custId), -1, -1);
            Map<String, String> oldPriorChannelKey2Id = new HashMap<>();
            Map<String, String> oldTypePriorKey2Id = new HashMap<>();
            Map<String, String> oldContRelaKey2Id = new HashMap<>();
            fillOldPreferenceKeyMaps(oldPreInfos, oldPriorChannelKey2Id, oldTypePriorKey2Id, oldContRelaKey2Id);
            checkCustPreferenceTypePriorNotSameAsDb(container, oldTypePriorKey2Id, cp);
            checkCustPreferenceDuplicatesAgainstDb(container, oldPriorChannelKey2Id, oldContRelaKey2Id, cp);

            List<BOCmCustPreferChannelBean> preferenceList = new ArrayList<>();
            for (CmCustPerferInfoVO vo : container) {
                String pt = vo.getPerferType();
                if (pt.equals(String.valueOf(CmConstants.PreferType.preferredMedium))) {
                    preferenceList.add(buildCustPreferChannelBean(vo, custId, CmConstants.PreferType.preferredMedium));
                } else if (pt.equals(String.valueOf(CmConstants.PreferType.preferredOffice))) {
                    preferenceList.add(buildCustPreferChannelBean(vo, custId, CmConstants.PreferType.preferredOffice));
                }
            }

            ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            service.saveCustPreferChannel(preferenceList.toArray(new BOCmCustPreferChannelBean[0]));
            cp.put("retFlag", "Y");
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("saveCustPreference exception.", e);
            }
            cp.put("retMsg", e.getMessage());
            cp.put("retFlag", "N");
        }
        return cp;
    }

    /** 必填与业务码校验（偏好优先级以 prior/PRIOR 为准，不使用联系媒介 PRIORITY）。 */
    private void validateCustPreferenceRow(CmCustPerferInfoVO vo, Map<String, Object> cp) throws Exception {
        if (vo == null || vo.getPerferType() == null) {
            ExceptionUtil.throwBusinessException("CMS0013237");
        }
        if (vo.getPrior() == null) {
            ExceptionUtil.throwBusinessException("CMS0013238");
        }
        if (vo.getPreferChannelName() == null) {
            ExceptionUtil.throwBusinessException("CMS0013239");
        }
        if (StringUtils.isBlank(vo.getCustContRelaId())) {
            cp.put("exitPriorFlag", true);
            throw new Exception("custContRelaId must not be blank");
        }
        if (vo.getPerferType().equals(String.valueOf(CmConstants.PreferType.preferredMedium))
                && vo.getContMedTypeName() == null) {
            ExceptionUtil.throwBusinessException("CMS0013240");
        }
    }

    private static String custPreferencePriorChannelKey(String perferType, String prior, String preferChannelName) {
        return perferType + "#" + prior + "#" + StringUtils.trimToEmpty(preferChannelName);
    }

    private static String custPreferenceTypePriorKey(String perferType, String prior) {
        return perferType + "#" + prior;
    }

    private static String custPreferenceContRelaKey(String perferType, String custContRelaId) {
        return perferType + "#" + StringUtils.trimToEmpty(custContRelaId);
    }

    private static boolean conflictsWithExistingPrefer(String preferChannelId, String existingId) {
        return existingId != null
                && (StringUtils.isBlank(preferChannelId) || !preferChannelId.equals(existingId));
    }

    private void checkCustPreferenceDuplicatesInRequest(List<CmCustPerferInfoVO> container, Map<String, Object> cp) throws Exception {
        Set<String> requestPriorChannelKeys = new HashSet<>();
        Set<String> requestContRelaKeys = new HashSet<>();
        for (CmCustPerferInfoVO vo : container) {
            String perferType = vo.getPerferType();
            String prior = String.valueOf(vo.getPrior());
            String preferChannelName = StringUtils.trimToEmpty(vo.getPreferChannelName());
            String custContRelaId = StringUtils.trimToEmpty(vo.getCustContRelaId());

            String priorChannelKey = custPreferencePriorChannelKey(perferType, prior, preferChannelName);
            if (!requestPriorChannelKeys.add(priorChannelKey)) {
                cp.put("exitPriorFlag", true);
                throw new Exception("Duplicate perferType + prior + preferChannelName for the same customer is not allowed");
            }
            String contRelaKey = custPreferenceContRelaKey(perferType, custContRelaId);
            if (!requestContRelaKeys.add(contRelaKey)) {
                cp.put("exitFlag", true);
                throw new Exception("Duplicate perferType + custContRelaId for the same customer is not allowed");
            }
        }
    }

    private static void fillOldPreferenceKeyMaps(IBOCmCustPerferInfomationValue[] oldPreInfos,
            Map<String, String> oldPriorChannelKey2Id, Map<String, String> oldTypePriorKey2Id,
            Map<String, String> oldContRelaKey2Id) {
        if (oldPreInfos == null) {
            return;
        }
        for (IBOCmCustPerferInfomationValue old : oldPreInfos) {
            if (old == null) {
                continue;
            }
            String priorChannelKey = custPreferencePriorChannelKey(
                    String.valueOf(old.getPerferType()),
                    String.valueOf(old.getPrior()),
                    old.getPreferChannelName());
            oldPriorChannelKey2Id.putIfAbsent(priorChannelKey, String.valueOf(old.getPreferChannelId()));

            String typePriorKey = custPreferenceTypePriorKey(
                    String.valueOf(old.getPerferType()),
                    String.valueOf(old.getPrior()));
            oldTypePriorKey2Id.putIfAbsent(typePriorKey, String.valueOf(old.getPreferChannelId()));

            String contRelaKey = custPreferenceContRelaKey(String.valueOf(old.getPerferType()), String.valueOf(old.getCustContRelaId()));
            oldContRelaKey2Id.putIfAbsent(contRelaKey, String.valueOf(old.getPreferChannelId()));
        }
    }

    /**
     * DB 对比校验：不能与旧数据存在相同的 perferType + prior 组合（允许更新同一条 preferChannelId）。
     *
     * <p>这是对旧逻辑（perferType + prior + preferChannelName）的补强：只要优先级在同一偏好类型下重复，就视为冲突。</p>
     */
    private void checkCustPreferenceTypePriorNotSameAsDb(List<CmCustPerferInfoVO> container,
            Map<String, String> oldTypePriorKey2Id, Map<String, Object> cp) throws Exception {
        for (CmCustPerferInfoVO vo : container) {
            String perferType = vo.getPerferType();
            String prior = String.valueOf(vo.getPrior());
            String typePriorKey = custPreferenceTypePriorKey(perferType, prior);
            String existingId = oldTypePriorKey2Id.get(typePriorKey);
            if (conflictsWithExistingPrefer(vo.getPreferChannelId(), existingId)) {
                cp.put("exitPriorFlag", true);
                throw new Exception("Duplicate perferType + prior for the same customer is not allowed");
            }
        }
    }

    private void checkCustPreferenceDuplicatesAgainstDb(List<CmCustPerferInfoVO> container,
            Map<String, String> oldPriorChannelKey2Id, Map<String, String> oldContRelaKey2Id, Map<String, Object> cp) throws Exception {
        for (CmCustPerferInfoVO vo : container) {
            String perferType = vo.getPerferType();
            String prior = String.valueOf(vo.getPrior());
            String preferChannelName = StringUtils.trimToEmpty(vo.getPreferChannelName());
            String custContRelaId = StringUtils.trimToEmpty(vo.getCustContRelaId());

            String priorChannelKey = custPreferencePriorChannelKey(perferType, prior, preferChannelName);
            String existingId = oldPriorChannelKey2Id.get(priorChannelKey);
            if (conflictsWithExistingPrefer(vo.getPreferChannelId(), existingId)) {
                cp.put("exitPriorFlag", true);
                throw new Exception("Duplicate perferType + prior + preferChannelName for the same customer is not allowed");
            }

            String contRelaKey = custPreferenceContRelaKey(perferType, custContRelaId);
            String existingContId = oldContRelaKey2Id.get(contRelaKey);
            if (conflictsWithExistingPrefer(vo.getPreferChannelId(), existingContId)) {
                cp.put("exitFlag", true);
                throw new Exception("Duplicate perferType + custContRelaId for the same customer is not allowed");
            }
        }
    }

    private BOCmCustPreferChannelBean buildCustPreferChannelBean(CmCustPerferInfoVO vo, String custId, int perferType) throws Exception {
        BOCmCustPreferChannelBean bean = new BOCmCustPreferChannelBean();
        if (!StringUtils.isBlank(vo.getPreferChannelId())) {
            bean.copy((DataStructInterface) vo);
        } else {
            bean.setPreferChannelId(CmCommonUtil.getNewSequence(BOCmCustPreferChannelBean.class));
            bean.setState("U");
            bean.setRegionId(CmCommonUtil.getDefaultRegionId());
            bean.setCustId(Long.valueOf(custId));
        }
        bean.setPerferType(perferType);
        bean.setCustContRelaId(DataType.getAsLong(vo.getCustContRelaId().trim()));
        bean.setPreferChannelName(vo.getPreferChannelName());
        bean.setPrior(DataType.getAsLong(vo.getPrior()));
        return bean;
    }

    public Map<String, Object> checkHasOngoingOrder(long custId) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retValue = "N";
        try {
            IBbossCustVpnRelSV bbossCustVpnRelSV = (IBbossCustVpnRelSV) ServiceFactory
                    .getService(IBbossCustVpnRelSV.class);
            boolean haveRet = bbossCustVpnRelSV.hasOngoingOrder(custId);
            if (haveRet) {
                retValue = "Y";
            }
        } catch (Exception e) {
            log.error("ERROR", e);
        } finally {
            cp.put("retValue", retValue);
        }
        return cp;
    }

    public String validAgreement(long custId, long agrId) {
        String retVal = "Y";
        try {
            IAgreementFSV agressSV = (IAgreementFSV) ServiceFactory.getService(IAgreementFSV.class);
            IBOAgrAgreementHValue agrValue = agressSV.getAgreementValueByCust(custId, agrId);
            if (agrValue != null) {
                retVal = "Y";
            } else {
                retVal = "N";
            }
        } catch (Exception e) {
            log.error("", e);
        }
        return retVal;
    }

    public Map queryCustSimpleById(long custId) throws Exception {
        Map cp = new HashMap();
        // 返回值
        String retVal = "Y";
        String custName = null;
        String firstName = null;
        String lastName = null;
        String custCertCode = null;
        String TaxID = "";
        long partyId = -1;
        try {
            ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            ICustomerValue custVal = customerSV.queryCustomerMaskByCustId(custId);
            custName = custVal.getCustName();
            firstName = custVal.getFirstName();
            lastName = custVal.getLastName();
            partyId = custVal.getPartyId();
            custCertCode = custVal.getCustCertCode();
            long custType = CmCommonUtil.getCustType(custId);
            // 集团客户查询税号
            if (custType == 3) {
                ICmLnGroupSV gsv = (ICmLnGroupSV) ServiceFactory.getService(ICmLnGroupSV.class);
                IBOLnCmxGroupCustValue gvalue = gsv.queryGroupCustExtById(custId);
                if (gvalue != null) {
                    TaxID = gvalue.getTaxId();
                }
                if (StringUtils.isNotBlank(custCertCode)) {
                    // 判断是否为外国集团
                    if (custCertCode.indexOf("K") < 0) {
                        long kobNumberLocal = DataType.getAsLong(custCertCode);
                        custCertCode = String.valueOf(kobNumberLocal);
                    } else {
                        custCertCode = "";
                    }
                }

            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("queryCustById exception.", e);
            }
            // 操作失敗
            retVal = "N";
        } finally {
            cp.put("retVal", retVal);
            cp.put("custName", custName);
            cp.put("firstName", firstName);
            cp.put("lastName", lastName);
            cp.put("custCertCode", custCertCode);
            cp.put("TaxID", TaxID);
            cp.put("partyId", Long.toString(partyId));
        }
        return cp;
    }

    public DataContainer[] queryGroupDeptBill(long custId, long deptId, int startNum, int endNum)
            throws Exception {
        String beanClass = "com.ai.appframe2.bo.DataContainer";
        XmlParameters xmlParam = new XmlParameters();
        xmlParam.setBeanProp(beanClass, 0, "DEPT_ID", String.valueOf(deptId));
        xmlParam.setBeanProp(beanClass, 0, "CUST_ID", String.valueOf(custId));
        ICmDkCustomerSV sv = (ICmDkCustomerSV) ServiceFactory.getService(ICmDkCustomerSV.class);
        return sv.queryGroupDeptBill(xmlParam.toXml(), startNum, endNum);
    }

    public int queryGroupDeptBillCount(long custId, long deptId) throws Exception {
        String beanClass = "com.ai.appframe2.bo.DataContainer";
        XmlParameters xmlParam = new XmlParameters();
        xmlParam.setBeanProp(beanClass, 0, "DEPT_ID", String.valueOf(deptId));
        xmlParam.setBeanProp(beanClass, 0, "CUST_ID", String.valueOf(custId));
        ICmDkCustomerSV sv = (ICmDkCustomerSV) ServiceFactory.getService(ICmDkCustomerSV.class);
        return sv.queryGroupDeptBillCount(xmlParam.toXml());
    }

    public Map<String, Object> saveGroupDeptInfo(SaveCustOrganizeVO saveVO) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = "";
        String id = "";
        try {

            // 判断有没取到dcs
            if (saveVO == null || saveVO.getNewData() == null) {
                retVal = "N";
                // 您已对数据进行过保存或从未对数据进行过修改，无需再次保存。
                retMsg = CrmLocaleFactory.getResource("CMS0000080");
            } else {
                CmCustOrganizeVO newVO = saveVO.getNewData();
                CmCustOrganizeVO oldVO = saveVO.getOldData();
                ICustOrganizeValue custOrganizeValue = new CustOrganizeBean();
                if (oldVO != null && oldVO.getDeptId() > 0) {
                    // modify
                    BeanUtils.copyProperties(oldVO, custOrganizeValue);
                    custOrganizeValue.setStsToOld();
                    BeanUtils.copyProperties(newVO, custOrganizeValue);
                } else {
                    // create
                    BeanUtils.copyProperties(newVO, custOrganizeValue);
                    custOrganizeValue.setStsToNew();
                }

                // 防止部分ID和父部门ID一致出现死循环
                if (custOrganizeValue.getDeptId() == custOrganizeValue.getParentDeptId()) {
                    retMsg = CrmLocaleFactory.getResource("CMS0000309");// 不能选择当部门织为自己的上级部门！
                    retVal = "N";
                } else {
                    IVOCustValue custValue = new VOCustBean();
                    custValue.setBusinessId(CmConstants.BusiLogId.GROUP_ORG_OPER);
                    custValue.addCustOrganize(custOrganizeValue);
                    CmServiceFactory.getCustomerSV().saveCustomer(custValue);
                    id = String.valueOf(custOrganizeValue.getDeptId());
                    if (custOrganizeValue.isNew()) {
                        retMsg = CrmLocaleFactory.getResource("CMS0000307");// 集团部门增加成功！
                    } else if (custOrganizeValue.isModified()) {
                        retMsg = CrmLocaleFactory.getResource("CMS0000308");// 集团部门修改成功！
                    }
                }
            }
        } catch (Exception e) {
            retVal = "N";
            if (log.isErrorEnabled()) {
                log.error(CrmLocaleFactory.getResource("CMS0013029"), e);
            }

            retMsg = CrmLocaleFactory.getResource("CMS0013029",
                    (e.getCause() == null ? e.getMessage() : e.getCause().getMessage()));
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
            cp.put("id", id);
        }
        return cp;
    }

    public Map<String, Object> delGroupDeptOfMember(long deptId) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        cp.put("ifCanModifySegment", "Y");
        cp.put("retFlag", "Y");
        String hasMember = "FALSE";
        String retVal = "Y";
        String retMsg = "";
        try {
            // 判断该部门有用户
            DataContainer condition = new DataContainer();
            condition.set(IGroupMemberValue.S_DeptId, deptId);
            IGroupMemberValue[] groupMemberValues = CmServiceFactory.getCustomerSV().queryGroupMembers(condition, -1,
                    -1);
            if (groupMemberValues != null && groupMemberValues.length > 0) {
                hasMember = "TRUE";
                IVOCustValue custValue = new VOCustBean();
                custValue.setBusinessId(CmConstants.BusiLogId.GROUP_ORG_PHONE_ASSIGN);
                custValue.setUserObject(CmLnConstants.DealCustInfo.OP_STATE, CmLnConstants.DealCustInfo.OP_DEL);
                ICustRelationshipValue custRelValue = null;
                for (int i = 0; i < groupMemberValues.length; i++) {
                    custRelValue = new CustRelationshipBean();
                    groupMemberValues[i].delete();
                    custRelValue.copy(groupMemberValues[i]);
                    custRelValue.setRelationType(CmConstants.CustRelationShip.CUST_REL_TYPE_GROUP_MEMBER);
                    custValue.addCustRel(custRelValue);
                }
                ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
                customerSV.saveCustomer(custValue);
                // 成员[{0}]删除成功！
                retMsg = CrmLocaleFactory.getResource("CMS0013241");
            } else {
                retMsg = CrmLocaleFactory.getResource("CMS5000096");
            }
        } catch (Exception e) {
            log.info(e.getMessage(), e);

            cp.put("retFlag", "N");
            cp.put("retMsg", e.getMessage());
        } finally {
            cp.put("hasMember", hasMember);
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    public Map<String, Object> delGroupCustDept(long deptId) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = "";
        try {
            DataContainer conditionDC = new DataContainer();
            conditionDC.set(ICustOrganizeValue.S_DeptId, deptId);
            ICustOrganizeValue[] values = CmServiceFactory.getCustomerSV().queryCustOrganizes(conditionDC, -1, -1);
            if (values != null && values.length == 1) {
                values[0].delete();
                IVOCustValue custValue = new VOCustBean();
                custValue.setBusinessId(CmConstants.BusiLogId.GROUP_ORG_OPER);
                custValue.addCustOrganize(values[0]);
                CmServiceFactory.getCustomerSV().saveCustomer(custValue);
            }
            retMsg = CrmLocaleFactory.getResource("CMS0000161");
        } catch (Exception e) {
            retVal = "N";
            if (log.isErrorEnabled()) {
                log.error(CrmLocaleFactory.getResource("CMS0000162"), e);
            }
            retMsg = CrmLocaleFactory.getResource("CMS0000162",
                    (e.getCause() == null ? e.getMessage() : e.getCause().getMessage()));
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    public Map<String, Object> delGroupDeptNumMember(SelectedCustDeptMemberVO deleteVO) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = "";
        try {
            // 判断有没取到dcs
            if (deleteVO == null || deleteVO.getSelectMembers() == null) {
                retVal = "N";
                // 您已对数据进行过保存或从未对数据进行过修改，无需再次保存。
                retMsg = CrmLocaleFactory.getResource("CMS0000080");
            } else {
                List<CmCustMemberVO> list = deleteVO.getSelectMembers();
                IVOCustValue custValue = new VOCustBean();
                custValue.setBusinessId(CmConstants.BusiLogId.GROUP_ORG_PHONE_ASSIGN);
                if (CmCommonUtil.isNotEmptyObject(list)) {
                    custValue.setUserObject(CmLnConstants.DealCustInfo.OP_STATE, CmLnConstants.DealCustInfo.OP_DEL);
                    for (int i = 0; i < list.size(); i++) {
                        ICustRelationshipValue custRelValue = new CustRelationshipBean();
                        CmCustMemberVO delMemberVO = list.get(i);
                        BeanUtils.copyProperties(delMemberVO, custRelValue);
                        custRelValue.setStsToOld();
                        custRelValue.delete();
                        custRelValue.setRelationType(CmConstants.CustRelationShip.CUST_REL_TYPE_GROUP_MEMBER);
                        custValue.addCustRel(custRelValue);
                    }
                    ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
                    customerSV.saveCustomer(custValue);
                    // 成员[{0}]删除成功！
                    retMsg = CrmLocaleFactory.getResource("CMS0013241");
                } else {
                    retVal = "N";
                    // 没有获取到要删除的成员信息！
                    retMsg = CrmLocaleFactory.getResource("CMS5000096");
                }
            }

        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("Deleted failed", e);
            }
            retVal = "N";
            retMsg = e.getCause() == null ? e.getMessage() : e.getCause().getMessage();
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    public Map<String, Object> modifyGroupDeptNumMember(long deptId, SelectedCustDeptMemberVO selectVO)
            throws Exception {
        Map<String, Object> cp = new HashMap<>();
        cp.put("retFlag", "Y");
        cp.put("retMsg", "");
        try {
            // 判断有没取到dcs
            if (selectVO == null || selectVO.getSelectMembers() == null) {
                cp.put("retFlag", "N");
                // 您已对数据进行过保存或从未对数据进行过修改，无需再次保存。
                cp.put("retMsg", CrmLocaleFactory.getResource("CMS0000080"));
            } else {
                List<CmCustMemberVO> list = selectVO.getSelectMembers();

                if (CmCommonUtil.isNotEmptyObject(list)) {
                    IVOCustValue custValue = new VOCustBean();
                    custValue.setBusinessId(CmConstants.BusiLogId.GROUP_ORG_PHONE_ASSIGN);
                    for (int i = 0; i < list.size(); i++) {
                        ICustRelationshipValue custRelValue = new CustRelationshipBean();
                        CmCustMemberVO memberVO = list.get(i);
                        BeanUtils.copyProperties(memberVO, custRelValue);
                        custRelValue.setStsToOld();
                        custRelValue.setRelationType(CmConstants.CustRelationShip.CUST_REL_TYPE_GROUP_MEMBER);
                        custRelValue.setDeptId(DataType.getAsLong(deptId));
                        custValue.addCustRel(custRelValue);
                    }
                    CmServiceFactory.getCustomerSV().saveCustomer(custValue);
                }
            }
        } catch (Exception e) {
            log.info(e.getMessage(), e);

            cp.put("retFlag", "N");
            cp.put("retMsg", e.getMessage());
        }
        return cp;
    }

    /**
     * CVS-405新增Payer CPR变更处理
     *
     * @param custCertCode
     * @param partyId
     * @throws Exception
     */
    public Map validateModifyPayerCPR(String custCertCode,
            long partyId,
            String inputFirstName,
            String inputLastName,
            String inputBirthday) throws Exception {
        Map cp = new HashMap();
        cp.put("retFlag", "Y");
        try {
            ICmIndivCustomerSV indivService = (ICmIndivCustomerSV) ServiceFactory.getService(ICmIndivCustomerSV.class);
            DataContainer dc = indivService.dealModifyPayerCPR(partyId, custCertCode, inputFirstName, inputLastName,
                    inputBirthday);
            if (CmCommonUtil.isNotEmptyObject(dc)) {
                cp.put("firstName", dc.getAsString("firstName"));
                cp.put("lastName", dc.getAsString("lastName"));
                cp.put("birth", dc.getAsString("birth"));
                cp.put("protected", dc.getAsString("protected"));
                cp.put("matchFlag", dc.getAsString("matchFlag"));
                cp.put("addressId", dc.getAsString("addressId"));
                cp.put("addressDetail", dc.getAsString("addressDetail"));
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("validateModifyPayerCPR exception.", e);
            }
            cp.put("retFlag", "N");
            cp.put("retMsg", e.getMessage());
        }
        return cp;
    }

    public Map<String, Object> checkGroupDeptParent(long deptId) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = "";
        String hasChild = "FALSE";
        String hasMember = "FALSE";
        try {
            ICmDkCustomerSV customerSV = (ICmDkCustomerSV) ServiceFactory.getService(ICmDkCustomerSV.class);
            ICustOrganizeValue[] values = customerSV.queryCustOrganizesByParentId(deptId,
                    CmConstants.CustomerOrg.DEPARTMENT, -1, -1);
            if (CmCommonUtil.isNotEmptyObject(values)) { // 包含子节点信息
                hasChild = "TRUE";
            }

            // 判断该部门有用户
            DataContainer condition = new DataContainer();
            condition.set(IGroupMemberValue.S_DeptId, Long.valueOf(deptId));
            IGroupMemberValue[] groupMemberValues = CmServiceFactory.getCustomerSV().queryGroupMembers(condition, -1,
                    -1);
            if (groupMemberValues != null && groupMemberValues.length > 0) {
                hasMember = "TRUE";
            }
        } catch (Exception e) {
            retVal = "N";
            if (log.isErrorEnabled()) {
                log.error(CrmLocaleFactory.getResource("CMS0206009"), e);
            }
            retMsg = CrmLocaleFactory.getResource("CMS0206009",
                    (e.getCause() == null ? e.getMessage() : e.getCause().getMessage()));
        }
        cp.put("hasChild", hasChild);
        cp.put("hasMember", hasMember);
        cp.put("retVal", retVal);
        cp.put("retMsg", retMsg);
        return cp;
    }

    public String getTTDetailPageUrl() throws Exception {
        return CmStaticDataUtil.getCodeNameByCodeTypeAndCodeValue("CM_TT_DETAIL_URL", TenantIDFactory.getTenant());
    }

    public Map<String, Object> checkDeptName(long custId, String deptName) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = "";
        String hasName = "FLASE";
        try {

            DataContainer value = CmServiceFactory.getCustomerSV().queryCustOrganizeByCustIdDeptName(custId, deptName);
            if (value != null) {
                hasName = "TRUE"; // 同名了
            }
        } catch (Exception e) {
            retVal = "N";
            if (log.isErrorEnabled()) {
                log.error(CrmLocaleFactory.getResource("CMS0206009"), e);
            }
            retMsg = CrmLocaleFactory.getResource("CMS0206009",
                    (e.getCause() == null ? e.getMessage() : e.getCause().getMessage()));
        }
        cp.put("retVal", retVal);
        cp.put("retMsg", retMsg);
        cp.put("hasName", hasName);
        return cp;
    }

    public Map getCprEditConfigMapFromMatrix(long custId, long partyId, String guiType, String registerType)
            throws Exception {
        Map cp = new HashMap();
        cp.put("retFlag", "");
        try {
            if (StringUtils.isBlank(guiType) || StringUtils.isBlank(registerType)
                    || (CmConstants.cprGuiType.CUSTOMER_VIEW.equalsIgnoreCase(guiType) && custId <= 0)
                    || (!CmConstants.cprGuiType.CUSTOMER_VIEW.equalsIgnoreCase(guiType) && partyId <= 0)) {
                throw new Exception("Input parameter is invalid.");
            }
            ICmIndivCustomerSV indivService = (ICmIndivCustomerSV) ServiceFactory.getService(ICmIndivCustomerSV.class);
            Map<String, String> mapFromMatrix = indivService.getCprEditMapFromMatrix(custId, partyId, guiType,
                    registerType);
            cp.put(CmConstants.EDIT_CPR_NUMBER, mapFromMatrix.get(CmConstants.EDIT_CPR_NUMBER));
            cp.put(CmConstants.EDIT_CPR_PROFILE, mapFromMatrix.get(CmConstants.EDIT_CPR_PROFILE));
            cp.put("retFlag", CmConstants.YES);
        } catch (Exception e) {
            log.error("getCprEditConfigMapFromMatrix error.", e);
            cp.put("retFlag", CmConstants.NO);
            cp.put("retMsg", e.getMessage());
        }
        return cp;
    }

    public Map<String, Object> saveGroupDeptNumMember(long custId, long deptId, SelectCmInsCmrelVO selectVO)
            throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = "";
        try {
            // 判断有没取到dcs
            if (selectVO == null || selectVO.getSelect() == null) {
                retVal = "N";
                // 您已对数据进行过保存或从未对数据进行过修改，无需再次保存。
                retMsg = CrmLocaleFactory.getResource("CMS0000080");
            } else {
                IVOCustValue custValue = new VOCustBean();
                custValue.setBusinessId(CmConstants.BusiLogId.GROUP_ORG_PHONE_ASSIGN);

                List<CmInsCmrelVO> list = selectVO.getSelect();
                if (CmCommonUtil.isNotEmptyObject(list)) {
                    for (int i = 0; i < list.size(); i++) {
                        ICustRelationshipValue custRelValue = new CustRelationshipBean();
                        IBOCmGroupMemberValue cmGroupMemberValue = new BOCmGroupMemberBean();

                        CmInsCmrelVO cmInsCmrelVO = list.get(i);
                        // CmInsCmrelVO to BOCmGroupMemberBean
                        BeanUtils.copyProperties(cmInsCmrelVO, cmGroupMemberValue);
                        cmGroupMemberValue.setStsToOld();
                        cmGroupMemberValue.setCustId(custId);
                        cmGroupMemberValue.setDeptId(deptId);
                        cmGroupMemberValue.setMemberType(CmLnConstants.MemberStatus.NUMBER_MEMBER);
                        cmGroupMemberValue.setRegionId(CmCommonUtil.getDefaultRegionId());
                        cmGroupMemberValue.setState(CmConstants.RecordState.USE);
                        // BOCmGroupMemberBean to CustRelationshipBean
                        custRelValue.copy(cmGroupMemberValue);
                        custRelValue.setRelationType(CmConstants.CustRelationShip.CUST_REL_TYPE_GROUP_MEMBER);
                        custRelValue.setStsToNew();
                        custValue.addCustRel(custRelValue);
                    }
                }
                CmServiceFactory.getCustomerSV().saveCustomer(custValue);
                retMsg = CrmLocaleFactory.getResource("CMS0088085");
            }
        } catch (Exception e) {
            retVal = "N";
            // 失败
            if (log.isErrorEnabled()) {
                log.error(CrmLocaleFactory.getResource("CMS0000163"), e);
            }
            retMsg = e.getCause() == null ? e.getMessage() : e.getCause().getMessage();
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    public Map getBillDayAndBillCycleDisplay(long custId, long agrId) throws Exception {
        Map cp = new HashMap();
        String retVal = "Y";
        String retMsg = "";
        String billCycle = "";
        String agrCode = "";
        String paymentTerms = "";
        try {
            // 获取custId
            IAgreementFSV agressSV = (IAgreementFSV) ServiceFactory.getService(IAgreementFSV.class);
            DataContainer dc = agressSV.queryAgreementBillCycle(agrId, null, custId);
            if (CmCommonUtil.isEmptyObj(dc)) {
                throw new Exception("error");
            } else {
                billCycle = dc.getAsString("BILL_CYCLE");
                agrCode = dc.getAsString("AGREEMENT_CODE");
                paymentTerms = dc.getAsString("PAYMENT_TERMS");
            }
        } catch (Exception e) {
            retVal = "N";
            retMsg = CrmLocaleFactory.getResource("CMS0031042", "Group Accounts",
                    e.getCause() == null ? e.getMessage() : e.getCause().getMessage());
            if (log.isErrorEnabled()) {
                log.error(retMsg, e);
            }

        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
            cp.put("billCycle", billCycle);
            cp.put("agrCode", agrCode);
            cp.put("paymentTerms", paymentTerms);
        }
        return cp;
    }

    public CustIndivBean queryIndivCust(long custId, String opCode) throws Exception {
        CustIndivBean bean = null;
        ICmInterfaceSV sv = (ICmInterfaceSV) ServiceFactory.getService(ICmInterfaceSV.class);
        ICustomerValue custValue = sv.queryCustomerByCustId(custId, "");
        if (null != custValue) {
            bean = new CustIndivBean();
            bean.setCustValueLevel(String.valueOf(custValue.getCustLevel())); // 客户价值等级
            bean.setCustIntegrityLevel(""); // 客户诚信等级
            bean.setCustSensitiveLevel(""); // 客户资产敏感度等级
            bean.setCustLostLevel(""); // 客户流失风险等级
            bean.setCustId(String.valueOf(custValue.getCustId()));
            bean.setCustomerName(custValue.getCustName());
            bean.setGender(String.valueOf(custValue.getGender()));
            bean.setCustType(String.valueOf(custValue.getCustType()));
            bean.setCustCertType(String.valueOf(custValue.getCustCertType()));
            bean.setCustCertCode(custValue.getCustCertCode());
            // bean.setContactPerson(custValue.getCustomer().getContName());
            bean.setCustStatus(String.valueOf(custValue.getCustStatus()));
            bean.setImageSrc(""); // 客户头像地址

            com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICmCustomerSV csv = (com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICmCustomerSV) ServiceFactory
                    .getService(com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICmCustomerSV.class);
            IBOCmCustContactMediumValue[] values = csv.queryCustContactMediumByCustId(custId);
            if (null != values) {
                for (int i = 0; i < values.length; i++) {
                    if (values[i].getContMedTypeId() == CmConstants.AddressId.EMAIL
                            && StringUtils.isBlank(bean.getEmail())) {
                        bean.setEmail(values[i].getEmailAddress()); // 联系邮箱
                    } else if (values[i].getContMedTypeId() == CmConstants.AddressId.legalAddress
                            && StringUtils.isBlank(bean.getCustAddress())) {
                        bean.setCustAddress(values[i].getAddressDetail());
                        bean.setCustCertAddress(values[i].getAddressDetail());
                    } else if (values[i].getContMedTypeId() == CmConstants.AddressId.CONTACT_NUMBER
                            && StringUtils.isBlank(bean.getContactNumber())) {
                        bean.setContactNumber(values[i].getContNumber());
                    }
                }
            }
            bean.setPostcode(custValue.getPostCode());
            bean.setCustLanague(custValue.getCustLanguage());
            bean.setBirthDate(custValue.getBirthday());
            bean.setCustAgents(custValue.getRemarks());
            bean.setCustPassword(custValue.getCustPassword());
        }

        return bean;
    }

    public CustGroupBean queryGroupCust(long custId, String opCode) throws Exception {
        ICmBi2OneframeSV iCmBi2CsSV = (ICmBi2OneframeSV) ServiceFactory.getService(ICmBi2OneframeSV.class);
        CustGroupBean returnBean = iCmBi2CsSV.queryGroupCust(custId, "");
        if (null != returnBean) {
            ICrmFSV crmfsv = (ICrmFSV) ServiceFactory.getService(ICrmFSV.class);
            Map countMap = crmfsv.getCompanySummaryInfo(String.valueOf(custId));
            StringBuffer sb = new StringBuffer();
            if (countMap != null) {
                sb.append("Subscription :(")
                        .append(countMap.get("cntSubscription") == null ? 0 : countMap.get("cntSubscription"))
                        .append(") ; Broadband :(").append(countMap.get("cntDSL") == null ? 0 : countMap.get("cntDSL"))
                        .append(") ; PSTN :(").append(countMap.get("cntPSTN") == null ? 0 : countMap.get("cntPSTN"))
                        .append(") ; Voice Sims :(")
                        .append(countMap.get("cntVoiceSimCard") == null ? 0 : countMap.get("cntVoiceSimCard"))
                        .append(") ; Data Sims :(")
                        .append(countMap.get("cntDataSimCard") == null ? 0 : countMap.get("cntDataSimCard"))
                        .append(")");
            }

            if (countMap.get("NoUsage") != null) {
                sb.append("; No Usage :(").append(countMap.get("NoUsage")).append(") ; Partial Usage :(")
                        .append(countMap.get("PartialUsage")).append(") ; Completed Usage :(")
                        .append(countMap.get("CompletedUsage")).append(")");
            }

            returnBean.setSubcriptionInfo(sb.toString());
        }

        return returnBean;
    }

    public Map queryCPR(String cpr) {
        Map cp = new HashMap();
        cp.put("retFlag", "Y");
        cp.put("retMsg", CrmLocaleFactory.getResource("CMS0001263"));
        try {
            ICmIndivCustomerSV indivService = (ICmIndivCustomerSV) ServiceFactory.getService(ICmIndivCustomerSV.class);
            // 送CPR进行校验
            Map params = new HashMap();
            params.put("PNR", cpr);
            Map cprData = indivService.validateCPR(params);
            String FEJLNR = (String) cprData.get("FEJLNR");
            if (!"00".equals(FEJLNR)) {
                // CPR在CPR系统中不存在。
                ExceptionUtil.throwBusinessException("CMS9988772");
            }

        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("queryCPR exception.", e);
            }
            cp.put("retFlag", "N");
            cp.put("retMsg", e.getMessage());
        }
        return cp;
    }

    public Map<String, Object> queryCustCertCodeByCustid(long custId) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y";
        String custCertCode = "";
        try {
            ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            IBOCmIndivCustomerValue customerValue = customerSV.queryIndivCustomerInfo(custId);
            custCertCode = String.valueOf(customerValue.getCustCertCode());
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("queryCustCertCodeByCustid exception.", e);
            }
            retVal = "N";
        }
        cp.put("retVal", retVal);
        cp.put("custCertCode", custCertCode);
        return cp;
    }

    public Map<String, Object> validateCPRNum(String needCheck, String custId, String cprNum) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        cp.put("flag", "");
        String msg = "";
        // 加一个返回信息字段给集团成员cpr校验
        String grpMemberMsg = "";
        // 判断如果是Y则是受保护地址，如果是N则不是受保护地址
        cp.put("retFlag", "Y");
        cp.put("firstName", "");
        cp.put("lastName", "");
        cp.put("birth", "");
        cp.put("isDead", "");
        try {
            ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            ICmIndivCustomerSV indivService = (ICmIndivCustomerSV) ServiceFactory.getService(ICmIndivCustomerSV.class);
            IBOCmIndivCustomerValue[] values = service.queryCustomerByCPR(cprNum);
            if (null != values && values.length > 0) {
                // CPR在CRM进行验证客户是否存在，存在则不进行创建。
                grpMemberMsg = CrmLocaleFactory.getResource("CMS9988856");
                ExceptionUtil.throwBusinessException("CMS9988771");
            }
            Map params = new HashMap();
            params.put("PNR", cprNum);
            // 送CPR进行校验
            Map cprData = indivService.validateCPR(params);
            String FEJLNR = (String) cprData.get("FEJLNR");
            if (!"00".equals(FEJLNR)) {
                // CPR在CPR系统中不存在。
                ExceptionUtil.throwBusinessException("CMS9988772");
            }
            Map data1 = (Map) cprData.get("DATA");
            Map data2 = (Map) data1.get("INFO");
            Map currentData = (Map) data2.get("Current_data");
            // 是否受保护
            String isProtected = (String) currentData.get("NVNADRBESKHAENSTART");
            // isProtected="1231234";
            String var = "[0]*";
            if (!isProtected.matches(var)) {
                // 受保护
                cp.put("flag", "Y");
                cp.put("birth", (String) currentData.get("FOEDDTO"));
                ExceptionUtil.throwBusinessException("CMS9988770");
            } else {
                // 从CPR返回的客户名称
                String firstName = (String) currentData.get("FORNVN");
                String lastName = (String) currentData.get("EFTERNVN");
                // 从CPR返回的生日
                String birthDay = (String) currentData.get("FOEDDTO");
                if (StringUtils.equals(needCheck, CmConstants.YES)) {
                    ICustomerValue custValue = null;
                    try {
                        // queryCustomerByCustId没查到客户会抛异常，这里的逻辑是查到客户(已有客户开户场景)才进行判断，没查到客户是新客户开户场景则不进行校验
                        custValue = service.queryCustomerByCustId(Long.parseLong(custId));
                    } catch (Exception ignored) {

                    }
                    if (CmCommonUtil.isNotEmptyObject(custValue)
                            && !StringUtils.equals(custValue.getFirstName(), "$$$$")
                            && !StringUtils.equals(custValue.getLastName(), "$$$$")
                            && custValue.getBirthday() != null) {
                        // 已存在的客户添加CPR NUMBER比对名称生日地址
                        boolean matchFlag = CmCommonUtil.checkNameAndBirthdayMatch(firstName, lastName, birthDay,
                                custValue, "", "", "", "");
                        // 有超级权限的用户允许修改
                        if (!matchFlag) {
                            cp.put("matchFlag", CmConstants.NO);
                            if (!CmCommonUtil.judgeCprProfileSec()) {
                                ExceptionUtil.throwBusinessException("CMS9988888");
                            }
                        }
                    }
                }
                // 从CPR返回的地址
                String houseNum = ((String) currentData.get("HUSNR")).trim();
                String floor = (String) currentData.get("ETAGE");
                String sideOrApartNum = (String) currentData.get("SIDEDOER");
                String buildNum = (String) currentData.get("SIDEDOER");
                String streetName = (String) currentData.get("VEJADRNVN");
                String city = (String) currentData.get("POSTDISTTXT");
                String smallCity = (String) currentData.get("BYNVN");
                String postCode = (String) currentData.get("POSTNR");
                String coName = (String) currentData.get("CONVN");
                String munici = (String) currentData.get("KOMKOD");
                String personStatus = (String) currentData.get("STATUS");
                if ("80".equals(personStatus)) {
                    // 客户移民
                    cp.put("flag", "Y");
                    cp.put("birth", birthDay);
                    ExceptionUtil.throwBusinessException("CMS9988946");
                }
                if ("70".equals(personStatus)) {
                    // 客户消失
                    cp.put("flag", "Y");
                    cp.put("birth", birthDay);
                    ExceptionUtil.throwBusinessException("CMS9988947");
                }
                if ("90".equals(personStatus)) {
                    // 客户死亡
                    cp.put("flag", "N");
                    cp.put("isDead", "Y");
                    ExceptionUtil.throwBusinessException("CMS9999040");
                }
                // 不受保护
                cp.put("firstName", CmCommonUtil.capitalizeFirstLetter(firstName));
                cp.put("lastName", CmCommonUtil.capitalizeFirstLetter(lastName));
                cp.put("birth", birthDay);
                cp.put("flag", "N");
                address address = new address();
                address.setAddressType(CmConstants.Address.ADDRESSTYPE);
                address.setDistrictId(CmConstants.Address.DISTRICTID);
                if (StringUtils.isNotBlank(houseNum)) {
                    if (Character.isLetter(houseNum.charAt(houseNum.length() - 1))) {
                        address.setHouseNumber(
                                String.valueOf(Integer.valueOf(houseNum.substring(0, houseNum.length() - 1).trim())));
                        address.setHouseLetter(String.valueOf(houseNum.charAt(houseNum.length() - 1)));
                    } else {
                        address.setHouseNumber(String.valueOf(Integer.valueOf(houseNum.trim())));
                        address.setHouseLetter("");
                    }
                }
                if (StringUtils.isNotBlank(floor)) {
                    address.setFloor(floor.trim());
                } else {
                    address.setFloor("");
                }
                if (StringUtils.isNotBlank(streetName)) {
                    address.setStreetName(streetName.trim());
                } else {
                    address.setStreetName("");
                }
                if (StringUtils.isNotBlank(city)) {
                    address.setCity(city.trim());
                } else {
                    address.setCity("");
                }
                if (StringUtils.isNotBlank(smallCity)) {
                    address.setCounty(smallCity.trim());
                } else {
                    address.setCounty("");
                }
                // 根据特殊规则判断sidedoer的走向
                if (StringUtils.isNotBlank(sideOrApartNum)) {
                    if (CmCommonUtil.validateSidedoer(sideOrApartNum)) {
                        address.setApartment(sideOrApartNum.trim());
                        address.setDoorNumber("");
                    } else {
                        address.setDoorNumber(sideOrApartNum.trim());
                        address.setApartment("");
                    }
                } else {
                    address.setApartment("");
                    address.setDoorNumber("");
                }
                if (StringUtils.isNotBlank(postCode)) {
                    address.setZipcode(postCode);
                } else {
                    address.setZipcode("");
                }
                if (StringUtils.isNotBlank(munici)) {
                    address.setMunicipality(munici);
                } else {
                    address.setMunicipality("");
                }
                address.setAddrDesc("");
                // 地址层级中增加CO_NAME
                if (StringUtils.isNotBlank(coName)) {
                    address.setCoName(coName);
                } else {
                    address.setCoName("");
                }

                address.setMainDoor("");
                IAddressSV addressSV = (IAddressSV) ServiceFactory.getService(IAddressSV.class);
                long addressId = addressSV.saveAddress(address);
                cp.put("addressId", String.valueOf(addressId));
                // 保存地址
                ICmIndivCustomerSV custSV = (ICmIndivCustomerSV) ServiceFactory.getService(ICmIndivCustomerSV.class);
                custSV.saveCustAddress(DataType.getAsLong(custId), addressId);
            }
        } catch (Exception e) {
            log.info(e.getMessage(), e);

            msg = e.getMessage();
            cp.put("retFlag", "N");
        }
        cp.put("msg", msg);
        // 给集团成员CPR校验使用
        cp.put("grpMemberMsg", grpMemberMsg);
        return cp;
    }

    public Map queryIndivCont(String billId) throws Exception {
        Map cp = new HashMap();
        String retVal = "Y";
        String retMsg = "";
        String userId = "";
        String barnd = "";
        String regionId = "";
        String partyId = "";
        try {
            CenterFactory.setCenterInfoByTypeAndValue(CmConstants.CenterType.BILL_ID, billId);
            ICmTeamInvokeSV teamInvokeSV = (ICmTeamInvokeSV) ServiceFactory.getService(ICmTeamInvokeSV.class);
            IQUserBaseInfoValue userBaseInfo = teamInvokeSV.getUserBaseInfoByBillId(billId);
            if (userBaseInfo != null) {
                long custId = userBaseInfo.getCustId();
                if (CmCommonUtil.getCustType(custId) == CmConstants.CustomerType.GROUP) {
                    // 集团客户不能作为成员添加！
                    ExceptionUtil.throwBusinessException("CMS5000099");
                }
                ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
                ICustomerValue customer = customerSV.queryCustomerByCustId(custId);
                partyId = String.valueOf(customer.getPartyId());
                retMsg = String.valueOf(custId);
                userId = String.valueOf(userBaseInfo.getUserId());
                barnd = userBaseInfo.getBrandIdDesc();
                regionId = userBaseInfo.getRegionId();
            } else {
                retVal = "N";
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("queryIndivCont exception.", e);
            }
            retVal = "N";
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
            cp.put("userId", userId);
            cp.put("barnd", barnd);
            cp.put("regionId", regionId);
            cp.put("partyId", partyId);
        }
        return cp;
    }

    public Map<String, Object> validateModifyCPR(String custCertCode, String custId, String inputFirstName,
            String inputLastName, String inputBirthday, String saveScene) throws Exception {
        Map<String, Object> cp = new HashMap();
        cp.put("retFlag", "Y");
        try {
            ICmIndivCustomerSV indivService = (ICmIndivCustomerSV) ServiceFactory.getService(ICmIndivCustomerSV.class);
            // Y标识需要送CPR
            DataContainer dc = indivService.dealModifyCPR(custId, custCertCode, CmConstants.YES, inputFirstName,
                    inputLastName, inputBirthday, saveScene);
            if (CmCommonUtil.isNotEmptyObject(dc)) {
                cp.put("firstName", dc.getAsString("firstName"));
                cp.put("lastName", dc.getAsString("lastName"));
                cp.put("birth", dc.getAsString("birth"));
                cp.put("protected", dc.getAsString("protected"));
                cp.put("matchFlag", dc.getAsString("matchFlag"));
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("validateModifyCPR exception.", e);
            }

            cp.put("retFlag", "N");
            cp.put("retMsg", e.getMessage());
        }
        return cp;
    }
    public Map<String, Object> saveGroupContact(MapList contractInfo, String  action) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = "";
        try {

            DataContainer[] contractdc = DataContainerUtils.wrap1(contractInfo);
            DataContainerList contractInfoDCList = new DataContainerList(new String[]{},contractdc);
            DataContainerList[] dcLists;
            dcLists = new DataContainerList[1];
            dcLists[0]=contractInfoDCList;
            // 判断有没取到dcs
            if (dcLists == null || dcLists.length < 1) {
                retVal = "N";
                // 您已对数据进行过保存或从未对数据进行过修改，无需再次保存。
                retMsg = CrmLocaleFactory.getResource("CMS0000080");
            } else {
                DataContainerInterface[] dcs = dcLists[0].getAllDataContainerInterface();
                IVOCustValue custValue = new VOCustBean();
                IContactValue contactValue = null;
                // 联系人主表信息
                // 联系人辽宁扩展信息
                if (StringUtils.equalsIgnoreCase("add",action)) {
                    custValue.setUserObject(CmLnConstants.DealCustInfo.OP_STATE, CmLnConstants.DealCustInfo.OP_NEW);
                } else if (StringUtils.equalsIgnoreCase("mod",action)) {
                    custValue.setUserObject(CmLnConstants.DealCustInfo.OP_STATE, CmLnConstants.DealCustInfo.OP_MODIFY);
                } else {
                    custValue.setUserObject(CmLnConstants.DealCustInfo.OP_STATE, CmLnConstants.DealCustInfo.OP_DEL);
                    custValue.setBusinessId(CmConstants.BusiLogId.GROUP_CONTACT_PERSON_DELETE);
                }
                // 给客户对象赋值
                for (int i = 0; i < dcs.length; i++) {
                    contactValue = new ContactBean();
                    contactValue.copy(dcs[i]);
                    if(StringUtils.equalsIgnoreCase("mod",action)){
                        contactValue.setStsToOld();
                    }else if(StringUtils.equalsIgnoreCase("add",action)){
                        contactValue.setStsToNew();
                    }else {
                        contactValue.delete();
                    }
                    custValue.addContact(contactValue);
                }
                CmServiceFactory.getContactSV().saveCustContact(custValue);
                //删除联系人时设置联系人角色失效
                if (StringUtils.equalsIgnoreCase("del",action)) {
                    ICmGroupContractSV groupContSv = (ICmGroupContractSV) ServiceFactory.getService(ICmGroupContractSV.class);
                    ICmContactSV indivContSv = (ICmContactSV) ServiceFactory.getService(ICmContactSV.class);
                    ICmPartyRoleSV partyRoleSv = (ICmPartyRoleSV) ServiceFactory.getService(ICmPartyRoleSV.class);
                    for (int j = 0; j < dcs.length; j++) {

                        IBOCmGroupContactValue[] groupContValue = groupContSv.queryCustContInfo(dcs[j].getAsLong("PARTY_ID"), -1, -1, new int[]{});
                        IBOCmIndivContactValue[] indivContValue = indivContSv.queryIndivContactByIdAndType(dcs[j].getAsLong("CONT_ID"), -1);
                        if((groupContValue == null || groupContValue.length < 1) && (indivContValue == null || indivContValue.length < 1)){
                            IBOCmPartyRoleValue[] partyRoleValue = partyRoleSv.queryPartyRole(dcs[j].getAsLong("PARTY_ID"), CmConstants.PartyRoleType.CONTACT, -1, -1);
                            if (partyRoleValue != null && partyRoleValue.length > 0) {
                                for(int i = 0; i < partyRoleValue.length; i++){
                                    ICmPartyRoleSV roleService = (ICmPartyRoleSV) ServiceFactory.getService(ICmPartyRoleSV.class);
                                    BOCmPartyRoleBean roleBean = new BOCmPartyRoleBean();
                                    roleBean.copy(partyRoleValue[i]);
                                    roleBean.setState(CmConstants.RecordState.ERASE);
                                    roleBean.setRoleStatus(CmConstants.roleStatus.IN_ACTIVE);
                                    roleBean.delete();
                                    roleService.savePartyRole(roleBean);
                                }
                            }
                        }
                    }
                }

                // 集团联系人修改成功
                retMsg = CrmLocaleFactory.getResource("CMS0076045");
            }
        } catch (Exception e) {
            retVal = "N";
            // 集团联系人新增失败
            if (log.isErrorEnabled()) {
                log.error(CrmLocaleFactory.getResource("CMS0206009"), e);
            }
            retMsg = CrmLocaleFactory.getResource("CMS0206009", (e.getCause() == null ? e.getMessage() : e.getCause().getMessage()));
        }
        cp.put("retVal", retVal);
        cp.put("retMsg", retMsg);
        return cp;
    }
    public Map<String, Object> deleteContactContMediumRela(long relaId, long regionId) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = "";
        try {
            IBOCmContactMediumRelValue contactMediumValue = new BOCmContactMediumRelBean();
            contactMediumValue.initProperty(IBOCmContactMediumRelValue.S_RelaId, relaId);
            contactMediumValue.initProperty(IBOCmContactMediumRelValue.S_RegionId, regionId);
            contactMediumValue.delete();
            BOCmContactMediumRelBean bean = new BOCmContactMediumRelBean();
            bean.copy(contactMediumValue);
            ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            customerSV.saveContactMediumRel(new BOCmContactMediumRelBean[] { bean });
            cp.put("retFlag", "Y");
            // 删除地址成功。
            cp.put("retVal", CrmLocaleFactory.getResource("CMS0013241"));
        } catch (Exception e) {
            retVal = "N";
            if (log.isErrorEnabled()) {
                log.error(CrmLocaleFactory.getResource("CMS0013242"), e);
            }
            retMsg = CrmLocaleFactory.getResource("CMS0013242", (e.getCause() == null ? e.getMessage() : e.getCause().getMessage()));
        }
        cp.put("retVal", retVal);
        cp.put("retMsg", retMsg);
        return cp;
    }

    public long queryCustOrganizeDeptIdByRelCustId(long relCustId)throws Exception{
        if(relCustId<=0){
            return 0;
        }
        ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        ICustOrganizeValue custOrgValue = customerSV.queryCustOrganizeByRelCustId(relCustId);
        if(custOrgValue!=null){
            return custOrgValue.getDeptId();
        }
        return 0;
    }
    public Map<String, Object> getHierarchyStatus(long custId) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        cp.put("retFlag", "Y");
        cp.put("status", "");
        try {
            ICmCommonSV commonSV = (ICmCommonSV) ServiceFactory.getService(ICmCommonSV.class);
            if (commonSV.queryHierarchyStatus(custId, CmConstants.CustomerStatus.GROUP_ACTIVE)) {
                // 在网
                cp.put("status", StaticDataUtil.getStaticData("CM_CUST_STATUS_360_3", String.valueOf(CmConstants.CustomerStatus.GROUP_ACTIVE)).getCodeName());
            } else if (commonSV.queryHierarchyStatus(custId, CmConstants.CustomerStatus.GROUP_PAUSE)) {
                // 暂停
                cp.put("status", StaticDataUtil.getStaticData("CM_CUST_STATUS_360_3", String.valueOf(CmConstants.CustomerStatus.GROUP_PAUSE)).getCodeName());
            } else if (commonSV.queryHierarchyStatus(custId, CmConstants.CustomerStatus.GROUP_INACTIVE)) {
                // 离网
                cp.put("status", StaticDataUtil.getStaticData("CM_CUST_STATUS_360_3", String.valueOf(CmConstants.CustomerStatus.GROUP_INACTIVE)).getCodeName());
            } else if (commonSV.queryHierarchyStatus(custId, CmConstants.CustomerStatus.GROUP_TERMINATED)) {
                // 注销
                cp.put("status", StaticDataUtil.getStaticData("CM_CUST_STATUS_360_3", String.valueOf(CmConstants.CustomerStatus.GROUP_TERMINATED)).getCodeName());
            } else if (commonSV.queryHierarchyStatus(custId, CmConstants.CustomerStatus.GROUP_POTENTIAL)) {
                // 潜在
                cp.put("status", StaticDataUtil.getStaticData("CM_CUST_STATUS_360_3", String.valueOf(CmConstants.CustomerStatus.GROUP_POTENTIAL)).getCodeName());
            } else {
                cp.put("status", "N");
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("getHierarchyStatus exception.", e);
            }
            cp.put("retFlag", "N");
            cp.put("retMsg", e.getMessage());
        }
        return cp;
    }
    public Map<String, Object> checkGroupOrgNode(long Id,long parentId, String type) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = "";
        try {
            if (Id > 0 && parentId > 0) {
                if ("DEPT".equals(type)) {
                    queryGroupOrgNode(Id, parentId);
                }
                if ("CUST".equals(type)) {
                    queryGroupOrgParent(Id, parentId);
                }
            }
        } catch (Exception e) {
            retVal = "N";
            retMsg = e.getCause() == null ? e.getMessage() : e.getCause().getMessage();
            if (log.isErrorEnabled()) {
                log.error(retMsg, e);
            }
        }
        cp.put("retVal", retVal);
        cp.put("retMsg", retMsg);
        return cp;
    }
    public static void queryGroupOrgNode(long Id, long parentId) throws Exception {
        // 递归判断
        ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        ICustOrganizeValue[] custOrganizeValues = customerSV.queryCustOrganizesByParentId(Id, -1, -1);
        if (custOrganizeValues != null && custOrganizeValues.length > 0) {
            for (int i = 0; i < custOrganizeValues.length; i++) {
                if (custOrganizeValues[i].getDeptId() == parentId) {
                    ExceptionUtil.throwBusinessException("CMS0011891");
                }
                queryGroupOrgNode(custOrganizeValues[i].getDeptId(), parentId);
            }
        }
    }

    public static void queryGroupOrgParent(long Id, long parentId) throws Exception {
        ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        ICustOrganizeValue custOrganizeValue = customerSV.queryCustOrganizeByIdDK(Id);
        if (custOrganizeValue != null) {
            if (custOrganizeValue.getParentDeptId() == parentId) {
                ExceptionUtil.throwBusinessException("CMS0011892");
            }
            queryGroupOrgParent(custOrganizeValue.getParentDeptId(), parentId);
        }
    }

    public Map validateCustAddress(String custId,String addressType) throws Exception {
        Map cp = new HashMap();
        cp.put("retFlag", "Y");
        cp.put("retMsg", "");
        // 判断一下是否校验ADDRESS
        IBOBsStaticDataValue[] values1 = StaticDataUtil.getStaticData("CM_VALIDATE_ADDRESS");
        if (null != values1 && values1.length > 0) {
            if ("2".equals(values1[0].getCodeValue())) {
                cp.put("retFlag", "N");
                return cp;
            }
        }

        try {
            ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            IBOCmCustContactMediumValue[] values = service.queryContactMediumByCondition(Long.valueOf(custId), Integer.valueOf(addressType));
            if (null != values && values.length > 0) {
                cp.put("retFlag", "N");
                cp.put("retMsg", String.valueOf(values[0].getAddressId()));
            }
        } catch (Exception e) {
            log.info(e.getMessage(), e);

            cp.put("retFlag", "N");
        }
        return cp;
    }

    public Map validateCustAndAddress(String custName,String initCustId,String birthday) throws Exception {
        Map cp = new HashMap();
        cp.put("retFlag", "Y");
        try {
            ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            IBOCmCustContactMediumValue[] values = service.queryContactMediumByCondition(Long.parseLong(initCustId), CmConstants.AddressId.legalAddress);
            if (null != values && values.length > 0) {
                long addressId = values[0].getAddressId();
                IBOCmIndivCustomerValue[] values1 = service.queryCmCustByCustInfoAndAddress(custName, birthday, addressId);
                if (null != values1 && values1.length > 0) {
                    if (Long.parseLong(initCustId) != values1[0].getCustId()) {
                        cp.put("retFlag", "N");
                    }
                } else {
                    // 根据地址id没匹配到cust再根据地址详情加强校验
                    IBOCmIndivCustomerValue[] newIndivValues = service.queryCmCustByCustInfoByAddressDetail(custName, birthday, values[0].getAddressDetail());
                    if (CmCommonUtil.isNotEmptyObject(newIndivValues) && Long.parseLong(initCustId) != newIndivValues[0].getCustId()) {
                        cp.put("retFlag", "N");
                    }
                }
            }
        } catch (Exception e) {
            log.info(e.getMessage(), e);
        }
        return cp;
    }

    public Map validateContact(long custId,String firstName,String lastName,String birthday) throws Exception {
        Map cp = new HashMap();
        cp.put("retFlag", "Y");
        try {
            ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            ICmCommonSV commonSV = (ICmCommonSV) ServiceFactory.getService(ICmCommonSV.class);
            IBOCmCustContactMediumValue[] values = service.queryContactMediumByCondition(custId, CmConstants.AddressId.EMAIL);
            IBOCmCustContactMediumValue[] contactvalues = service.queryContactMediumByCondition(custId, CmConstants.AddressId.CONTACT_NUMBER);
            if (CmCommonUtil.isEmptyObject(values) && CmCommonUtil.isEmptyObject(contactvalues)) {
                ExceptionUtil.throwBusinessException("CMS9988940");
            }
            // 邮箱与电话不能重复
            if (CmCommonUtil.isNotEmptyObject(values)) {
                // 检验邮箱
                for (int i = 0; i < values.length; i++) {
                    IBOCmCustContactMediumValue[] emails = commonSV.queryMediumByContact(values[i].getEmailAddress(), null);
                    if (emails.length > 1) {
                        ExceptionUtil.throwBusinessException("CMS9988948");
                    }
                }
            }
            if (CmCommonUtil.isNotEmptyObject(contactvalues)) {
                // 检验联系电话
                for (int i = 0; i < contactvalues.length; i++) {
                    IBOCmCustContactMediumValue[] contNums = commonSV.queryMediumByContact(null, contactvalues[i].getContNumber());
                    if (contNums.length > 1) {
                        ExceptionUtil.throwBusinessException("CMS9988949");
                    }
                }
            }
            // 用客户的名称生日与地址验重
            if (StringUtils.isNotBlank(firstName) && StringUtils.isNotBlank(lastName) && StringUtils.isNotBlank(birthday)) {
                IBOCmCustContactMediumValue value = service.queryCustContactMediumByCustIdAndType(custId, String.valueOf(CmConstants.AddressId.legalAddress));
                if (CmCommonUtil.isNotEmptyObject(value)) {
                    long addressId = value.getAddressId();
                    String addressDetail = value.getAddressDetail();
                    String custName = firstName + " " + lastName;
                    CmCommonUtil.judgeDuplicateCustomer(custId, birthday, addressId, addressDetail, custName);
                }
            }
        } catch (Exception e) {
            log.info(e.getMessage(), e);

            cp.put("retFlag", "N");
            cp.put("retMsg", e.getMessage());
        }
        return cp;
    }

    public ICustomerValue[] queryCustomersAndLog(Map info, int startNum, int endNum) throws Exception {
        String xmlCondition = ParamUtil.buildQueryXml("com.ai.appframe2.bo.DataContainer",info);
        ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        return service.queryCustomersAndLog(xmlCondition, startNum, endNum);
    }

    public IBOInterCallLogValue[] queryCprLogInfo(Map info, int startIndex, int endIndex)throws Exception{
        String xmlCondition = ParamUtil.buildQueryXml("com.ai.appframe2.bo.DataContainer",info);
        ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        return service.queryCprLogInfo(xmlCondition, startIndex, endIndex);
    }

    public int queryCprLogInfoCount(Map info)throws Exception{
        String xmlCondition = ParamUtil.buildQueryXml("com.ai.appframe2.bo.DataContainer",info);
        ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        return service.queryCprLogInfoCount(xmlCondition);
    }
    public DataContainer[] queryCustAcctRels(long acctId, long custId, String beanClass, int startIndex, int endIndex) throws Exception{
         Class beaClass=Class.forName(beanClass);
         ICmAccountSV accountSV = (ICmAccountSV) ServiceFactory.getService(ICmAccountSV.class);
        return accountSV.queryCustAcctRels(acctId, custId,beaClass, startIndex, endIndex);
    }
    public Map getCustImageHtml(long custId,String realCustType, String filePath, String fileName,  String context) throws Exception {
        Map cp = new HashMap();
        String retCode = "Y";
        String retMsg = "";
        String htmlCode = "";

        try {
            String gender = "1";
            if ("1".equalsIgnoreCase(realCustType)) {
                IRemoteTransferSV remoteSV = (IRemoteTransferSV)ServiceFactory.getService(IRemoteTransferSV.class);
                CustIndivBean custIndivBean = remoteSV.remote_queryIndivCust(custId, SessionManager.getUser().getCode());
                if (custIndivBean != null) {
                    gender = custIndivBean.getGender();
                }
            }

            StringBuilder imageBuilder = new StringBuilder();
            imageBuilder.append("<img src='").append(context);
            if ("1".equals(realCustType)) {
                imageBuilder.append("/business/com.ai.oneframe.common.AttachAction?action=doDownload&TYPE=.jpg&FTP_PATH_CODE=OF2_PHOTO_FOLDER_PATH&FILE_NAME=").append(fileName).append(".jpg'");
                if ("1".equals(gender)) {
                    imageBuilder.append(" onerror=\"src='").append(context).append("/webframe/images/").append("touxiang.gif'\" style=\"height: 80px;width:80px;\" ");
                } else {
                    imageBuilder.append(" onerror=\"src='").append(context).append("/webframe/images/").append("female.gif'\" style=\"height: 80px;width:80px;\" ");
                }
            } else if ("3".equals(realCustType)) {
                imageBuilder.append("/business/com.ai.oneframe.common.AttachAction?action=doDownload&TYPE=.jpg&FTP_PATH_CODE=OF2_PHOTO_FOLDER_PATH&FILE_NAME=").append(fileName).append(".jpg'").append(" onerror=\"src='").append(context).append("/webframe/images/").append("group.gif'\" style=\"height: 80px;width:80px;\" ");
            }

            imageBuilder.append(" />");
            htmlCode = imageBuilder.toString();
        } catch (Exception var18) {
            log.error("", var18);
            retCode = "N";
            retMsg = var18.getLocalizedMessage();
        }
        cp.put("retCode", retCode);
        cp.put("retMsg", retMsg);
        cp.put("htmlCode", htmlCode);
        return cp;
    }
    
    public String getLegalPerson(String cprNum) throws Exception {
        String legalPerson = null;
        ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        ICmIndivCustomerSV indivService = (ICmIndivCustomerSV) ServiceFactory.getService(ICmIndivCustomerSV.class);
        IBOCmIndivCustomerValue[] values = service.queryCustomerByCPR(cprNum);
        if(values!=null && values.length>0) {
            IBOCmIndivCustomerValue indivCustomer = values[0];
            legalPerson = CmCommonUtil.capitalizeFirstLetter(indivCustomer.getFirstName().trim())
                    +" "+ CmCommonUtil.capitalizeFirstLetter(indivCustomer.getLastName().trim());
        }
        if(StringUtils.isBlank(legalPerson)){
            try {
                Map params = new HashMap();
                params.put("PNR", cprNum);
                // 送CPR进行校验
                Map cprData = indivService.validateCPR(params);
                String FEJLNR = (String) cprData.get("FEJLNR");
                if (!"00".equals(FEJLNR)) {
                    // CPR在CPR系统中不存在。
                    log.info(CrmLocaleFactory.getResource("CMS9988772"));
                    return null;
                }
                Map data1 = (Map) cprData.get("DATA");
                Map data2 = (Map) data1.get("INFO");
                Map currentData = (Map) data2.get("Current_data");


                // 从CPR返回的客户名称
                String firstName = (String) currentData.get("FORNVN");
                String lastName = (String) currentData.get("EFTERNVN");
                legalPerson = CmCommonUtil.capitalizeFirstLetter(firstName)
                        +" "+ CmCommonUtil.capitalizeFirstLetter(lastName);

            } catch (Exception e) {
                log.error(e.getMessage(), e);
            }
        }
        return legalPerson;
    }

    public Map queryAdvanceCustomerDetail(long custId) throws Exception {
        ICmDkCustomerSV customerSV = (ICmDkCustomerSV) ServiceFactory.getService(ICmDkCustomerSV.class);
        int custType = CmCommonUtil.getCustType(custId);
        ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        ICustomerValue val = service.queryCustomerByCustId(custId);
        Map map=new HashMap();
        map.put("CUST_TYPE", custType);
        DataContainerInterface[] datas= null;
        if(val!=null) {
            map.putAll(val.getProperties());
            if (map.containsKey("CORPORATE_IDENTIFICATION_NUMBE") && StringUtils.isNotBlank(MapUtils.getString(map, "CORPORATE_IDENTIFICATION_NUMBE"))) {
                map.put("LEGAL_PERSON", this.getLegalPerson(MapUtils.getString(map, "CORPORATE_IDENTIFICATION_NUMBE")));
            }
            IBOCmCustContactMediumValue email = CmServiceFactory.getCustomerSV().queryCustContactMediumByCustIdAndType(custId, String.valueOf(CmConstants.AddressId.EMAIL));
            map.put("EMAIL",email!=null?email.getEmailAddress():"");
            IBOCmCustContactMediumValue adress = CmServiceFactory.getCustomerSV().queryCustContactMediumByCustIdAndType(custId, String.valueOf(CmConstants.AddressId.legalAddress));
            map.put("ADDRESS_DETAIL",adress!=null?adress.getAddressDetail():"");

        }
        return map;
    }

    public Map getCustInfoByBillId( String billId) throws Exception {
        Map cp=new HashMap<>();
        CustSimpleInfo simpleInfo = null;
        try {
            ICmCustSV customerSV = (ICmCustSV) ServiceFactory.getService(ICmCustSV.class);
            simpleInfo = customerSV.queryCustSimpleInfo(billId);
            if(simpleInfo != null) {
                cp.put("CUST_ID", simpleInfo.getCustId());
                cp.put("CUST_NAME",simpleInfo.getCustName());
            }
            cp.put(RefineBaseAction.KEY_RSLT_VAL, RefineBaseAction.DO_SUCC);
         } catch(Exception e) {
             cp.put(RefineBaseAction.KEY_RSLT_VAL, RefineBaseAction.DO_FAIL);
             cp.put(RefineBaseAction.KEY_RSLT_MSG, CrmLocaleFactory.getResource("SRS0002161"));
             if (log.isErrorEnabled()) {
                 log.error(CrmLocaleFactory.getResource("SRS0002161"), e);
             }
         

        }
        if(simpleInfo==null){
            log.info("No matching information found!billId:{}",billId);
            throw new Exception("No matching information found!billId:"+billId);
        }
        return  cp;
    }


    public Map getCustSegmentById(long custId) throws Exception {
        ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        Map cp=new HashMap<>();
        try {
            String custSegment = "";
            String custCode = "";
            String taxId = "";
            long[] custIds = {custId};
            ICustomerValue[] custs = customerSV.queryCustByCustIds(custIds);
            if (custs != null && custs.length > 0) {
                 custSegment = custs[0].getSegmentId();
                //鑾峰彇cust_code
                 custCode = custs[0].getCustCertCode();
                //get the tax_id by luanpeng
                 taxId = custs[0].getTaxId();
            }
            cp.put("custSeg", custSegment);
            cp.put("custCode", custCode);
            cp.put("taxId", taxId);
            return cp;
        } catch (Exception e) {
            log.error("can't get any cust infomation by custId " + custId, e);
            throw new Exception("can't get any cust infomation by custId " + custId);
        }
    }


}