package com.asiainfo.crm.cm.controller;

import com.ai.appframe2.complex.cache.CacheFactory;
import com.ai.secframe.orgmodel.ivalues.IQBOSecCustManagerValue;
import com.aie.api.vo.ResultVo;
import com.aie.api.vo.ResultVoBuilder;
import com.asiainfo.crm.cm.bf.ICustomerBF;
import com.asiainfo.crm.cm.bf.IPartyBF;
import com.asiainfo.crm.cm.common.cache.CmIndustryCacheImpl;
import com.asiainfo.crm.cm.common.ivalues.IBOCmCustPermissionClauseValue;
import com.asiainfo.crm.cm.common.ivalues.IBOIdentificationValue;
import com.asiainfo.crm.cm.common.util.CmCustContMedTypeUtil;
import com.asiainfo.crm.cm.customer.group.ivalues.IBOCmGroupRelIndustryValue;
import com.asiainfo.crm.cm.customer.group.ivalues.IBOCmIndustryConfigValue;
import com.asiainfo.crm.cm.customer.group.ivalues.IBoCmCustSegmentValue;
import com.asiainfo.crm.cm.customer.group.ivalues.IBoCmGroupAccountingValue;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmCustContMedTypeValue;
import com.asiainfo.crm.cm.inner.customer.ivalues.IQBOCmCustContMediumAndTypeValue;
import com.asiainfo.crm.cm.inner.log.ivalues.IBOCmHisRecordValue;
import com.asiainfo.crm.cm.model.ivalues.ICustManagerValue;
import com.asiainfo.crm.cm.model.ivalues.ICustomerValue;
import com.asiainfo.crm.cm.vo.*;
import com.asiainfo.crm.so.util.RBossUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.lang.Boolean;
import java.util.*;

@RestController
@RequestMapping("/cm")
@Slf4j
public class CustomerController {

    @Autowired
    private ICustomerBF customerBF;

    @Autowired
    private IPartyBF partyBF;

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<String> test() {
        ResultVoBuilder<String> result = new ResultVoBuilder<String>();
        result.success();
        result.data("success");
        return result.build();
    }

