# AccountBF 接口文档（CM域新增方法）

## 概述

`AccountBFImpl` 为 CM 域账户相关逻辑的 BF 实现。本文档描述新增的 3 个 CM 域方法，对应 CmAcctInfo4Open.jsp 中账户档案、账期、账单定制表单的数据源。

## 版本历史

| 版本 | 日期 | 更新内容 | 作者 |
|------|------|---------|------|
| 1.0 | 2026-03-23 | 新增 queryAccountProfileByAcctId、queryCurrAcctBillCyclesByAcctId、queryCmBillCustomizeByUserId | yangjin |
| 1.1 | 2026-03-23 | 从 ord-core CmAcctInfo4OpenBF 迁移至此，SQL 配置仅存于 CM-core/doc/sql/AccountBF_API_Config.sql | yangjin |

## 类信息

| 属性 | 值 |
|------|-----|
| 实现类 | `com.asiainfo.crm.cm.bf.impl.AccountBFImpl` |
| 所属模块 | CM-core |

## 方法列表（本次新增）

### 1. queryAccountProfileByAcctId

**方法签名**：
```java
Map<String, Object> queryAccountProfileByAcctId(long acctId) throws Exception
```

**功能描述**：
根据账户ID查询账户档案信息。对应 ICmLnAccountSV.queryAccountProfileByAcctId，CmAcctInfo4Open.jsp 中 cmAcctFrmAccount 表单数据源。

**参数说明**：

| 参数名 | 类型 | 是否必填 | 说明 |
|--------|------|----------|------|
| acctId | long | 是 | 账户ID |

**返回说明**：
Map 包含 ACCT_NAME、PAY_METHOD、ACCT_STATUS 等账户档案字段，不存在时返回空 Map。

**API配置**：
- sys_id: 8026
- API路径: `/api/cm/account-profile-by-acct-id`
- HTTP方法: GET

---

### 2. queryCurrAcctBillCyclesByAcctId

**方法签名**：
```java
Map<String, Object> queryCurrAcctBillCyclesByAcctId(long acctId) throws Exception
```

**功能描述**：
根据账户ID查询当前账期信息。对应 ICmAccountSV.queryCurrAcctBillCyclesByAcctId，CmAcctInfo4Open.jsp 中 cmAcctFrmBillCycle 表单数据源。

**参数说明**：

| 参数名 | 类型 | 是否必填 | 说明 |
|--------|------|----------|------|
| acctId | long | 是 | 账户ID |

**返回说明**：
Map 包含 CYCLE_TYPE、BILL_DAY、BILL_DUE_DATE 等账期字段，不存在时返回空 Map。

**API配置**：
- sys_id: 8032
- API路径: `/api/cm/bill-cycles-by-acct-id`
- HTTP方法: GET

---

### 3. queryCmBillCustomizeByUserId

**方法签名**：
```java
Map<String, Object> queryCmBillCustomizeByUserId(long acctId, long userId, int startNum, int endNum) throws Exception
```

**功能描述**：
根据账户ID和用户ID查询账单定制信息。对应 ICmAccountSV.queryCmBillCustomizeByUserId，CmAcctInfo4Open.jsp 中 cmAcctFrmCustomize 表单数据源。

**参数说明**：

| 参数名 | 类型 | 是否必填 | 说明 |
|--------|------|----------|------|
| acctId | long | 是 | 账户ID |
| userId | long | 否 | 用户ID，-1 表示不限 |
| startNum | int | 否 | 起始行号，-1 表示不分页 |
| endNum | int | 否 | 结束行号，-1 表示不分页 |

**返回说明**：
Map 包含 RECIPIENTS、CONT_EMAIL、CONT_MOBILE 等账单定制字段。

**API配置**：
- sys_id: 8028
- API路径: `/api/cm/bill-customize-by-user-id`
- HTTP方法: GET

---

## 调用示例

```java
// 通过 Spring 注入或 ServiceFactory 获取
AccountBFImpl accountBF = ...;

// 查询账户档案
Map<String, Object> profile = accountBF.queryAccountProfileByAcctId(123456L);

// 查询当前账期
Map<String, Object> billCycle = accountBF.queryCurrAcctBillCyclesByAcctId(123456L);

// 查询账单定制
Map<String, Object> customize = accountBF.queryCmBillCustomizeByUserId(123456L, -1L, -1, -1);
```

## 依赖关系

| Service接口 | 说明 |
|-------------|------|
| ICmLnAccountSV | 账户档案查询 |
| ICmAccountSV | 账户、账期、账单定制查询 |
