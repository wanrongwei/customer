package com.asiainfo.crm.cm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ai.appframe2.common.ServiceManager;
import com.ai.appframe2.complex.cache.CacheFactory;
import com.ai.appframe2.privilege.UserInfoInterface;
import com.ai.common.cache.BsParaDetailCacheImpl;
import com.ai.common.i18n.CrmLocaleFactory;
import com.ai.common.ivalues.IBOBsParaDetailValue;
import com.ai.common.ivalues.IBOBsStaticDataValue;
import com.ai.common.util.StaticDataUtil;
import com.aie.api.vo.ResultVoBuilder;
import com.asiainfo.crm.cm.bf.ICustomerBF;
import com.asiainfo.crm.cm.vo.SffAddressKeywordResult;
import com.asiainfo.crm.cm.common.util.CmCommonUtil;
import com.asiainfo.crm.cm.common.util.CmCustContMedTypeUtil;
import com.asiainfo.crm.cm.common.util.ws.address;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmCustContMedTypeValue;
import com.asiainfo.crm.cm.vo.CreateSFFAddressVO;
import com.asiainfo.crm.cm.vo.QuerySFFAddressVO;

@RestController
@RequestMapping("/common")
public class CommonController {

    @Autowired
    private ICustomerBF customerBF;

    @RequestMapping(value = "/staticData/list", method = RequestMethod.GET)
    @ResponseBody
    public ResultVoBuilder<List<HashMap<String, Object>>> getStaticData(@RequestParam("codeType") String codeType)
            throws Exception {
        ResultVoBuilder<List<HashMap<String, Object>>> result = new ResultVoBuilder<List<HashMap<String, Object>>>();
        List<HashMap<String, Object>> list = new ArrayList<>();
        try {
            IBOBsStaticDataValue[] values = StaticDataUtil.getStaticData(codeType);
            if (values != null && values.length > 0) {
                for (IBOBsStaticDataValue value : values) {
                	String codeName = value.getCodeName();
                	String codeNameToRes = null;
                	if(StringUtils.isNotBlank(codeName)) {
                		try {
                			codeNameToRes = CrmLocaleFactory.getResource(codeName);
						} catch (Exception e) {
						}
                	}
                	if(StringUtils.isNotBlank(codeNameToRes)) {
                		value.setCodeName(codeNameToRes);
                	}
                	
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
        return result;
    }

    @RequestMapping(value = "/paraDetail", method = RequestMethod.GET)
    @ResponseBody
    public ResultVoBuilder<HashMap<String, Object>> getParaDetail(
            @RequestParam(name = "regionId",required = false) String regionId, @RequestParam(name = "paraType",required = false) String paraType,
            @RequestParam(name = "paraCode",required = false) String paraCode, @RequestParam(name = "cacheKey",required = false) String cacheKey)
            throws Exception {
        ResultVoBuilder<HashMap<String, Object>> result = new ResultVoBuilder<HashMap<String, Object>>();
        HashMap<String, Object> map = new HashMap<>();
        try {
            IBOBsParaDetailValue value = null;
            if(StringUtils.isNotBlank(cacheKey)){
                value = (IBOBsParaDetailValue) CacheFactory.get(BsParaDetailCacheImpl.class, cacheKey);
            }else{
                if (StringUtils.isNotBlank(regionId) && StringUtils.isNotBlank(paraType) && StringUtils.isNotBlank(paraCode)) {
                    cacheKey = regionId + "_" + paraCode + "_" + paraType;
                    value = (IBOBsParaDetailValue) CacheFactory.get(BsParaDetailCacheImpl.class, cacheKey);
                }
                if (null == value && !StringUtils.equals("X", regionId)) {
                    cacheKey = "X_" + paraCode + "_" + paraType;
                    value = (IBOBsParaDetailValue) CacheFactory.get(BsParaDetailCacheImpl.class, cacheKey);
                }
            }
  
            if (value != null) {
                map.putAll(value.getProperties());
            }
            result.data(map);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/userInfo", method = RequestMethod.GET)
    @ResponseBody
    public ResultVoBuilder<UserInfoInterface> getUser() throws Exception {
        ResultVoBuilder<UserInfoInterface> result = new ResultVoBuilder<UserInfoInterface>();
        try {
            UserInfoInterface value = ServiceManager.getUser();
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/sff/address/page", method = RequestMethod.POST)
    @ResponseBody
    public ResultVoBuilder<address[]> queryAddressList(
            @RequestBody QuerySFFAddressVO queryVO,
            @RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
        ResultVoBuilder<address[]> result = new ResultVoBuilder<address[]>();
        try {
            address[] values = customerBF.queryAddressList(queryVO, pageNum, pageSize);
            result.data(values);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result;
    }

    /**
     * SFF address suggest by keyword only; data source same as {@link #queryAddressList}.
     * Response list element shape matches ORD {@code /qualification/query/installationAddress}
     * ({@link SffAddressKeywordResult#getAddress()} carries full SFF fields).
     */
    @RequestMapping(value = "/sff/address/queryByKeyword", method = RequestMethod.GET)
    @ResponseBody
    public ResultVoBuilder<List<SffAddressKeywordResult>> queryAddressListByKeyword(
            @RequestParam("keyWord") String keyWord) {
        ResultVoBuilder<List<SffAddressKeywordResult>> result = new ResultVoBuilder<List<SffAddressKeywordResult>>();
        try {
            result.data(customerBF.querySffAddressByKeyword(keyWord));
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/sff/address/count", method = RequestMethod.POST)
    @ResponseBody
    public ResultVoBuilder<Integer> queryAddressListCount(@RequestBody QuerySFFAddressVO queryVO) {
        ResultVoBuilder<Integer> result = new ResultVoBuilder<Integer>();
        try {
            int value = customerBF.queryAddressListCount(queryVO);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/sff/address", method = RequestMethod.POST)
    @ResponseBody
    public ResultVoBuilder<Map<String, Object>> saveAddress(@RequestBody CreateSFFAddressVO createVO) {
        ResultVoBuilder<Map<String, Object>> result = new ResultVoBuilder<Map<String, Object>>();
        try {
            Map<String, Object> value = customerBF.saveAddress(createVO);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result;
    }

    /**
     * Same request body as {@link #saveAddress(CreateSFFAddressVO)}. Finds an existing SFF row that matches
     * all saved fields; if found returns that {@code addressId} ({@code reused=true}), else saves new ({@code reused=false}).
     */
    @RequestMapping(value = "/sff/address/saveIfChanged", method = RequestMethod.POST)
    @ResponseBody
    public ResultVoBuilder<Map<String, Object>> saveSffAddressIfChanged(@RequestBody CreateSFFAddressVO vo) {
        ResultVoBuilder<Map<String, Object>> result = new ResultVoBuilder<Map<String, Object>>();
        try {
            Map<String, Object> value = customerBF.saveSffAddressIfChanged(vo);
            result.data(value);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/contactMediumType/list", method = RequestMethod.GET)
    @ResponseBody
    public ResultVoBuilder<List<HashMap<String, Object>>> getCmCustContMedType(
            @RequestParam(name = "upContMedTypeId") int upContMedTypeId,
            @RequestParam(name = "useType") int useType) {
        ResultVoBuilder<List<HashMap<String, Object>>> result = new ResultVoBuilder<List<HashMap<String, Object>>>();
        List<HashMap<String, Object>> list = new ArrayList<>();
        try {
            IBOCmCustContMedTypeValue[] values = CmCustContMedTypeUtil.getCmCustContMedType(upContMedTypeId, useType);
            if (values != null && values.length > 0) {
                for (IBOCmCustContMedTypeValue value : values) {
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
        return result;
    }

    @RequestMapping(value = "/regionId", method = RequestMethod.GET)
    @ResponseBody
    public ResultVoBuilder<String> getDefaultRegionId() throws Exception {
        ResultVoBuilder<String> result = new ResultVoBuilder<String>();
        try {
            String regionId = CmCommonUtil.getDefaultRegionId();
            result.data(regionId);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result;
    }
}
