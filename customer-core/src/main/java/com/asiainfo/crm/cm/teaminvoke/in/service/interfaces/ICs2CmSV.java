package com.asiainfo.crm.cm.teaminvoke.in.service.interfaces;

import com.ai.appframe2.bo.DataContainer;
import com.asiainfo.crm.ci.inter.out.bo.CustomerInteractionBean;

import java.util.Map;

public interface ICs2CmSV {
    /**
     * 客户管理创建TT工单
     * @Function CreateTicketForCM
     * @Description
     *
     * @param map
     * @throws Exception
     *
     * @version v1.0.0
     * @author yangjh
     * @date 2014-12-21 上午10:32:59
     *
     * <strong>Modification History:</strong><br>
     * Date         Author          Version            Description<br>
     * ---------------------------------------------------------<br>
     * 2014-12-21     yangjh           v1.0.0               修改原因<br>
     */
    public String CreateTicketForCM(Map map) throws Exception;

    /**
     * 查询故障单信息
     * @Function queryTicketListForCm
     * @Description
     *
     * @param custId
     * @param SrcType (CPR:个人,KOB:集团)
     * @param strDate
     * @param endDate
     * @param strIdx
     * @param endIdx
     * @return
     * @throws Exception
     *
     * @version v1.0.0
     * @author yangjh
     * @date 2014-12-21 下午4:55:09
     *
     * <strong>Modification History:</strong><br>
     * Date         Author          Version            Description<br>
     * ---------------------------------------------------------<br>
     * 2014-12-21     yangjh           v1.0.0               修改原因<br>
     */
    public DataContainer[] queryTicketListForCm(long custId, String SrcType, String errorCode, String strDate, String endDate, int strIdx, int endIdx) throws Exception;

    /**
     * 查询故障单信息数量
     * @Function queryTicketListCountForCm
     * @Description
     *
     * @param custId
     * @param SrcType
     * @param strDate
     * @param endDate
     * @return
     * @throws Exception
     *
     * @version v1.0.0
     * @author yangjh
     * @date 2014-12-21 下午4:56:50
     *
     * <strong>Modification History:</strong><br>
     * Date         Author          Version            Description<br>
     * ---------------------------------------------------------<br>
     * 2014-12-21     yangjh           v1.0.0               修改原因<br>
     */
    public int queryTicketListCountForCm(long custId, String SrcType, String errorCode, String strDate, String endDate) throws Exception;

    }
