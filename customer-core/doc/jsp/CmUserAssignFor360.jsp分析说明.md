# CmUserAssignFor360.jsp 分析说明

## 文档信息

- JSP路径：`CM-core/doc/jsp/CmUserAssignFor360.jsp`
- 规则依据：`agr-api-doc-sync`（仅标注已存在接口，不新增API配置）

## 页面概述

该页用于“360视图使用者维护”：
- 按 `userId` 查询用户关系列表
- 进入分配使用者弹窗（`CmPartyInfoForUser.jsp`）
- 删除使用者关系
- 修改使用者前做“是否有客户角色”校验

## 主要调用点

### 1) 表格查询服务

- `ICmDkCustomerSV#queryCmInsCmrel(long userId,int start,int end)`
- `ICmDkCustomerSV#queryCmInsCmrelCount(long userId)`

### 2) 前端 PostInfo 调用

- `CmIndivCustomerAction?action=delInsUser`
- `CmLnAccountAction?action=checkUserHasCustomerRole`

## 已存在接口ID映射（可确认）

| JSP动作/方法 | 现有API路径 | 方法来源 | sys_id |
|---|---|---|---|
| checkUserHasCustomerRole（近义已配置） | `/api/cm/service/CmLnAccountAction/checkHasOtherRolesWithoutPayer` | `com.asiainfo.crm.cm.bf.impl.AccountBFImpl#checkHasOtherRolesWithoutPayer` | 809 |
| queryCmInsCmrel（近义历史接口） | `/api/cm/user/query` | `com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryCmInsCmrel` | 136 |

## 未命中说明（不新增配置）

- `ICmDkCustomerSV#queryCmInsCmrel/queryCmInsCmrelCount`（当前 JSP 使用的 bean）在现有 `api_config_batch_1774004438647.sql` 未直接命中同 bean 同签名映射。
- `delInsUser` 在现有 API 配置中未检索到同名接口。
- 以上均按规则标记为“未命中”，本次不新增 API 配置。

