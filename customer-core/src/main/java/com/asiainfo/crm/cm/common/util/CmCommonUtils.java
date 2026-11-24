package com.asiainfo.crm.cm.common.util;

import com.ai.appframe2.common.DataStructInterface;
import com.ai.appframe2.common.ServiceManager;
import com.ai.appframe2.common.SessionManager;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.common.i18n.CrmLocaleFactory;
import com.ai.common.util.ExceptionUtil;
import com.ai.secframe.client.SecframeClient;
import com.asiainfo.crm.cm.common.service.interfaces.ICmCommonSV;
import com.asiainfo.crm.cm.common.util.ws.address;
import com.asiainfo.crm.constant.CmConstants;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;

import java.lang.reflect.Array;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Slf4j
public class CmCommonUtils {
    /**
     * 判断集合是否为空
     *
     * @Function: isNotEmptyObject
     * @Description: 判断集合是否为空
     *
     * @param collection
     * @return true：非空；false：空
     *
     * @version: v1.0.0
     * @author: huzq2
     * @date: Mar 28, 2011 10:00:47 PM
     *
     * Modification History: Date Author Version Description
     * ---------------------------------------------------------* Mar 28, 2011
     * huzq2 v1.0.0 修改原因
     */
    public static boolean isNotEmptyObject(Collection collection) {
        return (collection != null && !collection.isEmpty());
    }

    /**
     * 判断集合是否为空
     *
     * @Function isEmptyObject
     * @Description
     *
     * @param collection
     * @return true：空；false：非空
     *
     * @version v1.0.0
     * @author huzq
     * @date 2012-6-11 下午3:24:19
     *
     * <strong>Modification History:</strong><br>
     * Date Author Version Description<br>
     * ---------------------------------------------------------<br>
     * 2012-6-11 huzq v1.0.0 修改原因<br>
     */
    public static boolean isEmptyObject(Collection collection) {
        return (collection == null || collection.isEmpty());
    }

    /**
     * 判断Map是否为空
     *
     * @Function: isNotEmptyObject
     * @Description: 判断Map是否为空
     *
     * @param map
     * @return true：非空；false：空
     *
     * @version: v1.0.0
     * @author: huzq2
     * @date: Mar 28, 2011 10:00:35 PM
     *
     * Modification History: Date Author Version Description
     * ---------------------------------------------------------* Mar 28, 2011
     * huzq2 v1.0.0 修改原因
     */
    public static boolean isNotEmptyObject(Map map) {
        return (map != null && !map.isEmpty());
    }

    /**
     * 判断Map是否为空
     *
     * @Function isEmptyObject
     * @Description
     *
     * @param map
     * @return true：空；false：非空
     *
     * @version v1.0.0
     * @author huzq
     * @date 2012-6-11 下午3:21:29
     *
     * <strong>Modification History:</strong><br>
     * Date Author Version Description<br>
     * ---------------------------------------------------------<br>
     * 2012-6-11 huzq v1.0.0 修改原因<br>
     */
    public static boolean isEmptyObject(Map map) {
        return (map == null || map.isEmpty());
    }

    /**
     * @Function: isNotEmptyObject
     * @Description: 判断平台的容器是否为空
     *
     * @param dataStruct
     * @return true：非空；false：空
     *
     * @version: v1.0.0
     * @author: huzq2
     * @date: Mar 28, 2011 10:06:57 PM
     *
     * Modification History: Date Author Version Description
     * ---------------------------------------------------------* Mar 28, 2011
     * huzq2 v1.0.0 修改原因
     */
    public static boolean isNotEmptyObject(DataStructInterface dataStruct) {
        return (dataStruct != null && isNotEmptyObject(dataStruct.getProperties()));
    }

    /**
     * 判断平台的容器是否为空
     *
     * @Function isEmptyObject
     * @Description
     *
     * @param dataStruct
     * @return true：空；false：非空
     *
     * @version v1.0.0
     * @author huzq
     * @date 2012-6-11 下午3:20:21
     *
     * <strong>Modification History:</strong><br>
     * Date Author Version Description<br>
     * ---------------------------------------------------------<br>
     * 2012-6-11 huzq v1.0.0 修改原因<br>
     */
    public static boolean isEmptyObject(DataStructInterface dataStruct) {
        return (dataStruct == null || isEmptyObject(dataStruct.getProperties()));
    }

