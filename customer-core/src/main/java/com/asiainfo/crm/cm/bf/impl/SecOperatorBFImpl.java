package com.asiainfo.crm.cm.bf.impl;

import com.ai.appframe2.common.DataContainerInterface;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.appframe2.util.locale.AppframeLocaleFactory;
import com.ai.secframe.orgmodel.ivalues.IQBOSecOrgStaffOperValue;
import com.ai.secframe.orgmodel.service.interfaces.ISecOperatorSV;
import com.asiainfo.crm.util.PageUtil;
import com.asiainfo.crm.vo.SummaryVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
public class SecOperatorBFImpl {
    /**
     * 查询操作员列表
     * @param organizeId
     * @param name
     * @param code
     * @param billId
     * @param startIndex 分页参数,前端开始1,0及负值代表最小
     * @param endIndex 分页参数,结束索引,最大length,0及负值代码最大
     * @return
     */
    public SummaryVO refreshSecOrgStaffOper(String organizeId, String name, String code, String billId, int startIndex, int endIndex) throws Exception{
        IQBOSecOrgStaffOperValue[] values = null;
        int total = 0;

        if (StringUtils.isBlank(organizeId) && StringUtils.isBlank(name) && StringUtils.isBlank(code) && StringUtils.isBlank(billId)) {
            return null;
        }

        ISecOperatorSV sv = (ISecOperatorSV) ServiceFactory.getService(ISecOperatorSV.class);
        try{
            if (StringUtils.isBlank(organizeId)) {
                values = sv.getStaffValByCond(-1L, billId, code, name);
            } else {
                values = sv.getStaffValByCond(Long.valueOf(organizeId), (String)null, (String)null, (String)null);
            }
        } catch (Exception e) {
            log.error("refreshSecOrgStaffOper",e);
            throw e;
        }


        if(values!=null){
            total = values.length;
        }

        //原有前端使用的com.ai.appframe2.web.tag.ActionDataModel做前端分页
        //这里也采用这种方式
        return PageUtil.getPageData(values, total, startIndex, endIndex);
    }
}
