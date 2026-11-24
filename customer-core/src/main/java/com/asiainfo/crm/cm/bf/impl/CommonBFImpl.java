package com.asiainfo.crm.cm.bf.impl;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.lang.reflect.InvocationTargetException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.common.SessionManager;
import com.ai.appframe2.privilege.UserInfoInterface;
import com.ai.common.bo.BOBsParaDetailBean;
import com.ai.common.i18n.BusinessException;
import com.ai.common.ivalues.IBOBsParaDetailValue;
import com.ai.common.ivalues.IBOBsStaticDataValue;
import com.ai.common.util.CenterUtil;
import com.ai.oneframe.remote.service.interfaces.IRemoteTransferSV;
import com.ai.oneframe.view.bo.BOOf2ViewBean;
import com.ai.oneframe.view.ivalues.IBOOf2ViewExtValue;
import com.ai.oneframe.view.ivalues.IBOOf2ViewValue;
import com.ai.oneframe.view.service.interfaces.IOf2ViewSV;
import com.asiainfo.crm.cm.common.service.interfaces.ICmCommonSV;
import com.asiainfo.crm.cm.common.util.CmStaticDataUtil;
import com.asiainfo.crm.common.cache.BsCommonDistrictCacheImpl;
import com.asiainfo.crm.common.cache.BsParaDetailCacheImpl;
import com.asiainfo.crm.common.ivalues.IBOBsCommonDistrictValue;
import com.asiainfo.crm.msm.common.StringUtil;
import com.asiainfo.crm.util.BceUtil;
import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ai.appframe2.common.DataContainerInterface;
import com.ai.appframe2.common.Util;
import com.ai.appframe2.complex.cache.CacheFactory;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.appframe2.util.StringUtils;
import com.ai.appframe2.web.DataContainerList;
import com.ai.appframe2.web.HttpUtil;
import com.ai.appframe2.web.fileupload.ApacheUploadTool;
import com.ai.common.cache.BsFtpPathCacheImpl;
import com.ai.common.i18n.CrmLocaleFactory;
import com.ai.common.ivalues.IBOBsFtpPathValue;
import com.ai.common.util.ExceptionUtil;
import com.ai.common.util.FtpUtil;
import com.asiainfo.appframe.ext.exeframe.bp.ivalues.IBOBpFtpValue;
import com.asiainfo.appframe.ext.exeframe.bp.service.interfaces.IBpSV;
import com.asiainfo.appframe.ext.exeframe.bp.util.BpFtpUtil;
import com.asiainfo.crm.common.bp.service.interfaces.IVolumnBusinessSV;
import com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV;
import com.asiainfo.crm.so.util.RBossUtil;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class CommonBFImpl {
    /**
     * 校验email地址
     * 
     * @param emailAddress
     * @throws Exception
     */
    public Map checkEmailAddress(String emailAddress) {
        Map cp = new HashMap();
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

    public Map<String, Object> getCurrentDayAlreadyImportDbCount(String templateCode) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String msg = "";
        String ret = "Y";
        try {
            if (com.ai.appframe2.util.StringUtils.isEmptyString(templateCode)) {
                ExceptionUtil.throwBusinessException("BAS3000107");
            }
            IBpSV bpsv = (IBpSV) ServiceFactory.getService(IBpSV.class);
            long count = bpsv.getCurrentDayAlreadyImportDbCount(templateCode);
            if (log.isDebugEnabled())
                log.debug("current day already import db count :" + count);
            msg = String.valueOf(count);
        } catch (Exception ex) {
            if (log.isErrorEnabled()) {
                log.error(ex.getMessage(), ex);
            }
            ret = "N";
            msg = CrmLocaleFactory.getResource("BAS3000108") + ex.getMessage();
        } finally {
            cp.put("ret", ret);
            cp.put("msg", msg);
        }
        return cp;
    }

    private final static long DEFAULT_FILE_MAX_SIZE = 10 * 1024 * 1024;

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private HttpServletResponse response;

    public Map<String, Object> fileImport(String templateCode, String remindNumber, String bookingDate, String remarks,
            String ftpId, String yetUpload) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String msg = "";
        String fileid = "";
        String ret = "Y";
        String fileName = "";
        String ftpFileName = "";
        String ftpFileNameTemp = "";
        IVolumnBusinessSV vbSV = (IVolumnBusinessSV) ServiceFactory.getService(IVolumnBusinessSV.class);

        IBOBpFtpValue bpFtp = null;
        BpFtpUtil ftpUtil = null;
        boolean isUpload = false;
        try {
            // 判断模板code是否为空
            if (com.ai.appframe2.util.StringUtils.isEmptyString(templateCode)) {
                ExceptionUtil.throwBusinessException("BAS3000107");
            }

            // 获取ftp
            bpFtp = vbSV.getBpFtp(Long.parseLong(ftpId));
            if (bpFtp == null || bpFtp.isNew()) {
                ExceptionUtil.throwBusinessException("BAS3000030", ftpId);
            }

            // 获取页面上传的文件
            Object[] obj = ApacheUploadTool.getUploadFileInfo(request);
            List aFileList = (List) obj[0];
            Map xmlMap = (Map) obj[1];
            String templateForm = (String) xmlMap.get("templateForm");
            String busiPara = "";

            // 判断模板表单是否为空
            if (!com.ai.appframe2.util.StringUtils.isEmptyString(templateForm)) {
                templateForm = new String(templateForm.getBytes(HttpUtil.CHARSET_ISO8859), "UTF-8");

                // 解决xml串中存在' '时，转换成对象时出现空指针，把对应的空格去除.
                templateForm = templateForm.replaceAll("&apos;&nbsp;&apos;", "&apos;&apos;");
                // 获取表单和字段
                DataContainerList[] lists = HttpUtil.getDataContainerLists(templateForm, null);
                DataContainerInterface dc = lists[0].getColDataContainerInterface(0)[0];
                busiPara = dc.getAsString("BUSI_DATA_PARA");
            }
            // ***********************
            if (log.isDebugEnabled()) {
                log.debug("BUSI_DATA_PARA:" + busiPara);
            }

            // 文件不存在
            if (aFileList == null || aFileList.size() == 0) {
                ExceptionUtil.throwBusinessException("BAS3000031");
            }
            // 文件存在
            FileItem fileItem = (FileItem) aFileList.get(0);

            // 去除前后空格
            fileName = fileItem.getName().trim();
            // 替换\\
            fileName = fileName.replace("\\", "/");
            // 去除目录名
            if (fileName.indexOf("/") > 0) {
                fileName = fileName.substring(fileName.lastIndexOf("/") + 1);
            }
            if (log.isDebugEnabled()) {
                log.debug("fileName:" + fileName + ",yet upload:" + yetUpload);
            }

            ftpFileName = fileName;
            // 文件未上传
            if ("0".equals(yetUpload)) {
                if (log.isDebugEnabled()) {
                    log.debug("upload to ftp...fileName:" + fileName);
                }

                /**
                 * add by liyy9 文件大小限制
                 * 
                 */
                long docSize = fileItem.getSize();
                if (docSize == 0) {
                    // throw new Exception("上传文件的大小不能为0M!");
                    throw new Exception(CrmLocaleFactory.getResource("SOS9010059"));
                }
                if (docSize > DEFAULT_FILE_MAX_SIZE) {
                    // throw new Exception("上传文件的大小不能大于10M!");
                    throw new Exception(CrmLocaleFactory.getResource("BAS6100093"));
                }

                // begin add by gaoxy for [事由：bp公共action修改，上传文件报错 DMP：Telenor_BUG_20150512_0058
                // 和 Telenor_BUG_20150512_0057]
                // 解决：如果用虚拟桌面上传文件，比如期望的是importAM.txt，却获取到\\ossfilet01\XA_2K12_folder_redirect$\TISH.SONOFON.DOM\Documents\importAM.txt
                try {
                    fileName = fileName.replaceAll("\\\\", "/");
                    if (fileName.contains("/")) {
                        int lastIndex = fileName.lastIndexOf("/");
                        fileName = fileName.substring(lastIndex + 1, fileName.length());
                    }
                } catch (Exception e) {
                    log.error("ftp file name is:" + fileName + "\t\tError occurs when get real fileName:", e);
                }
                // end add by gaoxy for [事由：bp公共action修改，上传文件报错 DMP：Telenor_BUG_20150512_0058 和
                // Telenor_BUG_20150512_0057]

                ftpFileName = System.currentTimeMillis() + "^" + fileName;
                // 截取空格 tab
                ftpFileName = ftpFileName.replaceAll(" ", "").replaceAll("\t", "");

                if (log.isDebugEnabled()) {
                    log.debug("ftp file name is:" + ftpFileName);
                }
                ftpUtil = new BpFtpUtil(bpFtp);
                // begin add by gaoxy for [事由：bp公共action修改，上传文件报错 DMP：Telenor_BUG_20150512_0058
                // 和 Telenor_BUG_20150512_0057]
                ftpFileNameTemp = ftpFileName;
                if (bpFtp != null) {
                    if ("Y".equalsIgnoreCase(bpFtp.getSecure()) || "1".equalsIgnoreCase(bpFtp.getSecure())) {
                        // SFTP
                        if (bpFtp.getRemotePath() != null && bpFtp.getRemotePath().startsWith("/")) {
                            ftpUtil.changeWorkingDirectory("/");
                            if (bpFtp.getRemotePath().endsWith("/")) {
                                ftpFileNameTemp = ftpUtil.getCurrentWorkingDirectory() + bpFtp.getRemotePath()
                                        + ftpFileNameTemp;
                            } else {
                                ftpFileNameTemp = ftpUtil.getCurrentWorkingDirectory() + bpFtp.getRemotePath() + "/"
                                        + ftpFileNameTemp;
                            }
                        }
                    }
                }
                ftpUtil.upload(ftpFileNameTemp, fileItem.getInputStream(), FtpUtil.BIN);
                // end add by gaoxy for [事由：bp公共action修改，上传文件报错 DMP：Telenor_BUG_20150512_0058 和
                // Telenor_BUG_20150512_0057]
                isUpload = true;
            }

            // 生成文件批次
            Timestamp bkDate = Timestamp.valueOf(bookingDate);
            long fileId = vbSV.createBPFile(templateCode, fileName, ftpFileName, remindNumber, remarks, bkDate,
                    busiPara);

            fileid = String.valueOf(fileId);

            msg = CrmLocaleFactory.getResource("BAS3000028", String.valueOf(fileId));
        } catch (Exception ex) {
            // 如果文件已经上传，则删除
            if (isUpload) {
                ftpUtil.delete(ftpFileNameTemp);
                // ftpUtil.delete(ftpFileName);
            }

            log.error(CrmLocaleFactory.getResource("BAS3000029"), ex);
            ret = "N";
            msg = CrmLocaleFactory.getResource("BAS3000029") + ": " + ex.getMessage();
        } finally {
            if (ftpUtil != null) {
                ftpUtil.close();
            }
            cp.put("ret", ret);
            cp.put("msg", msg);
            cp.put("fileid", fileid);
            showFileUploadMsg(response, cp);
        }
        return cp;
    }

    public Map<String, Object> fileImportBackground(String templateCode, String remindNumber, String bookingDate,
            String remarks,
            String ftpId, String yetUpload)
            throws Exception {
        Map<String, Object> cp = new HashMap<>();

        String msg = "";
        String fileid = "";
        String ret = "Y";
        String fileName = "";// 本地文件名
        String ftpFileName = "";// ftp文件
        IVolumnBusinessSV vbSV = (IVolumnBusinessSV) ServiceFactory.getService(IVolumnBusinessSV.class);
        IBOBpFtpValue bpFtp = null;
        BpFtpUtil ftpUtil = null;

        boolean isUpload = false;
        FtpUtil ftp = null;
        BufferedWriter writer = null;
        String ftpPath = "BP_TEMP_LOG_FTP";
        try {
            // 判断模板code是否为空
            if (StringUtils.isEmptyString(templateCode)) {
                ExceptionUtil.throwBusinessException("BAS3000107");
            }
            // 获取ftp
            bpFtp = vbSV.getBpFtp(Long.parseLong(ftpId));
            if (bpFtp == null || bpFtp.isNew()) {
                ExceptionUtil.throwBusinessException("BAS3000030", ftpId);
            }
            // 获取页面上传的文件
            Object[] obj = ApacheUploadTool.getUploadFileInfo(request);
            List aFileList = (List) obj[0];
            Map xmlMap = (Map) obj[1];
            String templateForm = (String) xmlMap.get("templateForm");
            String busiPara = "";

            // 判断模板表单是否为空
            if (!StringUtils.isEmptyString(templateForm)) {
                templateForm = new String(templateForm.getBytes(HttpUtil.CHARSET_ISO8859), "UTF-8");
                // 解决xml串中存在' '时，转换成对象时出现空指针，把对应的空格去除.
                templateForm = templateForm.replaceAll("&apos;&nbsp;&apos;", "&apos;&apos;");
                // log.error("==="+templateForm);
                // 获取表单和字段
                DataContainerList[] lists = HttpUtil.getDataContainerLists(templateForm, null);
                DataContainerInterface dc = lists[0].getColDataContainerInterface(0)[0];
                busiPara = dc.getAsString("BUSI_DATA_PARA");
            }

            // ***********************
            if (log.isDebugEnabled()) {
                log.debug("BUSI_DATA_PARA:" + busiPara);
            }

            IBOBsFtpPathValue objIBsFtpPathValue = (IBOBsFtpPathValue) CacheFactory.get(BsFtpPathCacheImpl.class,
                    ftpPath);
            String localPath = objIBsFtpPathValue.getLocalPath();// 获取本地路径
            // 写文件
            String localFileName = System.currentTimeMillis() + "^" + "bill.txt";

            String sheetTitle = "";
            String title = "";
            List columnTitle = new ArrayList();// 列名（但bp目前框架，建议不使用列名）
            List text = new ArrayList();// 列数据，每列数据都放在一个list里面

            String[] param = busiPara.split("\\|");
            String[] billInfo = null;
            String bills = "";
            if (templateCode.startsWith("BATCH_SUSPENSION_RESUMPTION")
                    || templateCode.startsWith("BATCH_PRETERMINATION_REACCESS")) {// 批量停复机,//批量预销户重入网
                bills = param[0];// 手机号码建议放在第一位（统一模板）
                billInfo = bills.split(",");// 获取号码

                // List temp = new ArrayList();
                // for(int i =0;i<billInfo.length;i++){
                // temp.add(billInfo[i]);
                // };
                // text.add(temp);
                writer = new BufferedWriter(new FileWriter(localPath + "/" + localFileName));
                try {
                    for (int i = 0; i < billInfo.length; i++) {
                        writer.write(billInfo[i]);
                        writer.newLine();
                    }
                } catch (Exception e) {
                    throw e;
                } finally {
                    writer.close();
                }

            } else if (templateCode.startsWith("BATCH_CHANGE_CARD") || templateCode.startsWith("BATCH_CHANGE_NUMBER")
                    || templateCode.startsWith("BATCH_PRE_TERMINATE")
                    || templateCode.startsWith("BATCH_TRANSFER_OWERSHIP")) {
                this.writeToFile(bookingDate, busiPara, localPath, localFileName);
            }

            // 写excel文件公共方法
            // writeExcel( localPath, localFileName,sheetTitle, title, columnTitle, text);

            ftpFileName = localFileName;
            fileName = localFileName;
            // 文件未上传
            if ("0".equals(yetUpload)) {
                if (log.isDebugEnabled()) {
                    log.debug("upload to ftp...fileName:" + fileName);
                }
                // 截取空格 tab
                ftpFileName = ftpFileName.replaceAll(" ", "").replaceAll("\t", "");

                if (log.isDebugEnabled()) {
                    log.debug("ftp file name is:" + ftpFileName);
                }
                ftp = new FtpUtil(ftpPath);
                ftp.upload(ftpFileName, fileName, FtpUtil.BIN);
                isUpload = true;
            }

            // 生成文件批次
            Timestamp bkDate = Timestamp.valueOf(bookingDate);
            long fileId = vbSV.createBPFile(templateCode, fileName, ftpFileName, remindNumber, remarks, bkDate,
                    busiPara);

            fileid = String.valueOf(fileId);

            msg = CrmLocaleFactory.getResource("BAS3000028", String.valueOf(fileId));
        } catch (Exception ex) {
            // 如果文件已经上传，则删除
            if (isUpload) {
                ftp.delete(fileName);
            }

            log.error(CrmLocaleFactory.getResource("BAS3000029"), ex);
            ret = "N";
            msg = CrmLocaleFactory.getResource("BAS3000029") + ex.getMessage();
        } finally {
            if (ftpUtil != null) {
                ftpUtil.close();
            }
            if (ftp != null) {
                ftp.close();
            }
            if (writer != null) {
                writer.close();
            }
        }
        cp.put("ret", ret);
        cp.put("msg", msg);
        cp.put("fileid", fileid);
        showFileUploadMsg(response, cp);
        return cp;
    }

    /**
     * 写入文件
     * 
     * @param busiPara
     * @param localPath
     * @param localFileName
     * @throws Exception
     */
    private void writeToFile(String bookingDateStr, String busiPara, String localPath, String localFileName)
            throws Exception {
        BufferedWriter writer = new BufferedWriter(new FileWriter(localPath + "/" + localFileName));
        try {
            // 列数组,忽略最后一列预约时间
            busiPara = busiPara.substring(0, busiPara.length() - bookingDateStr.length() - 1);
            String[] param = busiPara.split("\\|");
            // 每列的行数据
            String[] paramInfo = param[0].split("&");
            int length = paramInfo.length;
            for (int i = 0; i < length; i++) {
                // 每行数据，以|分隔
                String rowData = "";
                for (int j = 0; j < param.length; j++) {
                    paramInfo = param[j].split("&");
                    if (null != paramInfo && paramInfo.length != 0) {
                        if ("" != paramInfo[i]) {
                            rowData += paramInfo[i] + "|";
                        }
                    } else if (null != paramInfo && paramInfo.length == 0) {
                        rowData += "|";
                    }
                }
                rowData = rowData.substring(0, rowData.length() - 1);
                writer.write(rowData);
                writer.newLine();
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (writer != null) {
                writer.close();
            }
        }
    }

    private void showFileUploadMsg(HttpServletResponse response, Map<String, Object> cp) throws Exception {
        try {
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().print(HttpUtil.getHtmlContentType());
            String str = toXmlString(cp);
            str = str.replaceAll("[\\t\\n\\r]", " ");
            String result = "<html><head><script type='text/javascript'>function killUpdate() { window.parent.killUpdate('"
                    + str + "'); }</script></head><body onload='killUpdate()'></body></html>";
            response.getWriter().print(result);
        } catch (Exception var4) {
            throw var4;
        }
    }

    private String toXmlString(Map<String, Object> cp) {
        StringBuilder strBuffer = new StringBuilder();
        strBuffer.append("<UD>");
        if (cp != null) {
            for (Iterator obj = cp.keySet().iterator(); obj.hasNext(); strBuffer.append("</p>")) {
                String sName = obj.next().toString();
                String sValue = (String) cp.get(sName);
                strBuffer.append("<p n=\"").append(sName).append("\">");
                if (sValue != null) {
                    strBuffer.append(Util.checkAndTransStr(sValue));
                }
            }
        }
        strBuffer.append("</UD>");
        return strBuffer.toString();
    }

    public Map<String,String> getNewSequence(String className) throws Exception {
        Map<String,String> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = "";
        try {
            ICmCommonSV commonSV = (ICmCommonSV) ServiceFactory.getService(ICmCommonSV.class);
            Class<?>classz =  Class.forName(className);
            long id = commonSV.getNewSequence(classz);
            retMsg = String.valueOf(id);
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("get Id exception.", e);
            }
            retVal = "N";
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    public Map getCodeNameByCodeTypeAndCodeValue(String codeType, String codeValue) throws Exception {
        Map cp = new HashMap();
        String retVal = "Y";
        String isReturn = "false";
        String retMsg = "";
        try {
            String nowvalue = CmStaticDataUtil.getCodeNameByCodeTypeAndCodeValue(codeType, codeValue);
            if(StringUtils.isEmptyString(nowvalue)){
                isReturn = "true";
            }
        } catch (Exception e) {
            retVal = "N";
            retMsg = e.getCause()==null?e.getMessage():e.getCause().getMessage();
        }finally{
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
            cp.put("isReturn", isReturn);
        }
        return cp;
    }

    public IBOBsParaDetailValue getParaDetailValue(String regionId, String paraType, String paraCode) throws Exception{
        IBOBsParaDetailValue bsParaDetailValue=null;
        try {
             bsParaDetailValue = BceUtil.getParaDetailValue(regionId, paraType, paraCode);
        } catch (Exception e) {
           log.error("getParaDetailValue error:"+regionId+"_"+paraCode+"_"+paraType,e);
        }
        return bsParaDetailValue;
    }

    public String getFormOfAddress()throws Exception{
        IBOBsStaticDataValue[] sdatas = CmStaticDataUtil.getStaticDataByParent(false, "CM_CUST_STATUS", "1");
        StringBuffer sbData = new StringBuffer();
        if(sdatas != null && sdatas.length > 0){
            for (int i = 0;i < sdatas.length;i++){
                if(sbData.length() > 0){
                    sbData.append(",");
                }
                sbData.append("{\"text\":\"");
                sbData.append(sdatas[i].getCodeName());
                sbData.append("\",\"value\":\"");
                sbData.append(sdatas[i].getCodeValue());
                sbData.append("\"}");
            }
        }
        return "["+sbData.toString()+"]";
    }
    private static final DecimalFormat df = new DecimalFormat("#");
    public Map statisticCustData(long custId, String serviceNo, int custType) throws Exception {
        Map cp=new HashMap();
        cp.put("ret_code", "success");
        UserInfoInterface user = SessionManager.getUser();
        IBOOf2ViewExtValue[] views = getCustViews(custType);
        IRemoteTransferSV remoteSV = (IRemoteTransferSV)ServiceFactory.getService(IRemoteTransferSV.class);
        int compaignNum;
        if (views != null && views.length != 0) {
            IBOOf2ViewExtValue[] var49 = views;
            int var48 = views.length;

            for(int var47 = 0; var47 < var48; ++var47) {
                IBOOf2ViewExtValue view = var49[var47];
                if (view.getViewCode() != null && view.getViewCode() != "") {
                    BusinessException be;
                    if (view.getViewCode().equalsIgnoreCase("OrderQuery")) {
                        try {
                            compaignNum = remoteSV.remote_getPendingOrderNum(custId, user.getCode());
                            cp.put("OrderQuery", df.format((long)compaignNum));
                        } catch (InvocationTargetException var41) {
                            if (var41.getTargetException() instanceof BusinessException) {
                                be = (BusinessException)var41.getTargetException();
                                cp.put("ret_code", "failure");
                                cp.put("ret_msg", CrmLocaleFactory.getResource(be.getKey(), be.getArgs()));
                                return cp;
                            }

                            throw var41;
                        } catch (BusinessException var42) {
                            log.error("Something wrong when getPendingOrderNum.......", var42);
                            cp.put("ret_code", "failure");
                            cp.put("ret_msg", CrmLocaleFactory.getResource(var42.getKey(), var42.getArgs()));
                            return cp;
                        } catch (Exception var43) {
                            log.error("Something wrong when getPendingOrderNum.......", var43);
                            cp.put("ret_code", "failure");
                            cp.put("ret_msg", com.asiainfo.appframe.ext.flyingserver.org.apache.commons.lang.StringUtils.isEmpty(var43.getLocalizedMessage()) ? var43.getCause().getLocalizedMessage() : var43.getLocalizedMessage());
                            return cp;
                        }
                    } else if (view.getViewCode().equalsIgnoreCase("Opportunity")) {
                        try {
                            compaignNum = remoteSV.remote_getOpportunityNum(custId, user.getCode());
                            cp.put("Opportunity", df.format((long)compaignNum));
                        } catch (InvocationTargetException var38) {
                            if (var38.getTargetException() instanceof BusinessException) {
                                be = (BusinessException)var38.getTargetException();
                                cp.put("ret_code", "failure");
                                cp.put("ret_msg", CrmLocaleFactory.getResource(be.getKey(), be.getArgs()));
                                return cp;
                            }

                            throw var38;
                        } catch (BusinessException var39) {
                            log.error("Something wrong when getOpportunityNum.......", var39);
                            cp.put("ret_code", "failure");
                            cp.put("ret_msg", CrmLocaleFactory.getResource(var39.getKey(), var39.getArgs()));
                            return cp;
                        } catch (Exception var40) {
                            log.error("Something wrong when getOpportunityNum.......", var40);
                            cp.put("ret_code", "failure");
                            cp.put("ret_msg", com.asiainfo.appframe.ext.flyingserver.org.apache.commons.lang.StringUtils.isEmpty(var40.getLocalizedMessage()) ? var40.getCause().getLocalizedMessage() : var40.getLocalizedMessage());
                            return cp;
                        }
                    } else if (view.getViewCode().equalsIgnoreCase("CaseIndiHistory")) {
                        try {
                            compaignNum = remoteSV.remote_getPendingCaseNum(custId, user.getCode());
                            cp.put("CaseIndiHistory", df.format((long)compaignNum));
                        } catch (InvocationTargetException var35) {
                            if (var35.getTargetException() instanceof BusinessException) {
                                be = (BusinessException)var35.getTargetException();
                                cp.put("ret_code", "failure");
                                cp.put("ret_msg", CrmLocaleFactory.getResource(be.getKey(), be.getArgs()));
                                return cp;
                            }

                            throw var35;
                        } catch (BusinessException var36) {
                            log.error("Something wrong when getPendingCaseNum.......", var36);
                            cp.put("ret_code", "failure");
                            cp.put("ret_msg", CrmLocaleFactory.getResource(var36.getKey(), var36.getArgs()));
                            return cp;
                        } catch (Exception var37) {
                            log.error("Something wrong when getPendingCaseNum.......", var37);
                            cp.put("ret_code", "failure");
                            cp.put("ret_msg", com.asiainfo.appframe.ext.flyingserver.org.apache.commons.lang.StringUtils.isEmpty(var37.getLocalizedMessage()) ? var37.getCause().getLocalizedMessage() : var37.getLocalizedMessage());
                            return cp;
                        }
                    } else if (view.getViewCode().equalsIgnoreCase("CaseCorpHistory")) {
                        try {
                            compaignNum = remoteSV.remote_getPendingCoporateCaseNum(custId, user.getCode());
                            cp.put("CaseCorpHistory", df.format((long)compaignNum));
                        } catch (InvocationTargetException var20) {
                            if (var20.getTargetException() instanceof BusinessException) {
                                be = (BusinessException)var20.getTargetException();
                                cp.put("ret_code", "failure");
                                cp.put("ret_msg", CrmLocaleFactory.getResource(be.getKey(), be.getArgs()));
                                return cp;
                            }

                            throw var20;
                        } catch (BusinessException var21) {
                            log.error("Something wrong when getPendingCoporateCaseNum.......", var21);
                            cp.put("ret_code", "failure");
                            cp.put("ret_msg", CrmLocaleFactory.getResource(var21.getKey(), var21.getArgs()));
                            return cp;
                        } catch (Exception var22) {
                            log.error("Something wrong when getPendingCoporateCaseNum.......", var22);
                            cp.put("ret_code", "failure");
                            cp.put("ret_msg", com.asiainfo.appframe.ext.flyingserver.org.apache.commons.lang.StringUtils.isEmpty(var22.getLocalizedMessage()) ? var22.getCause().getLocalizedMessage() : var22.getLocalizedMessage());
                            return cp;
                        }
                    } else if (view.getViewCode().equalsIgnoreCase("Compaign")) {
                        try {
                            compaignNum = remoteSV.remote_getCompaignNum(custId, serviceNo, user.getCode());
                            cp.put("Compaign", df.format((long)compaignNum));
                        } catch (Exception var44) {
                            log.error("Something wrong when getCompaignNum.......", var44);
                            cp.put("ret_code", "failure");
                            cp.put("ret_msg", com.asiainfo.appframe.ext.flyingserver.org.apache.commons.lang.StringUtils.isEmpty(var44.getLocalizedMessage()) ? var44.getCause().getLocalizedMessage() : var44.getLocalizedMessage());
                        }
                    }
                }
            }
        } else {
            BOOf2ViewBean of2ViewBean = new BOOf2ViewBean();
            IOf2ViewSV sv = (IOf2ViewSV)ServiceFactory.getService(IOf2ViewSV.class);
            of2ViewBean.setViewType("1");
            IBOOf2ViewValue[] of2_views = sv.getViewsByCondition(of2ViewBean);
            if (of2_views != null) {
                BOOf2ViewBean[] var17 = (BOOf2ViewBean[]) of2_views;
                int var16 = of2_views.length;

                for(int i = 0; i < var16; ++i) {
                    IBOOf2ViewValue view = var17[i];
                    if (view.getViewCode() != null && view.getViewCode() != "") {
                        BusinessException be;
                        if (view.getViewCode().equalsIgnoreCase("OrderQuery")) {
                            try {
                                compaignNum = remoteSV.remote_getPendingOrderNum(custId, user.getCode());
                                cp.put("OrderQuery", df.format((long)compaignNum));
                            } catch (InvocationTargetException var29) {
                                if (var29.getTargetException() instanceof BusinessException) {
                                    be = (BusinessException)var29.getTargetException();
                                    cp.put("ret_code", "failure");
                                    cp.put("ret_msg", CrmLocaleFactory.getResource(be.getKey(), be.getArgs()));
                                    return cp;
                                }

                                throw var29;
                            } catch (BusinessException var30) {
                                log.error("Something wrong when getPendingOrderNum.......", var30);
                                cp.put("ret_code", "failure");
                                cp.put("ret_msg", CrmLocaleFactory.getResource(var30.getKey(), var30.getArgs()));
                                return cp;
                            } catch (Exception var31) {
                                log.error("Something wrong when getPendingOrderNum.......", var31);
                                cp.put("ret_code", "failure");
                                cp.put("ret_msg", com.asiainfo.appframe.ext.flyingserver.org.apache.commons.lang.StringUtils.isEmpty(var31.getLocalizedMessage()) ? var31.getCause().getLocalizedMessage() : var31.getLocalizedMessage());
                                return cp;
                            }
                        } else if (view.getViewCode().equalsIgnoreCase("Opportunity")) {
                            try {
                                compaignNum = remoteSV.remote_getOpportunityNum(custId, user.getCode());
                                cp.put("Opportunity", df.format((long)compaignNum));
                            } catch (InvocationTargetException var26) {
                                if (var26.getTargetException() instanceof BusinessException) {
                                    be = (BusinessException)var26.getTargetException();
                                    cp.put("ret_code", "failure");
                                    cp.put("ret_msg", CrmLocaleFactory.getResource(be.getKey(), be.getArgs()));
                                    return cp;
                                }

                                throw var26;
                            } catch (BusinessException var27) {
                                log.error("Something wrong when getOpportunityNum.......", var27);
                                cp.put("ret_code", "failure");
                                cp.put("ret_msg", CrmLocaleFactory.getResource(var27.getKey(), var27.getArgs()));
                                return cp;
                            } catch (Exception var28) {
                                log.error("Something wrong when getOpportunityNum.......", var28);
                                cp.put("ret_code", "failure");
                                cp.put("ret_msg", com.asiainfo.appframe.ext.flyingserver.org.apache.commons.lang.StringUtils.isEmpty(var28.getLocalizedMessage()) ? var28.getCause().getLocalizedMessage() : var28.getLocalizedMessage());
                                return cp;
                            }
                        } else if (view.getViewCode().equalsIgnoreCase("CaseIndiHistory")) {
                            try {
                                compaignNum = remoteSV.remote_getPendingCaseNum(custId, user.getCode());
                                cp.put("CaseIndiHistory", df.format((long)compaignNum));
                            } catch (InvocationTargetException var23) {
                                if (var23.getTargetException() instanceof BusinessException) {
                                    be = (BusinessException)var23.getTargetException();
                                    cp.put("ret_code", "failure");
                                    cp.put("ret_msg", CrmLocaleFactory.getResource(be.getKey(), be.getArgs()));
                                    return cp;
                                }

                                throw var23;
                            } catch (BusinessException var24) {
                                log.error("Something wrong when getPendingCaseNum.......", var24);
                                cp.put("ret_code", "failure");
                                cp.put("ret_msg", CrmLocaleFactory.getResource(var24.getKey(), var24.getArgs()));
                                return cp;
                            } catch (Exception var25) {
                                log.error("Something wrong when getPendingCaseNum.......", var25);
                                cp.put("ret_code", "failure");
                                cp.put("ret_msg", com.asiainfo.appframe.ext.flyingserver.org.apache.commons.lang.StringUtils.isEmpty(var25.getLocalizedMessage()) ? var25.getCause().getLocalizedMessage() : var25.getLocalizedMessage());
                                return cp;
                            }
                        } else if (view.getViewCode().equalsIgnoreCase("CaseCorpHistory")) {
                            try {
                                compaignNum = remoteSV.remote_getPendingCoporateCaseNum(custId, user.getCode());
                                cp.put("CaseCorpHistory", df.format((long)compaignNum));
                            } catch (InvocationTargetException var32) {
                                if (var32.getTargetException() instanceof BusinessException) {
                                    be = (BusinessException)var32.getTargetException();
                                    cp.put("ret_code", "failure");
                                    cp.put("ret_msg", CrmLocaleFactory.getResource(be.getKey(), be.getArgs()));
                                    return cp;
                                }

                                throw var32;
                            } catch (BusinessException var33) {
                                log.error("Something wrong when getPendingCoporateCaseNum.......", var33);
                                cp.put("ret_code", "failure");
                                cp.put("ret_msg", CrmLocaleFactory.getResource(var33.getKey(), var33.getArgs()));
                                return cp;
                            } catch (Exception var34) {
                                log.error("Something wrong when getPendingCoporateCaseNum.......", var34);
                                cp.put("ret_code", "failure");
                                cp.put("ret_msg", com.asiainfo.appframe.ext.flyingserver.org.apache.commons.lang.StringUtils.isEmpty(var34.getLocalizedMessage()) ? var34.getCause().getLocalizedMessage() : var34.getLocalizedMessage());
                                return cp;
                            }
                        } else if (view.getViewCode().equalsIgnoreCase("Compaign")) {
                            try {
                                compaignNum = remoteSV.remote_getCompaignNum(custId, serviceNo, user.getCode());
                                cp.put("Compaign", df.format((long)compaignNum));
                            } catch (Exception var45) {
                                log.error("Something wrong when getCompaignNum.......", var45);
                                cp.put("ret_code", "failure");
                                cp.put("ret_msg", com.asiainfo.appframe.ext.flyingserver.org.apache.commons.lang.StringUtils.isEmpty(var45.getLocalizedMessage()) ? var45.getCause().getLocalizedMessage() : var45.getLocalizedMessage());
                            }
                        }
                    }
                }
            }
        }
        return cp;
    }
    private static IBOOf2ViewExtValue[] getCustViews(int custType) throws Exception {
        UserInfoInterface user = SessionManager.getUser();
        int systemCode = 1;
        long visualId = user.getID();
        if (log.isDebugEnabled()) {
            log.debug("FrameCommonAction.getCustViews(" + custType + ")...");
        }

        if (custType <= 0) {
            return null;
        } else {
            IOf2ViewSV sv = (IOf2ViewSV) ServiceFactory.getService(IOf2ViewSV.class);
            IBOOf2ViewExtValue[] views = sv.queryOpViewsExt("1", visualId);
            List<IBOOf2ViewExtValue> viewList = new ArrayList();
            if (views != null && views.length > 0) {
                for(int len = 0; len < views.length; ++len) {
                    if ((long)systemCode == views[len].getOwnSys() && (long)custType == views[len].getCustType()) {
                        viewList.add(views[len]);
                    }
                }
            }

            return (IBOOf2ViewExtValue[])viewList.toArray(new IBOOf2ViewExtValue[0]);
        }
    }

    public IBOBsStaticDataValue[] getStaticDataByParent(boolean isChoose, String codeType, String parentCodeValue) throws Exception {
        return CmStaticDataUtil.getStaticDataByParent(isChoose,codeType,parentCodeValue);
    }

    public String getRegionIdByUserId(long userId) throws Exception{
        return CenterUtil.getRegionIdByUserId(userId);
    }
}