    @RequestMapping(value = "/getId", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<Long> getCustId(@RequestParam("custType") int custType) {
        ResultVoBuilder<Long> result = new ResultVoBuilder<Long>();
        long custId = 0;
        try {
            custId = this.customerBF.getCustId(custType);
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        if (custId > 0) {
            result.data(custId);
            result.success();
        } else {
            result.error();
        }
        return result.build();
    }

    @RequestMapping(value = "/getPartyId", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<Long> getPartyId() {
        ResultVoBuilder<Long> result = new ResultVoBuilder<Long>();
        long partyId = 0;
        try {
            partyId = this.partyBF.getPartyId();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        if (partyId > 0) {
            result.data(partyId);
            result.success();
        } else {
            result.error();
        }
        return result.build();
    }

    @RequestMapping(value = "/cloudPBXControl", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<Boolean> cloudPBXControl() {
        ResultVoBuilder<Boolean> result = new ResultVoBuilder<Boolean>();
        try {
            boolean flag = RBossUtil.cloudPBXControl();
            result.data(flag);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/defaultPlatform", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<String> getCustDefaultPlatform() {
        ResultVoBuilder<String> result = new ResultVoBuilder<String>();
        try {
            String defaultPlatform = RBossUtil.getCustDefaultPlatform();
            result.data(defaultPlatform);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/manager/page", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<List<HashMap<String, Object>>> queryCustManager(
            @RequestParam(name = "code", required = false) String code,
            @RequestParam(name = "staffName", required = false) String staffName,
            @RequestParam(name = "orgName", required = false) String orgName,
            @RequestParam(name = "districtId", required = false) String districtId,
            @RequestParam(name = "countyId", required = false) String countyId,
            @RequestParam(name = "ownerArea", required = false) String ownerArea,
            @RequestParam(name = "billId", required = false) String billId,
            @RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
        ResultVoBuilder<List<HashMap<String, Object>>> result = new ResultVoBuilder<List<HashMap<String, Object>>>();
        List<HashMap<String, Object>> list = new ArrayList<>();
        try {
            IQBOSecCustManagerValue[] values = customerBF.queryCustManager(code, staffName, orgName, districtId,
                    countyId, ownerArea, billId, pageNum, pageSize);
            if (values != null && values.length > 0) {
                for (IQBOSecCustManagerValue value : values) {
                    HashMap<String, Object> map = new HashMap<>();
                    map.putAll(value.getProperties());
                    list.add(map);
                }
            }
            result.data(list);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/manager/count", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<Integer> queryCustManagerCond(
            @RequestParam(name = "code", required = false) String code,
            @RequestParam(name = "staffName", required = false) String staffName,
            @RequestParam(name = "orgName", required = false) String orgName,
            @RequestParam(name = "districtId", required = false) String districtId,
            @RequestParam(name = "countyId", required = false) String countyId,
            @RequestParam(name = "ownerArea", required = false) String ownerArea,
            @RequestParam(name = "billId", required = false) String billId) {
        ResultVoBuilder<Integer> result = new ResultVoBuilder<Integer>();
        try {
            int value = customerBF.queryCustManagerCond(code, staffName, orgName, districtId, countyId, ownerArea,
                    billId);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/permissionClause/page", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<List<HashMap<String, Object>>> qryCmCustPermissionClause(
            @RequestParam("parentClauseId") String parentClauseId,
            @RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
        ResultVoBuilder<List<HashMap<String, Object>>> result = new ResultVoBuilder<List<HashMap<String, Object>>>();
        List<HashMap<String, Object>> list = new ArrayList<>();
        try {
            IBOCmCustPermissionClauseValue[] values = customerBF.qryCmCustPermissionClause(parentClauseId, pageNum,
                    pageSize);
            if (values != null && values.length > 0) {
                for (IBOCmCustPermissionClauseValue value : values) {
                    HashMap<String, Object> map = new HashMap<String, Object>();
                    map.putAll(value.getProperties());
                    list.add(map);
                }
            }
            result.data(list);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/permissionClause/count", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<Integer> qryCmCustPermissionClauseCount(
            @RequestParam("parentClauseId") String parentClauseId) {
        ResultVoBuilder<Integer> result = new ResultVoBuilder<Integer>();
        try {
            int value = customerBF.qryCmCustPermissionClauseCount(parentClauseId);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/hisRecord/page", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<List<HashMap<String, Object>>> queryHisRecordByCdn(
            @RequestParam(name = "id", required = false) long id,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam(name = "type", required = false) int type,
            @RequestParam(name = "startDate", required = false) String startDate,
            @RequestParam(name = "endDate", required = false) String endDate,
            @RequestParam("pageNum") int pageNum,
            @RequestParam("pageSize") int pageSize) {
        ResultVoBuilder<List<HashMap<String, Object>>> result = new ResultVoBuilder<List<HashMap<String, Object>>>();
        List<HashMap<String, Object>> list = new ArrayList<>();
        try {
            IBOCmHisRecordValue[] values = customerBF.queryHisRecordByCdn(id, name, type, startDate, endDate,
                    pageNum, pageSize);
            if (values != null && values.length > 0) {
                for (IBOCmHisRecordValue value : values) {
                    HashMap<String, Object> map = new HashMap<String, Object>();
                    map.putAll(value.getProperties());
                    list.add(map);
                }
            }
            result.data(list);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/hisRecord/count", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<Integer> queryHisRecordCountByCdn(
            @RequestParam(name = "id", required = false) long id,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam(name = "type", required = false) int type,
            @RequestParam(name = "startDate", required = false) String startDate,
            @RequestParam(name = "endDate", required = false) String endDate) {
        ResultVoBuilder<Integer> result = new ResultVoBuilder<Integer>();
        try {
            int value = customerBF.queryHisRecordCountByCdn(id, name, type, startDate, endDate);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/contactMedium/address/page", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<List<HashMap<String, Object>>> queryCustContactMediumsForPage(
            @RequestParam("custId") long custId,
            @RequestParam("mediumType") long mediumType,
            @RequestParam("upMediumType") long upMediumType,
            @RequestParam("pageNum") int pageNum,
            @RequestParam("pageSize") int pageSize) {
        ResultVoBuilder<List<HashMap<String, Object>>> result = new ResultVoBuilder<List<HashMap<String, Object>>>();
        List<HashMap<String, Object>> list = new ArrayList<>();
        try {
            IQBOCmCustContMediumAndTypeValue[] values = customerBF.queryCustContactMediumsForPage(custId, mediumType,
                    upMediumType,
                    pageNum, pageSize);
            if (values != null && values.length > 0) {
                for (IQBOCmCustContMediumAndTypeValue value : values) {
                    HashMap<String, Object> map = new HashMap<String, Object>();
                    map.putAll(value.getProperties());
                    list.add(map);
                }
            }
            result.data(list);
            result.setMetaObject("SETCmCustContMediumAndType001");
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/contactMedium/address/count", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<Integer> queryCustContactMediumsCount(
            @RequestParam("custId") long custId,
            @RequestParam("mediumType") long mediumType,
            @RequestParam(name = "upMediumType", required = false) long upMediumType) {
        ResultVoBuilder<Integer> result = new ResultVoBuilder<Integer>();
        try {
            int vlaue = customerBF.queryCustContactMediumsCount(custId, mediumType, upMediumType);
            result.data(vlaue);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/contactMedium/page", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<List<HashMap<String, Object>>> queryCustElectronicMediumForPage(
            @RequestParam("custId") long custId,
            @RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
        ResultVoBuilder<List<HashMap<String, Object>>> result = new ResultVoBuilder<List<HashMap<String, Object>>>();
        List<HashMap<String, Object>> list = new ArrayList<>();
        try {
            IQBOCmCustContMediumAndTypeValue[] values = customerBF.queryCustElectronicMediumForPage(custId, pageNum,
                    pageSize);
            if (values != null && values.length > 0) {
                for (IQBOCmCustContMediumAndTypeValue value : values) {
                    HashMap<String, Object> map = new HashMap<String, Object>();
                    map.putAll(value.getProperties());
                    Object isNoDisturbing = map.get(IQBOCmCustContMediumAndTypeValue.S_IsNoDisturbing);
                    if (isNoDisturbing instanceof Number && ((Number) isNoDisturbing).longValue() == -1L) {
                        map.put(IQBOCmCustContMediumAndTypeValue.S_IsNoDisturbing, null);
                    } else if (isNoDisturbing instanceof String && "-1".equals(((String) isNoDisturbing).trim())) {
                        map.put(IQBOCmCustContMediumAndTypeValue.S_IsNoDisturbing, null);
                    }
                    list.add(map);
                }
            }
            result.data(list);
            result.setMetaObject("SETCmCustContMediumAndType001");
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/contactMedium/count", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<Integer> queryCustElectronicMediumCount(
            @RequestParam("custId") long custId) {
        ResultVoBuilder<Integer> result = new ResultVoBuilder<Integer>();
        try {
            int value = customerBF.queryCustElectronicMediumCount(custId);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/segment/list", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<List<HashMap<String, Object>>> querySegmentByParentIdfromCache(
            @RequestParam(name = "segId", required = false) long segId,
            @RequestParam(name = "segName", required = false) String segName,
            @RequestParam(name = "parentSegId", required = false) long parentSegId,
            @RequestParam(name = "regionId", required = false) String regionId) {
        ResultVoBuilder<List<HashMap<String, Object>>> result = new ResultVoBuilder<List<HashMap<String, Object>>>();
        List<HashMap<String, Object>> list = new ArrayList<>();
        try {
            IBoCmCustSegmentValue[] values = customerBF.querySegmentByParentIdfromCache(segId, segName, parentSegId,
                    regionId);
            if (values != null && values.length > 0) {
                for (IBoCmCustSegmentValue value : values) {
                    HashMap<String, Object> map = new HashMap<String, Object>();
                    map.putAll(value.getProperties());
                    list.add(map);
                }
            }
            result.data(list);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/segment/detail", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<HashMap<String, Object>> querySegment(
            @RequestParam("segId") long segId,
            @RequestParam("segName") String segName) {
        ResultVoBuilder<HashMap<String, Object>> result = new ResultVoBuilder<HashMap<String, Object>>();
        HashMap<String, Object> map = new HashMap<String, Object>();
        try {
            IBoCmCustSegmentValue value = customerBF.querySegment(segId, segName);
            if (value != null) {
                map.putAll(value.getProperties());
            }
            result.data(map);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/b2b/customer/detail", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<HashMap<String, Object>> queryCustomerMaskByCustIdAndLog(
            @RequestParam("custId") long custId) {
        ResultVoBuilder<HashMap<String, Object>> result = new ResultVoBuilder<HashMap<String, Object>>();
        HashMap<String, Object> map = new HashMap<String, Object>();
        try {
            ICustomerValue value = customerBF.queryCustomerMaskByCustIdAndLog(custId);
            if (value != null) {
                map.putAll(value.getProperties());
            }
            result.data(map);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/industry/page", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<List<HashMap<String, Object>>> queryGroupIndustryForPage(
            @RequestParam(name = "custId") long custId,
            @RequestParam(name = "pageNum") int pageNum, @RequestParam(name = "pageSize") int pageSize) {
        ResultVoBuilder<List<HashMap<String, Object>>> result = new ResultVoBuilder<List<HashMap<String, Object>>>();
        List<HashMap<String, Object>> list = new ArrayList<>();
        try {
            IBOCmGroupRelIndustryValue[] values = customerBF.queryGroupIndustryForPage(custId, pageNum,
                    pageSize);
            if (values != null && values.length > 0) {
                for (IBOCmGroupRelIndustryValue value : values) {
                    HashMap<String, Object> map = new HashMap<String, Object>();
                    map.putAll(value.getProperties());
                    list.add(map);
                }
            }
            result.data(list);
            result.success();
            result.setMetaObject("SETCmGroupRelIndustry002");
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/industry/count", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<Integer> queryGroupIndustryCount(
            @RequestParam(name = "custId") long custId) {
        ResultVoBuilder<Integer> result = new ResultVoBuilder<Integer>();
        try {
            int value = customerBF.queryGroupIndustryCount(custId);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/identification/list", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<List<HashMap<String, Object>>> queryCustIdentifications(
            @RequestParam(name = "partyId", required = false) long partyId,
            @RequestParam(name = "idenType", required = false) int idenType,
            @RequestParam(name = "idenCode", required = false) String idenCode) {
        ResultVoBuilder<List<HashMap<String, Object>>> result = new ResultVoBuilder<List<HashMap<String, Object>>>();
        List<HashMap<String, Object>> list = new ArrayList<>();
        try {
            IBOIdentificationValue[] values = customerBF.queryCustIdentifications(partyId, idenType, idenCode);
            if (values != null && values.length > 0) {
                for (IBOIdentificationValue value : values) {
                    HashMap<String, Object> map = new HashMap<String, Object>();
                    map.putAll(value.getProperties());
                    list.add(map);
                }
            }
            result.data(list);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/accounting/detail", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<HashMap<String, Object>> queryGroupAccountingById(@RequestParam("custId") long custId) {
        ResultVoBuilder<HashMap<String, Object>> result = new ResultVoBuilder<HashMap<String, Object>>();
        HashMap<String, Object> map = new HashMap<String, Object>();
        try {
            IBoCmGroupAccountingValue value = customerBF.queryGroupAccountingById(custId);
            if (value != null) {
                map.putAll(value.getProperties());
            }
            result.data(map);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/manager/detail", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<HashMap<String, Object>> queryMainCustManagersByCustId(@RequestParam("custId") long custId) {
        ResultVoBuilder<HashMap<String, Object>> result = new ResultVoBuilder<HashMap<String, Object>>();
        HashMap<String, Object> map = new HashMap<String, Object>();
        try {
            ICustManagerValue value = customerBF.queryMainCustManagersByCustId(custId);
            if (value != null) {
                map.putAll(value.getProperties());
            }
            result.data(map);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/contactMediumType/list", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<List<HashMap<String, Object>>> getCmCustContMedType(
            @RequestParam("upContMedTypeId") int upContMedTypeId,
            @RequestParam("useType") int useType) {
        ResultVoBuilder<List<HashMap<String, Object>>> result = new ResultVoBuilder<List<HashMap<String, Object>>>();
        List<HashMap<String, Object>> list = new ArrayList<>();
        try {
            IBOCmCustContMedTypeValue[] values = CmCustContMedTypeUtil.getCmCustContMedType(upContMedTypeId, useType);
            if (values != null && values.length > 0) {
                for (IBOCmCustContMedTypeValue value : values) {
                    HashMap<String, Object> map = new HashMap<String, Object>();
                    map.putAll(value.getProperties());
                    list.add(map);
                }
            }
            result.data(list);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/industryConfig/list", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<List<HashMap<String, Object>>> getIndustryByParentId(
            @RequestParam(name = "parentId", required = false) String parentId,
            @RequestParam(name = "level", required = false) int level) {
        ResultVoBuilder<List<HashMap<String, Object>>> result = new ResultVoBuilder<List<HashMap<String, Object>>>();
        List<HashMap<String, Object>> list = new ArrayList<>();
        try {
        	List<IBOCmIndustryConfigValue> industries = (List<IBOCmIndustryConfigValue>) CacheFactory.get(CmIndustryCacheImpl.class, CmIndustryCacheImpl.IDX_BY_LEVEL_PARENT + CmIndustryCacheImpl.SPLIT_CODE + level + CmIndustryCacheImpl.SPLIT_CODE + parentId);
            //IBOCmIndustryConfigValue[] values = BsCommonDistrictUtil.getIndustryByParentId(parentId, level);
            if (industries != null && !industries.isEmpty()) {
                for (IBOCmIndustryConfigValue value : industries) {
                    HashMap<String, Object> map = new HashMap<String, Object>();
                    map.putAll(value.getProperties());
                    list.add(map);
                }
            }
            result.data(list);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/addtionalInfo/detail", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<Map<String, Object>> queryAddtionalInfo(@RequestParam("custId") long custId) {
        ResultVoBuilder<Map<String, Object>> result = new ResultVoBuilder<Map<String, Object>>();
        try {
            Map<String, Object> value = customerBF.queryAddtionalInfo(custId);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/validateCPRNum", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<Map<String, Object>> validateCPRNum(@RequestParam("cprNum") String cprNum) {
        ResultVoBuilder<Map<String, Object>> result = new ResultVoBuilder<Map<String, Object>>();
        try {
            Map<String, Object> value = customerBF.validateCPRNum(cprNum);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/segMgrGroupId", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<Map<String, Object>> queryOrgId(@RequestParam("custSegment") String custSegment,
            @RequestParam("segmentId") long segmentId,
            @RequestParam(name = "zipCode", required = false, defaultValue = "0") long zipCode) {
        ResultVoBuilder<Map<String, Object>> result = new ResultVoBuilder<Map<String, Object>>();
        try {
            Map<String, Object> value = customerBF.queryOrgId(custSegment, segmentId, zipCode);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/checkStaffAmount", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<Map<String, Object>> checkStaffAmount(
            @RequestParam("staffAmountType") String staffAmountType,
            @RequestParam("staffAmount") String staffAmount, @RequestParam("custCertCode") String custCertCode) {
        ResultVoBuilder<Map<String, Object>> result = new ResultVoBuilder<Map<String, Object>>();
        try {
            Map<String, Object> value = customerBF.checkStaffAmount(staffAmountType, staffAmount, custCertCode);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/b2b/customer", method = RequestMethod.POST)
    @ResponseBody
    public ResultVo<Map<String, Object>> saveGroupCustomer(@RequestBody Map createVO) {
        ResultVoBuilder<Map<String, Object>> result = new ResultVoBuilder<Map<String, Object>>();
        try {
            Map<String, Object> value = customerBF.saveGroupCustomer(createVO);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/industry", method = RequestMethod.POST)
    @ResponseBody
    public ResultVo<Map<String, Object>> createIndustry(@RequestBody CreateIndustryVO createVO) {
        ResultVoBuilder<Map<String, Object>> result = new ResultVoBuilder<Map<String, Object>>();
        try {
            Map<String, Object> value = customerBF.createIndustry(createVO);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/industry", method = RequestMethod.DELETE)
    @ResponseBody
    public ResultVo<Map<String, Object>> deleteGroupIndustry(@RequestParam("relId") long relId) {
        ResultVoBuilder<Map<String, Object>> result = new ResultVoBuilder<Map<String, Object>>();
        try {
            Map<String, Object> value = customerBF.deleteGroupIndustry(relId);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/checkEmailAddress", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<Map<String, Object>> checkEmailAddress(@RequestParam("emailAddress") String emailAddress) {
        ResultVoBuilder<Map<String, Object>> result = new ResultVoBuilder<Map<String, Object>>();
        try {
            Map<String, Object> value = customerBF.checkEmailAddress(emailAddress);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/contactMedium", method = RequestMethod.POST)
    @ResponseBody
    public ResultVo<Map<String, Object>> saveElecAddress(@RequestBody CreateContactMediumVO createVO) {
        ResultVoBuilder<Map<String, Object>> result = new ResultVoBuilder<Map<String, Object>>();
        try {
            Map<String, Object> value = customerBF.saveElecAddress(createVO);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/checkIsCustMgr", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<Map<String, Object>> checkIsCustMgr(@RequestParam("managerId") long managerId) {
        ResultVoBuilder<Map<String, Object>> result = new ResultVoBuilder<Map<String, Object>>();
        try {
            Map<String, Object> value = customerBF.checkIsCustMgr(managerId);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/address", method = RequestMethod.POST)
    @ResponseBody
    public ResultVo<Map<String, Object>> addCustAddress(@RequestBody CreateCustAddressVO createVO) {
        ResultVoBuilder<Map<String, Object>> result = new ResultVoBuilder<Map<String, Object>>();
        try {
            Map<String, Object> value = customerBF.addCustAddress(createVO);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/address", method = RequestMethod.DELETE)
    @ResponseBody
    public ResultVo<Map<String, Object>> deleteCustAddress(@RequestParam("addressRelaId") long addressRelaId) {
        ResultVoBuilder<Map<String, Object>> result = new ResultVoBuilder<Map<String, Object>>();
        try {
            Map<String, Object> value = customerBF.deleteCustAddress(addressRelaId);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/address/modify", method = RequestMethod.POST)
    @ResponseBody
    public ResultVo<Map<String, Object>> modifyCustAddress(@RequestBody ModifyCustAddressVO modifyVO) {
        ResultVoBuilder<Map<String, Object>> result = new ResultVoBuilder<Map<String, Object>>();
        try {
            Map<String, Object> value = customerBF.modifyCustAddress(modifyVO);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

    @RequestMapping(value = "/contactMedium/detail", method = RequestMethod.GET)
    @ResponseBody
    public ResultVo<HashMap<String, Object>> queryCustContactMedium(
            @RequestParam("contRelaId") long contRelaId) {
        ResultVoBuilder<HashMap<String, Object>> result = new ResultVoBuilder<HashMap<String, Object>>();
        HashMap<String, Object> map = new HashMap<String, Object>();
        try {
            IQBOCmCustContMediumAndTypeValue value = customerBF.queryCustContactMedium(contRelaId);
            if (value != null) {
                map.putAll(value.getProperties());
            }
            result.data(map);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result.build();
    }

}
