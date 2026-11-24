# CmIndivCustomerRequestInfo.jsp 分析说明

## 文档信息

- JSP路径：`CM-core/doc/jsp/CmIndivCustomerRequestInfo.jsp`
- 规则依据：`agr-api-doc-sync`（仅标注已存在接口，不新增API配置）

## 页面概述

该页为“使用者请求信息”只读展示页，通过 `custId` 查询请求任务信息并展示。

## 主要调用点

- dbform：
  - `ICmCustRequestTaskSV#queryByCustIdForShow(long custId)`
- 页面初始化：
  - `g_FormRowSetManager.get("frmCustRequestTaskInfo").refresh("custId="+custId)`

## 已存在接口ID映射

| JSP动作/方法 | 现有API路径 | 方法来源 | sys_id |
|---|---|---|---|
| queryByCustIdForShow | `/api/cm/service/ICmCustRequestTaskSV/queryByCustIdForShow` | `com.asiainfo.crm.cm.dk.service.interfaces.ICmCustRequestTaskSV#queryByCustIdForShow` | 748 |

## 结论

- 本页核心查询已在现有配置中命中 `sys_id=748`。
- 无需新增接口配置。

