# CmPartyInfoForUser.jsp 分析说明

## 文档信息

- JSP路径：`CM-core/doc/jsp/CmPartyInfoForUser.jsp`
- 规则依据：`agr-api-doc-sync`（仅标注已存在接口，不新增API配置）

## 页面概述

该页用于“分配使用者”流程中的客户/参与人查询与保存：
- 查询参与人列表
- 选中参与人后获取 `custId`
- 将号码与用户关系保存给目标客户

## 主要调用点

### 1) 表格查询服务

- `ICmPartySV#queryPartyInfoForUser(...)`
- `ICmPartySV#queryPartyInfoForUserCount(...)`

### 2) 前端 PostInfo 调用

- `CmIndivAction?action=getCustId&partyId=...`
- `CmIndivCustomerAction?action=saveInsUser&custId=...`

## 已存在接口ID映射

| JSP动作/方法 | 现有API路径 | 方法来源 | sys_id |
|---|---|---|---|
| queryPartyInfoForUser | （文档中已配置，对应 Party 查询接口） | `com.asiainfo.crm.cm.service.interfaces.ICmPartySV#queryPartyInfoForUser` | 123 |
| queryPartyInfoForUserCount | （文档中已配置，对应 Party 统计接口） | `com.asiainfo.crm.cm.service.interfaces.ICmPartySV#queryPartyInfoForUserCount` | 124 |
| getCustId（按 partyId） | `/api/cm/party/queryCustId/{partyId}` | `com.asiainfo.crm.cm.bf.impl.UserBFImpl#getCustId` | 128 |
| saveInsUser | `/api/cm/party/saveInsUser` | `com.asiainfo.crm.cm.bf.impl.UserBFImpl#saveInsUser` | 129 |

## 说明

- 同名 `getCustId` 在 CM 模块中存在多个接口（如 `201`、`704`），本页按调用语义（`partyId -> custId`）对应 `sys_id=128`。
- 不新增任何 API 配置。