    /**
     * @Function: isNotEmptyObject
     * @Description: 判断数组是否为空
     *
     * @param objs
     * @return true：非空；false：空
     *
     * @version: v1.0.0
     * @author: huzq2
     * @date: Mar 28, 2011 9:52:45 PM
     *
     * Modification History: Date Author Version Description
     * ---------------------------------------------------------* Mar 28, 2011
     * huzq2 v1.0.0 修改原因
     */
    public static boolean isNotEmptyObject(Object[] objs) {
        return (objs != null && Array.getLength(objs) > 0);
    }

    /**
     * 判断数组是否为空
     *
     * @Function isEmptyObject
     * @Description
     *
     * @param objs
     * @return true：空；false：非空
     *
     * @version v1.0.0
     * @author huzq
     * @date 2012-6-11 下午3:25:49
     *
     * <strong>Modification History:</strong><br>
     * Date Author Version Description<br>
     * ---------------------------------------------------------<br>
     * 2012-6-11 huzq v1.0.0 修改原因<br>
     */
    public static boolean isEmptyObject(Object[] objs) {
        return (objs == null || Array.getLength(objs) <= 0);
    }


    /**
     *
     * @Function: getStringLengthByChar
     * @Description: 获取字符串长度，中文算两个字符
     *
     * @param str
     * @return
     *
     * @version: v1.0.0
     * @author: xialing
     * @date: Jul 12, 2011 9:40:24 PM
     *
     * Modification History: Date Author Version Description
     * ---------------------------------------------------------* Jul 12, 2011
     * xialing v1.0.0 修改原因
     */
    public static int getStringLengthByChar(String str) {
        int result = 0;
        if (!com.ai.appframe2.util.StringUtils.isEmptyString(str)) {
            result = str.replaceAll("[^x00-xff]", "**").length();
        }
        return result;
    }

    /**
     *
     * @Function: subStringByCharLength
     * @Description: 分隔一个超长字符串
     *
     * @param str
     * @param len
     *            每个分段的长度，中文算两个字符长度
     * @return
     *
     * @version: v1.0.0
     * @author: xialing
     * @date: Jul 12, 2011 9:50:35 PM
     *
     * Modification History: Date Author Version Description
     * ---------------------------------------------------------* Jul 12, 2011
     * xialing v1.0.0 修改原因
     */
    public static List subStringByCharLength(String str, int len) throws Exception {
        List result = new ArrayList();
        if (com.ai.appframe2.util.StringUtils.isEmptyString(str)) {
            result.add("");
        } else if (len <= 0) {
            result.add(str);
        } else if (getStringLengthByChar(str) <= len) {
            result.add(str);
        } else {
            String tmp = null;
            while (!com.ai.appframe2.util.StringUtils.isEmptyString(str)) {
                tmp = byteSubstring(str, len);
                if (com.ai.appframe2.util.StringUtils.isEmptyString(tmp)) {
                    result.add("");
                    break;
                }
                result.add(tmp);
                str = str.substring(tmp.length());
            }
        }
        return result;
    }

    /**
     *
     * @Function: byteSubstring
     * @Description: 根据字符长度截取字符串，中文算两个字符
     *
     * @param str
     * @param len
     * @return
     * @throws Exception
     *
     * @version: v1.0.0
     * @author: huzq2
     * @date: Jul 12, 2011 10:56:08 PM
     *
     * Modification History: Date xialing Version Description
     * ---------------------------------------------------------* Jul 12, 2011
     * xialing v1.0.0 修改原因
     */
    public static String byteSubstring(String str, int len) throws Exception {
        String result = "";
        if (!com.ai.appframe2.util.StringUtils.isEmptyString(str)) {
            byte[] bt = str.getBytes(StandardCharsets.UTF_8);
            if (bt.length <= len) {
                result = new String(bt, 0, bt.length, StandardCharsets.UTF_8);
            } else {
                if (bt[len] < 0) { // 最后一个是否为负
                    int count = 0; // 统计byte数组中负数的个数
                    for (int i = 0; i < len; i++) {
                        if (bt[i] < 0) {
                            count++;
                        }
                    }
                    if (count % 2 == 1) { // 如果是负的字节个数为奇数，那么丢弃最后一个负数
                        len = len - 1;
                    }
                }
                result = new String(bt, 0, len, StandardCharsets.UTF_8);
            }
        }
        return result;
    }

