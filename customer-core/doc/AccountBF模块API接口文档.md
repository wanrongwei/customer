# AccountBF 模块 API 接口文档（CM 域）

## 文档元信息

| 项目 | 值 |
|------|-----|
| 接口总数 | 3 |
| 配置来源 SQL | [CM-core/doc/sql/AccountBF_API_Config.sql](sql/AccountBF_API_Config.sql) |
| 最后更新时间 | 2026-04-09 00:00:00 |
| 关联 JSP 分析 | [ORD-core/doc/jsp/CmAcctInfo4Open.jsp分析说明.md](../../ORD-core/doc/jsp/CmAcctInfo4Open.jsp分析说明.md) |

## 版本历史

| 版本 | 日期 | 更新内容 | 作者 |
|------|------|---------|------|
| 1.0 | 2026-03-23 | 新增 queryAccountProfileByAcctId、queryCurrAcctBillCyclesByAcctId、queryCmBillCustomizeByUserId | yangjin |
| 1.1 | 2026-03-23 | 从 ord-core CmAcctInfo4Open 迁移至此，接口数据及 SQL 配置归属 cm-core | yangjin |
| 1.2 | 2026-04-09 | 按 sys_api_config 对齐；修正账单定制接口 sys_id 与 SQL 一致（8028）；补充接口概览与元信息 | — |

## 概述

本文档描述 CM 域 `AccountBFImpl` 中与 CmAcctInfo4Open.jsp 表单数据源对应的 3 个查询类 API。订单侧独有接口见 [ORD-core/doc/CmAcctInfo4Open模块API接口文档.md](../../ORD-core/doc/CmAcctInfo4Open模块API接口文档.md)。

---

## 接口概览

**业务域：`/api/cm`（AccountBFImpl）**

| sys_id | 接口名称 | HTTP 方法 | API 路径 | 方法来源 | 功能描述 |
|--------|----------|-----------|----------|----------|----------|
| 8026 | Query Account Profile By Acct Id | GET | `/api/cm/account-profile-by-acct-id` | `com.asiainfo.crm.cm.bf.impl.AccountBFImpl#queryAccountProfileByAcctId` | 根据账户ID查询账户档案 |
| 8027 | Query Bill Cycles By Acct Id | GET | `/api/cm/bill-cycles-by-acct-id` | `com.asiainfo.crm.cm.bf.impl.AccountBFImpl#queryCurrAcctBillCyclesByAcctId` | 根据账户ID查询当前账期 |
| 8028 | Query Bill Customize By User Id | GET | `/api/cm/bill-customize-by-user-id` | `com.asiainfo.crm.cm.bf.impl.AccountBFImpl#queryCmBillCustomizeByUserId` | 根据账户与用户查询账单定制 |

---

## API 详细设计

### Query Account Profile By Acct Id（GET `/api/cm/account-profile-by-acct-id`）

- **sys_id**: 8026
- **HTTP 方法**: GET
- **API 路径**: `/api/cm/account-profile-by-acct-id`
- **功能描述**: 根据账户ID查询账户档案信息。对应 CmAcctInfo4Open.jsp 中 cmAcctFrmAccount 表单数据源。CM 域接口。
- **方法来源**: `com.asiainfo.crm.cm.bf.impl.AccountBFImpl#queryAccountProfileByAcctId`

#### 请求参数

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| acctId | long | 是 | 账户ID |

#### 请求示例

```
GET /api/cm/account-profile-by-acct-id?acctId=123456
```

#### 响应示例

暂无样例数据（调用日志 SQL 中未收录本 sys_id 的 request/response）。

**返回数据（说明）**: Map，包含 ACCT_NAME、PAY_METHOD、ACCT_STATUS、REGION_ID 等账户档案字段；不存在时可为空对象。

---

### Query Bill Cycles By Acct Id（GET `/api/cm/bill-cycles-by-acct-id`）

- **sys_id**: 8027
- **HTTP 方法**: GET
- **API 路径**: `/api/cm/bill-cycles-by-acct-id`
- **功能描述**: 根据账户ID查询当前账期信息（CYCLE_TYPE、BILL_DAY、BILL_DUE_DATE 等）。对应 CmAcctInfo4Open.jsp 中 cmAcctFrmBillCycle 表单。CM 域接口。
- **方法来源**: `com.asiainfo.crm.cm.bf.impl.AccountBFImpl#queryCurrAcctBillCyclesByAcctId`

#### 请求参数

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| acctId | long | 是 | 账户ID |

#### 请求示例

```
GET /api/cm/bill-cycles-by-acct-id?acctId=123456
```

#### 响应示例

暂无样例数据（调用日志 SQL 中未收录本 sys_id 的 request/response）。

**返回数据（说明）**: Map，包含 CYCLE_TYPE、BILL_DAY、BILL_DUE_DATE、CYCLE_ID 等账期字段。

---

### Query Bill Customize By User Id（GET `/api/cm/bill-customize-by-user-id`）

- **sys_id**: 8028
- **HTTP 方法**: GET
- **API 路径**: `/api/cm/bill-customize-by-user-id`
- **功能描述**: 根据账户ID和用户ID查询账单定制信息。对应 CmAcctInfo4Open.jsp 中 cmAcctFrmCustomize 表单（JSP 中该区块已注释，接口仍保留供其他调用方使用）。CM 域接口。
- **方法来源**: `com.asiainfo.crm.cm.bf.impl.AccountBFImpl#queryCmBillCustomizeByUserId`

#### 请求参数

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| acctId | long | 是 | 账户ID |
| userId | long | 否 | 用户ID，如 -1 表示不限 |
| startNum | int | 否 | 起始行号，如 -1 表示不分页 |
| endNum | int | 否 | 结束行号，如 -1 表示不分页 |

#### 请求示例

```
GET /api/cm/bill-customize-by-user-id?acctId=123456&userId=-1&startNum=-1&endNum=-1
```

#### 响应示例

暂无样例数据（调用日志 SQL 中未收录本 sys_id 的 request/response）。

**返回数据（说明）**: Map，包含 RECIPIENTS、CONT_EMAIL、CONT_MOBILE、CONT_ADDRESS 等账单定制字段。

---

## API 接口汇总表

| 序号 | sys_id | 接口名称 | HTTP 方法 | API 路径 | 功能描述 |
|------|--------|----------|-----------|----------|----------|
| 1 | 8026 | Query Account Profile By Acct Id | GET | `/api/cm/account-profile-by-acct-id` | 根据账户ID查询账户档案 |
| 2 | 8027 | Query Bill Cycles By Acct Id | GET | `/api/cm/bill-cycles-by-acct-id` | 根据账户ID查询当前账期 |
| 3 | 8028 | Query Bill Customize By User Id | GET | `/api/cm/bill-customize-by-user-id` | 根据账户和用户查询账单定制 |
