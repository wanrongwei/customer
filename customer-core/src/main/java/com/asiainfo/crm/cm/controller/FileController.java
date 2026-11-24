package com.asiainfo.crm.cm.controller;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.common.util.ExceptionUtil;
import com.aie.api.tool.XmlParameters;
import com.aie.api.vo.ResultVoBuilder;
import com.asiainfo.crm.cm.busimodel.common.ParamUtil;
import com.asiainfo.crm.cm.common.util.CmCommonUtil;
import com.asiainfo.crm.cm.model.ivalues.ICustomerValue;
import com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV;
import com.asiainfo.crm.cm.vo.QueryB2BCustomerVO;
import com.google.gson.Gson;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.servlet.http.HttpServletResponse;
import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Colour;
import jxl.write.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RestController("ci-fileController")
@RequestMapping("/api/cm/file")
@Slf4j
public class FileController {

    /** B2B customer export row cap (business limit). ai-fixbug-jira: VERISPR-3557 */
    private static final int MAX_B2B_EXPORT_ROWS = 3000;

    /** ResultVo business code when export row count exceeds {@link #MAX_B2B_EXPORT_ROWS}. */
    private static final int CODE_EXPORT_ROW_LIMIT_EXCEEDED = 3;

    @Operation(tags = "file",summary ="exportB2BCustomers", description = "Export B2B Customers")
    @RequestMapping(value = "/customers/b2b", method = RequestMethod.POST)
    @ResponseBody
    public void exportB2BCustomers(@RequestBody QueryB2BCustomerVO queryVO,
                                   HttpServletResponse response) throws Exception {
        Map cp = new HashMap();
        String retVal = "Y";
        String retMsg ="";

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

            String xmlCondition = xmlParam.toXml();
            DataContainer[] dcs = ParamUtil.parseXmlCriteria(xmlCondition);
            if (CmCommonUtil.isEmptyObject(dcs)) {
                ExceptionUtil.throwBusinessException("CMS0000073");
            }
            if (StringUtils.isNotBlank(custStatus)) {
                dcs[0].set("CUST_STATUS", custStatus);
            }

            ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getCrossCenterService(ICmCustomerSV.class);

            int startNum = -1;
            int endNum = -1;
            int exStart = queryVO.getExportStartRow();
            int exEnd = queryVO.getExportEndRow();
            boolean rangedExport = exStart > 0 && exEnd > 0;
            if (rangedExport) {
                if (exEnd < exStart) {
                    showError(response, "Invalid export row range: end must be >= start.");
                    return;
                }
                long rangeLen = (long) exEnd - exStart + 1;
                if (rangeLen > MAX_B2B_EXPORT_ROWS) {
                    log.warn("B2B export rejected: range length {} exceeds limit {}", rangeLen, MAX_B2B_EXPORT_ROWS);
                    showError(response, "Export row range length cannot exceed " + MAX_B2B_EXPORT_ROWS
                            + " rows. (Requested " + rangeLen + " rows.)", CODE_EXPORT_ROW_LIMIT_EXCEEDED);
                    return;
                }
                startNum = exStart;
                endNum = exEnd;
            } else {
                int matchedRows = customerSV.queryGroupCustCountByCdns(dcs[0]);
                if (matchedRows > MAX_B2B_EXPORT_ROWS) {
                    log.warn("B2B export rejected: matchedRows={} exceeds limit {}", matchedRows, MAX_B2B_EXPORT_ROWS);
                    showError(response, "Export exceeds the maximum of " + MAX_B2B_EXPORT_ROWS
                            + " rows. Please narrow your search criteria and try again. (Matched rows: "
                            + matchedRows + ")", CODE_EXPORT_ROW_LIMIT_EXCEEDED);
                    return;
                }
            }

        try(OutputStream os = response.getOutputStream()) {
            ICustomerValue[] results = customerSV.queryCusts4GroupAndLog(xmlCondition, custStatus, startNum, endNum);

            String fname = "B2BCustomers_"+new Date().getTime();
            response.reset();

            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/x-msdownload");
            response.setHeader("Content-Disposition","attachment;filename="+fname+".xls");

            WritableWorkbook workbook = Workbook.createWorkbook(os);
            WritableSheet sheet = workbook.createSheet("B2B Customers",0);
            WritableFont font = new  WritableFont(WritableFont.ARIAL, 10 ,WritableFont.BOLD);
            font.setColour(Colour.BLACK);
            WritableCellFormat format = new  WritableCellFormat(font);
            format.setBackground(Colour.GRAY_25);
            format.setAlignment(Alignment.CENTRE);

            sheet.addCell(new Label(0,0,"Customer ID",format));
            sheet.addCell(new Label(1,0,"Customer Name",format));
            sheet.addCell(new Label(2,0,"Segment",format));
            sheet.addCell(new Label(3,0,"Account Manager ID",format));
            sheet.addCell(new Label(4,0,"Account Manager Name",format));
            sheet.addCell(new Label(5,0,"Manager Tel.",format));
            sheet.addCell(new Label(6,0,"Customer Status",format));
            sheet.addCell(new Label(7,0,"Date Created",format));

            sheet.setColumnView(0,20);
            sheet.setColumnView(1,20);
            sheet.setColumnView(2,20);
            sheet.setColumnView(3,20);
            sheet.setColumnView(4,20);
            sheet.setColumnView(5,20);
            sheet.setColumnView(6,20);
            sheet.setColumnView(7,20);

            sheet.getSettings().setProtected(false);
            WritableCellFormat lockfont = new  WritableCellFormat();
            lockfont.setLocked(false);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            if(results != null && results.length > 0){
                for(int i=0;i<results.length;i++){
                    sheet.addCell(new Label(0,i+1,String.valueOf(results[i].getCustId())));
                    sheet.addCell(new Label(1,i+1,results[i].getCustName()));
                    sheet.addCell(new Label(2,i+1,results[i].getGroupCustSegment()));
                    sheet.addCell(new Label(3,i+1,String.valueOf(results[i].getManagerId())));
                    sheet.addCell(new Label(4,i+1,results[i].getManagerName()));
                    sheet.addCell(new Label(5,i+1,results[i].getManagerPhone()));
                    sheet.addCell(new Label(6,i+1,results[i].getCustStatusDesc()));
                    sheet.addCell(new Label(7,i+1,sdf.format(results[i].getCreateDate())));
                }
            }

            workbook.write();
            workbook.close();
        } catch (Exception e) {
            log.error("error:",e);
            retMsg = e.getMessage()==null?"":e.getMessage();
            showError(response,retMsg);
        }
    }

    private void showError(HttpServletResponse response, String retMsg) throws IOException {
        showError(response, retMsg, null);
    }

    private void showError(HttpServletResponse response, String retMsg, Integer codeOverride) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        ResultVoBuilder<Map> resultVoBuilder = new ResultVoBuilder<>();
        resultVoBuilder.error().message(retMsg);
        if (codeOverride != null) {
            resultVoBuilder.code(codeOverride);
        }
        Gson gson = new Gson();
        response.getWriter().write(gson.toJson(resultVoBuilder.build()));
    }
}