    /**
     * @Title: closeJDBC
     * @Description: 关闭数据库相关资源
     * @param conn
     * @param sta
     * @param rs
     */
    public static void closeJDBC(Connection conn, Statement sta, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                if (log.isErrorEnabled()) {
                    log.error(CrmLocaleFactory.getResource("CMS0000161"), e);
                }
            }
        }
        if (sta != null) {
            try {
                sta.close();
            } catch (SQLException e) {
                if (log.isErrorEnabled()) {
                    log.error(CrmLocaleFactory.getResource("CMS0000162"), e);
                }
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                if (log.isErrorEnabled()) {
                    log.error(CrmLocaleFactory.getResource("CMS0000163"), e);
                }
            }
        }
    }
    public static String[] getCycleYYMM(String startDate, String endDate) throws Exception {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        List list = new ArrayList();
        if (StringUtils.isNotBlank(startDate) && StringUtils.isNotBlank(endDate)) {
            Date sDate = dateFormat.parse(startDate);
            Date eDate = dateFormat.parse(endDate);
            Calendar sCal = Calendar.getInstance();
            Calendar eCal = Calendar.getInstance();
            if (sDate != null) {
                sCal.setTime(sDate);
                eCal.setTime(eDate);
                if (eCal.compareTo(sCal) < 0) {
                    // 错误：开始时间大于结束时间，不能计算帐期！
                    ExceptionUtil.throwBusinessException("CMS0010041");
                }
            }
            while (eCal.compareTo(sCal) >= 0
                    || (eCal.compareTo(sCal) < 0 && (eCal.get(Calendar.YEAR) == sCal.get(Calendar.YEAR) && (eCal.get(Calendar.MONTH) == sCal.get(Calendar.MONTH))))) {
                list.add(String.valueOf(sCal.get(Calendar.YEAR) * 100 + sCal.get(Calendar.MONTH) + 1));
                sCal.add(Calendar.MONTH, 1);
            }
            if (!list.isEmpty()) {
                return (String[]) list.toArray(new String[0]);
            }
        }
        return null;
    }

    /**
     * @Function getCustType
     * @Description
     *
     * @param custId
     * @return 客户类型
     * @throws Exception
     *             根据传入的客户编号不能获取到正确的客户编号时抛出业务异常。
     *
     * @version v1.0.0
     * @author huzq2
     * @date 2011-12-15 上午10:31:17
     *
     * <strong>Modification History:</strong><br>
     * Date Author Version Description<br>
     * ---------------------------------------------------------<br>
     * 2011-12-15 huzq2 v1.0.0 修改原因 2012-1-11 huzq2 v1.0.0
     * 直接使用common.jar中的方法，避免因规则变化时引起数据不一致的问题
     */
    public static int getCustType(long custId) throws Exception {
        // 更改为直接使用common.jar中的方法 modified by huzq2 at 2012-1-11
        ICmCommonSV cmCommonSV=(ICmCommonSV)ServiceFactory.getService(ICmCommonSV.class);
        return cmCommonSV.getCustType(custId);
    }

    /**
     * 通过字符的ASCII码值加减进行首字母大写转换
     * @param name 入参
     * @return 首字母大写
     */
    public static String capitalizeFirstLetter(String name) {
        try {
            if (StringUtils.isNotBlank(name) && Character.isLowerCase(name.charAt(0))) {
                char[] chars = name.toCharArray();
                chars[0] -= 32;
                return String.valueOf(chars);
            }
        } catch (Exception e) {
            log.error("capitalizeFirstLetter occur exception.", e);
        }
        return name;
    }

    public static void setCommonFields(DataStructInterface data) throws Exception {
        if (null != data) {
            List<String> propertyList = Arrays.asList(data.getPropertyNames());
            if(data.isNew()){
                if (propertyList.contains("CREATE_ORG_ID") && null == data.get("CREATE_ORG_ID")) {
                    data.set("CREATE_ORG_ID", new BigDecimal(ServiceManager.getUser().getOrgId()));
                }

                if (propertyList.contains("CREATE_OP_ID") && null == data.get("CREATE_OP_ID")) {
                    data.set("CREATE_OP_ID", new BigDecimal(ServiceManager.getUser().getID()));
                }

                if (propertyList.contains("CREATE_DATE") && null == data.get("CREATE_DATE")) {
                    data.set("CREATE_DATE", ServiceManager.getOpDateTime());
                }
                if (propertyList.contains("REGION_ID") && null == data.get("REGION_ID")) {
                    data.set("REGION_ID", getDefaultRegionId());
                }
            }

            if (propertyList.contains("DONE_DATE")) {
                data.set("DONE_DATE", ServiceManager.getOpDateTime());
            }

            if (propertyList.contains("ORG_ID") && ServiceManager.getUser()!=null && ServiceManager.getUser().getOrgId()>0 ) {
                data.set("ORG_ID", new BigDecimal(ServiceManager.getUser().getOrgId()));
            }

            if (propertyList.contains("OP_ID") && ServiceManager.getUser()!=null && ServiceManager.getUser().getID()>0 ) {
                data.set("OP_ID", new BigDecimal(ServiceManager.getUser().getID()));
            }
        }
    }

    public static String getDefaultRegionId() throws Exception{
        ICmCommonSV cmCommonSV=(ICmCommonSV)ServiceFactory.getService(ICmCommonSV.class);
        return cmCommonSV.getDefaultRegionId();
    }
    public static long getNewSequence(Class claz) throws Exception {
        ICmCommonSV sv = (ICmCommonSV) ServiceFactory.getService(ICmCommonSV.class);
        return sv.getCommonNewSequence(claz);
    }
    /**
     * 获取标准地址描述
     * @Function getStandAddressDesc
     * @Description
     *
     * @param inadress
     * @return
     * @throws Exception
     *
     * @version v1.0.0
     * @author yangjh
     * @date 2016-3-3 下午6:11:43
     *
     * <strong>Modification History:</strong><br>
     * Date         Author          Version            Description<br>
     * ---------------------------------------------------------<br>
     * 2016-3-3     yangjh           v1.0.0               修改原因<br>
     */
    public static String getStandAddressDesc(address inadress) throws Exception {
        StringBuffer addrDesc = new StringBuffer("");
        if (inadress != null) {
            String addressType = inadress.getAddressType();
            if ("NON_STANDARD_ADDRESS".equalsIgnoreCase(addressType)) {
                return inadress.getAddrDesc();
            }
            String streetName = inadress.getStreetName();
            String houseNumber = inadress.getHouseNumber();
            String houseLetter = inadress.getHouseLetter();
            String direction = inadress.getApartment();
            String doorNumber = inadress.getDoorNumber();
            String county = inadress.getCounty();
            String poBox = inadress.getPoBox();
            String coName = inadress.getCoName();
            String country = inadress.getCountry();
            String floor = inadress.getFloor();
            String mainDoor = inadress.getMainDoor();
            String streetName2 = inadress.getStreetName2();
            String streetName3 = inadress.getStreetName3();
            String zipCode = inadress.getZipcode();
            String city = inadress.getCity();
            if (StringUtils.isNotBlank(coName)) {
                if (!coName.toUpperCase().contains("C/O")) {
                    addrDesc.append("C/O ").append(coName);
                } else {
                    addrDesc.append(coName);
                }
            }
            if (StringUtils.isNotBlank(poBox)) {
                addrDesc.append(" P.O.BOX ").append(poBox);
            }
            if (StringUtils.isNotBlank(streetName)) {
                addrDesc.append(" ").append(streetName);
                if (StringUtils.isNotBlank(houseNumber)) {
                    addrDesc.append(" ").append(houseNumber);
                }
                if (StringUtils.isNotBlank(houseLetter)) {
                    addrDesc.append(" ").append(houseLetter);
                }
                if (StringUtils.isNotBlank(floor)) {
                    addrDesc.append(",").append(floor);
                }
                if (StringUtils.isNotBlank(mainDoor)) {//TELENOR_DEFECT_20181108_0004增加门牌号TV/TH的展示
                    addrDesc.append(". ").append(mainDoor);
                }
                if (StringUtils.isNotBlank(direction)) {
                    addrDesc.append(".").append(direction);
                } else if (StringUtils.isNotBlank(doorNumber)) {
                    addrDesc.append(".").append(doorNumber);
                }

                if (StringUtils.isNotBlank(county)) {
                    addrDesc.append(" ").append(county);
                }
                if (StringUtils.isNotBlank(streetName2)) {
                    addrDesc.append(" ").append(streetName2);
                }
                if (StringUtils.isNotBlank(streetName3)) {
                    addrDesc.append(" ").append(streetName3);
                }
                if (StringUtils.isNotEmpty(zipCode)) {
                    addrDesc.append(" ").append(zipCode);
                }
                if (StringUtils.isNotEmpty(city)) {
                    addrDesc.append(" ").append(city);
                }

            }
        }
        return addrDesc.toString().trim();

    }
    public static boolean judgeCprProfileSec() throws Exception {
        long opId = SessionManager.getUser().getID();
        return SecframeClient.checkEntityPermission(opId, CmConstants.controlCprInfo.ent_id, CmConstants.controlCprInfo.priv_id);
    }
}
