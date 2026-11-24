# CM 模块 API 接口文档

## 文档说明

本文档详细描述了CM模块中所有RESTful API接口。所有接口均基于数据库配置自动生成，并在可用时注入真实调用日志请求/响应样例。
**文档版本**: v1.0
**生成时间**: 2026-03-20 19:17:56
**最后更新**: 2026-04-16 15:45:53
模块名称**: CM-core
接口总数**: 303
---
## 一、接口概览

### 360view 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 381 | checkIsRangeNumberAndSameRange | POST | `/api/cm/360view/RbossSoAction/checkIsRangeNumberAndSameRange` | 检查号码是否在号段内且属于同一号段。该方法接收账单ID，设置中心信息为账单ID，调用资源服务检查号码是否在号段内。如果在号段内，则进一步检查是否属于同一号段。如果不在号段内或不属于同一号段，返回失败标志，否则返回成功标志 返回信息: 包含检… |
| 382 | getOfferTypeByOfferId | POST | `/api/cm/360view/BbossSoAction/getOfferTypeByOfferId` | 根据产品ID获取产品类型和特征值。该方法接收产品ID，查询产品信息，判断产品类型是否为OTT计划或OTT增值服务，查询产品的特征值，判断是否为O365类型（特征值为"21"且等于MDM_OTT_FEATURE_VALUE时不是O365），返… |
| 383 | getDM002UserFlag | POST | `/api/cm/360view/BbossSoAction/getDM002UserFlag` | 判断是否为DM002用户，用于宽带业务变更判断。该方法根据用户ID查询实例服务属性，获取技术类型属性值，如果技术类型属性值不为空，则标识为DM002用户 返回信息: 包含判断结果的Map，key包括"DM002Flag"（"Y"表示是DM0… |
| 384 | checIsHasRangesOpen | GET | `/api/cm/360view/RbossSoAction/checIsHasRangesOpen` | 检查是否有号段开放。该方法接收服务号码和功能ID，如果服务号码不为空，则查询前导号码信息。如果服务号码等于前导号码，则根据功能ID判断是否需要检查已使用号码。对于特定功能ID（10000019、10000022、20000039、20000… |
| 385 | isCompanyOffer | POST | `/api/cm/360view/BbossSoAction/isCompanyOffer` | 判断产品是否为公司产品。该方法接收产品ID，调用isCompany方法判断是否为公司产品，返回判断结果 返回信息: 包含判断结果的Map，key为"retValue"（"Y"表示是公司产品，"N"表示不是） |
| 386 | query360OrdCustByCustIdAndStartEndDateCount | POST | `/api/cm/360view/RbossSoAction/query360OrdCustByCustIdAndStartEndDateCount` | 根据客户ID和起止日期查询360订单客户数量。该方法接收客户ID、开始日期、结束日期、区域ID、类型、账单ID、电路号码、CPE号码、PO号码和FIBIA客户ID等参数，调用CRM服务查询符合条件的订单客户数量 返回信息: 包含查询结果的M… |
| 390 | getOrdBasicInfo | POST | `/api/cm/360view/ICrmFSV/getOrdBasicInfo` |  |
| 391 | getOrdDeliveryInfo | POST | `/api/cm/360view/ICrmFSV/getOrdDeliveryInfo` | 根据订单ID查询并组装订单的配送信息，包括收货人姓名/公司名、配送地址、配送方式、联系方式、预计配送日期等，并判断收货人是否为默认客户名称。 |
| 612 | 360视图查询用户数据count | GET | `/api/cm/360view/user/count` | 360视图查询用户数据count |
| 760 | queryCustAcctRelCountFor360 | POST | `/api/cm/360view/ICmAccountSV/queryCustAcctRelCountFor360` |  |
| 761 | getAcctIdByInvoiceNumber | POST | `/api/cm/360view/RbossSoAction/getAcctIdByInvoiceNumber` | 根据发票号码获取账户ID。该方法接收发票号码，调用订单查询服务根据发票号码查询银行账户ID。如果查询到账户ID则返回成功标志和账户ID，否则返回失败标志和账户ID为"0" 返回信息: 包含查询结果的Map，key包括"retVal"（"Y"… |
| 762 | queryBanksByConditions | POST | `/api/cm/360view/IOtherBaseSV/queryBanksByConditions` |  |
| 791 | refreshSecOrgStaffOper | POST | `/api/cm/360view/SecOperatorBF/refresh` | 刷新安全组织员工操作员列表。该方法接收组织ID、姓名、代码、账单ID和分页参数，如果所有查询条件都为空则返回null。如果组织ID为空，则根据账单ID、代码和姓名查询员工信息；如果组织ID不为空，则查询该组织下的所有员工信息。查询结果使用P… |
| 796 | getStaticDataByParent | GET | `/api/cm/360view/CommonBF/getStaticDataByParent` | 根据父代码值获取静态数据。该方法通过静态数据工具类查询指定代码类型和父代码值下的所有静态数据，支持是否包含选择项的配置 返回信息: 静态数据值数组，包含所有符合条件的静态数据记录 |
| 3010 | getVoipNumberByUserIdAndAttrId | GET | `/api/cm/360view/RbossSoBF/getVoipNumberByUserIdAndAttrId` | 根据用户ID和属性ID获取VoIP号码。该方法接收区域ID、用户ID和属性ID，设置中心信息为区域ID，调用实例查询服务批量获取实例服务属性，返回第一个属性的属性值作为VoIP号码 返回信息: VoIP号码字符串，如果查询不到则返回空字符串 |
| 3018 | queryGroupByCustId | GET | `/api/cm/360view/CustomerViewBF/queryGroupByCustId` |  |
| 3019 | getGroupBasicInfo | GET | `/api/cm/360view/CustGroupOut/getGroupBasicInfo` |  |
| 3030 | queryMemListByCondition | GET | `/api/cm/360view/groupmember/queryMemListByCondition` | 根据客户ID、VPN套餐实例、账单ID、角色ID、开通平台等条件，分页查询群组成员短号信息列表。 |

### account 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 300 | 根据账户id查询账户资料 | GET | `/api/cm/account/{acctId}/profile` | 根据账户id查询账户资料。 |
| 303 | 根据账户ID查询账户 | GET | `/api/cm/account/{acctId}/profile/mask` | 根据账户ID查询账户 |
| 304 | 查询账户当前账期信息 | GET | `/api/cm/account/{acctId}/bill/cycle/current` | 查询账户当前账期信息 |
| 305 | 查询账号支付渠道 | GET | `/api/cm/account/{acctId}/paychannle` | 查询账户支付渠道。 |
| 306 | queryAcctFormatType | GET | `/api/cm/account/{acctId}/bill/formattype` | 查询账号账单格式。 |
| 307 | 查询后付费账单格式 | GET | `/api/cm/account/{acctId}/billformat` | 查询后付费账单格式。 |
| 308 | 查询账单格式(分页) | GET | `/api/cm/account/{acctId}/billformat/list` | 查询账单格式明细列表。该方法接收账户ID、账单类型和分页参数，调用查询服务获取账户信息，从响应中提取客户ID和客户类型（如果是集团客户则减1）。然后从账户信息中获取账单格式列表，根据账单类型过滤出匹配的账单格式明细。遍历明细列表，封装成账单… |
| 309 | 查询账单格式总数，用于分页 | GET | `/api/cm/account/{acctId}/billformat/count` | 查询账单总数，用于分页。 |
| 310 | 查询账单地址 | GET | `/api/cm/account/{acctId}/bill/address` | 查询账户账单地址 |
| 313 | 查询账期表单数据 | GET | `/api/cm/account/{acctId}/billcycle` | 查询账期表单数据 |
| 314 | 保存修改账户 | POST | `/api/cm/account` | 处理账户业务。该方法接收账户信息VO、BCE框架ID和业务ID，将账户信息和账单周期信息转换为DataContainer，如果存在旧数据则标记为旧状态并建立关联关系，然后调用BCE处理服务进行业务处理 返回信息: BCE处理返回数据对象，包… |
| 323 | 账户客户关系查询 | GET | `/api/cm/account/{acctId}/custacctrel` | 账户客户关系查询 |
| 324 | 查询账户客户关系总数 | GET | `/api/cm/account/{acctId}/custacctrel/count` | 查询账户客户关系总数 |
| 325 | 删除grp账户信息 | DELETE | `/api/cm/account/{acctId}/grp` | 删除集团账户信息。该方法接收账户ID，检查租户ID是否为TENANT_21（不允许删除），调用billing接口将账户状态设置为inactive（状态值为2），然后更新账户信息。删除成功返回成功标志和消息，失败返回异常信息 返回信息: 包含… |
| 332 | 创建payer | POST | `/api/cm/account/payer` | 创建付款人信息。该方法接收付款人信息Map，如果PARTY_ID为空则创建新的参与人、参与人角色（PAYER）和联系信息；如果PARTY_ID已存在则更新参与人信息，检查并创建PAYER角色（如果不存在），保存联系信息。支持个人类参与人的创… |
| 333 | 验证此Party是否含有除payer,user以外的其他角色 | GET | `/api/cm/account/role/other` | 检查参与人是否具有除Payer和User之外的其他角色。该方法接收参与人ID，查询该参与人的所有角色，判断是否为纯User、纯Payer或User/Payer两种角色的组合。只有这三种情况才允许编辑，其他情况（包含客户角色或其他角色）不允许… |
| 334 | validateModifyPayerCPR | GET | `/api/cm/account/payer/modifiable` | 验证修改付款人CPR。该方法接收证件代码、参与人ID、输入的名字、姓氏和生日，调用个人客户服务处理修改付款人CPR，返回处理结果（名字、姓氏、生日、是否受保护、匹配标志、地址ID、地址详情等） 返回信息: 包含验证结果的Map，key包括"… |
| 345 | 保存payer地址变更 | POST | `/api/cm/account/{acctId}/address/log` | 保存地址变更记录。该方法接收旧地址、新地址、客户ID和账户ID，记录地址变更的操作日志，包括账户号码、旧付款人账单地址和新付款人账单地址 返回信息: 包含操作结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）和"re… |
| 346 | 保存账单支付方式 | POST | `/api/cm/account/{acctId}/billingpayment` | 保存账单支付信息。该方法接收客户ID、账户ID和账单支付VO对象，将支付渠道信息、账户联系信息和账单格式信息转换为对应的Bean对象，然后调用billing服务保存账户支付信息 返回信息: 包含操作结果的Map，key包括"retVal"（… |
| 734 | 从nets查询银行卡信息(分页) | GET | `/api/cm/account/bankCard/page` |  |
| 735 | 从nets查询银行卡信息(总数) | GET | `/api/cm/account/bankCard/count` |  |
| 736 | 查询nets交易信息 | GET | `/api/cm/account/nets` | 获取交易ID并生成支付URL。该方法接收客户ID和URL，将客户ID追加到URL参数中，调用billing服务获取交易ID，然后根据商户ID和交易ID生成支付页面的完整URL 返回信息: 包含操作结果的Map，key包括"retVal"（"… |

### acct 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 849 | queryUserSplitAccount | POST | `/api/cm/acct/ICrmFSV/queryUserSplitAccount` | queryUserSplitAccount |
| 850 | queryUserSplitAccountLength | POST | `/api/cm/acct/ICrmFSV/queryUserSplitAccountLength` | queryUserSplitAccountLength |
| 851 | queryPayerAccountByAgr | POST | `/api/cm/acct/ICrmFSV/queryPayerAccountByAgr` | queryPayerAccountByAgr |
| 852 | queryPayerAccountByAgrCount | POST | `/api/cm/acct/ICrmFSV/queryPayerAccountByAgrCount` | 根据合同ID（agreementId）和客户信息（客户类型、客户ID、姓名、CPR、生日、地址、公司名、KOB、CVR等）查询与合同关联的付款账户数量。 |
| 853 | queryPayerAccountByDts | POST | `/api/cm/acct/ICrmFSV/queryPayerAccountByDts` | 根据客户类型、客户ID、姓名、CPR、生日、地址、公司名、KOB、CVR等条件查询付款账户列表，支持按账户ID精确过滤和分页查询。 |
| 854 | queryPayerAccountByDtsCount | POST | `/api/cm/acct/ICrmFSV/queryPayerAccountByDtsCount` | 根据客户类型、客户ID、姓名、CPR、生日、地址、公司名、KOB、CVR等条件查询付款账户的数量。 |

### acount 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 315 | 查询Bill Format详情 | GET | `/api/cm/acount/{acctId}/billformatdtl` | 查询Bill Format详情 |

### address 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 4 | 保存客户地址 | POST | `/api/cm/address` | 保存客户地址 |

### b2b 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 2 | 创建B2B客户 | POST | `/api/cm/b2b/customer` | 创建B2B客户 |
| 113 | 查询集团客户 | POST | `/api/cm/b2b/queryCust` | 查询集团客户。 |
| 114 | 查询集团客户总数 | POST | `/api/cm/b2b/countCust` | 统计B2B客户数量。该方法接收B2B客户查询VO，构建XML查询参数（包括客户ID、客户名称、证件代码、创建日期、客户状态、经理ID、CVR号码、联系手机、客户服务ID、账单ID、县ID、城市ID、证件级别、证件地址、产品名称、生效日期、到… |
| 216 | 修改B2B客户数据 | PUT | `/api/cm/b2b/customer` | 修改B2B客户数据 |
| 500 | 保存集团客户关系 | POST | `/api/cm/b2b/custRel` | 保存集团客户关系 |
| 501 | 查询集团客户关系 | GET | `/api/cm/b2b/custRel` | 查询集团客户关系 |
| 502 | 查询集团客户关系数量 | GET | `/api/cm/b2b/custRel/count` | 查询集团客户关系数量 |
| 503 | 删除集团客户关系 | DELETE | `/api/cm/b2b/custRel` | 删除集团客户关系 |
| 858 | 获取legal person | GET | `/api/cm/b2b/legal-person` | 获取法人。该方法接收CPR号码，首先查询CRM系统中是否存在该CPR对应的客户，如果存在则返回客户名称（首字母大写）。如果不存在，则调用CPR接口验证CPR号码，从CPR系统获取客户名称并返回 返回信息: 法人名称字符串，如果CPR在CPR… |

### bill 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 328 | 删除账单格式详情 | DELETE | `/api/cm/bill/account/{acctId}` | 删除账单格式详情 |
| 331 | 保存账单格式 | POST | `/api/cm/bill/formatDtl` |  |
| 343 | getBillingAddress | GET | `/api/cm/bill/account/{acctId}/address` |  |

### bp 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 404 | 查询模板信息 | GET | `/api/common/bp/template` | 查询模板信息 |
| 405 | 查询模板详细信息 | GET | `/api/common/bp/template/detail` | 查询模板详细信息 |
| 411 | 查询模板今日新增成功文件的数量 | GET | `/api/common/bp/template/import/count` | 获取当天已导入数据库的数量。该方法根据模板代码查询当天已经导入数据库的文件数量，用于控制文件导入的频率和数量限制 返回信息: 包含查询结果的Map，key包括"ret"（"Y"表示成功，"N"表示失败）、"msg"（结果消息，成功时返回数量… |

### common 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 329 | email校验 | GET | `/api/cm/common/email/validation` | 校验email地址。该方法检查email白名单控制开关，如果开关开启则调用CRM服务查询邮箱地址是否在白名单中。如果邮箱地址在白名单中则校验成功，否则校验失败 返回信息: 包含校验结果的Map，key包括"emailCtrl"（"Y"表示开… |
| 711 | 获取ID | GET | `/api/cm/common/seq/{className}` | 获取新序列号。该方法根据类名获取对应的新序列号，通过反射获取类对象，然后调用通用服务获取该类的下一个序列号值。 |
| 733 | 查询CmStaticData | GET | `/api/cm/common/cmStaticData` | 根据代码类型和代码值获取代码名称。该方法通过静态数据工具类查询指定代码类型和代码值对应的代码名称，如果查询结果为空则标识为需要返回。 |
| 737 | 查询paraDetailValue | GET | `/api/cm/common/paraDetailValue` | 获取参数详情值。该方法根据区域ID、参数类型和参数代码查询参数详情值，通过BCE工具类获取参数配置信息。 |
| 742 | getStaticDataByCodeType | GET | `/api/cm/common/staticData/codeType/{codeType}` |  |

### composite 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 613 | 查询成员用户数 | GET | `/api/cm/composite/ins/member/count` | 查询成员用户数 |

### contactMedium 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 5 | 查询客户联系媒介 | GET | `/api/cm/contactMedium/page` | 查询客户联系媒介 |

### cust 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 109 | 获取客户联系媒介 | GET | `/api/cm/cust/ElectronicMedium/query/{custId}` | 获取客户联系媒介 |
| 110 | 获取客户联系媒介总数 | GET | `/api/cm/cust/ElectronicMedium/count/{custId}` | 获取客户联系媒介总数 |

### custOrg 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 119 | 查询客户组织 | GET | `/api/cm/custOrg/query/{deptId}` | 查询客户组织。 |
| 120 | 校验是否有子部门 | GET | `/api/cm/custOrg/check` | 校验是否有子部门 |
| 122 | 校验是否同名 | GET | `/api/cm/custOrg/checkSameName` | 校验是否同名 |

### custView 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 127 | 查询custview 树形 | POST | `/api/cm/custView/query` | 查询custview 树形 |

### permissionClause 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 10006 | Query Permission Clause Tree | GET | `/api/cm/permission-clause/tree` | Query permission clause tree in one-shot response. |

### customer 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 130 | 查询客户组织 | GET | `/api/cm/customer/queryCustOrg` | 查询客户组织 |
| 131 | 查询客户组织总数 | GET | `/api/cm/customer/countCustOrg` | 查询客户组织总数 |
| 200 | 是否只能查看客户信息 | GET | `/api/cm/customer/if-only-can-view` | 是否只能查看客户信息 |
| 201 | 获取新的客户ID | GET | `/api/cm/customer/id` | 获取新的客户ID |
| 202 | 查询客户信息 | GET | `/api/cm/customer/{custId}` | 查询客户信息 |
| 204 | 查询客户扩展信息 | GET | `/api/cm/customer/{custId}/ext` | 查询客户扩展信息。 |
| 205 | 客户基本信息查询 | GET | `/api/cm/customer/{custId}/detail` | 客户基本信息查询。 |
| 206 | B2B客户行业信息查询 | GET | `/api/cm/customer/{custId}/industry/page` | B2B客户行业信息查询 |
| 207 | B2B客户行业信息查询count | GET | `/api/cm/customer/{custId}/industry/count` | B2B客户行业信息查询count |
| 208 | B2B客户经理信息查询 | GET | `/api/cm/customer/{custId}/manager/page` | B2B客户经理信息查询。 |
| 209 | 客户经理总数查询count | GET | `/api/cm/customer/{custId}/manager/count` | 查询客户经理总数。 |
| 211 | 账户数据信息查询 | GET | `/api/cm/customer/{custId}/accounting/detail` | 账户数据信息查询。 |
| 212 | 查询客户状态 | GET | `/api/cm/customer/{custId}/status` | 查询客户状态。 |
| 213 | 检验操作员是否只有查看权限 | GET | `/api/cm/customer/access-control` | 检验操作员是否只有查看权限。 |
| 214 | 人工离网 | POST | `/api/cm/customer/{custId}/offline` | 人工离网 |
| 215 | 校验是否可以修改客户细分 | GET | `/api/cm/customer/if-can-modify-segment` | 校验是否可以修改客户细分 |
| 217 | 客户销户 | POST | `/api/cm/customer/{custId}/terminate` | 客户销户 |
| 218 | 查询客户附加信息 | GET | `/api/cm/customer/{custId}/addtional` | 查询客户附加信息。 |
| 219 | 查询客户资料显示项个性配置 | GET | `/api/cm/customer/of2-vc` | 查询客户资料显示项个性配置。 |
| 220 | 保存客户附加信息 | POST | `/api/cm/customer/{custId}/addtional` | 保存客户附加信息，修改/新增 |
| 221 | 查询客户备案记录 | GET | `/api/cm/customer/{custId}/puton-record` | 查询客户备案记录 |
| 222 | aks信息保存 | POST | `/api/cm/customer/{custId}/aks` | aks信息保存 |
| 223 | 查询客户不良信息 | GET | `/api/cm/customer/{custId}/bad-record/page` | 查询客户不良信息 |
| 224 | 查询客户不良信息count | GET | `/api/cm/customer/{custId}/bad-record/count` | 查询客户不良信息count |
| 225 | 判断客户是否有在途单 | GET | `/api/cm/customer/{custId}/check-ongoging-order` | 判断客户是否有在途单 |
| 311 | 查询客户信息 | GET | `/api/cm/customer/{custId}/1` | 根据客户id查询客户信息 |
| 312 | ICmxCustomerSV.queryCmxCustomer | GET | `/api/cm/customer/{custId}/cmx` | ICmxCustomerSV.queryCmxCustomer |
| 326 | 验证客户协议 | GET | `/api/cm/customer/{custId}/agreement/{agrId}` | 验证协议。该方法接收客户ID和协议ID，调用协议服务查询该客户和协议ID对应的协议信息，如果存在则返回"Y"，否则返回"N"。 |
| 327 | 查询客户简单信息 | GET | `/api/cm/customer/{custId}/simple` | 根据客户ID查询客户简单信息。该方法接收客户ID，查询客户基本信息（客户名称、名字、姓氏、参与人ID、证件代码等）。如果是集团客户，还会查询税号，并处理证件代码（判断是否为外国集团） 返回信息: 包含客户简单信息的Map，key包括"ret… |
| 337 | getCprEditConfigMapFromMatrix  | GET | `/api/cm/customer/cpreditconfig` | 从矩阵获取CPR编辑配置Map。该方法接收客户ID、参与人ID、GUI类型和注册类型，验证输入参数的有效性，然后调用个人客户服务从矩阵获取CPR编辑配置（包括是否可编辑CPR号码和CPR档案） 返回信息: 包含CPR编辑配置的Map，key… |
| 342 | getBillDayAndBillCycleDisplay | GET | `/api/cm/customer/{custId}/agreement/{agrId}/billdaycycle` | 获取账单日和账单周期显示信息。该方法接收客户ID和协议ID，调用协议服务查询协议的账单周期信息（账单周期、协议代码、付款条款等） 返回信息: 包含账单周期信息的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retM… |
| 344 | 查询cpr | GET | `/api/cm/customer/cpr` | 查询CPR。该方法接收CPR号码，调用个人客户服务验证CPR号码是否在CPR系统中存在 返回信息: 包含查询结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，成功时返回国际化资源"CM… |
| 400 | 查询部门成员 | GET | `/api/cm/customer/{custId}/member/page` | 查询集团成员 |
| 401 | 查询部门成员count | GET | `/api/cm/customer/{custId}/member/count` | 查询集团部门账单数量。该方法接收客户ID和部门ID，构建XML查询参数，然后调用丹麦客户服务查询该部门下的账单总数 返回信息: 符合条件的账单总数，int类型 |
| 402 | 查询部门成员 | GET | `/api/cm/customer/{custId}/user/page` | 查询部门成员 |
| 403 | 查询部门成员数量 | GET | `/api/cm/customer/{custId}/user/count` | 查询部门成员数量 |
| 406 | 新增和修改客户部门 | POST | `/api/cm/customer/dept` | 保存集团客户部门信息 |
| 407 | 删除部门下所有成员 | DELETE | `/api/cm/customer/dept/{deptId}/member` | 删除部门成员 |
| 408 | 删除部门 | DELETE | `/api/cm/customer/dept/{deptId}` | 删除部门 |
| 409 | 删除部门下的指定成员 | DELETE | `/api/cm/customer/dept/member` | 删除部门下的指定成员 |
| 410 | 分配部门成员到其他部门 | POST | `/api/cm/customer/assign/dept/member` | 分配部门成员到其他部门 |
| 414 | 给部门分配成员 | POST | `/api/cm/customer/{custId}/dept/{deptId}/member` | 给部门分配成员 |
| 415 | 部门树形结构查询 | GET | `/api/cm/customer/{custId}/dept/tree` | 部门树形结构查询 |
| 600 | 公司组织树状结构查询 | GET | `/api/cm/customer/{custId}/org/tree` | 公司组织树状结构查询。 |
| 601 | 查询组织成员信息 | GET | `/api/cm/customer/org/{deptId}/member/page` | 查询组织成员信息。 |
| 602 | 查询组织成员总数，用于分页 | GET | `/api/cm/customer/org/{deptId}/member/count` | 查询组织成员总数，用于分页 |
| 603 | 获取下属组织 | GET | `/api/cm/customer/{custId}/sub-org` | 获取下属组织。 |
| 604 | 校验是否有子组织 | GET | `/api/cm/customer/check-group-org-parent` | 校验是否有子组织 |
| 605 | 保存集团组织信息 | POST | `/api/cm/customer/org` | 保存集团组织信息 |
| 606 | 删除组织信息 | DELETE | `/api/cm/customer/org/{orgId}` | 删除组织信息 |
| 607 | 删除组织中的成员 | DELETE | `/api/cm/customer/org/member` | 删除组织中的成员 |
| 608 | 查询个人客户partyId | GET | `/api/cm/customer/indiv/{custId}/party-id` | 查询个人客户partyId |
| 609 | 查询客户基本信息 | GET | `/api/cm/customer/{custId}/2` | 查询客户基本信息。 |
| 610 | 查询客户信息 | GET | `/api/cm/customer/{custId}/3` | 查询客户信息 |
| 635 | 根据客户id查询客户在集团组织的deptId | GET | `/api/cm/customer/{relCustId}/org/deptId` | 根据关联客户ID查询客户组织部门ID。 |
| 700 | 根据部门名称查询客户下的部门 | GET | `/api/cm/customer/{custId}/group/org` |  |
| 701 | 根据部门名称查询客户下的部门总数 | GET | `/api/cm/customer/{custId}/group/org/count` |  |
| 702 | 查询联系人信息 | GET | `/api/cm/customer/indivCont` | 查询个人联系人。该方法接收账单ID，设置中心信息，然后调用团队调用服务根据账单ID获取用户基本信息，如果用户是集团客户则抛出异常，否则返回客户ID、用户ID、品牌、区域ID和参与人ID 返回信息: 包含查询结果的Map，key包括"retV… |
| 703 | queryCmxIndivCustomerValue | GET | `/api/cm/customer/{custId}/CmxIndivCustomer` |  |
| 704 | 查询默认客户id | GET | `/api/cm/customer/defaultId` |  |
| 705 | 保存集团成员 | POST | `/api/cm/customer/groupmember/ln` | 保存LN集团成员。该方法接收集团成员VO，包含个人客户信息、集团成员信息、扩展信息等，处理新旧数据合并，设置客户状态（网外成员设置为匿名潜在客户），判断成员是否已存在（根据账单ID、状态、成员类型），对于新增网外成员插入CPR订购工单，对于… |
| 706 | 保存TN集团成员 | POST | `/api/cm/customer/groupmember/tn` | 保存Telnor集团成员。该方法接收成员来源、成员参与人ID和集团成员VO，处理网内网外成员（网外成员分为4种：从CPR系统查询、从个人客户、从参与人、操作员输入），设置客户为匿名潜在客户，校验成员是否已存在，对于网内成员或选择客户作为成员… |
| 707 | 获取集团关键人等级 | GET | `/api/cm/customer/{custId}/keyPeopGrad` | 获取客户关键人员等级。该方法接收客户ID，查询客户信息，根据客户服务等级（LEVEL_INT_l1、LEVEL_INT_l2、LEVEL_INT_21、LEVEL_INT_22、LEVEL_INT_30）映射到对应的关键人员等级（LEVEL… |
| 708 | 通过billid查询客户简要信息 | GET | `/api/cm/customer/simplebill` | 根据账单ID查询客户信息。该方法接收账单ID，设置中心信息，调用团队调用服务根据账单ID获取用户基本信息，返回品牌、用户ID、区域ID和客户ID 返回信息: 包含查询结果的Map，key包括"retVal"（参与人ID，此字段未使用）、"r… |
| 709 | 根据CustRelId查询集团客户 | GET | `/api/cm/customer/groupMember/{custRelId}` |  |
| 710 | 获取个人客户状态 | GET | `/api/cm/customer/{custId}/invidiv/status` | 获取请求状态和编辑字段。该方法根据客户ID查询客户请求任务，判断客户是否可编辑（如果请求状态为处理中或已处理完成且已生成订购关系则不可编辑）。同时根据参与人角色类型（user或非user）获取对应的不可编辑字段列表（CM、CMX、CM_AD… |
| 712 | 查询集团客户地址 | GET | `/api/cm/customer/{custId}/group/address` | 查询地址信息。该方法接收客户ID，查询客户的合法地址联系媒介，然后调用地址服务获取地址详细信息（邮编、城市、地址描述） 返回信息: 包含地址信息的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（失败… |
| 713 | 查询客户列表(分页) | POST | `/api/cm/customer/xml` | 根据XML条件查询客户。该方法接收查询条件MapList和分页参数，将条件转换为DataContainer，格式化条件（设置CUST_ID默认值、匹配类型），调用业务模型查询客户数据，然后为每个客户补充行业信息、法律地址、客户层级、客户经理… |
| 714 | 查询客户列表(总数) | POST | `/api/cm/customer/xml/count` | 根据XML条件查询客户数量。该方法接收查询条件MapList，将条件转换为DataContainer，格式化条件（设置CUST_ID默认值、匹配类型），调用客户服务查询符合条件的客户总数 返回信息: 符合条件的客户总数，int类型 |
| 715 | contentId查询 | GET | `/api/cm/customer/contId` | 显示联系人ID。该方法接收参与人ID，查询参与人的联系人ID 返回信息: 包含查询结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（联系人ID，成功时存在） |
| 718 | 删除联系媒介信息 | DELETE | `/api/cm/customer/group/contactContMedium` | 删除联系人联系媒介。该方法接收联系关系ID和区域ID，查询联系媒介关系是否存在，如果存在则抛出异常，否则查询联系人信息获取参与人ID，删除联系媒介，如果参与人ID大于0则发送付款人地址到计费系统 返回信息: 包含删除结果的Map，key包括… |
| 719 | 保存联系媒介信息 | PUT | `/api/cm/customer/group/contactContMedium` | 保存联系人联系媒介。该方法接收联系人ID、参与人ID和联系媒介MapList，验证联系媒介数据（联系类型不能为空、联系信息不能为空、邮箱格式验证、电话号码格式验证、邮箱重复性验证），检查优先级重复，保存联系媒介关系，如果联系人ID有效则发送… |
| 720 | 查询联系媒介信息(分页) | GET | `/api/cm/customer/group/contactContMedium/cond/page` |  |
| 721 | 查询联系媒介信息(总数) | GET | `/api/cm/customer/group/contactContMedium/cond/count` |  |
| 722 | 验联系人是否已经存在 | GET | `/api/cm/customer/group/contact/validation` | 验证集团联系人。该方法接收参与人ID、客户ID和联系人类型，查询该客户和参与人下是否存在指定类型的集团联系人 返回信息: 包含验证结果的Map，key包括"retFlag"（"Y"表示存在集团联系人，"N"表示不存在） |
| 723 | 保存DK联系信息 | PUT | `/api/cm/customer/group/contact/dk` | 保存丹麦集团联系人信息。该方法接收联系人ID、集团成员Map、参与人联系Map和联系人Map，将Map转换为DataContainer，提取客户联系人ID、区域ID和优先级，调用集团合同服务保存丹麦集团联系人信息 返回信息: 包含保存结果的… |
| 724 | 客管合同查询页面 | GET | `/api/cm/customer/{custId}/cmpage/agreement` |  |
| 725 | 保存联系信息 | PUT | `/api/cm/customer/group/contact` | 保存联系人。该方法接收客户联系人ID、联系人ID、集团成员MapList、参与人MapList和参与人联系MapList，将MapList转换为DataContainerList，根据FLAG标志判断是保存丹麦集团联系人还是普通集团联系人，… |
| 726 | 保存联系媒介关系 | PUT | `/api/cm/customer/group/contactContMediumRel` | 保存联系人联系媒介关系。该方法接收客户联系人ID和联系媒介关系MapList，将MapList转换为DataContainer数组，为每个联系媒介关系创建或更新联系媒介关系Bean，检查关系是否已存在（避免重复），保存联系媒介关系 返回信息… |
| 727 | 联系媒介信息查询 | GET | `/api/cm/customer/group/contactContMedium/page` | 联系媒介信息查询。 |
| 728 | 联系媒介信息查询总数 | GET | `/api/cm/customer/group/contactContMedium/count` | 该方法用于查询指定客户联系ID下非地址类型的联系媒介数量。 |
| 759 | queryCustAcctRel | POST | `/api/cm/customer/{relCustd}/account/cmCustAcctRel` | 查询客户账户关系信息。该方法接收多个查询条件参数（关联客户ID、账户ID、账户名称、分期标志、支付方式、周期类型、客户状态、账户服务ID、服务号码、PBS、EAN等）和分页参数，查询符合条件的客户账户关系列表，并更新账户的到期信息 返回信息… |
| 800 | 校验cpr | GET | `/api/cm/customer/validateCPRNum` | 校验cpr |
| 801 | 获取证件号码 | GET | `/api/cm/customer/getCertCode` | 获取证件号码 |
| 802 | 保存B2C客户 | POST | `/api/cm/customer/saveIndivCustomer` | 保存个人客户。该方法接收客户信息Map和操作类型（add/mod/del），将客户基本信息和附加信息转换为DataContainer，如果是修改操作则标记旧数据并设置变更映射。方法会处理客户姓名（如果为空则设置默认值）、客户类型（USER或… |
| 803 | 校验修改的cpr | POST | `/api/cm/customer/validateModifyCPR` | 验证修改CPR（个人身份证号码）。该方法接收客户证件代码、客户ID、输入的姓名、生日和保存场景等参数，调用个人客户服务的dealModifyCPR方法处理修改CPR的逻辑，标识需要送CPR（参数为YES）。如果处理返回的DataContai… |
| 804 | 删除联系人 | POST | `/api/cm/customer/saveGroupContact` | 删除联系人 |
| 805 | 删除联系媒介 | DELETE | `/api/cm/customer/deleteContactContMediumRela` | 删除联系媒介 |
| 814 | queryByCustId | GET | `/api/cm/customer/queryByCustId` | queryByCustId |
| 815 | queryPOAList | GET | `/api/cm/customer/queryPOAList` | queryPOAList |
| 816 | queryPOAListCount | GET | `/api/cm/customer/countPOAList` | queryPOAListCount |
| 817 | queryPayerByPartyId | GET | `/api/cm/customer/queryPayerByPartyId` | queryPayerByPartyId |
| 821 | dealCustomer | PUT | `/api/cm/customer/modifyIndivCust` | 处理客户业务。该方法接收客户信息Map、BCE框架ID和业务ID，将客户基本信息和附加信息转换为DataContainer，如果存在旧数据则标记为旧状态并设置变更映射，然后调用客户BCE处理服务进行业务处理 返回信息: BCE业务处理返回数… |
| 1018 | queryAdvanceCustomerDetail | GET | `/api/cm/customer/{custId}/advance/detail` | 查询高级客户详情。该方法接收客户ID，查询客户类型和客户基本信息，如果是集团客户且存在法人识别号码，则获取法人信息。同时查询客户的邮箱和合法地址详情，将所有信息合并到Map中返回 返回信息: 包含客户详细信息的Map，包括客户类型、客户基本… |

### customers 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 146 | getCustSegmentById | GET | `/api/cm/customers/{custId}/identifications` | 根据客户ID获取客户细分。该方法接收客户ID，查询客户信息，返回客户细分ID、客户代码和税号 返回信息: 包含客户细分信息的Map，key包括"custSeg"（客户细分ID）、"custCode"（客户代码）、"taxId"（税号） |

### groupCustomers 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 8033 | 集团客户查询 | GET | `/api/cm/group-customers` | 按客户ID、客户名称、KOB、CVR 查询集团客户，返回列表及总数。 |

### identification 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 210 | 查询认证信息表单 | GET | `/api/cm/identification/list` | 查询认证信息表单。 |

### kobTT 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 117 | KOB tt 查询 | GET | `/api/cm/kobTT/query` | KOB tt 查询 |
| 118 | KOB tt 查询总数 | GET | `/api/cm/kobTT/count` | KOB tt 查询总数 |
| 121 | 获取TT详情链接 | GET | `/api/cm/kobTT/queryUrl` | 获取TT详情页面URL。该方法根据租户ID从静态数据中获取TT详情页面的URL配置 返回信息: TT详情页面URL字符串 |

### log 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 316 | 查询业务历史记录 | GET | `/api/cm/log/busi/his/{id}/cnd` | 查询业务记录历史 |
| 317 | 查询业务历史记录数 | GET | `/api/cm/log/busi/his/{id}/count` | 查询业务记录历史数 |

### manager 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 100 | 查询客户经理1 | GET | `/api/cm/manager/query` | 查询客户经理 |
| 101 | 查询客户经理总数 | GET | `/api/cm/manager/queryCount` | 查询客户经理总数 |

### organization 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 104 | 查询组织信息 | GET | `/api/cm/organization/queryInfo` | 查询组织信息 |
| 105 | 查询组织总数 | GET | `/api/cm/organization/countInfo` | 查询组织总数 |

### party 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 128 | 查询custId | GET | `/api/cm/party/queryCustId/{partyId}` | 根据参与人ID获取客户ID。该方法接收参与人ID，调用参与人服务查询该参与人对应的客户ID。如果查询到客户ID大于0，则返回成功标志和客户ID，否则返回成功标志和空客户ID 返回信息: 包含查询结果的Map，key包括"retFlag"（"… |
| 129 | 保存使用者 | POST | `/api/cm/party/saveInsUser` | 保存实例用户信息。该方法接收实例用户VO对象，从用户信息数组中提取区域ID，如果区域ID不为空则设置中心信息为区域ID，然后调用客户服务处理号码分配，将用户信息分配给指定客户 返回信息: 包含操作结果的Map，key包括"retFlag"（… |
| 203 | 获取新的参与者ID | GET | `/api/cm/party/id` | 获取新的参与人ID。该方法调用通用服务生成新的参与人序列ID 返回信息: 新的参与人ID，Long类型 |
| 301 | 查询partyAcctrel信息 | GET | `/api/cm/party/acc/rel` | 根据传入的参数查询partyAcctrel信息 |
| 302 | 根据partyId查询party信息 | GET | `/api/cm/party/{partyId}` | 根据partyId查询party信息。 |
| 318 | 根据partyId查party信息 | GET | `/api/cm/party/{partyId}/mask` | 根据partyId查party信息 |
| 319 | queryPartyRole | GET | `/api/cm/party/{partyId}/role` | queryPartyRole |
| 320 | queryAsPartyByCertCodeAndLog | POST | `/api/cm/party/certcodelog` | 根据证件代码和日志查询参与人。该方法接收查询条件Map和分页参数，将条件转换为DataContainer，调用参与人服务根据证件代码和日志查询参与人信息。 |
| 321 | 查询partyList分页 | POST | `/api/cm/party/condition` | 根据条件查询参与人列表。该方法接收查询条件Map和分页参数，将条件转换为DataContainer，调用跨中心参与人服务查询符合条件的参与人列表 返回信息: 参与人值数组，包含符合查询条件的参与人信息列表 |
| 322 | 查询partyList总数 | POST | `/api/cm/party/condition/count` | 根据条件查询参与人数量。该方法接收查询条件Map，将条件转换为DataContainer，调用跨中心参与人服务查询符合条件的参与人总数 返回信息: 符合条件的参与人总数，int类型 |
| 330 | 查询创建party | POST | `/api/cm/party/search/{searchType}` | 创建参与人。该方法接收参与人信息Map，根据搜索类型（SEARCH_TYPE）进行不同处理：类型"1"表示根据证件类型和证件代码查询，如果不存在则调用CPR系统查询，如果CPR返回有firstName则创建参与人；类型"2"表示根据名称生日… |
| 335 | 查询certCode | GET | `/api/cm/party/{partyId}/indiv/cercode` | 根据参与人ID查询证件代码。该方法接收参与人ID，查询参与人信息，返回证件代码 返回信息: 包含查询结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"certCode"（证件代码） |
| 336 | checkPartyInfor | GET | `/api/cm/party/{partyId}/info` | 检查参与人信息。该方法接收参与人ID，查询参与人信息，返回CPR号码、状态和参与人类型 返回信息: 包含检查结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息）、"cprNumbe… |
| 338 | checkUniqueParty | GET | `/api/cm/party/{partyId}/unique` | 检查唯一参与人。该方法接收参与人ID、名字、姓氏、地址ID和生日，通过名称生日地址校验参与人是否已经存在，如果存在且不是当前参与人，则返回已存在的参与人ID 返回信息: 包含检查结果的Map，key包括"hasExist"（"Y"表示已存在… |
| 339 | checkCprRegistHasComplete | GET | `/api/cm/party/{partyId}/regist` | 检查CPR注册是否完成。该方法接收参与人ID，查询参与人信息获取CPR ID，然后查询CPR注册工单状态，如果存在状态为"P"（进行中）的工单，则表示注册未完成 返回信息: 包含检查结果的Map，key包括"hasComplete"（"Y"… |
| 340 | modifyPartyInformation | PUT | `/api/cm/party/info` | 修改参与人信息。该方法接收参与人信息VO，如果参与人ID大于0，则调用参与人服务修改参与人的名字、姓氏、生日、地址ID、地址详情、性别和证件代码 返回信息: 包含修改结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）… |
| 341 | 保存修改User信息 | PUT | `/api/cm/party/userInfo` | 修改用户信息（仅用于choose payer页面修改user信息）。该方法接收参与人信息VO，查询该参与人下的客户信息，如果客户类型为USER，则修改客户基本信息（名字、姓氏、客户名称、性别、证件代码、生日等），如果地址发生变化则更新地址信… |
| 716 | 按pary名查询party信息 | GET | `/api/cm/party/byname` |  |
| 717 | 按pary名查询party信息(总数) | GET | `/api/cm/party/byname/count` |  |
| 729 | 根据联系信息编号查询参与人联系信息 | GET | `/api/cm/party/contact/{contId}` |  |
| 730 | 根据联系id查询联系信息 | GET | `/api/cm/party/groupContact/{custContId}` |  |
| 731 | 查询集团联系人信息(分页) | POST | `/api/cm/party/group/partycontact/page` | 查询集团联系人信息。 |
| 732 | 查询集团联系人信息(总数) | POST | `/api/cm/party/group/partycontact/count` | 根据客户ID、账单ID、联系人名称等条件统计集团联系人数量，对于子集团会继承根集团的可继承联系人一并统计。 |

### preferance 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 102 | 查询客户偏好 | GET | `/api/cm/preferance/queryInfo/{custId}` | 查询客户偏好 |
| 103 | 查询客户偏好总数 | GET | `/api/cm/preferance/countInfo/{custId}` | 查询客户偏好总数 |
| 111 | 删除偏好信息 | DELETE | `/api/cm/preferance/delete` | 删除偏好信息 |
| 115 | 保存客户偏好 | POST | `/api/cm/preferance/save` | 保存客户偏好 |

### preferanceTime 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 107 | 获取偏好时间 | GET | `/api/cm/preferanceTime/queryInfo/{preferChannelId}` | 获取偏好时间 |
| 108 | 获取偏好时间总数 | GET | `/api/cm/preferanceTime/countInfo/{preferChannelId}` | 获取偏好时间总数 |
| 112 | 删除偏好时间 | DELETE | `/api/cm/preferanceTime/delete` | 删除偏好时间 |
| 116 | 保存偏好时间 | POST | `/api/cm/preferanceTime/save` | 保存偏好时间 |

### province 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 106 | 获取省级等操作权限 | GET | `/api/cm/province/control` | 获取省级等操作权限 |

### service 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 132 | getCustInfoByBillId | GET | `/api/cm/service/getCustInfoByBillId` | 根据账单ID获取客户信息。该方法接收账单ID，调用客户服务查询客户简单信息，返回客户ID和客户名称 返回信息: 包含客户信息的Map，key包括"KEY_RSLT_VAL"（"DO_SUCC"表示成功，"DO_FAIL"表示失败）、"KEY… |
| 347 | validateContact | POST | `/api/cm/service/CmIndivAction/validateContact` | 校验联系人。该方法接收客户ID、名字、姓氏和生日，查询客户的邮箱和联系电话联系媒介，验证邮箱和电话不能重复，然后根据客户名称、生日和地址验重，如果存在重复则抛出业务异常 返回信息: 包含校验结果的Map，key包括"retFlag"（"Y"… |
| 348 | validateCust | POST | `/api/cm/service/CmIndivCustomerAction/validateCust` | 校验客户。该方法根据客户ID查询客户联系媒介，然后根据地址ID和客户名称查询客户联系人，如果存在匹配的联系人则校验失败 返回信息: 包含校验结果的Map，key包括"retFlag"（"Y"表示校验通过，"N"表示校验不通过，即存在匹配的联… |
| 349 | checkTransferDonner | POST | `/api/cm/service/RbossSoAction/checkTransferDonner` | 校验过户下家。该方法根据客户ID查询客户信息，校验客户状态是否有效（在网、潜在、非活跃状态），如果客户状态为停机状态或无效状态则不允许过户。同时判断是否为匿名客户，匿名客户不允许过户。如果是批量过户流程（billId不为空），则判断B2B … |
| 350 | getFormOfAddress | GET | `/api/cm/service/Common/getFormOfAddress` | 获取称呼形式。该方法查询客户状态为"1"的静态数据，将其转换为JSON格式的字符串数组，每个元素包含text（代码名称）和value（代码值） 返回信息: JSON格式的字符串，包含称呼形式的选项列表，格式为[{"text":"代码名称",… |
| 351 | queryCustomersAndLog | POST | `/api/cm/service/ICmCustomerSV/queryCustomersAndLog` | 根据XML条件查询客户列表，记录查询日志，并补充行业、地址、层级、客户经理等关联信息后返回。 |
| 352 | queryPOAByCustId | POST | `/api/cm/service/CmIndivAction/queryPOAByCustId` | 根据客户ID查询POA（授权委托书）信息。该方法调用客户服务查询POA信息，如果查询结果不为空则解析JSON数据，根据全名、生日、生效时间和到期时间过滤匹配的POA记录，返回POA信息的JSON字符串 返回信息: 包含查询结果的Map，ke… |
| 353 | queryAcctsById | POST | `/api/cm/service/ICmAccountSV/queryAcctsById` |  |
| 354 | queryAcctsCountById | POST | `/api/cm/service/ICmAccountSV/queryAcctsCountById` |  |
| 355 | queryIndivContactByCustContId | POST | `/api/cm/service/ICmContactSV/queryIndivContactByCustContId` |  |
| 356 | savePartyContactInfo | POST | `/api/cm/service/CmIndivAction/savePartyContactInfo` | 保存参与人联系信息。该方法接收集团成员Bean、参与人联系Bean和参与人Bean，如果参与人联系信息被修改则保存参与人联系信息，然后创建个人联系关系记录 返回信息: 包含保存结果的Map，key包括"retFlag"（"Y"表示成功，"N… |
| 357 | saveDkIndivContactInfo | POST | `/api/cm/service/CmIndivAction/saveDkIndivContactInfo` | 保存丹麦个人联系信息。该方法接收集团成员Bean、参与人联系Bean和参与人Bean，如果是新增则创建个人联系关系、参与人联系信息和参与人基本信息；如果是修改则更新这些信息。方法会设置参与人名称（根据firstName、middleName… |
| 358 | validateIndivContact | POST | `/api/cm/service/CmIndivAction/validateIndivContact` | 校验个人联系人。该方法根据参与人ID和客户ID查询个人联系人，如果存在匹配的联系人则校验成功 返回信息: 包含校验结果的Map，key包括"retFlag"（"Y"表示校验成功（存在匹配的联系人），"N"表示校验失败（不存在匹配的联系人）） |
| 359 | queryCprLogInfo | POST | `/api/cm/service/ICmCustomerSV/queryCprLogInfo` |  |
| 360 | queryCprLogInfoCount | POST | `/api/cm/service/ICmCustomerSV/queryCprLogInfoCount` | 查询CPR日志信息数量。该方法接收查询条件Map，构建XML查询条件，然后调用客户服务查询符合条件的CPR日志信息总数 返回信息: 符合条件的CPR日志信息总数，int类型 |
| 361 | queryCustContactCount | POST | `/api/cm/service/ICmContactSV/queryCustContactCount` | 查询客户联系人数量。该方法接收查询条件Map和Bean名称，通过参数工具类构建XML查询条件，然后调用联系人服务查询符合条件的客户联系人总数 返回信息: 客户联系人总数，返回符合查询条件的联系人记录数量 |
| 362 | queryCustContacts | POST | `/api/cm/service/ICmContactSV/queryCustContacts` | 查询客户联系人列表。该方法接收查询条件Map、Bean名称和分页参数（起始索引和结束索引），通过参数工具类构建XML查询条件，然后调用联系人服务查询符合条件的客户联系人列表，支持分页查询 返回信息: 客户联系人值数组，包含符合查询条件的联系… |
| 363 | query360AllUserList | POST | `/api/cm/service/ICrmFSV/query360AllUserList` | 根据客户ID、产品目录、账单ID、产品ID等条件，查询并返回该客户下所有符合条件的用户列表，包含用户基本信息、产品信息、协议期、VPN信息、操作链接等，并按账单ID排序后分页返回。 |
| 364 | query360AllUserListCount | POST | `/api/cm/service/ICrmFSV/query360AllUserListCount` | 根据客户ID、产品目录ID、账单ID和套餐ID，查询360度全量用户列表中符合条件的用户关系数量。 |
| 365 | query360AllUserListView | POST | `/api/cm/service/ICrmFSV/query360AllUserListView` |  |
| 366 | query360AllUserListViewCount | POST | `/api/cm/service/ICrmFSV/query360AllUserListViewCount` |  |
| 369 | getCustVpnRelation | POST | `/api/cm/service/IBbossCustVpnRelSV/getCustVpnRelation` | 根据客户ID分页查询该客户在VPN关系中的关联客户列表；若该客户是VPN拥有者则返回其受益客户列表，若是受益者则返回其拥有者客户列表。 |
| 370 | getCustVpnRelationCount | POST | `/api/cm/service/IBbossCustVpnRelSV/getCustVpnRelationCount` | 该方法统计指定客户在VPN关系中的关联数量（作为owner或benefi的所有关系记录数）。 |
| 371 | searchServiceNum | POST | `/api/cm/service/RbossSoAction/searchServiceNum` | 查询服务号码是否在实例表中存在。该方法接收服务号码，设置中心信息为账单ID，调用getUserInfoByBillId方法查询用户信息。如果查询到用户信息则返回成功标志，否则返回失败标志和错误消息 返回信息: 包含查询结果的Map，key包… |
| 372 | queryVpmnTransferResult | POST | `/api/cm/service/IBbossVpnTransferResultSV/queryVpmnTransferResult` |  |
| 373 | queryVpmnTransferResultCount | POST | `/api/cm/service/IBbossVpnTransferResultSV/queryVpmnTransferResultCount` |  |
| 374 | getUsersByInsOfferIdRoleId | POST | `/api/cm/service/RbossSoBF/getUsersByInsOfferIdRoleId` | 根据产品实例ID和角色ID获取用户列表。该方法接收产品实例ID、账单ID、角色ID、有效类型、区域ID字符串、是否主角色和分页参数，设置中心信息为账单ID，调用实例用户服务查询符合条件的用户列表 返回信息: 用户信息的DataContain… |
| 375 | createInsUserTable | POST | `/api/cm/service/IInsUserSV/createInsUserTable` |  |
| 376 | getRegionIdByUserId | GET | `/api/cm/service/CommonBF/getRegionIdByUserId` | 根据用户ID获取区域ID。该方法通过中心工具类查询指定用户ID对应的区域ID 返回信息: 区域ID字符串，如果查询失败则返回null |
| 377 | getOfferRelatRoleValue | POST | `/api/cm/service/ICrmProductSV/getOfferRelatRoleValue` |  |
| 378 | getProductSpecByRoleId | POST | `/api/cm/service/ICrmProductSV/getProductSpecByRoleId` |  |
| 379 | getUserProdsInfoTree | GET | `/api/cm/service/Cust360ViewBF/getUserProdsInfoTree` | 获取用户产品信息树。该方法根据用户ID设置中心信息，然后调用CRM服务获取用户的产品信息树结构，用于360视图展示用户的产品信息 返回信息: 数据容器数组，包含用户的产品信息树结构，每个元素代表一个产品节点 |
| 380 | query360UserAccrel | GET | `/api/cm/service/Cust360ViewBF/query360UserAccrel` | 查询360用户账户关系。该方法根据用户ID设置中心信息，然后调用CRM服务查询用户的账户关系信息，用于360视图展示用户的账户关系 返回信息: 数据容器数组，包含用户的账户关系信息列表，每个元素代表一个账户关系记录 |
| 738 | queryAcctUserRel分页 | POST | `/api/cm/service/ICmDkCustomerSV/queryAcctUserRel` |  |
| 739 | queryAcctUserRel总数 | POST | `/api/cm/service/ICmDkCustomerSV/queryAcctUserRelCount` |  |
| 740 | getInsAccrelsByAcct | POST | `/api/cm/service/ICmDkCustomerSV/getInsAccrelsByAcct` |  |
| 741 | getInsAccrelsCountByAcct总数 | POST | `/api/cm/service/ICmDkCustomerSV/getInsAccrelsCountByAcct` |  |
| 743 | queryCustomerByCustId | POST | `/api/cm/service/ICmCustomerSV/queryCustomerByCustId` |  |
| 744 | queryUserNumbers | POST | `/api/cm/service/ICmDkCustomerSV/queryUserNumbers` |  |
| 745 | queryUserNumbersCount | POST | `/api/cm/service/ICmDkCustomerSV/queryUserNumbersCount` |  |
| 746 | queryEmployeeView | POST | `/api/cm/service/ICmDkCustomerSV/queryEmployeeView` |  |
| 747 | queryPersonViewAndLog | POST | `/api/cm/service/ICmDkCustomerSV/queryPersonViewAndLog` |  |
| 748 | queryByCustIdForShow | POST | `/api/cm/service/ICmCustRequestTaskSV/queryByCustIdForShow` |  |
| 749 | validateCustAddress | POST | `/api/cm/service/CmIndivCustomerAction/validateCustAddress` | 校验客户地址。该方法接收客户ID和地址类型，查询客户联系媒介，如果地址类型为合法地址且存在地址信息，则返回成功标志 返回信息: 包含校验结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息… |
| 750 | validateCustAndAddress | POST | `/api/cm/service/CmIndivCustomerAction/validateCustAndAddress` | 校验客户和地址。该方法接收客户名称、初始客户ID和生日，查询客户的合法地址联系媒介，然后根据客户名称、生日和地址ID或地址详情查询客户信息，如果查询到的客户ID与初始客户ID不一致，则校验失败 返回信息: 包含校验结果的Map，key包括"… |
| 806 | party信息查询 | GET | `/api/cm/service/ICmDkCustomerSV/queryPartyView` | 根据参与人ID查询参与人视图信息（包括基本信息、客户ID、法律地址等），并根据角色类型和操作类型决定是否生成客户ID的超链接，同时对证件号码进行脱敏处理。 |
| 807 | party b2b信息查询 | GET | `/api/cm/service/ICmDkCustomerSV/queryOrgViewAndLog` | party b2b信息查询 |
| 808 | party 角色查询 | POST | `/api/cm/service/ICmPartyRoleSV/queryPartyRoles` | party 角色查询 |
| 809 | checkHasOtherRolesWithoutPayer | GET | `/api/cm/service/CmLnAccountAction/checkHasOtherRolesWithoutPayer` | 检查是否有除付款人外的其他角色。该方法接收参与人ID，查询该参与人的所有角色，判断角色类型组合：如果只有付款人角色（5）或只有用户角色（2），或只有用户和付款人两种角色，则允许编辑；如果有客户角色（1）或其他角色组合，则不允许编辑 返回信息… |
| 810 | queryCmxIndivCustValueAndLog | GET | `/api/cm/service/ICmCustomerSV/queryCmxIndivCustValueAndLog` | queryCmxIndivCustValueAndLog |
| 811 | queryCustContacts | GET | `/api/cm/service/CmIndivAction/queryCustContacts` | 查询客户联系人。该方法根据客户ID查询客户联系人信息，如果联系人存在且未过期，则返回监护人姓名和更新日期 返回信息: 包含查询结果的Map，key包括"retFlag"（"Y"表示查询成功且有有效联系人，"N"表示查询失败或无有效联系人）、… |
| 812 | deleteIndivCustomer | DELETE | `/api/cm/service/CmIndivAction/deleteIndivCustomer` | 删除个人客户。该方法根据客户ID删除客户信息，如果客户在群组中则执行出群、解散群或转让群操作 返回信息: 包含删除结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，失败时包含异常信息） |
| 818 | queryDuplicateCustCount | GET | `/api/cm/service/ICmIndivCustomerSV/queryDuplicateCustCount` | queryDuplicateCustCount |
| 819 | queryDuplicateCust | GET | `/api/cm/service/ICmIndivCustomerSV/queryDuplicateCust` | queryDuplicateCust |
| 820 | queryDuplicateCprIds | GET | `/api/cm/service/CmIndivAction/queryDuplicateCprIds` | 查询重复CPR ID。该方法根据客户ID查询客户扩展信息，获取重复的CPR ID列表 返回信息: 包含查询结果的Map，key包括"cprIds"（重复的CPR ID字符串，多个ID用逗号分隔）、"retFlag"（"N"表示查询失败，仅当… |
| 822 | getHierarchyStatus | GET | `/api/cm/service/CmCustomerAction/getHierarchyStatus` | getHierarchyStatus,没有对应方法 |
| 823 | queryGroupOrgNode | GET | `/api/cm/service/CmCustomerAction/checkGroupOrgNode` | queryGroupOrgNode |
| 824 | addOffLineMemberByCpr | GET | `/api/cm/service/CmIndivCustomerAction/addOffLineMemberByCpr` | 根据CPR添加离线成员。该方法根据CPR号码查询参与人信息，如果参与人存在则判断是否为客户、付款人或联系人，并返回相应的信息。如果参与人不存在，则调用CPR接口验证CPR号码，获取客户信息（姓名、生日、地址等），判断是否受保护、是否移民或消… |
| 825 | queryCustAcctRels | POST | `/api/cm/service/ICmAccountSV/queryCustAcctRels` | queryCustAcctRels |
| 826 | getParamValue | POST | `/api/cm/service/ICmCommonSV/getParamValue` | getParamValue |
| 827 | queryB2BCustomers | POST | `/api/cm/service/ICustomerSearchSV/queryB2BCustomers` | 根据多个条件查询并返回企业客户信息的分页列表。 |
| 828 | countB2BCustomers | POST | `/api/cm/service/ICustomerSearchSV/countB2BCustomers` | 根据多个查询条件查询符合条件的客户数量。 |
| 835 | statisticCustData | POST | `/api/cm/service/FrameCommonAction/statisticCustData` | 统计客户数据。该方法根据客户类型获取对应的视图配置，然后调用远程服务统计客户相关的数据，包括待处理订单数、商机数、个人案例数、企业案例数和活动数。统计结果以格式化后的数字字符串形式返回 返回信息: 包含统计结果的Map，key包括"ret_… |
| 836 | getCustImageHtml | POST | `/api/cm/service/FrameCommonAction/getCustImageHtml` | 获取客户图片HTML。该方法接收客户ID、真实客户类型、文件路径、文件名和上下文路径，根据客户类型和性别生成客户头像的HTML img标签，如果图片加载失败则显示默认头像（个人客户根据性别显示不同头像，集团客户显示集团头像） 返回信息: 包… |
| 838 | QueryCustInfoItem | POST | `/api/cm/service/IOf2CustInfoItemSV/QueryCustInfoItem` | QueryCustInfoItem |
| 839 | QueryCustInfoItemCount | POST | `/api/cm/service/IOf2CustInfoItemSV/QueryCustInfoItemCount` | QueryCustInfoItem |
| 840 | queryVcCustItem | POST | `/api/cm/service/IOf2VcCustItemSV/queryVcCustItem` | queryVcCustItem |
| 841 | queryVcCustItemCount | POST | `/api/cm/service/IOf2VcCustItemSV/queryVcCustItemCount` | queryVcCustItemCount |
| 843 | getCustType | GET | `/api/cm/service/CmCommonUtil/getCustType` | 获取客户类型。该方法根据客户ID查询客户类型，如果客户ID小于等于0则抛出业务异常，通过SN工具类获取客户类型 返回信息: 客户类型整数值，如果查询失败则抛出业务异常 |
| 846 | saveVcCustItemInfo | POST | `/api/cm/service/CustItemBFImpl/saveVcCustItemInfo` | 保存视图客户项信息。该方法接收客户类型、所属系统和项目代码列表，获取当前用户ID和最大排序号，然后将项目代码列表按逗号分割，为每个项目代码创建视图客户项Bean（设置可见性、排序号等），最后批量保存这些客户项信息 返回信息: 包含保存结果的… |
| 847 | deleteVcCustItemInfo | POST | `/api/cm/service/CustItemBFImpl/deleteVcCustItemInfo` | 删除视图客户项信息。该方法接收客户类型、所属系统和项目代码列表，获取当前用户ID，删除指定的视图客户项，然后重新获取剩余的客户项并重新排序（从1开始），最后批量保存更新后的排序号 返回信息: 包含删除结果的Map，key包括"retVal"… |
| 848 | moveVcCustItemData | POST | `/api/cm/service/CustItemBFImpl/moveVcCustItemData` | 移动视图客户项数据。该方法接收项目代码、客户类型、所属系统、操作标志和排序号，获取当前用户ID，然后调用视图客户项服务移动客户项数据（用于调整客户项的顺序） 返回信息: 包含移动结果的Map，key包括"retVal"（"Y"表示成功，"N… |
| 856 | getSkinAndMenuStyle | GET | `/api/cm/service/PartyBFImpl/getSkinAndMenuStyle` | 获取皮肤和菜单样式。该方法查询当前用户的视觉配置信息，返回皮肤颜色和菜单样式，如果用户未配置则返回默认值（"0,1"） 返回信息: 包含皮肤和菜单样式的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（… |
| 857 | queryCustAcctRelFor360New | POST | `/api/cm/service/Cust360ViewBFImpl/queryCustAcctRelFor360New` | 查询客户账户关系（360视图新版本）。该方法接收多个查询条件（关联客户ID、账户ID、账户名称、分期标志、支付方式、周期类型、客户状态、账户服务ID、服务号码、PBS、EAN等）和分页参数，调用账户服务查询客户账户关系列表。同时根据用户ID… |
| 877 | acctInfoBybillAndCust | POST | `/api/cm/service/query/acctInfoBybillAndCust` | 根据客户ID和账单ID查询账户详情。该方法接收客户ID、区域ID、账单ID、支付方式、保险标志、协议ID、账户名称、账户ID和分页参数，查询符合条件的账户详情列表和总数 返回信息: 包含查询结果的Map，key包括"TOTAL"（总记录数）… |
| 887 | queryCust | POST | `/api/cm/service/queryCust` | 查询客户。该方法接收查询类型和查询值，根据查询类型进行不同处理：类型"1"表示根据账单ID（实际为电话号码）查询，调用getCustInfoByBillId方法；类型"0"表示根据邮箱查询，调用CM2CS服务查询客户。如果查询到客户信息，则… |
| 2000 | 查询参与人列表 | POST | `/api/cm/service/ICmDkCustomerSV/queryPartyList` | 查询参与人列表。该方法接收查询参与人VO和分页参数，提取查询条件（参与人类型、参与人名称、名字、姓氏、证件类型、证件代码、地址ID、参与人ID），构建XML查询参数，调用丹麦客户服务查询参与人列表 返回信息: DataContainer数组… |
| 2001 | 查询参与人列表count | POST | `/api/cm/service/ICmDkCustomerSV/queryPartyListCount` | 查询参与人列表数量。该方法接收查询参与人VO，提取查询条件，构建XML查询参数，调用丹麦客户服务查询符合条件的参与人总数 返回信息: 符合条件的参与人总数，int类型 |
| 2002 | 查询支付者信息 | POST | `/api/cm/service/ICmDkCustomerSV/queryPayerView` | 查询支付者信息 |
| 2003 | 查询支付者账户列表 | POST | `/api/cm/service/ICmAccountSV/queryPayerAccts` | 查询支付者账户列表 |
| 2004 | 查询支付者账户列表count | POST | `/api/cm/service/ICmAccountSV/queryPayerAcctsCount` | 查询支付者账户列表count |
| 2005 | 根据PartyId，查询所有关联的b2b客户 | POST | `/api/cm/service/ICmContactSV/queryCustConByPartyIdForPage` | 根据PartyId，查询所有关联的b2b客户 |
| 2006 | 根据PartyId，查询所有关联的b2b客户count | POST | `/api/cm/service/ICmContactSV/queryCustConCountByPartyId` | 根据PartyId，查询所有关联的b2b客户count |

### user 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 136 | 查询用户使用者 | GET | `/api/cm/user/query` | 查询用户使用者 |

### userInfo 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 125 | 查询用户使用者 | GET | `/api/cm/userInfo/query` | 查询用户使用者 |
| 126 | 查询用户使用者总数 | GET | `/api/cm/userInfo/count` | 查询用户使用者总数 |

### userPartyInfo 相关接口

| sys_id | 接口名称 | HTTP方法 | API路径 | 功能描述 |
|--------|---------|---------|---------|---------|
| 123 | 查询用户party信息 | GET | `/api/cm/userPartyInfo/query` | 查询用户party信息 |
| 124 | 查询客户下的用户总数 | GET | `/api/cm/userPartyInfo/count` | 查询客户下的用户总数 |
---
## 三、接口详细说明

### 3.1 创建B2B客户（2）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 2 |
| 接口名称 | 创建B2B客户 |
| HTTP方法 | POST |
| API路径 | `/api/cm/b2b/customer` |
| 功能描述 | 创建B2B客户 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#saveGroupCustomer |

**请求参数**：c

| - | - | - | - | - | - |

**请求示例**：

```http
GET /api/cm/customers/23210011018282/identifications
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "taxId": null,
    "custSeg": "200000000003",
    "custCode": "0001650941"
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.2 保存客户地址（4）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 4 |
| 接口名称 | 保存客户地址 |
| HTTP方法 | POST |
| API路径 | `/api/cm/address` |
| 功能描述 | 保存客户地址 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#addCustAddress |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.3 查询客户联系媒介（5）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 5 |
| 接口名称 | 查询客户联系媒介 |
| HTTP方法 | GET |
| API路径 | `/api/cm/contactMedium/page` |
| 功能描述 | 查询客户联系媒介 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryCustElectronicMediumForPage |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 |  |  |
| start | int | QUERY | 是 |  |  |
| end | int | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.4 查询客户经理1（100）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 100 |
| 接口名称 | 查询客户经理1 |
| HTTP方法 | GET |
| API路径 | `/api/cm/manager/query` |
| 功能描述 | 查询客户经理 |
| 方法来源 | com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.ISec2CmSV#queryCustManager |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| code | String | QUERY | 否 | Staff Code |  |
| staffName | String | QUERY | 否 | staff Name |  |
| orgName | String | QUERY | 否 | select organization id |  |
| districtId | String | QUERY | 否 | not use |  |
| countyId | String | QUERY | 否 | not use |  |
| ownerArea | String | QUERY | 否 | not use |  |
| billId | String | QUERY | 否 | billId |  |
| start | int | QUERY | 是 |  |  |
| end | int | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.5 查询客户经理总数（101）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 101 |
| 接口名称 | 查询客户经理总数 |
| HTTP方法 | GET |
| API路径 | `/api/cm/manager/queryCount` |
| 功能描述 | 查询客户经理总数 |
| 方法来源 | com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.ISec2CmSV#queryCustManagerCond |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| code | String | QUERY | 否 | Staff Code |  |
| staffName | String | QUERY | 否 | staff Name |  |
| orgName | String | QUERY | 否 | select organization id |  |
| districtId | String | QUERY | 否 | not use |  |
| countyId | String | QUERY | 否 | not use |  |
| ownerArea | String | QUERY | 否 | not use |  |
| billId | String | QUERY | 否 | billId |  |

**请求示例**：

```http
GET /api/cm/manager/queryCount?orgName=100632
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 4,
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.6 查询客户偏好（102）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 102 |
| 接口名称 | 查询客户偏好 |
| HTTP方法 | GET |
| API路径 | `/api/cm/preferance/queryInfo/{custId}` |
| 功能描述 | 查询客户偏好 |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmCustPreferenceInfoSV#queryCustPreferInformation |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | cust id |  |
| start | int | QUERY | 是 |  |  |
| end | int | QUERY | 是 |  |  |

**请求示例**：

```http
GET /api/cm/preferance/queryInfo/23210120133026?pageNum=1&pageSize=10
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [],
  "metaObject": "SETCmCustPerferInfomation001",
  "fieldNameConvert": null
}
```
---

### 3.7 查询客户偏好总数（103）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 103 |
| 接口名称 | 查询客户偏好总数 |
| HTTP方法 | GET |
| API路径 | `/api/cm/preferance/countInfo/{custId}` |
| 功能描述 | 查询客户偏好总数 |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmCustPreferenceInfoSV#queryCustPreferInformationCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | cust id |  |

**请求示例**：

```http
GET /api/cm/preferance/countInfo/23210120133026
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 0,
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.8 查询组织信息（104）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 104 |
| 接口名称 | 查询组织信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/organization/queryInfo` |
| 功能描述 | 查询组织信息 |
| 方法来源 | com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.ISec2CmSV#querySecOrg |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| orgId | long | QUERY | 否 | org id |  |
| orgName | String | QUERY | 否 | org name |  |
| districtId | String | QUERY | 否 | districtId |  |
| countyId | String | QUERY | 否 | countyId |  |
| ownerArea | String | QUERY | 否 | ownerArea |  |
| start | int | QUERY | 是 |  |  |
| end | int | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.9 查询组织总数（105）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 105 |
| 接口名称 | 查询组织总数 |
| HTTP方法 | GET |
| API路径 | `/api/cm/organization/countInfo` |
| 功能描述 | 查询组织总数 |
| 方法来源 | com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.ISec2CmSV#querySecOrgCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| orgId | long | QUERY | 否 | org id |  |
| orgName | String | QUERY | 否 | org name |  |
| districtId | String | QUERY | 否 | districtId |  |
| countyId | String | QUERY | 否 | countyId |  |
| ownerArea | String | QUERY | 否 | ownerArea |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.10 获取省级等操作权限（106）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 106 |
| 接口名称 | 获取省级等操作权限 |
| HTTP方法 | GET |
| API路径 | `/api/cm/province/control` |
| 功能描述 | 获取省级等操作权限 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#checkManagerPrivs |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.11 获取偏好时间（107）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 107 |
| 接口名称 | 获取偏好时间 |
| HTTP方法 | GET |
| API路径 | `/api/cm/preferanceTime/queryInfo/{preferChannelId}` |
| 功能描述 | 获取偏好时间 |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmCustPreferenceInfoSV#queryCustPreferTimeInfor |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| preferChannelId | long | PATH | 是 | preferChannelId |  |
| pageNum | int | QUERY | 是 |  |  |
| pageSize | int | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.12 获取偏好时间总数（108）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 108 |
| 接口名称 | 获取偏好时间总数 |
| HTTP方法 | GET |
| API路径 | `/api/cm/preferanceTime/countInfo/{preferChannelId}` |
| 功能描述 | 获取偏好时间总数 |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmCustPreferenceInfoSV#queryCustPreferTimeInforCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| preferChannelId | long | PATH | 是 | preferChannelId |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.13 获取客户联系媒介（109）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 109 |
| 接口名称 | 获取客户联系媒介 |
| HTTP方法 | GET |
| API路径 | `/api/cm/cust/ElectronicMedium/query/{custId}` |
| 功能描述 | 获取客户联系媒介 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryCustElectronicMediumForPageSele |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | custId |  |
| start | int | QUERY | 是 |  |  |
| end | int | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.14 获取客户联系媒介总数（110）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 110 |
| 接口名称 | 获取客户联系媒介总数 |
| HTTP方法 | GET |
| API路径 | `/api/cm/cust/ElectronicMedium/count/{custId}` |
| 功能描述 | 获取客户联系媒介总数 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryCustElectronicMediumCountSele |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | custId |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.15 删除偏好信息（111）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 111 |
| 接口名称 | 删除偏好信息 |
| HTTP方法 | DELETE |
| API路径 | `/api/cm/preferance/delete` |
| 功能描述 | 删除偏好信息 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#deleteCustPreference |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | String | QUERY | 是 | custId |  |
| preferChannelId | String | QUERY | 是 | preferChannelId |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.16 删除偏好时间（112）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 112 |
| 接口名称 | 删除偏好时间 |
| HTTP方法 | DELETE |
| API路径 | `/api/cm/preferanceTime/delete` |
| 功能描述 | 删除偏好时间 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#deleteCustPreferTime |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | String | QUERY | 是 | custId |  |
| preferPeriodId | String | QUERY | 是 | preferPeriodId |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.17 查询集团客户（113）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 113 |
| 接口名称 | 查询集团客户 |
| HTTP方法 | POST |
| API路径 | `/api/cm/b2b/queryCust` |
| 功能描述 | 查询集团客户。 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#queryB2BCustomers |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

```http
POST /api/cm/b2b/queryCust
Content-Type: application/json

{
  "custType": "3",
  "matchType": "2",
  "isVpmn": "0",
  "qryType": "1",
  "memberType": "1",
  "managerId": "",
  "custName": "Asiainfo Denmark Software Limited Coperation",
  "custId": "23210120133026",
  "custStatus": "1",
  "page": 1,
  "size": 30
}
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":[{"CUST_ID":23210120133026,"PROTECT_EFF_DATE":"2025-10-01","ORG_ID":21000000,"GROUP_TYPE":2,"CUST_CERT_TYPE":17,"SHORT_NAME":"C","EXT15":"1:1,2:0,3:18,4:13,5:0","PROTECT_EXPIRE_DATE":"2034-12-01","GROUP_SEGMENT_ID":"200000000005","EXT17":"Agent","EXT16":"1:0,2:0,3:0","GROUP_WEB":"Carlsberg","CUST_STATUS_DESC":"Active","POST_CODE":"9172","CREATE_ORG_ID":21000000,"EXPIRE_DATE":"2099-12-31 23:59:59","CONT_ADDRESS":"5306983","LEGAL_FORM":"EÃF","CUST_SERVICE_ID":"","DONE_DATE":"2025-12-22 14:25:37","FORMER_NAME":"Carlsberg Group Entities","REG_AMOUNT":300,"CUST_SERVICE_LEVEL":11,"CUST_TYPE":3,"BI_COMPANY_NAME":"Carlsberg Breweries A/S","MANAGER_ID":101032,"CREATE_DATE":"2025-12-15 19:36:16","STAFF_AMOUNT_TYPE":"G","IS_REVISABLE":0,"CONT_NAME":"Asiainfo Denmark Software Limited Coperation","PARTY_ID":110008472096,"REGION_ID":"2102","EFFECTIVE_DATE":"2025-12-15 19:44:56","DEVELOP_TYPE":1,"CREATE_OP_ID":10131916,"DIRECT_MARKETING_PROTECTION
```
---

### 3.18 查询集团客户总数（114）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 114 |
| 接口名称 | 查询集团客户总数 |
| HTTP方法 | POST |
| API路径 | `/api/cm/b2b/countCust` |
| 功能描述 | 统计B2B客户数量。该方法接收B2B客户查询VO，构建XML查询参数（包括客户ID、客户名称、证件代码、创建日期、客户状态、经理ID、CVR号码、联系手机、客户服务ID、账单ID、县ID、城市ID、证件级别、证件地址、产品名称、生效日期、到期日期、县代码、经理代码、成员类型、成员账单ID、账户ID等），然后调用客户服务查询符合条件的B2B客户总数 返回信息: 符合条件的B2B客户总数，int类型 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#countB2BCustomers |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

```http
POST /api/cm/b2b/countCust
Content-Type: application/json

{
  "custType": "3",
  "matchType": "2",
  "isVpmn": "0",
  "qryType": "1",
  "memberType": "1",
  "managerId": "",
  "custName": "Asiainfo Denmark Software Limited Coperation",
  "custId": "23210120133026",
  "custStatus": "1"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 1,
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.19 保存客户偏好（115）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 115 |
| 接口名称 | 保存客户偏好 |
| HTTP方法 | POST |
| API路径 | `/api/cm/preferance/save` |
| 功能描述 | 保存客户偏好 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#saveCustPreference |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.20 保存偏好时间（116）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 116 |
| 接口名称 | 保存偏好时间 |
| HTTP方法 | POST |
| API路径 | `/api/cm/preferanceTime/save` |
| 功能描述 | 保存偏好时间 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#saveCustPrefeTime |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.21 KOB tt 查询（117）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 117 |
| 接口名称 | KOB tt 查询 |
| HTTP方法 | GET |
| API路径 | `/api/cm/kobTT/query` |
| 功能描述 | KOB tt 查询 |
| 方法来源 | com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.ICs2CmSV#queryTicketListForCm |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | String | QUERY | 是 | custId |  |
| SrcType | String | QUERY | 是 | SrcType |  |
| errorCode | String | QUERY | 否 | errorCode |  |
| strDate | String | QUERY | 是 | strDate |  |
| endDate | String | QUERY | 是 | endDate |  |
| start | int | QUERY | 是 |  |  |
| end | int | QUERY | 是 |  |  |

**请求示例**：

```http
GET /api/cm/kobTT/query?custId=21210419971223&SrcType=CPR&errorCode=&strDate=2026-03-01%2000%3A00%3A00&endDate=2026-03-02%2008%3A43%3A39&pageNum=1&pageSize=10
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [],
  "metaObject": "SETCmTicketInfo001",
  "fieldNameConvert": null
}
```
---

### 3.22 KOB tt 查询总数（118）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 118 |
| 接口名称 | KOB tt 查询总数 |
| HTTP方法 | GET |
| API路径 | `/api/cm/kobTT/count` |
| 功能描述 | KOB tt 查询总数 |
| 方法来源 | com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.ICs2CmSV#queryTicketListCountForCm |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | String | QUERY | 是 | custId |  |
| SrcType | String | QUERY | 是 | SrcType |  |
| errorCode | String | QUERY | 否 | errorCode |  |
| strDate | String | QUERY | 是 | strDate |  |
| endDate | String | QUERY | 是 | endDate |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.23 查询客户组织（119）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 119 |
| 接口名称 | 查询客户组织 |
| HTTP方法 | GET |
| API路径 | `/api/cm/custOrg/query/{deptId}` |
| 功能描述 | 查询客户组织。 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryCustOrganizeById |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| deptId | long | PATH | 是 | 部门ID | 410001940838 |

**请求示例**：

```http
GET /api/cm/custOrg/query/410002020040
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "EFFECTIVE_DATE": "2026-01-27 16:14:48",
    "REGION_ID": "2107",
    "DEPT_ID": 410002020040,
    "CREATE_OP_ID": 10131916,
    "CUST_ID": 23210120133026,
    "DEPT_NAME": "Asiainfo Denmark Software Limited Coperation",
    "ORG_ID": 21000000,
    "DONE_DATE": "2026-01-27 16:14:48",
    "DONE_CODE": 20002194858,
    "OP_ID": 10131916,
    "HAS_LEAF": 1,
    "STATE": "U",
    "PARENT_DEPT_NAME": "Asiainfo Denmark Software Limited Coperation",
    "CREATE_DATE": "2025-12-15 19:36:16",
    "REL_CUST_ID": 23210120133026,
    "IS_REVISABLE": 1,
    "PARENT_DEPT_ID": 23210120133026,
    "REL_CUST_NAME": "Asiainfo Denmark Software Limited Coperation",
    "CREATE_ORG_ID": 21000000,
    "EXPIRE_DATE": "2099-12-31 23:59:59",
    "DEPT_TYPE": 0
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.24 校验是否有子部门（120）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 120 |
| 接口名称 | 校验是否有子部门 |
| HTTP方法 | GET |
| API路径 | `/api/cm/custOrg/check` |
| 功能描述 | 校验是否有子部门 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#checkGroupDeptParent |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| deptId | long | QUERY | 是 | deptId |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.25 获取TT详情链接（121）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 121 |
| 接口名称 | 获取TT详情链接 |
| HTTP方法 | GET |
| API路径 | `/api/cm/kobTT/queryUrl` |
| 功能描述 | 获取TT详情页面URL。该方法根据租户ID从静态数据中获取TT详情页面的URL配置 返回信息: TT详情页面URL字符串 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#getTTDetailPageUrl |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.26 校验是否同名（122）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 122 |
| 接口名称 | 校验是否同名 |
| HTTP方法 | GET |
| API路径 | `/api/cm/custOrg/checkSameName` |
| 功能描述 | 校验是否同名 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#checkDeptName |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 | custId |  |
| deptName | String | QUERY | 是 | deptName |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.27 查询用户party信息（123）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 123 |
| 接口名称 | 查询用户party信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/userPartyInfo/query` |
| 功能描述 | 查询用户party信息 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmPartySV#queryPartyInfoForUser |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyName | String | QUERY | 否 | partyName |  |
| certType | String | QUERY | 否 | certType |  |
| certCode | String | QUERY | 否 | certCode |  |
| cvr | String | QUERY | 否 | cvr |  |
| firstName | String | QUERY | 否 | firstName |  |
| lastName | String | QUERY | 否 | lastName |  |
| custId | String | QUERY | 否 | custId |  |
| partyId | String | QUERY | 否 | partyId |  |
| start | int | QUERY | 是 |  |  |
| end | int | QUERY | 是 |  |  |

**请求示例**：

```http
GET /api/cm/userPartyInfo/query?firstName=liang&pageNum=1&pageSize=10
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [
    {
      "PARTY_NAME": "Liang Jie",
      "PARTY_ID": 110004383290
    },
    {
      "PARTY_NAME": "Liang Jie",
      "PARTY_ID": 110004747490
    },
    {
      "PARTY_NAME": "Liang Jie",
      "PARTY_ID": 110008194890
    },
    {
      "PARTY_NAME": "Liang Jie",
      "PARTY_ID": 110005429290
    },
    {
      "PARTY_NAME": "Liang Jie",
      "CERT_CODE": "",
      "PARTY_ID": 110007482095
    },
    {
      "PARTY_NAME": "Liang Jie",
      "PARTY_ID": 110004393090
    },
    {
      "PARTY_NAME": "Liang Jie",
      "PARTY_ID": 110004369693
    },
    {
      "PARTY_NAME": "Liang Jie",
      "CERT_CODE": "0001799552",
      "PARTY_ID": 110004316890,
      "CERT_TYPE": 8
    }
  ],
  "metaObject": "SETCmPartyInfoNew001",
  "fieldNameConvert": null
}
```
---

### 3.28 查询客户下的用户总数（124）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 124 |
| 接口名称 | 查询客户下的用户总数 |
| HTTP方法 | GET |
| API路径 | `/api/cm/userPartyInfo/count` |
| 功能描述 | 查询客户下的用户总数 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmPartySV#queryPartyInfoForUserCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyName | String | QUERY | 否 | partyName |  |
| certType | String | QUERY | 否 | certType |  |
| certCode | String | QUERY | 否 | certCode |  |
| cvr | String | QUERY | 否 | cvr |  |
| firstName | String | QUERY | 否 | firstName |  |
| lastName | String | QUERY | 否 | lastName |  |
| custId | String | QUERY | 否 | custId |  |
| partyId | String | QUERY | 否 | partyId |  |

**请求示例**：

```http
GET /api/cm/userPartyInfo/count?firstName=liang
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 8,
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.29 查询用户使用者（125）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 125 |
| 接口名称 | 查询用户使用者 |
| HTTP方法 | GET |
| API路径 | `/api/cm/userInfo/query` |
| 功能描述 | 查询用户使用者 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryCmInsCmrel |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 | custId |  |
| start | int | QUERY | 是 |  |  |
| end | int | QUERY | 是 |  |  |

**请求示例**：

```http
GET /api/cm/userInfo/query?custId=21210419971223&pageNum=1&pageSize=10&CrossCenter=CrossCenter
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":[{"EFFECTIVE_DATE":"2025-08-22 14:34:59","CUST_ID":21210419971223,"ORG_ID":21000000,"OP_ID":100000032,"IS_ASSIGNED":1,"CMREL_ID":11000012544808,"STATE":1,"USER_ID":42102131798151,"EFFECTIVE_DATE_TYPE":0,"BILL_ID":"16018142","EXPIRE_DATE":"2099-12-31 23:59:59","USER_REGION_CODE":"2102","DONE_DATE":"2025-08-22 14:36:27","DONE_CODE":340008453250,"CUST_ID_T_NAME":"KentÂ¿S Skou Finsen","OFFER_ID":90123264,"USER":"21210320199224","EXPIRE_DATE_TYPE":0,"EXT1":"1","EXT2":"0000000000000000000000000000000000000000000000000000000000000000","CREATE_DATE":"2025-08-22 14:34:59","EXT3":"2025-08-22 14:35:06.917","RELA_TYPE":2,"ACTION":"<a href='javascript:void(0)' class='cellpath' onclick='modifyCustInfo(21210320199224)' style='color:blue;text-decoration:underline'>Edit</a>","USER_TYPE":1,"PROD_CATALOG_ID":171000000001,"USER_T_NAME":"W4WNY5Xq vw6VDLK5"},{"EFFECTIVE_DATE":"2025-08-22 14:53:15","CUST_ID":21210419971223,"ORG_ID":21000000,"OP_ID":1000000
```
---

### 3.30 查询用户使用者总数（126）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 126 |
| 接口名称 | 查询用户使用者总数 |
| HTTP方法 | GET |
| API路径 | `/api/cm/userInfo/count` |
| 功能描述 | 查询用户使用者总数 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryCmInsCmrelCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 | custId |  |

**请求示例**：

```http
GET /api/cm/userInfo/count?custId=21210419971223&CrossCenter=CrossCenter
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 10,
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.31 查询custview 树形（127）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 127 |
| 接口名称 | 查询custview 树形 |
| HTTP方法 | POST |
| API路径 | `/api/cm/custView/query` |
| 功能描述 | 查询custview 树形 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerViewBFImpl#init |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.32 查询custId（128）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 128 |
| 接口名称 | 查询custId |
| HTTP方法 | GET |
| API路径 | `/api/cm/party/queryCustId/{partyId}` |
| 功能描述 | 根据参与人ID获取客户ID。该方法接收参与人ID，调用参与人服务查询该参与人对应的客户ID。如果查询到客户ID大于0，则返回成功标志和客户ID，否则返回成功标志和空客户ID 返回信息: 包含查询结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"custId"（客户ID字符串，查询不到时为空字符串）和"retMsg"（异常信息，仅在失败时存在） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.UserBFImpl#getCustId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | String | PATH | 是 | 参与人ID，用于查询该参与人对应的客户ID |  |

**请求示例**：

```http
GET /api/cm/party/queryCustId/110008542493
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "custId": "21210220204424",
    "retFlag": "Y"
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.33 保存使用者（129）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 129 |
| 接口名称 | 保存使用者 |
| HTTP方法 | POST |
| API路径 | `/api/cm/party/saveInsUser` |
| 功能描述 | 保存实例用户信息。该方法接收实例用户VO对象，从用户信息数组中提取区域ID，如果区域ID不为空则设置中心信息为区域ID，然后调用客户服务处理号码分配，将用户信息分配给指定客户 返回信息: 包含操作结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）和"retMsg"（异常信息，仅在失败时存在） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.UserBFImpl#saveInsUser |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

```http
POST /api/cm/party/saveInsUser
Content-Type: application/json

{
  "ownerCustId": "21210419971223",
  "userInfos": [
    "42102131798151,90123264,2102,171000000001,1,0000000000000000000000000000000000000000000000000000000000000000,21210320199224"
  ],
  "custId": "21210220204424"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "retMsg": "500 Internal Server Error on POST request for \"http://10.1.248.215:18488/flying\": \"{\"timestamp\":\"2026-03-02 08:49:54\",\"status\":500,\"error\":\"Internal Server Error\",\"path\":\"/flying\"}\"",
    "retFlag": "N"
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.34 查询客户组织（130）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 130 |
| 接口名称 | 查询客户组织 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/queryCustOrg` |
| 功能描述 | 查询客户组织 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryCustOrganizesByCustId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 | 查询客户组织 |  |
| start | int | QUERY | 是 |  |  |
| end | int | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.35 查询客户组织总数（131）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 131 |
| 接口名称 | 查询客户组织总数 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/countCustOrg` |
| 功能描述 | 查询客户组织总数 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryCustOrganizeCountByCustId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 | 查询客户组织总数 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.36 getCustInfoByBillId（132）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 132 |
| 接口名称 | getCustInfoByBillId |
| HTTP方法 | GET |
| API路径 | `/api/cm/service/getCustInfoByBillId` |
| 功能描述 | 根据账单ID获取客户信息。该方法接收账单ID，调用客户服务查询客户简单信息，返回客户ID和客户名称 返回信息: 包含客户信息的Map，key包括"KEY_RSLT_VAL"（"DO_SUCC"表示成功，"DO_FAIL"表示失败）、"KEY_RSLT_MSG"（失败时的错误消息）、"CUST_ID"（客户ID）、"CUST_NAME"（客户名称） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#getCustInfoByBillId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| billId | String | QUERY | 是 | 账单ID，用于查询客户信息 |  |

**请求示例**：

```http
GET /api/cm/service/getCustInfoByBillId?billId=16018033
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "CUST_ID": 23210619883367,
    "rsltVal": "Y",
    "CUST_NAME": "zzw b2b20250711145506 zz"
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.37 查询用户使用者（136）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 136 |
| 接口名称 | 查询用户使用者 |
| HTTP方法 | GET |
| API路径 | `/api/cm/user/query` |
| 功能描述 | 查询用户使用者 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryCmInsCmrel |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| userId | long | QUERY | 是 | userId |  |
| custId | long | QUERY | 是 | custId |  |

**请求示例**：

```http
GET /api/cm/user/query?custId=21210419971223&userId=42102131798151&CrossCenter=CrossCenter
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [
    {
      "EFFECTIVE_DATE": "2025-08-22 14:34:59",
      "CUST_ID": 21210419971223,
      "ORG_ID": 21000000,
      "OP_ID": 100000032,
      "IS_ASSIGNED": 1,
      "CMREL_ID": 11000012544808,
      "STATE": 1,
      "USER_ID": 42102131798151,
      "EFFECTIVE_DATE_TYPE": 0,
      "BILL_ID": "16018142",
      "EXPIRE_DATE": "2099-12-31 23:59:59",
      "USER_REGION_CODE": "2102",
      "DONE_DATE": "2025-08-22 14:36:27",
      "DONE_CODE": 340008453250,
      "OFFER_ID": 90123264,
      "USER": "21210320199224",
      "EXPIRE_DATE_TYPE": 0,
      "EXT1": "1",
      "EXT2": "0000000000000000000000000000000000000000000000000000000000000000",
      "CREATE_DATE": "2025-08-22 14:34:59",
      "EXT3": "2025-08-22 14:35:06.917",
      "RELA_TYPE": 2,
      "USER_TYPE": 1,
      "PROD_CATALOG_ID": 171000000001,
      "USER_T_NAME": "W4WNY5Xq vw6VDLK5"
    }
  ],
  "metaObject": "SETCmInsCmrel001",
  "fieldNameConvert": null
}
```
---

### 3.38 getCustSegmentById（146）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 146 |
| 接口名称 | getCustSegmentById |
| HTTP方法 | GET |
| API路径 | `/api/cm/customers/{custId}/identifications` |
| 功能描述 | 根据客户ID获取客户细分。该方法接收客户ID，查询客户信息，返回客户细分ID、客户代码和税号 返回信息: 包含客户细分信息的Map，key包括"custSeg"（客户细分ID）、"custCode"（客户代码）、"taxId"（税号） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#getCustSegmentById |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID，用于查询客户细分信息 |  |

**请求示例**：

```http
GET /api/cm/customers/23210011018282/identifications
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "taxId": null,
    "custSeg": "200000000003",
    "custCode": "0001650941"
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
### 3.39 是否只能查看客户信息（200）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 200 |
| 接口名称 | 是否只能查看客户信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/if-only-can-view` |
| 功能描述 | 是否只能查看客户信息 |
| 方法来源 | com.asiainfo.crm.cm.common.service.interfaces.ICmCommonSV#queryIfOnlyCanViewCustomer |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.40 获取新的客户ID（201）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 201 |
| 接口名称 | 获取新的客户ID |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/id` |
| 功能描述 | 获取新的客户ID |
| 方法来源 | com.asiainfo.crm.cm.common.service.interfaces.ICmCommonSV#getCustId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custType | int | QUERY | 是 | 客户类型 |  |

**请求示例**：

```http
GET /api/cm/customer/id?custType=1
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 21210620204423,
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.41 查询客户信息（202）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 202 |
| 接口名称 | 查询客户信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}` |
| 功能描述 | 查询客户信息 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryDKCustomer |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID |  |

**请求示例**：

```http
GET /api/cm/customer/23210820133024
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "REGION_ID": "2108",
    "EFFECTIVE_DATE": "2025-12-15 19:05:52",
    "DEVELOP_TYPE": 1,
    "CUST_ID": 23210820133024,
    "CREATE_OP_ID": 10131916,
    "ORG_ID": 21000000,
    "GROUP_TYPE": 2,
    "OP_ID": 10131916,
    "CUST_CERT_CODE": "K23210820133024",
    "CUST_ZIPCODE": "9626",
    "STATE": "U",
    "CUST_CERT_TYPE": 17,
    "GROUP_WEB": "www.samtank.com",
    "GROUP_SUB_TYPE": 1,
    "PROVINCE_ID": "9999",
    "CREATE_ORG_ID": 21000000,
    "EXPIRE_DATE": "2099-12-31 08:00:00",
    "CUST_SERVICE_ID": "",
    "DONE_DATE": "2026-02-03 10:58:22",
    "DONE_CODE": 112434581860,
    "REG_AMOUNT": 400,
    "CUST_SERVICE_LEVEL": 21,
    "CUST_TYPE": 3,
    "CREATE_DATE": "2025-12-15 18:44:38",
    "STAFF_AMOUNT_TYPE": "E",
    "STAFF_AMOUNT": 6,
    "CREDIT_VALUE": 1,
    "CREDIT_LEVEL": "3",
    "PARTY_ID": 110008472094,
    "CUST_STATUS": 1,
    "CUST_NAME": "Samtank A/S"
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.42 获取新的参与者ID（203）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 203 |
| 接口名称 | 获取新的参与者ID |
| HTTP方法 | GET |
| API路径 | `/api/cm/party/id` |
| 功能描述 | 获取新的参与人ID。该方法调用通用服务生成新的参与人序列ID 返回信息: 新的参与人ID，Long类型 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.PartyBFImpl#getPartyId |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.43 查询客户扩展信息（204）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 204 |
| 接口名称 | 查询客户扩展信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/ext` |
| 功能描述 | 查询客户扩展信息。 |
| 方法来源 | com.asiainfo.crm.cm.ln.customer.group.service.interfaces.ICmLnGroupSV#queryGroupCustExtByIdAndLog |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作 | 23210517915222 |

**请求示例**：

```http
GET /api/cm/customer/23210820133024/ext?custId=23210820133024
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "EFFECTIVE_DATE": "2026-03-01 09:56:31",
    "REGION_ID": "2108",
    "CUST_ID": 23210820133024,
    "CREATE_OP_ID": 10131916,
    "ORG_ID": 21000000,
    "PROTECT_EFF_DATE": "2025-02-01",
    "DIRECT_MARKETING_PROTECTION": 0,
    "OP_ID": 10131916,
    "STATE": "U",
    "EXT15": "1:3,2:0,3:21,4:11,5:0",
    "PROTECT_EXPIRE_DATE": "2033-12-01",
    "EXT17": "Group discount customers",
    "EXT16": "1:0,2:0,3:0",
    "TAX_ID": "12445040",
    "CREATE_ORG_ID": 21000000,
    "EXPIRE_DATE": "2099-12-31 23:59:59",
    "LEGAL_FORM": "AND",
    "REGISTRATION_DATE": "2025-11-30",
    "DONE_DATE": "2026-03-01 09:56:31",
    "DONE_CODE": 112451198219,
    "FORMER_NAME": "Denne bivirkning",
    "BI_COMPANY_NAME": "samtank",
    "COMPANY_STATUS": 1,
    "EXT1": "0",
    "EXT25": 1,
    "CREATE_DATE": "2025-12-15 18:44:38",
    "EXT3": "Richard",
    "EXT27": "2025-12-16",
    "HEAD_OFFICE": "Pillerne",
    "EXT22": 0,
    "EXT5": "forÃ¥rsager",
    "EXT6": "NÃ¥r din",
    "PREFERRED_PLATFORM": "CloudPBX",
    "EXT7": "Ã¸jeblikkeligt",
    "IS_VPMN": 1,
    "TAX_FLAG": 1
  },
  "metaObject": "SETCmLnGroupCustExt001",
  "fieldNameConvert": null
}
```
---

### 3.44 客户基本信息查询（205）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 205 |
| 接口名称 | 客户基本信息查询 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/detail` |
| 功能描述 | 客户基本信息查询。 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryCustomerMaskByCustIdAndLog |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作 | 23210619756422 |

**请求示例**：

```http
GET /api/cm/customer/21210219123624/detail?custId=21210219123624
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":{"CUST_ID":21210219123624,"ORG_ID":10056316,"FIRST_NAME_QRY":"FMO VMEILING LA","CUST_CERT_TYPE":8,"COUNTY_ID":"1001","GROUP_SEGMENT_ID":"New","ORG_ID_DESC":"O0996","PNR":22014800,"CUST_SEGMENT":100000000001,"CREATE_ORG_ID":21000000,"EXT18":"qweee","EXPIRE_DATE":"2099-12-31 23:59:59","BIRTHDAY":"1995-04-30 00:00:00","CONT_ADDRESS":"5692522","PHYSIOLOGICAL_STATE":0,"CUST_SERVICE_ID":"","DONE_DATE":"2025-07-29 18:07:50","CUST_LANGUAGE":"1","HOBBY":"3004950045","CONT_NAME_QRY":"FMO VMEILING LA RUELLE","CUST_SERVICE_LEVEL":1,"MANUAL_COMMERCIAL_PROTECTION":0,"CUST_TYPE":1,"CONTACT_PROTECTION":1,"CREATE_DATE":"2023-11-28 18:47:50","IS_REVISABLE":0,"CONT_NAME":"Fmo Vmeiling La Ruelle","PARTY_ID":110007465292,"LAST_NAME_QRY":"RUELLE","NATIONALITY":"00400","REGION_ID":"2107","EFFECTIVE_DATE":"2023-11-28 18:47:50","CREATE_OP_ID":100000032,"REAL_NAME_FLAG":0,"DIRECT_MARKETING_PROTECTION":-1,"OP_ID":500014851,"CUST_CERT_CODE":"3004950045","STATE
```
---

### 3.45 B2B客户行业信息查询（206）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 206 |
| 接口名称 | B2B客户行业信息查询 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/industry/page` |
| 功能描述 | B2B客户行业信息查询 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryGroupIndustryForPage |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID |  |
| start | int | QUERY | 是 |  |  |
| end | int | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.46 B2B客户行业信息查询count（207）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 207 |
| 接口名称 | B2B客户行业信息查询count |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/industry/count` |
| 功能描述 | B2B客户行业信息查询count |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryGroupIndustryCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.47 B2B客户经理信息查询（208）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 208 |
| 接口名称 | B2B客户经理信息查询 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/manager/page` |
| 功能描述 | B2B客户经理信息查询。 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryAllCustMgrsByCustId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作 | 23210517915222 |
| startNum | int | QUERY | 是 | 分页起始位置，用于分页查询。表示从第几条记录开始返回，从0开始计数 | 1 |
| endNum | int | QUERY | 是 | 分页结束位置，用于分页查询。表示返回到第几条记录为止（不包含该位置） | 10 |

**请求示例**：

```http
GET /api/cm/customer/23210013940222/manager/page?custId=23210013940222&pageNum=1&pageSize=10
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [
    {
      "EFFECTIVE_DATE": "2017-07-11 14:22:29",
      "REGION_ID": "2107",
      "CUST_ID": 23210013940222,
      "ORG_ID": 21000000,
      "MANAGER_ID": 100000754,
      "REL_ID": 2104951795,
      "STAFF_NAME": "LA1TSM"
    }
  ],
  "metaObject": "SETCmCustManager001",
  "fieldNameConvert": null
}
```
---

### 3.48 客户经理总数查询count（209）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 209 |
| 接口名称 | 客户经理总数查询count |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/manager/count` |
| 功能描述 | 查询客户经理总数。 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryCustManagerCountByCustId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作 | 23210517915222 |

**请求示例**：

```http
GET /api/cm/customer/23210120133026/manager/count?custId=23210120133026&pageNum=1&pageSize=10
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 1,
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.49 查询认证信息表单（210）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 210 |
| 接口名称 | 查询认证信息表单 |
| HTTP方法 | GET |
| API路径 | `/api/cm/identification/list` |
| 功能描述 | 查询认证信息表单。 |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV#queryCustIdentifications |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | QUERY | 否 | 实体唯一标识，既可代表组织（B2B场景），也可代表个人（B2C场景），用于建立实体级关联关系 | 110008089692 |
| idenType | int | QUERY | 否 | 识别类型 | 5 |
| idenCode | String | QUERY | 否 | 识别码 |  |

**请求示例**：

```http
GET /api/cm/identification/list?partyId=110008472096&idenType=5&idenCode=
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [],
  "metaObject": "SETCmIdentification001",
  "fieldNameConvert": null
}
```
---

### 3.50 账户数据信息查询（211）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 211 |
| 接口名称 | 账户数据信息查询 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/accounting/detail` |
| 功能描述 | 账户数据信息查询。 |
| 方法来源 | com.asiainfo.crm.cm.ln.customer.group.service.interfaces.ICmLnGroupSV#queryGroupAccountingById |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作 | 23210517915222 |

**请求示例**：

```http
GET /api/cm/customer/23210120133026/accounting/detail
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "EFFECTIVE_DATE": "2025-12-15 19:44:56",
    "REGION_ID": "2102",
    "CUST_ID": 23210120133026,
    "CREATE_OP_ID": 10131916,
    "ORG_ID": 21000000,
    "DONE_DATE": "2025-12-15 19:44:56",
    "DONE_CODE": 112399912327,
    "OP_ID": 10131916,
    "STATE": "U",
    "CREATE_DATE": "2025-12-15 19:36:16",
    "CREATE_ORG_ID": 21000000,
    "EXPIRE_DATE": "2099-12-31 08:00:00"
  },
  "metaObject": "SETCmGroupAccounting001",
  "fieldNameConvert": null
}
```
---

### 3.51 查询客户状态（212）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 212 |
| 接口名称 | 查询客户状态 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/status` |
| 功能描述 | 查询客户状态。 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#getGroupCustStatus |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作 | 23210517915222 |

**请求示例**：

```http
GET /api/cm/customer/23210120133026/status?custId=23210120133026
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "custStatus": "1"
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.52 检验操作员是否只有查看权限（213）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 213 |
| 接口名称 | 检验操作员是否只有查看权限 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/access-control` |
| 功能描述 | 检验操作员是否只有查看权限。 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#groupAccessControl |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 | 客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作 | 23210517915222 |

**请求示例**：

```http
GET /api/cm/customer/access-control?custId=23210820133024
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "onlyCanViewCust": "false",
    "retMsg": "",
    "retFlag": "Y"
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.53 人工离网（214）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 214 |
| 接口名称 | 人工离网 |
| HTTP方法 | POST |
| API路径 | `/api/cm/customer/{custId}/offline` |
| 功能描述 | 人工离网 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#manualOffline |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.54 校验是否可以修改客户细分（215）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 215 |
| 接口名称 | 校验是否可以修改客户细分 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/if-can-modify-segment` |
| 功能描述 | 校验是否可以修改客户细分 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#queryIfCanModifySegment |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 | 客户ID |  |

**请求示例**：

```http
GET /api/cm/customer/if-can-modify-segment?custId=23210619756422
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "ifCanModifySegment": "Y",
    "retFlag": "Y"
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.55 修改B2B客户数据（216）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 216 |
| 接口名称 | 修改B2B客户数据 |
| HTTP方法 | PUT |
| API路径 | `/api/cm/b2b/customer` |
| 功能描述 | 修改B2B客户数据 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#modifyGroupCustomer |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.56 客户销户（217）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 217 |
| 接口名称 | 客户销户 |
| HTTP方法 | POST |
| API路径 | `/api/cm/customer/{custId}/terminate` |
| 功能描述 | 客户销户 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#modifyGroupCustState |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户id |  |
| businessId | long | QUERY | 是 | 业务id |  |
| partyId | long | QUERY | 否 | 参与者id |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.57 查询客户附加信息（218）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 218 |
| 接口名称 | 查询客户附加信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/addtional` |
| 功能描述 | 查询客户附加信息。 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#queryAddtionalInfo |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作 | 23210517915222 |

**请求示例**：

```http
GET /api/cm/customer/21210010000252/addtional
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "ADDITIONAL_INFO_POP_UP": "N",
    "ADDITIONAL_INFO": "%3Cp%3E%3Cstrong%3Eaaatest%3C%2Fstrong%3E%20%3Cstrong%3Emodify%3C%2Fstrong%3E%3C%2Fp%3E%0A%3Cp%3E%26nbsp%3B%3C%2Fp%3E%0A%3Cp%3E31%3C%2Fp%3E%0A%3Cp%3E321%3C%2Fp%3E"
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.58 查询客户资料显示项个性配置（219）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 219 |
| 接口名称 | 查询客户资料显示项个性配置 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/of2-vc` |
| 功能描述 | 查询客户资料显示项个性配置。 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#queryCustomerInfo |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 | 客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作 | 23210517915222 |
| custType | int | QUERY | 是 | 客户类型 | 1 |

**请求示例**：

```http
GET /api/cm/customer/of2-vc?custId=21210419971223&custType=1
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":{"CUST_ID":"21210419971223","CUST_LEVEL_CODE":"0","CUST_CERT_CODE":"010485****","CUST_CERT_TYPE":"8","CUST_LANAGUE":"1","custAgents":null,"retMsg":"","retFlag":"Y","CONTACT_ADDRESS":"Pr. Christians AllÃ© 61 5250 Odense SV","output":"<tr valign=\"top\"><td width=\"10%\" class=\"view_Hd_cont_tit_row\">Name</td><td width=\"15%\"  class=\"view_Hd_cont_tit_col\">KentÂ¿S Skou Finsen</td><td width=\"10%\" class=\"view_Hd_cont_tit_row\">Gender</td><td width=\"15%\"  class=\"view_Hd_cont_tit_col\">Male</td><td width=\"10%\" class=\"view_Hd_cont_tit_row\">Type</td><td width=\"15%\"  class=\"view_Hd_cont_tit_col\">Individual Customer</td><td width=\"10%\" class=\"view_Hd_cont_tit_row\">Date of Birth</td><td width=\"15%\"  class=\"view_Hd_cont_tit_col\">1985-04-01</td></tr><tr valign=\"top\"><td width=\"10%\" class=\"view_Hd_cont_tit_row\">Postcode</td><td width=\"15%\"  class=\"view_Hd_cont_tit_col\"> </td><td width=\"10%\" class=\"view_Hd_cont_
```
---

### 3.59 保存客户附加信息（220）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 220 |
| 接口名称 | 保存客户附加信息 |
| HTTP方法 | POST |
| API路径 | `/api/cm/customer/{custId}/addtional` |
| 功能描述 | 保存客户附加信息，修改/新增 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#saveAddtionalInfo |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.60 查询客户备案记录（221）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 221 |
| 接口名称 | 查询客户备案记录 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/puton-record` |
| 功能描述 | 查询客户备案记录 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#queryCmCustPutOnRecord |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID |  |

**请求示例**：

```http
GET /api/cm/customer/21210219123624/puton-record
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {},
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.61 aks信息保存（222）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 222 |
| 接口名称 | aks信息保存 |
| HTTP方法 | POST |
| API路径 | `/api/cm/customer/{custId}/aks` |
| 功能描述 | aks信息保存 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#saveAKSInfo |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID |  |
| aksFlag | String | QUERY | 是 | aks信息 |  |

**请求示例**：

```http
POST /api/cm/customer/21210419971223/aks
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "retFlag": "Y"
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.62 查询客户不良信息（223）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 223 |
| 接口名称 | 查询客户不良信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/bad-record/page` |
| 功能描述 | 查询客户不良信息 |
| 方法来源 | com.asiainfo.crm.cm.common.service.interfaces.ICmCommonSV#queryCustBadInfo |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID |  |
| startIndex | int | QUERY | 是 |  |  |
| endIndex | int | QUERY | 是 |  |  |

**请求示例**：

```http
GET /api/cm/customer/21210219123624/bad-record/page?custId=21210219123624&pageNum=1&pageSize=10
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [],
  "metaObject": "SETCmCustBadRecord001",
  "fieldNameConvert": null
}
```
---

### 3.63 查询客户不良信息count（224）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 224 |
| 接口名称 | 查询客户不良信息count |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/bad-record/count` |
| 功能描述 | 查询客户不良信息count |
| 方法来源 | com.asiainfo.crm.cm.common.service.interfaces.ICmCommonSV#queryCustBadInformationCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID |  |

**请求示例**：

```http
GET /api/cm/customer/21210219123624/bad-record/count?custId=21210219123624&pageNum=1&pageSize=10
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 0,
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.64 判断客户是否有在途单（225）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 225 |
| 接口名称 | 判断客户是否有在途单 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/check-ongoging-order` |
| 功能描述 | 判断客户是否有在途单 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#checkHasOngoingOrder |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.65 根据账户id查询账户资料（300）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 300 |
| 接口名称 | 根据账户id查询账户资料 |
| HTTP方法 | GET |
| API路径 | `/api/cm/account/{acctId}/profile` |
| 功能描述 | 根据账户id查询账户资料。 |
| 方法来源 | com.asiainfo.crm.cm.ln.account.service.interfaces.ICmLnAccountSV#queryAccountProfileByAcctId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | PATH | 是 | 账户唯一标识，用于账户编辑、查看及用户关联等账户级操作 | 32100119385351 |

**请求示例**：

```http
GET /api/cm/account/32106119370551/profile
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":{"CUST_ID":21210419971223,"PAY_ORG_ID":21000000,"CYCLE_DONE_CODE":112394464505,"CYCLE_ORG_ID":21000000,"ACCT_CREATE_ORG_ID":21000000,"ACCT_DONE_CODE":112394464505,"PAY_STATE":"U","PAYMENT_ID":1109373915,"ACCT_STATE":"U","PAY_CREATE_ORG_ID":21000000,"PAY_METHOD":2,"ACCT_EXPIRE_DATE":"2099-12-31 23:59:59","PAY_CREATE_DATE":"2025-08-22 14:36:05","ACCT_OP_ID":100000032,"CYCLE_ID":1109374273,"PAY_DONE_CODE":112394464505,"CYCLE_STATE":"U","CYCLE_UNIT":1,"PAY_EXPIRE_DATE":"2099-12-31 23:59:59","CUST_CRED_CODE":"3004950002","PARTY_ID":110007469090,"REGION_ID":"2102","URGE_STOP_FLAG":"1","ACCT_EFFECTIVE_DATE":"2025-09-10 10:26:48","CYCLE_CREATE_DATE":"2025-08-22 14:36:05","CYCLE_DONE_DATE":"2025-09-10 10:26:48","LAST_NAME":"Hammoud","CYCLE_OP_ID":100000032,"FIRST_NAME":"Enrikov Fadi Nasser","ACCT_DONE_DATE":"2025-09-10 10:26:48","INSTALLMENT_FLAG":0,"CYCLE_EXPIRE_DATE":"2099-12-31 23:59:59","ACCT_ORG_ID":21000000,"CYCLE_CREATE_OP_ID":1000000
```
---

### 3.66 查询partyAcctrel信息（301）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 301 |
| 接口名称 | 查询partyAcctrel信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/party/acc/rel` |
| 功能描述 | 根据传入的参数查询partyAcctrel信息 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmAccountSV#queryPartyAccRel |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | QUERY | 是 | 账户唯一标识，用于账户编辑、查看及用户关联等账户级操作 | 32100119385351 |
| partyId | long | QUERY | 是 | 实体唯一标识，既可代表组织（B2B场景），也可代表个人（B2C场景），用于建立实体级关联关系 | 110006120290 |

**请求示例**：

```http
GET /api/cm/party/acc/rel?acctId=32106119370551&partyId=-1
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [
    {
      "EFFECTIVE_DATE": "2025-09-10 10:26:48",
      "CREATE_OP_ID": 100000032,
      "DONE_DATE": "2025-09-10 10:26:48",
      "ORG_ID": 21000000,
      "DONE_CODE": 112382939059,
      "OP_ID": 100000032,
      "ACCT_ID": 32106119370551,
      "STATE": "U",
      "CREATE_DATE": "2025-08-22 14:36:05",
      "CREATE_ORG_ID": 21000000,
      "REL_ID": 1109224732,
      "EXPIRE_DATE": "2099-12-31 23:59:59",
      "PARTY_ID": 110007469090
    }
  ],
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.67 根据partyId查询party信息（302）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 302 |
| 接口名称 | 根据partyId查询party信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/party/{partyId}` |
| 功能描述 | 根据partyId查询party信息。 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmPartySV#queryPartyById |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | PATH | 是 | 实体唯一标识，既可代表组织（B2B场景），也可代表个人（B2C场景），用于建立实体级关联关系 | 110006120290 |

**请求示例**：

```http
GET /api/cm/party/110007469090
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "EFFECTIVE_DATE": "2024-01-03 15:33:30",
    "NATIONALITY": "00400",
    "REGION_ID": "2106",
    "CREATE_OP_ID": 100000032,
    "ORG_ID": 21000000,
    "OP_ID": 100000032,
    "FIRST_NAME_QRY": "ENRIKOV FADI NASSER",
    "STATE": "U",
    "PERFER_LANGUAGE": 1,
    "COUNTY_ID": "1001",
    "LAST_NAME": "Hammoud",
    "FIRST_NAME": "Enrikov Fadi Nasser",
    "PARTY_TYPE": 1,
    "PARTY_NAME": "Enrikov Fadi Nasser Hammoud",
    "PROVINCE_ID": "9999",
    "CREATE_ORG_ID": 21000000,
    "PARTY_NAME_QRY": "ENRIKOV FADI NASSER HAMMOUD",
    "EXPIRE_DATE": "2099-12-31 23:59:59",
    "CERT_CODE": "3004950002",
    "DONE_DATE": "2025-09-10 11:02:41",
    "DONE_CODE": 410008251003,
    "CERT_TYPE": 8,
    "CREATE_DATE": "2023-11-29 14:12:12",
    "CITY_ID": "1000",
    "CPR_ID": "22016600",
    "LAST_NAME_QRY": "HAMMOUD",
    "PARTY_ID": 110007469090
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.68 根据账户ID查询账户（303）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 303 |
| 接口名称 | 根据账户ID查询账户 |
| HTTP方法 | GET |
| API路径 | `/api/cm/account/{acctId}/profile/mask` |
| 功能描述 | 根据账户ID查询账户 |
| 方法来源 | com.asiainfo.crm.cm.ln.account.service.interfaces.ICmLnAccountSV#queryMaskAccountProfileByAcctId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | PATH | 是 | 账户唯一标识，用于账户编辑、查看及用户关联等账户级操作 | 32100119385351 |

**请求示例**：

```http
GET /api/cm/account/32106119370551/profile/mask
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":{"CUST_ID":21210419971223,"PAY_ORG_ID":21000000,"CYCLE_DONE_CODE":112394464505,"CYCLE_ORG_ID":21000000,"ACCT_DONE_CODE":112394464505,"ACCT_CREATE_ORG_ID":21000000,"PAY_STATE":"U","PAYMENT_ID":1109373915,"ACCT_STATE":"U","PAY_CREATE_ORG_ID":21000000,"PAY_METHOD":2,"ACCT_EXPIRE_DATE":"2099-12-31 23:59:59","PAY_CREATE_DATE":"2025-08-22 14:36:05","ACCT_OP_ID":100000032,"CYCLE_ID":1109374273,"PAY_DONE_CODE":112394464505,"CYCLE_STATE":"U","CYCLE_UNIT":1,"PAY_EXPIRE_DATE":"2099-12-31 23:59:59","PARTY_ID":110007469090,"CUST_CRED_CODE":"3004950002","EFFECTIVE_DATE":"2025-09-10 10:26:48","REGION_ID":"2102","URGE_STOP_FLAG":"1","ACCT_EFFECTIVE_DATE":"2025-09-10 10:26:48","CYCLE_CREATE_DATE":"2025-08-22 14:36:05","CYCLE_DONE_DATE":"2025-09-10 10:26:48","LAST_NAME":"Hammoud","CYCLE_OP_ID":100000032,"FIRST_NAME":"Enrikov Fadi Nasser","ACCT_DONE_DATE":"2025-09-10 10:26:48","INSTALLMENT_FLAG":0,"CYCLE_EXPIRE_DATE":"2099-12-31 23:59:59","ACCT_ORG_ID
```
---

### 3.69 查询账户当前账期信息（304）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 304 |
| 接口名称 | 查询账户当前账期信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/account/{acctId}/bill/cycle/current` |
| 功能描述 | 查询账户当前账期信息 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmAccountSV#queryCurrAcctBillCyclesByAcctId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | PATH | 是 | 账户唯一标识，用于账户编辑、查看及用户关联等账户级操作 | 32100119385351 |

**请求示例**：

```http
GET /api/cm/account/32106119370551/bill/cycle/current
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "EFFECTIVE_DATE": "2025-08-22 14:36:05",
    "REGION_ID": "2107",
    "CREATE_OP_ID": 100000032,
    "DONE_DATE": "2025-09-10 10:26:48",
    "ORG_ID": 21000000,
    "DONE_CODE": 112394464505,
    "ACCT_ID": 32106119370551,
    "OP_ID": 100000032,
    "CYCLE_ID": 1109374273,
    "STATE": "U",
    "CYCLE_UNIT": 1,
    "CREATE_DATE": "2025-08-22 14:36:05",
    "BILL_DUE_DATE": 0,
    "BILL_DAY": 16,
    "CREATE_ORG_ID": 21000000,
    "EXPIRE_DATE": "2099-12-31 23:59:59",
    "CYCLE_TYPE": 5
  },
  "metaObject": "SETAcctBillCycle001",
  "fieldNameConvert": null
}
```
---

### 3.70 查询账号支付渠道（305）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 305 |
| 接口名称 | 查询账号支付渠道 |
| HTTP方法 | GET |
| API路径 | `/api/cm/account/{acctId}/paychannle` |
| 功能描述 | 查询账户支付渠道。 |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmBillingAcctSV#queryAcctPayChannel |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | PATH | 是 | 账户id | 32100119385351 |

**请求示例**：

```http
GET /api/cm/account/32106119370551/paychannle
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "PAYMENT_TYPE": 11,
    "PBS_STS": 0,
    "CPR": "020595****",
    "CARD_TYPE_NAME": null,
    "CH_ID": null,
    "CARD_EXPIRY_DATE": null,
    "CARD_TYPE": 1,
    "BANK_ID": "****",
    "CARD_ID": "****"
  },
  "metaObject": "SETCmPayChannel001",
  "fieldNameConvert": null
}
```
---

### 3.71 queryAcctFormatType（306）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 306 |
| 接口名称 | queryAcctFormatType |
| HTTP方法 | GET |
| API路径 | `/api/cm/account/{acctId}/bill/formattype` |
| 功能描述 | 查询账号账单格式。 |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmBillingAcctSV#queryAcctFormatType |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | PATH | 是 | 账户唯一标识，用于账户编辑、查看及用户关联等账户级操作 | 32100119385351 |

**请求示例**：

```http
GET /api/cm/account/32106119370551/bill/formattype
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": "1",
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.72 查询后付费账单格式（307）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 307 |
| 接口名称 | 查询后付费账单格式 |
| HTTP方法 | GET |
| API路径 | `/api/cm/account/{acctId}/billformat` |
| 功能描述 | 查询后付费账单格式。 |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmBillingAcctSV#queryAcctBillFormat |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | PATH | 是 | 账户唯一标识，用于账户编辑、查看及用户关联等账户级操作 | 32100119385351 |
| type | int | QUERY | 是 | 类型 | 1 |

**请求示例**：

```http
GET /api/cm/account/32103119229951/billformat?type=1
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "LANGUAGE": 5,
    "OIO_ACCOUNT_CODE": null,
    "OIO_UTS_PROFILE": null,
    "SIDE_PRINTING": "1",
    "EFFECTIVE_METHOD": "1",
    "OIO_ORDER_CODE": null,
    "PRINT_BILL": 1,
    "EAN": null,
    "DELIVERY_METHOD": 1,
    "EAN_QUALIFICATOR": "",
    "BILLING_TYPE": 1,
    "IS_CHARGE": 0,
    "OIO_UBL_PROFILE": null,
    "DUE_DAYS": "30",
    "OIO_COTACT_NAME": null,
    "BILL_FORMAT": "201110100"
  },
  "metaObject": "SETCmAcctBillFormat001",
  "fieldNameConvert": null
}
```
---

### 3.73 查询账单格式(分页)（308）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 308 |
| 接口名称 | 查询账单格式(分页) |
| HTTP方法 | GET |
| API路径 | `/api/cm/account/{acctId}/billformat/list` |
| 功能描述 | 查询账单格式明细列表。该方法接收账户ID、账单类型和分页参数，调用查询服务获取账户信息，从响应中提取客户ID和客户类型（如果是集团客户则减1）。然后从账户信息中获取账单格式列表，根据账单类型过滤出匹配的账单格式明细。遍历明细列表，封装成账单格式明细Bean对象，设置账户ID、客户类型、明细编号、是否收费、是否主要、账单类型等属性。查询账单格式枚举值获取邮件代码名称和账单格式名称，设置地址ID、地址描述、邮箱地址、附件发票、发送附件等属性。为每个明细生成编辑和删除操作的HTML链接。支持分页查询，返回指定范围内的账单格式明细数组\', \'账单格式明细信息数组，每个元素包含账户ID、客户类型、明细编号、是否收费、是否主要、账单类型、邮件代码、邮件名称、账单格式ID、账单格式名称、地址ID、地址描述、邮箱地址、附件发票、发送附件和操作链接等属性。如果没有查询到数据则返回空数组\', \'查询过程中发生异常时会抛出异常  |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmBillingAcctSV#queryBillformats |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | PATH | 是 | 账户唯一标识，用于账户编辑、查看及用户关联等账户级操作 | 32100119385351 |
| billingType | int | QUERY | 是 | 计费类型 | 1 |
| start | int | QUERY | 是 | 分页起始位置，用于分页查询。表示从第几条记录开始返回，从0开始计数 | 1 |
| end | int | QUERY | 是 | 分页结束位置，用于分页查询。表示返回到第几条记录为止（不包含该位置） | 10 |

**请求示例**：

```http
GET /api/cm/account/32103119229951/billformat/list?acctId=32103119229951&billingType=1&pageNum=1&pageSize=10
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [],
  "metaObject": "SETCMBillFormatDtl001",
  "fieldNameConvert": null
}
```
---

### 3.74 查询账单格式总数，用于分页（309）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 309 |
| 接口名称 | 查询账单格式总数，用于分页 |
| HTTP方法 | GET |
| API路径 | `/api/cm/account/{acctId}/billformat/count` |
| 功能描述 | 查询账单总数，用于分页。 |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmBillingAcctSV#queryBillformatsCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | PATH | 是 | 账户唯一标识，用于账户编辑、查看及用户关联等账户级操作 | 32100119385351 |
| billingType | int | QUERY | 是 | 账单类型 | 1 |

**请求示例**：

```http
GET /api/cm/account/32103119229951/billformat/count?acctId=32103119229951&billingType=1
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 0,
  "metaObject": "SETCMBillFormatDtl001",
  "fieldNameConvert": null
}
```
---

### 3.75 查询账单地址（310）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 310 |
| 接口名称 | 查询账单地址 |
| HTTP方法 | GET |
| API路径 | `/api/cm/account/{acctId}/bill/address` |
| 功能描述 | 查询账户账单地址 |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmBillingAcctSV#queryBillAddress |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | PATH | 是 | 账户唯一标识，用于账户编辑、查看及用户关联等账户级操作 | 32100119385351 |

**请求示例**：

```http
GET /api/cm/account/32103119229951/bill/address
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "CONTACT_NAME": " Asiainfo Yuanhang Software (Beijing) Co., Ltd.",
    "MOBILE_PHONE": null,
    "EFFECTIVE_WAY": "",
    "CONTACT_TYPE": 5,
    "ADDRESS_DETAIL": " c/o leo111 Badevej 2 leo11 Denmark 3000 HelsingÃ¸r ",
    "CONTACT_ID": 267484,
    "EMAIL": null
  },
  "metaObject": "SETCmAcctContact001",
  "fieldNameConvert": null
}
```
---

### 3.76 查询客户信息（311）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 311 |
| 接口名称 | 查询客户信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/1` |
| 功能描述 | 根据客户id查询客户信息 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryCustomerByCustId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户id |  |

**请求示例**：

```http
GET /api/cm/customer/21210419971223/1
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":{"CUST_ID":21210419971223,"ORG_ID":21000000,"FIRST_NAME_QRY":"KENTÂ¿S SKOU","CUST_CERT_TYPE":8,"COUNTY_ID":"1001","GROUP_SEGMENT_ID":"New","PNR":22149000,"CUST_SEGMENT":100000000001,"CREATE_ORG_ID":21000000,"CUST_PASSWORD":"1234","EXPIRE_DATE":"2099-12-31 00:00:00","BIRTHDAY":"1985-04-01 00:00:00","CONT_ADDRESS":"5727334","PHYSIOLOGICAL_STATE":0,"CUST_SERVICE_ID":"","DONE_DATE":"2025-10-30 17:37:14","CUST_LANGUAGE":"1","HOBBY":"0104850117","CONT_NAME_QRY":"KENTÂ¿S SKOU FINSEN","CUST_SERVICE_LEVEL":1,"MANUAL_COMMERCIAL_PROTECTION":-1,"CUST_TYPE":1,"CONTACT_PROTECTION":1,"CREATE_DATE":"2025-08-22 00:00:00","IS_REVISABLE":0,"CONT_NAME":"KentÂ¿S Skou Finsen","PARTY_ID":110008313090,"LAST_NAME_QRY":"FINSEN","NATIONALITY":"00400","REGION_ID":"2101","EFFECTIVE_DATE":"2025-08-22 14:20:32","CREATE_OP_ID":100000032,"REAL_NAME_FLAG":0,"DIRECT_MARKETING_PROTECTION":-1,"OP_ID":100000032,"CUST_CERT_CODE":"0104850117","STATE":"U","CUST_NAME_QRY":"KEN
```
---

### 3.77 ICmxCustomerSV.queryCmxCustomer（312）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 312 |
| 接口名称 | ICmxCustomerSV.queryCmxCustomer |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/cmx` |
| 功能描述 | ICmxCustomerSV.queryCmxCustomer |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmxCustomerSV#queryCmxCustomer |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户id |  |

**请求示例**：

```http
GET /api/cm/customer/21210219123624/cmx
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "REGION_ID": "2103",
    "UPDATE_FLAG": 1,
    "EFFECTIVE_DATE": "2023-11-28 18:47:50",
    "CUST_ID": 21210219123624,
    "ORG_ID": 21000000,
    "DIRECT_MARKETING_PROTECTION": -1,
    "OP_ID": 100000032,
    "STATE": "U",
    "AKS_STATUS": "3",
    "PNR": 22014800,
    "EXT18": "qweee",
    "EXPIRE_DATE": "2099-12-31 23:59:59",
    "DONE_DATE": "2025-07-29 18:07:50",
    "DONE_CODE": 340008076453,
    "MANUAL_PROTECT_EXPIRE_DATE": "2099-12-31",
    "MANUAL_COMMERCIAL_PROTECTION": 0,
    "CONTACT_PROTECTION": 1,
    "CREATE_DATE": "2023-11-28 18:47:50",
    "EXT4": "0",
    "EXT27": "2023-11-28",
    "EXT22": 0,
    "EXT6": "0",
    "EXT7": "0",
    "EXT8": "0",
    "EXT9": "0",
    "MANUAL_PROTECT_EFFECTIVE_DATE": "2025-07-29"
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.78 查询账期表单数据（313）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 313 |
| 接口名称 | 查询账期表单数据 |
| HTTP方法 | GET |
| API路径 | `/api/cm/account/{acctId}/billcycle` |
| 功能描述 | 查询账期表单数据 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmAccountSV#queryCurrAcctBillCyclesByAcctId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | PATH | 是 | 账户id |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.79 保存修改账户（314）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 314 |
| 接口名称 | 保存修改账户 |
| HTTP方法 | POST |
| API路径 | `/api/cm/account` |
| 功能描述 | 处理账户业务。该方法接收账户信息VO、BCE框架ID和业务ID，将账户信息和账单周期信息转换为DataContainer，如果存在旧数据则标记为旧状态并建立关联关系，然后调用BCE处理服务进行业务处理 返回信息: BCE处理返回数据对象，包含业务处理的结果信息 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.AccountBFImpl#dealAccount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| voAccountValue | com.asiainfo.crm.cm.vo.CmAccountInfoVo | BODY | 是 | 账户信息VO对象，包含账户表单信息和账单周期表单信息，以及可选的旧账户信息和旧账单周期信息 |  |
| bceFrameId | java.lang.Long | QUERY | 是 | BCE框架ID，用于指定业务处理框架 |  |
| businessId | java.lang.String | QUERY | 是 | 业务ID，用于标识业务操作类型 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.80 查询Bill Format详情（315）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 315 |
| 接口名称 | 查询Bill Format详情 |
| HTTP方法 | GET |
| API路径 | `/api/cm/acount/{acctId}/billformatdtl` |
| 功能描述 | 查询Bill Format详情 |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmBillingAcctSV#queryBillFormatDtl |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | PATH | 是 | 账户id |  |
| dtlNo | long | QUERY | 是 | dtlNo |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.81 查询业务历史记录（316）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 316 |
| 接口名称 | 查询业务历史记录 |
| HTTP方法 | GET |
| API路径 | `/api/cm/log/busi/his/{id}/cnd` |
| 功能描述 | 查询业务记录历史 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmBusiLogSV#queryHisRecordByCdn |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| id | long | PATH | 是 | id |  |
| name | java.lang.String | QUERY | 否 | name |  |
| type | int | QUERY | 是 | type |  |
| startDate | java.lang.String | QUERY | 是 | startDate |  |
| endDate | java.lang.String | QUERY | 是 | endDate |  |
| start | int | QUERY | 是 |  |  |
| end | int | QUERY | 是 |  |  |

**请求示例**：

```http
GET /api/cm/log/busi/his/32107119373952/cnd?type=-1&startDate=2026-03-01&endDate=2026-03-02&pageNum=1&pageSize=10
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [],
  "metaObject": "SETCmHisRecord001",
  "fieldNameConvert": null
}
```
---

### 3.82 查询业务历史记录数（317）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 317 |
| 接口名称 | 查询业务历史记录数 |
| HTTP方法 | GET |
| API路径 | `/api/cm/log/busi/his/{id}/count` |
| 功能描述 | 查询业务记录历史数 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmBusiLogSV#queryHisRecordCountByCdn |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| id | long | PATH | 是 | id |  |
| name | java.lang.String | QUERY | 否 | name |  |
| type | int | QUERY | 是 | type |  |
| startDate | java.lang.String | QUERY | 是 | startDate |  |
| endDate | java.lang.String | QUERY | 是 | endDate |  |

**请求示例**：

```http
GET /api/cm/log/busi/his/32107119373952/count?type=-1&startDate=2026-03-01&endDate=2026-03-02
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 0,
  "metaObject": "SETCmHisRecord001",
  "fieldNameConvert": null
}
```
---

### 3.83 根据partyId查party信息（318）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 318 |
| 接口名称 | 根据partyId查party信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/party/{partyId}/mask` |
| 功能描述 | 根据partyId查party信息 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmPartySV#queryMaskPartyById |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | PATH | 是 | partyId |  |

**请求示例**：

```http
GET /api/cm/party/110008099293/mask
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "EFFECTIVE_DATE": "2025-06-06 12:00:31",
    "REGION_ID": "2108",
    "CREATE_OP_ID": 100000032,
    "ORG_ID": 0,
    "CERT_CODE": "1606360174",
    "DONE_DATE": "2025-12-02 16:50:55",
    "DONE_CODE": 112294182513,
    "OP_ID": 100000032,
    "CERT_TYPE": 8,
    "FIRST_NAME_QRY": "OTHENDAL POSTBORG LILLELUND",
    "STATE": "U",
    "REMARKS": "CPR",
    "LAST_NAME": "Hestbech                                ",
    "FIRST_NAME": "Othendal Postborg Lillelund                       ",
    "CREATE_DATE": "2025-04-23 10:55:48",
    "PARTY_TYPE": 1,
    "PARTY_NAME": "Othendal Postborg Lillelund                        Hestbech",
    "PARTY_NAME_QRY": "OTHENDAL POSTBORG LILLELUND                        HESTBECH",
    "CREATE_ORG_ID": 0,
    "EXPIRE_DATE": "2099-12-31 23:59:59",
    "LAST_NAME_QRY": "HESTBECH",
    "PARTY_ID": 110008099293
  },
  "metaObject": "SETCmPartyInfo001",
  "fieldNameConvert": null
}
```
---

### 3.84 queryPartyRole（319）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 319 |
| 接口名称 | queryPartyRole |
| HTTP方法 | GET |
| API路径 | `/api/cm/party/{partyId}/role` |
| 功能描述 | queryPartyRole |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmPartySV#queryPartyRole |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | PATH | 是 | partyId |  |

**请求示例**：

```http
GET /api/cm/party/110005600291/role
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":[{"EFFECTIVE_DATE":"2021-07-27 16:35:25","REGION_ID":"2108","CREATE_OP_ID":10131716,"ROLE_TYPE":5,"DONE_DATE":"2021-07-27 17:58:47","ORG_ID":21000000,"DONE_CODE":110737024678,"ENTITY_ID":110005600291,"OP_ID":10131716,"ROLE_STATUS":1,"STATE":"U","CREATE_DATE":"2021-07-27 16:35:25","PARTY_ROLE_ID":110000011498182,"CREATE_ORG_ID":21000000,"EXPIRE_DATE":"2099-12-31 23:59:59","PARTY_ID":110005600291},{"EFFECTIVE_DATE":"2021-07-27 16:34:30","REGION_ID":"2100","CREATE_OP_ID":10131716,"ROLE_TYPE":1,"DONE_DATE":"2021-07-27 16:36:36","ORG_ID":21000000,"DONE_CODE":110737024473,"ENTITY_ID":21210417258822,"OP_ID":10131716,"ROLE_STATUS":1,"STATE":"U","REMARKS":"MÃ¸lbakvej 38 9900 Frederikshavn","CREATE_DATE":"2021-07-27 16:34:30","PARTY_ROLE_ID":110000011498183,"CREATE_ORG_ID":21000000,"EXPIRE_DATE":"2099-12-31 23:59:59","PARTY_ID":110005600291},{"EFFECTIVE_DATE":"2021-07-27 16:46:06","REGION_ID":"2105","ROLE_TYPE":2,"DONE_DATE":"2021-07-27 16:46:
```
---

### 3.85 queryAsPartyByCertCodeAndLog（320）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 320 |
| 接口名称 | queryAsPartyByCertCodeAndLog |
| HTTP方法 | POST |
| API路径 | `/api/cm/party/certcodelog` |
| 功能描述 | 根据证件代码和日志查询参与人。该方法接收查询条件Map和分页参数，将条件转换为DataContainer，调用参与人服务根据证件代码和日志查询参与人信息。 |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| condition | java.util.Map | BODY | 是 | 查询条件Map，包含查询参与人的各种条件参数，用于根据证件代码和日志查询参与人 | {'Party_Name_OfSearch': '', 'Party_ID': '', 'Customer_ID_OfSearch': '', 'CERT_TYPE': 17, 'PARTY_TYPE': 17} |
| start | int | QUERY | 是 | 起始索引，用于分页查询 | 1 |
| end | int | QUERY | 是 | 结束索引，用于分页查询 | 10 |

**请求示例**：

```http
POST /api/cm/party/certcodelog
Content-Type: application/json

{
  "Party_Name_OfSearch": "",
  "Party_ID": 110005600291,
  "Customer_ID_OfSearch": "",
  "CERT_TYPE": 8,
  "CERT_CODE": "",
  "PARTY_TYPE": 8,
  "SEARCH_TYPE": 3,
  "FIRST_NAME": "",
  "LAST_NAME": "",
  "BIRTHDAY": "1994-04-30",
  "REMARKS": "",
  "CONT_ADDRESS": "",
  "PARTY_ID": 110005600291,
  "ACTION": "TableSelectedQuery"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "EFFECTIVE_DATE": "2021-07-27 16:48:43",
    "REGION_ID": "2100",
    "CREATE_OP_ID": 10131716,
    "ORG_ID": 21000000,
    "DIRECT_MARKETING_PROTECTION": -1,
    "OP_ID": 10131716,
    "STATE": "U",
    "REMARKS": "MÃ¸lbakvej 38 9900 Frederikshavn",
    "CONT_ID": 110006555994,
    "LAST_NAME": "Schulskis",
    "FIRST_NAME": "Havelsevej Shanjeev",
    "PARTY_TYPE": 1,
    "GENDER": 1,
    "PARTY_NAME": "Havelsevej Shanjeev Schulskis",
    "CREATE_ORG_ID": 21000000,
    "EXPIRE_DATE": "2099-12-31 23:59:59",
    "BIRTHDAY": "1994-04-30 00:00:00",
    "CONT_ADDRESS": "5560331",
    "CERT_CODE": "300494****",
    "DONE_DATE": "2021-07-28 22:02:00",
    "DONE_CODE": 110737024685,
    "CERT_TYPE": 8,
    "EXT1": "0",
    "EXT2": "0",
    "CREATE_DATE": "2021-07-27 16:34:30",
    "PARTY_ID": 110005600291
  },
  "metaObject": "SETCmPartyInfo001",
  "fieldNameConvert": null
}
```
---

### 3.86 查询partyList分页（321）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 321 |
| 接口名称 | 查询partyList分页 |
| HTTP方法 | POST |
| API路径 | `/api/cm/party/condition` |
| 功能描述 | 根据条件查询参与人列表。该方法接收查询条件Map和分页参数，将条件转换为DataContainer，调用跨中心参与人服务查询符合条件的参与人列表 返回信息: 参与人值数组，包含符合查询条件的参与人信息列表 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.PartyBFImpl#queryPartyByCondition |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| condition | java.util.Map | BODY | 是 | 查询条件Map，包含查询参与人的各种条件参数，用于查询参与人列表 |  |
| startNum | int | QUERY | 是 | 起始索引，用于分页查询 |  |
| endNum | int | QUERY | 是 | 结束索引，用于分页查询 |  |

**请求示例**：

```http
POST /api/cm/party/condition
Content-Type: application/json

{
  "condition": {
    "Party_ID": 110005600291,
    "CERT_TYPE": 8,
    "PARTY_TYPE": 8,
    "SEARCH_TYPE": 3,
    "PARTY_ID": 110005600291
  }
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [
    {
      "EFFECTIVE_DATE": "2021-07-27 16:48:43",
      "REGION_ID": "2100",
      "CREATE_OP_ID": 10131716,
      "ORG_ID": 21000000,
      "DIRECT_MARKETING_PROTECTION": -1,
      "OP_ID": 10131716,
      "STATE": "U",
      "REMARKS": "MÃ¸lbakvej 38 9900 Frederikshavn",
      "CONT_ID": 110006555994,
      "LAST_NAME": "Schulskis",
      "FIRST_NAME": "Havelsevej Shanjeev",
      "PARTY_TYPE": 1,
      "GENDER": 1,
      "PARTY_NAME": "Havelsevej Shanjeev Schulskis",
      "CREATE_ORG_ID": 21000000,
      "EXPIRE_DATE": "2099-12-31 23:59:59",
      "BIRTHDAY": "1994-04-30 00:00:00",
      "CONT_ADDRESS": "5560331",
      "CERT_CODE": "300494****",
      "DONE_DATE": "2021-07-28 22:02:00",
      "DONE_CODE": 110737024685,
      "CERT_TYPE": 8,
      "EXT1": "0",
      "EXT2": "0",
      "CREATE_DATE": "2021-07-27 16:34:30",
      "PARTY_ID": 110005600291
    }
  ],
  "metaObject": "SETCmPartyInfo001",
  "fieldNameConvert": null
}
```
---

### 3.87 查询partyList总数（322）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 322 |
| 接口名称 | 查询partyList总数 |
| HTTP方法 | POST |
| API路径 | `/api/cm/party/condition/count` |
| 功能描述 | 根据条件查询参与人数量。该方法接收查询条件Map，将条件转换为DataContainer，调用跨中心参与人服务查询符合条件的参与人总数 返回信息: 符合条件的参与人总数，int类型 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.PartyBFImpl#queryPartyByConditionCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| condition | java.util.Map | BODY | 是 | 查询条件Map，包含查询参与人的各种条件参数，用于查询参与人总数 |  |

**请求示例**：

```http
POST /api/cm/party/condition/count
Content-Type: application/json

{
  "condition": {
    "Party_ID": 110005600291,
    "CERT_TYPE": 8,
    "PARTY_TYPE": 8,
    "SEARCH_TYPE": 3,
    "PARTY_ID": 110005600291
  }
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 1,
  "metaObject": "SETCmPartyInfo001",
  "fieldNameConvert": null
}
```
---

### 3.88 账户客户关系查询（323）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 323 |
| 接口名称 | 账户客户关系查询 |
| HTTP方法 | GET |
| API路径 | `/api/cm/account/{acctId}/custacctrel` |
| 功能描述 | 账户客户关系查询 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmAccountSV#queryCustAcctRel |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| relCustd | long | QUERY | 是 | relCustd |  |
| acctId | long | QUERY | 是 | acctId |  |
| acctName | java.lang.String | QUERY | 否 | acctName |  |
| installmentFalg | int | QUERY | 是 | installmentFalg |  |
| paymethod | int | QUERY | 是 | paymethod |  |
| cycleType | int | QUERY | 是 | cycleType |  |
| custStatus | java.lang.String | QUERY | 否 | custStatus |  |
| start | int | QUERY | 是 |  |  |
| end | int | QUERY | 是 |  |  |

**请求示例**：

```http
GET /api/cm/account/-1/custacctrel?relCustd=23210120133026&acctId=-1&payMethod=&cycleType=-1&installmentFalg=-1&custId=23210120133026&paymethod=&pageNum=1&pageSize=10
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":[{"EFFECTIVE_DATE":"2025-12-16 14:25:28","REGION_ID":"2102","REL_TYPE":1,"ORG_ID":21000000,"DONE_DATE":"2026-01-27 17:25:57","DONE_CODE":112430490020,"OP_ID":100000032,"ACCT_ID":32100119535751,"STATE":"U","CUST_TYPE":3,"EXT1":"1","ACCT_NAME":"Anne Harlev Sornsena","CREATE_DATE":"2025-12-16 14:26:19","BILL_DUE_DATE":0,"INSTALLMENT_FLAG":0,"REL_CUST_ID":23210120133026,"BILL_DAY":11,"PAY_METHOD":2,"EXPIRE_DATE":"2099-12-31 23:59:59","CYCLE_TYPE":5},{"EFFECTIVE_DATE":"2025-12-16 11:18:53","REGION_ID":"2105","REL_TYPE":1,"ORG_ID":21000000,"DONE_DATE":"2025-12-16 11:19:21","DONE_CODE":112400809059,"OP_ID":999999025,"ACCT_ID":32105119534753,"STATE":"U","CUST_TYPE":3,"EXT1":"1","ACCT_NAME":"Carlsberg hardware","CREATE_DATE":"2025-12-16 11:18:53","BILL_DUE_DATE":8,"INSTALLMENT_FLAG":3,"REL_CUST_ID":23210120133026,"BILL_DAY":11,"PAY_METHOD":2,"EXPIRE_DATE":"2099-12-31 23:59:59","CYCLE_TYPE":5},{"EFFECTIVE_DATE":"2025-12-16 11:18:21","REGION_I
```
---

### 3.89 查询账户客户关系总数（324）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 324 |
| 接口名称 | 查询账户客户关系总数 |
| HTTP方法 | GET |
| API路径 | `/api/cm/account/{acctId}/custacctrel/count` |
| 功能描述 | 查询账户客户关系总数 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmAccountSV#queryCustAcctRelCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| relCustd | long | QUERY | 是 | relCustd |  |
| acctId | long | QUERY | 是 | acctId |  |
| acctName | java.lang.String | QUERY | 否 | acctName |  |
| installmentFalg | int | QUERY | 是 | installmentFalg |  |
| paymethod | int | QUERY | 是 | paymethod |  |
| cycleType | int | QUERY | 是 | cycleType |  |
| custStatus | java.lang.String | QUERY | 否 | custStatus |  |

**请求示例**：

```http
GET /api/cm/account/-1/custacctrel/count?relCustd=23210120133026&acctId=-1&payMethod=&cycleType=-1&installmentFalg=-1&custId=23210120133026&paymethod=
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 4,
  "metaObject": "SETCmAccount001",
  "fieldNameConvert": null
}
```
---

### 3.90 删除grp账户信息（325）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 325 |
| 接口名称 | 删除grp账户信息 |
| HTTP方法 | DELETE |
| API路径 | `/api/cm/account/{acctId}/grp` |
| 功能描述 | 删除集团账户信息。该方法接收账户ID，检查租户ID是否为TENANT_21（不允许删除），调用billing接口将账户状态设置为inactive（状态值为2），然后更新账户信息。删除成功返回成功标志和消息，失败返回异常信息 返回信息: 包含操作结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）和"retMsg"（结果消息或异常信息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.AccountBFImpl#delGrpAcctInfo |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | PATH | 是 | 账户ID，用于标识要删除的账户 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.91 验证客户协议（326）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 326 |
| 接口名称 | 验证客户协议 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/agreement/{agrId}` |
| 功能描述 | 验证协议。该方法接收客户ID和协议ID，调用协议服务查询该客户和协议ID对应的协议信息，如果存在则返回"Y"，否则返回"N"。 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#validAgreement |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID，用于验证协议 | 23210517915222 |
| agrId | long | PATH | 是 | 协议ID，用于验证协议 | 2434351 |

**请求示例**：

```http
GET /api/cm/customer/23210619756422/agreement/-1
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": "N",
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.92 查询客户简单信息（327）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 327 |
| 接口名称 | 查询客户简单信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/simple` |
| 功能描述 | 根据客户ID查询客户简单信息。该方法接收客户ID，查询客户基本信息（客户名称、名字、姓氏、参与人ID、证件代码等）。如果是集团客户，还会查询税号，并处理证件代码（判断是否为外国集团） 返回信息: 包含客户简单信息的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"custName"（客户名称）、"firstName"（名字）、"lastName"（姓氏）、"custCertCode"（证件代码）、"TaxID"（税号，仅集团客户）、"partyId"（参与人ID） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#queryCustSimpleById |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID，用于查询客户简单信息 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.93 删除账单格式详情（328）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 328 |
| 接口名称 | 删除账单格式详情 |
| HTTP方法 | DELETE |
| API路径 | `/api/cm/bill/account/{acctId}` |
| 功能描述 | 删除账单格式详情 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.BillBFImpl#delBillFormatDtl |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | PATH | 是 | 账户ID，用于标识要删除的账单格式明细所属账户 |  |
| dtlNo | long | QUERY | 是 | 明细编号，用于标识要删除的账单格式明细 |  |
| billingType | int | QUERY | 是 | 账单类型，用于标识要删除的账单格式明细类型 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.94 email校验（329）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 329 |
| 接口名称 | email校验 |
| HTTP方法 | GET |
| API路径 | `/api/cm/common/email/validation` |
| 功能描述 | 校验email地址。该方法检查email白名单控制开关，如果开关开启则调用CRM服务查询邮箱地址是否在白名单中。如果邮箱地址在白名单中则校验成功，否则校验失败 返回信息: 包含校验结果的Map，key包括"emailCtrl"（"Y"表示开启邮箱控制，"N"表示未开启）、"retVal"（"Y"表示校验成功，"N"表示校验失败）、"retMsg"（结果消息，失败时包含异常信息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CommonBFImpl#checkEmailAddress |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| emailAddress | java.lang.String | QUERY | 是 | 邮箱地址，用于校验是否在白名单中 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.95 查询创建party（330）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 330 |
| 接口名称 | 查询创建party |
| HTTP方法 | POST |
| API路径 | `/api/cm/party/search/{searchType}` |
| 功能描述 | 创建参与人。该方法接收参与人信息Map，根据搜索类型（SEARCH_TYPE）进行不同处理：类型"1"表示根据证件类型和证件代码查询，如果不存在则调用CPR系统查询，如果CPR返回有firstName则创建参与人；类型"2"表示根据名称生日地址（NBA）查询，先检查是否存在相同信息的参与人，如果不存在则创建；类型"3"则返回特殊标识 返回信息: 包含创建结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败，或"create"表示新创建，"searchTypeIs3"表示搜索类型为3）、"retMsg"（结果消息，可能包含已存在的参与人信息或错误信息）、"pId"（参与人ID）、"pName"（参与人名称） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.PartyBFImpl#createParty |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| bean | java.util.Map | BODY | 是 | 参与人信息Map，包含搜索类型（SEARCH_TYPE）、证件类型（CERT_TYPE）、证件代码（CERT_CODE）、名字（FIRST_NAME）、姓氏（LAST_NAME）、生日（BIRTHDAY）、联系地址（CONT_ADDRESS）、地址详情（REMARKS）等信息，用于创建参与人 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.96 保存账单格式（331）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 331 |
| 接口名称 | 保存账单格式 |
| HTTP方法 | POST |
| API路径 | `/api/cm/bill/formatDtl` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.BillBFImpl#saveBillFormatDtl |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.97 创建payer（332）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 332 |
| 接口名称 | 创建payer |
| HTTP方法 | POST |
| API路径 | `/api/cm/account/payer` |
| 功能描述 | 创建付款人信息。该方法接收付款人信息Map，如果PARTY_ID为空则创建新的参与人、参与人角色（PAYER）和联系信息；如果PARTY_ID已存在则更新参与人信息，检查并创建PAYER角色（如果不存在），保存联系信息。支持个人类参与人的创建和更新 返回信息: 包含操作结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（"create"表示新创建，"exsist"表示已存在，或错误消息）和"pId"（参与人ID） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.AccountBFImpl#createPayer |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| bean | java.util.HashMap | BODY | 是 | 付款人信息Map，包含参与人、个人类参与人和联系信息的所有属性，用于创建或更新付款人 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.98 验证此Party是否含有除payer,user以外的其他角色（333）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 333 |
| 接口名称 | 验证此Party是否含有除payer,user以外的其他角色 |
| HTTP方法 | GET |
| API路径 | `/api/cm/account/role/other` |
| 功能描述 | 检查参与人是否具有除Payer和User之外的其他角色。该方法接收参与人ID，查询该参与人的所有角色，判断是否为纯User、纯Payer或User/Payer两种角色的组合。只有这三种情况才允许编辑，其他情况（包含客户角色或其他角色）不允许编辑 返回信息: 包含检查结果的Map，key包括"hasFlag"（"Y"表示不允许编辑，"N"表示允许编辑）、"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息或异常信息）和"roleScene"（角色场景："2"表示User，"5"表示Payer） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.AccountBFImpl#checkHasOtherRolesWithoutPayer |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | QUERY | 是 | 参与人ID，用于查询该参与人的所有角色信息 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.99 validateModifyPayerCPR（334）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 334 |
| 接口名称 | validateModifyPayerCPR |
| HTTP方法 | GET |
| API路径 | `/api/cm/account/payer/modifiable` |
| 功能描述 | 验证修改付款人CPR。该方法接收证件代码、参与人ID、输入的名字、姓氏和生日，调用个人客户服务处理修改付款人CPR，返回处理结果（名字、姓氏、生日、是否受保护、匹配标志、地址ID、地址详情等） 返回信息: 包含验证结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"firstName"（名字）、"lastName"（姓氏）、"birth"（生日）、"protected"（是否受保护）、"matchFlag"（匹配标志）、"addressId"（地址ID）、"addressDetail"（地址详情）、"retMsg"（失败时的错误消息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#validateModifyPayerCPR |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custCertCode | java.lang.String | QUERY | 是 | 证件代码，用于验证修改付款人CPR |  |
| partyId | long | QUERY | 是 | 参与人ID，用于验证修改付款人CPR |  |
| inputFirstName | java.lang.String | QUERY | 是 | 输入的名字，用于验证修改付款人CPR |  |
| inputLastName | java.lang.String | QUERY | 是 | 输入的姓氏，用于验证修改付款人CPR |  |
| inputBirthday | java.lang.String | QUERY | 是 | 输入的生日，用于验证修改付款人CPR |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.100 查询certCode（335）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 335 |
| 接口名称 | 查询certCode |
| HTTP方法 | GET |
| API路径 | `/api/cm/party/{partyId}/indiv/cercode` |
| 功能描述 | 根据参与人ID查询证件代码。该方法接收参与人ID，查询参与人信息，返回证件代码 返回信息: 包含查询结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"certCode"（证件代码） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.PartyBFImpl#queryCertCodeByPartyId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | PATH | 是 | 参与人ID，用于查询参与人的证件代码 |  |

**请求示例**：

```http
GET /api/cm/party/110005600291/indiv/cercode
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "certCode": "3004940173",
    "retVal": "Y"
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.101 checkPartyInfor（336）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 336 |
| 接口名称 | checkPartyInfor |
| HTTP方法 | GET |
| API路径 | `/api/cm/party/{partyId}/info` |
| 功能描述 | 检查参与人信息。该方法接收参与人ID，查询参与人信息，返回CPR号码、状态和参与人类型 返回信息: 包含检查结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息）、"cprNumber"（CPR号码）、"state"（状态）、"partyType"（参与人类型，字符串形式） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.PartyBFImpl#checkPartyInfor |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | PATH | 是 | 参与人ID，用于检查参与人信息 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.102 getCprEditConfigMapFromMatrix （337）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 337 |
| 接口名称 | getCprEditConfigMapFromMatrix  |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/cpreditconfig` |
| 功能描述 | 从矩阵获取CPR编辑配置Map。该方法接收客户ID、参与人ID、GUI类型和注册类型，验证输入参数的有效性，然后调用个人客户服务从矩阵获取CPR编辑配置（包括是否可编辑CPR号码和CPR档案） 返回信息: 包含CPR编辑配置的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"EDIT_CPR_NUMBER"（是否可编辑CPR号码）、"EDIT_CPR_PROFILE"（是否可编辑CPR档案）、"retMsg"（失败时的错误消息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#getCprEditConfigMapFromMatrix |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 | 客户ID，用于从矩阵获取CPR编辑配置（当GUI类型为CUSTOMER_VIEW时必填） |  |
| partyId | long | QUERY | 是 | 参与人ID，用于从矩阵获取CPR编辑配置（当GUI类型不为CUSTOMER_VIEW时必填） |  |
| guiType | java.lang.String | QUERY | 是 | GUI类型，用于标识界面类型（如CUSTOMER_VIEW） |  |
| registerType | java.lang.String | QUERY | 是 | 注册类型，用于标识注册类型 |  |

**请求示例**：

```http
GET /api/cm/customer/cpreditconfig?guiType=CUSTOMER_VIEW&registerType=CPR_NUMBER&custId=21210119854822
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "EDIT_CPR_NUMBER": "N",
    "retFlag": "Y",
    "EDIT_CPR_PROFILE": "N"
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.103 checkUniqueParty（338）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 338 |
| 接口名称 | checkUniqueParty |
| HTTP方法 | GET |
| API路径 | `/api/cm/party/{partyId}/unique` |
| 功能描述 | 检查唯一参与人。该方法接收参与人ID、名字、姓氏、地址ID和生日，通过名称生日地址校验参与人是否已经存在，如果存在且不是当前参与人，则返回已存在的参与人ID 返回信息: 包含检查结果的Map，key包括"hasExist"（"Y"表示已存在，"N"表示不存在）、"partyIdOfReturn"（已存在的参与人ID，不存在时为"N"）、"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.PartyBFImpl#checkUniqueParty |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | PATH | 是 | 参与人ID，用于检查唯一参与人（排除当前参与人） |  |
| firstName | java.lang.String | QUERY | 是 | 名字，用于检查唯一参与人 |  |
| lastName | java.lang.String | QUERY | 是 | 姓氏，用于检查唯一参与人 |  |
| addressId | long | QUERY | 是 | 地址ID，用于检查唯一参与人 |  |
| birthday | java.lang.String | QUERY | 是 | 生日，用于检查唯一参与人 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.104 checkCprRegistHasComplete（339）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 339 |
| 接口名称 | checkCprRegistHasComplete |
| HTTP方法 | GET |
| API路径 | `/api/cm/party/{partyId}/regist` |
| 功能描述 | 检查CPR注册是否完成。该方法接收参与人ID，查询参与人信息获取CPR ID，然后查询CPR注册工单状态，如果存在状态为"P"（进行中）的工单，则表示注册未完成 返回信息: 包含检查结果的Map，key包括"hasComplete"（"Y"表示注册已完成（无进行中工单），"N"表示注册未完成（有进行中工单））、"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.PartyBFImpl#checkCprRegistHasComplete |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | PATH | 是 | 参与人ID，用于检查CPR注册是否完成 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.105 modifyPartyInformation（340）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 340 |
| 接口名称 | modifyPartyInformation |
| HTTP方法 | PUT |
| API路径 | `/api/cm/party/info` |
| 功能描述 | 修改参与人信息。该方法接收参与人信息VO，如果参与人ID大于0，则调用参与人服务修改参与人的名字、姓氏、生日、地址ID、地址详情、性别和证件代码 返回信息: 包含修改结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.PartyBFImpl#modifyPartyInformation |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| info | com.asiainfo.crm.cm.vo.PartyInfoVO | BODY | 是 | 参与人信息VO，包含参与人ID、名字、姓氏、生日、地址ID、地址详情、性别、证件代码等信息，用于修改参与人信息 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.106 保存修改User信息（341）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 341 |
| 接口名称 | 保存修改User信息 |
| HTTP方法 | PUT |
| API路径 | `/api/cm/party/userInfo` |
| 功能描述 | 修改用户信息（仅用于choose payer页面修改user信息）。该方法接收参与人信息VO，查询该参与人下的客户信息，如果客户类型为USER，则修改客户基本信息（名字、姓氏、客户名称、性别、证件代码、生日等），如果地址发生变化则更新地址信息并重新发送CPR工单 返回信息: 包含修改结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.PartyBFImpl#modifyUserInfo |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| info | com.asiainfo.crm.cm.vo.PartyInfoVO | BODY | 是 | 参与人信息VO，包含参与人ID、名字、姓氏、生日、地址ID、地址详情、性别、证件代码等信息，用于修改用户信息 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.107 getBillDayAndBillCycleDisplay（342）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 342 |
| 接口名称 | getBillDayAndBillCycleDisplay |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/agreement/{agrId}/billdaycycle` |
| 功能描述 | 获取账单日和账单周期显示信息。该方法接收客户ID和协议ID，调用协议服务查询协议的账单周期信息（账单周期、协议代码、付款条款等） 返回信息: 包含账单周期信息的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，失败时包含错误信息）、"billCycle"（账单周期）、"agrCode"（协议代码）、"paymentTerms"（付款条款） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#getBillDayAndBillCycleDisplay |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID，用于查询协议的账单周期信息 |  |
| agrId | long | PATH | 是 | agrId |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.108 getBillingAddress（343）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 343 |
| 接口名称 | getBillingAddress |
| HTTP方法 | GET |
| API路径 | `/api/cm/bill/account/{acctId}/address` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.BillBFImpl#getBillingAddress |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | PATH | 是 | 账户ID，用于查询该账户的账单地址信息 |  |
| custId | long | QUERY | 是 | 客户ID，用于查询该客户的账单地址信息 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.109 查询cpr（344）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 344 |
| 接口名称 | 查询cpr |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/cpr` |
| 功能描述 | 查询CPR。该方法接收CPR号码，调用个人客户服务验证CPR号码是否在CPR系统中存在 返回信息: 包含查询结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，成功时返回国际化资源"CMS0001263"对应的文本，失败时返回错误信息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#queryCPR |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| cpr | java.lang.String | QUERY | 是 | CPR号码，用于验证是否在CPR系统中存在 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.110 保存payer地址变更（345）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 345 |
| 接口名称 | 保存payer地址变更 |
| HTTP方法 | POST |
| API路径 | `/api/cm/account/{acctId}/address/log` |
| 功能描述 | 保存地址变更记录。该方法接收旧地址、新地址、客户ID和账户ID，记录地址变更的操作日志，包括账户号码、旧付款人账单地址和新付款人账单地址 返回信息: 包含操作结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）和"retMsg"（结果消息或异常信息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.AccountBFImpl#saveAddressChange |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| oldAddress | java.lang.String | BODY | 是 | 旧的付款人账单地址 |  |
| newAddress | java.lang.String | BODY | 是 | 新的付款人账单地址 |  |
| custId | long | BODY | 是 | 客户ID，用于记录操作日志 |  |
| acctId | long | PATH | 是 | 账户ID，用于记录操作日志 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.111 保存账单支付方式（346）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 346 |
| 接口名称 | 保存账单支付方式 |
| HTTP方法 | POST |
| API路径 | `/api/cm/account/{acctId}/billingpayment` |
| 功能描述 | 保存账单支付信息。该方法接收客户ID、账户ID和账单支付VO对象，将支付渠道信息、账户联系信息和账单格式信息转换为对应的Bean对象，然后调用billing服务保存账户支付信息 返回信息: 包含操作结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）和"retMsg"（成功时返回国际化资源"CMS0088085"对应的文本，失败时返回异常信息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.AccountBFImpl#saveBillingPayment |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | BODY | 是 | 客户ID，用于保存账单支付信息 |  |
| acctId | long | PATH | 是 | 账户ID，用于保存账单支付信息 |  |
| infos | com.asiainfo.crm.cm.vo.BillingPaymentVo | BODY | 是 | 账单支付信息VO对象，包含支付渠道信息、账户联系信息和账单格式信息列表 |  |

**请求示例**：

```http
POST /api/cm/account/32100117500751/billingpayment
Content-Type: application/json

{
  "custId": 23210117776822,
  "infos": {
    "cmPayChannel": {},
    "cmAcctContact": {},
    "cmAcctBillFormat": [
      {}
    ]
  }
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "retVal": "N",
    "retMsg": "Cannot invoke \"com.ai.appframe2.common.DataStructInterface.getDisplayAttrHashMap()\" because \"source\" is null"
  },
  "metaObject": "",
  "fieldNameConvert": null
}
```
---

### 3.112 validateContact（347）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 347 |
| 接口名称 | validateContact |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/CmIndivAction/validateContact` |
| 功能描述 | 校验联系人。该方法接收客户ID、名字、姓氏和生日，查询客户的邮箱和联系电话联系媒介，验证邮箱和电话不能重复，然后根据客户名称、生日和地址验重，如果存在重复则抛出业务异常 返回信息: 包含校验结果的Map，key包括"retFlag"（"Y"表示校验通过，"N"表示校验不通过）、"retMsg"（失败时的错误消息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#validateContact |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | BODY | 是 | 客户ID，用于校验联系人 |  |
| firstName | java.lang.String | BODY | 是 | 名字，用于校验联系人 |  |
| lastName | java.lang.String | BODY | 是 | 姓氏，用于校验联系人 |  |
| birthday | java.lang.String | BODY | 是 | 生日，用于校验联系人 |  |

**请求示例**：

```http
POST /api/cm/service/CmIndivAction/validateContact
Content-Type: application/json

{
  "custId": 21210620204423,
  "firstName": "autob2c first20260302084149",
  "lastName": "autob2c last",
  "birthday": "1900-01-01"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "retFlag": "Y"
  },
  "metaObject": "",
  "fieldNameConvert": null
}
```
---

### 3.113 validateCust（348）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 348 |
| 接口名称 | validateCust |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/CmIndivCustomerAction/validateCust` |
| 功能描述 | 校验客户。该方法根据客户ID查询客户联系媒介，然后根据地址ID和客户名称查询客户联系人，如果存在匹配的联系人则校验失败 返回信息: 包含校验结果的Map，key包括"retFlag"（"Y"表示校验通过，"N"表示校验不通过，即存在匹配的联系人） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl#validateCust |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | BODY | 是 | 客户ID，用于查询客户联系媒介信息 |  |
| custName | java.lang.String | BODY | 是 | 客户名称，用于查询匹配的客户联系人 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.114 checkTransferDonner（349）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 349 |
| 接口名称 | checkTransferDonner |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/RbossSoAction/checkTransferDonner` |
| 功能描述 | 校验过户下家。该方法根据客户ID查询客户信息，校验客户状态是否有效（在网、潜在、非活跃状态），如果客户状态为停机状态或无效状态则不允许过户。同时判断是否为匿名客户，匿名客户不允许过户。如果是批量过户流程（billId不为空），则判断B2B Single号段内客户是否允许过户，B2B号码段内不允许过户 返回信息: 包含校验结果的Map，key包括"retVal"（"Y"表示校验通过，"N"表示校验不通过）、"retMsg"（结果消息，校验不通过时返回对应的错误提示信息，如"该客户为停机状态，不允许过户"、"无效客户，不能受理"、"不能过户给匿名客户"、"B2B号码段内不允许过户"等） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.Cust2CrmBFImpl#checkTransferDonner |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | BODY | 是 |  |  |
| oldCustId | long | BODY | 是 |  |  |
| billId | java.lang.String | BODY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.115 getFormOfAddress（350）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 350 |
| 接口名称 | getFormOfAddress |
| HTTP方法 | GET |
| API路径 | `/api/cm/service/Common/getFormOfAddress` |
| 功能描述 | 获取称呼形式。该方法查询客户状态为"1"的静态数据，将其转换为JSON格式的字符串数组，每个元素包含text（代码名称）和value（代码值） 返回信息: JSON格式的字符串，包含称呼形式的选项列表，格式为[{"text":"代码名称","value":"代码值"},...] |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CommonBFImpl#getFormOfAddress |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.116 queryCustomersAndLog（351）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 351 |
| 接口名称 | queryCustomersAndLog |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmCustomerSV/queryCustomersAndLog` |
| 功能描述 | 根据XML条件查询客户列表，记录查询日志，并补充行业、地址、层级、客户经理等关联信息后返回。 |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| info | java.util.Map | BODY | 是 |  | {'NATIONALITY': '00400', 'CUST_TYPE': '1', 'STATE': 'U', 'CUST_ID': '21210419971223', 'CUST_CERT_TYPE': '8', 'CUST_CERT_CODE': '0104850117', 'CUST_STATUS': '1', 'INDIV_CUST_TYPE': '1'} |
| startNum | int | QUERY | 是 | 页数 | 1 |
| endNum | int | QUERY | 是 | 每页条数 | 10 |

**请求示例**：

```http
POST /api/cm/service/ICmCustomerSV/queryCustomersAndLog
Content-Type: application/json

{
  "info": {
    "NATIONALITY": "00400",
    "CUST_TYPE": "1",
    "STATE": "U",
    "CUST_ID": "21210419971223",
    "CUST_CERT_TYPE": "8",
    "CUST_CERT_CODE": "0104850117",
    "CUST_STATUS": "1",
    "INDIV_CUST_TYPE": "1"
  }
}
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":[{"CUST_ID":21210419971223,"ORG_ID":21000000,"FIRST_NAME_QRY":"KENTÂ¿S SKOU","CUST_CERT_TYPE":8,"SEGMENT_NAME":"New","COUNTY_ID":"1001","GROUP_SEGMENT_ID":"New","PNR":22149000,"CUST_SEGMENT":100000000001,"CREATE_ORG_ID":21000000,"CUST_PASSWORD":"1234","EXPIRE_DATE":"2099-12-31 00:00:00","BIRTHDAY":"1985-04-01 00:00:00","CONT_ADDRESS":"5727334","PHYSIOLOGICAL_STATE":0,"CUST_SERVICE_ID":"","DONE_DATE":"2025-10-30 17:37:14","CUST_LANGUAGE":"1","HOBBY":"0104850117","CUST_SERVICE_LEVEL":1,"MANUAL_COMMERCIAL_PROTECTION":-1,"CUST_TYPE":1,"CONTACT_PROTECTION":1,"CREATE_DATE":"2025-08-22 00:00:00","IS_REVISABLE":0,"CONT_NAME":"KentÂ¿S Skou Finsen","PARTY_ID":110008313090,"LAST_NAME_QRY":"FINSEN","NATIONALITY":"00400","REGION_ID":"2101","EFFECTIVE_DATE":"2025-08-22 14:20:32","CREATE_OP_ID":100000032,"REAL_NAME_FLAG":0,"DIRECT_MARKETING_PROTECTION":-1,"OP_ID":100000032,"CUST_CERT_CODE":"0104850117","STATE":"U","CUST_NAME_QRY":"KENTÂ¿S SKOU FINSEN
```
---

### 3.117 queryPOAByCustId（352）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 352 |
| 接口名称 | queryPOAByCustId |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/CmIndivAction/queryPOAByCustId` |
| 功能描述 | 根据客户ID查询POA（授权委托书）信息。该方法调用客户服务查询POA信息，如果查询结果不为空则解析JSON数据，根据全名、生日、生效时间和到期时间过滤匹配的POA记录，返回POA信息的JSON字符串 返回信息: 包含查询结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"poaResult"（POA信息的JSON字符串，包含协议类型、协议期间、状态、特征、协议项、参与方等信息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl#queryPOAByCustId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | java.lang.String | BODY | 是 | 客户ID，用于查询该客户的POA信息 | 23210517915222 |
| fullName | java.lang.String | BODY | 是 | 全名，用于过滤匹配的POA记录，可以为空 |  |
| birthday | java.lang.String | BODY | 是 | 生日，用于过滤匹配的POA记录，可以为空 |  |
| effTime | java.lang.String | BODY | 是 | 生效时间，用于过滤匹配的POA记录，可以为空 |  |
| expTime | java.lang.String | BODY | 是 | 到期时间，用于过滤匹配的POA记录，可以为空 |  |

**请求示例**：

```http
POST /api/cm/service/CmIndivAction/queryPOAByCustId
Content-Type: application/json

{
  "custId": "21210419971223"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "retFlag": "Y"
  },
  "metaObject": "",
  "fieldNameConvert": null
}
```
---

### 3.118 queryAcctsById（353）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 353 |
| 接口名称 | queryAcctsById |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmAccountSV/queryAcctsById` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmAccountSV#queryAcctsById |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | BODY | 是 |  |  |
| custId | long | BODY | 是 |  |  |
| startIndex | int | QUERY | 是 |  |  |
| endIndex | int | QUERY | 是 |  |  |

**请求示例**：

```http
POST /api/cm/service/ICmAccountSV/queryAcctsById
Content-Type: application/json

{
  "custId": "21210419971223"
}
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":[{"EFFECTIVE_DATE":"2025-08-22 14:22:04","REGION_ID":"2100","CREATE_OP_ID":100000032,"CUST_ID":21210419971223,"URGE_STOP_FLAG":"1","ORG_ID":21000000,"OP_ID":100000032,"CUST_CERT_CODE":"0104850117","STATE":"U","LAST_NAME":"Finsen","FIRST_NAME":"KentÂ¿S Skou","INSTALLMENT_FLAG":0,"CREATE_ORG_ID":21000000,"EXPIRE_DATE":"2099-12-31 23:59:59","DONE_DATE":"2025-09-25 19:25:24","DONE_CODE":112394894678,"ACCT_ID":32108119370351,"ACCT_TYPE":2,"ACCT_NAME":"a","CREATE_DATE":"2025-08-22 14:22:04","ACCT_STATUS":3,"CREDIT_VALUE":0,"ACCT_BEHALF_PHONE":"0","CUST_NAME":"KentÂ¿S Skou Finsen"},{"EFFECTIVE_DATE":"2025-08-25 15:43:58","REGION_ID":"2107","CREATE_OP_ID":500014851,"CUST_ID":21210419971223,"URGE_STOP_FLAG":"1","ORG_ID":21000000,"OP_ID":100001254,"CUST_CERT_CODE":"0104850117","STATE":"U","LAST_NAME":"Finsen","FIRST_NAME":"KentÂ¿S Skou","INSTALLMENT_FLAG":0,"CREATE_ORG_ID":10056316,"EXPIRE_DATE":"2099-12-31 23:59:59","DONE_DATE":"2026-02-03 08:4
```
---

### 3.119 queryAcctsCountById（354）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 354 |
| 接口名称 | queryAcctsCountById |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmAccountSV/queryAcctsCountById` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmAccountSV#queryAcctsCountById |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | BODY | 是 |  |  |
| custId | long | BODY | 是 |  |  |

**请求示例**：

```http
POST /api/cm/service/ICmAccountSV/queryAcctsCountById
Content-Type: application/json

{
  "custId": "21210419971223"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 5,
  "metaObject": "SETAccount001",
  "fieldNameConvert": null
}
```
---

### 3.120 queryIndivContactByCustContId（355）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 355 |
| 接口名称 | queryIndivContactByCustContId |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmContactSV/queryIndivContactByCustContId` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmContactSV#queryIndivContactByCustContId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custContId | long | BODY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.121 savePartyContactInfo（356）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 356 |
| 接口名称 | savePartyContactInfo |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/CmIndivAction/savePartyContactInfo` |
| 功能描述 | 保存参与人联系信息。该方法接收集团成员Bean、参与人联系Bean和参与人Bean，如果参与人联系信息被修改则保存参与人联系信息，然后创建个人联系关系记录 返回信息: 包含保存结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl#savePartyContactInfo |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| groupMemberBean | java.util.Map | BODY | 是 | 集团成员Bean，包含个人联系关系信息 |  |
| partyContactBean | java.util.Map | BODY | 是 | 参与人联系Bean，包含参与人联系信息 |  |
| partyBean | java.util.Map | BODY | 是 | 参与人Bean，包含参与人基本信息 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.122 saveDkIndivContactInfo（357）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 357 |
| 接口名称 | saveDkIndivContactInfo |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/CmIndivAction/saveDkIndivContactInfo` |
| 功能描述 | 保存丹麦个人联系信息。该方法接收集团成员Bean、参与人联系Bean和参与人Bean，如果是新增则创建个人联系关系、参与人联系信息和参与人基本信息；如果是修改则更新这些信息。方法会设置参与人名称（根据firstName、middleName和lastName组合） 返回信息: 包含保存结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl#saveDkIndivContactInfo |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| groupMemberBean | java.util.Map | BODY | 是 | 集团成员Bean，包含个人联系关系信息 |  |
| partyContactBean | java.util.Map | BODY | 是 | 参与人联系Bean，包含参与人联系信息 |  |
| partyBean | java.util.Map | BODY | 是 | 参与人Bean，包含参与人基本信息 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.123 validateIndivContact（358）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 358 |
| 接口名称 | validateIndivContact |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/CmIndivAction/validateIndivContact` |
| 功能描述 | 校验个人联系人。该方法根据参与人ID和客户ID查询个人联系人，如果存在匹配的联系人则校验成功 返回信息: 包含校验结果的Map，key包括"retFlag"（"Y"表示校验成功（存在匹配的联系人），"N"表示校验失败（不存在匹配的联系人）） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl#validateIndivContact |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | BODY | 是 | 参与人ID，用于查询个人联系人 |  |
| custId | long | BODY | 是 | 客户ID，用于查询个人联系人 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.124 queryCprLogInfo（359）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 359 |
| 接口名称 | queryCprLogInfo |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmCustomerSV/queryCprLogInfo` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#queryCprLogInfo |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| info | java.util.Map | BODY | 是 |  |  |
| startIndex | int | QUERY | 是 |  |  |
| endIndex | int | QUERY | 是 |  |  |

**请求示例**：

```http
POST /api/cm/service/ICmCustomerSV/queryCprLogInfo
Content-Type: application/json

{
  "info": {
    "PNR": "0104850117",
    "START_TIME": "2026-03-01",
    "END_TIME": "2026-03-02"
  }
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [],
  "metaObject": "SETCMCustCprLog001",
  "fieldNameConvert": null
}
```
---

### 3.125 queryCprLogInfoCount（360）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 360 |
| 接口名称 | queryCprLogInfoCount |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmCustomerSV/queryCprLogInfoCount` |
| 功能描述 | 查询CPR日志信息数量。该方法接收查询条件Map，构建XML查询条件，然后调用客户服务查询符合条件的CPR日志信息总数 返回信息: 符合条件的CPR日志信息总数，int类型 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#queryCprLogInfoCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| info | java.util.Map | BODY | 是 | 查询条件Map，包含查询CPR日志信息的各种条件参数 |  |

**请求示例**：

```http
POST /api/cm/service/ICmCustomerSV/queryCprLogInfoCount
Content-Type: application/json

{
  "info": {
    "PNR": "0104850117",
    "START_TIME": "2026-03-01",
    "END_TIME": "2026-03-02"
  }
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 0,
  "metaObject": "SETCMCustCprLog001",
  "fieldNameConvert": null
}
```
---

### 3.126 queryCustContactCount（361）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 361 |
| 接口名称 | queryCustContactCount |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmContactSV/queryCustContactCount` |
| 功能描述 | 查询客户联系人数量。该方法接收查询条件Map和Bean名称，通过参数工具类构建XML查询条件，然后调用联系人服务查询符合条件的客户联系人总数 返回信息: 客户联系人总数，返回符合查询条件的联系人记录数量 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.ContactBFImpl#queryCustContactCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| info | java.util.Map | BODY | 是 | 查询条件Map，包含查询客户联系人的各种条件参数 |  |
| beanName | java.lang.String | BODY | 是 | Bean名称，用于构建XML查询条件的Bean类型标识 |  |

**请求示例**：

```http
POST /api/cm/service/ICmContactSV/queryCustContactCount
Content-Type: application/json

{
  "info": {
    "CUST_ID": "21210419971223"
  },
  "beanName": "com.asiainfo.crm.cm.model.bo.ContactBean"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 0,
  "metaObject": "SETContact001",
  "fieldNameConvert": null
}
```
---

### 3.127 queryCustContacts（362）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 362 |
| 接口名称 | queryCustContacts |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmContactSV/queryCustContacts` |
| 功能描述 | 查询客户联系人列表。该方法接收查询条件Map、Bean名称和分页参数（起始索引和结束索引），通过参数工具类构建XML查询条件，然后调用联系人服务查询符合条件的客户联系人列表，支持分页查询 返回信息: 客户联系人值数组，包含符合查询条件的联系人信息列表，每个元素代表一个联系人记录 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.ContactBFImpl#queryCustContacts |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| info | java.util.Map | BODY | 是 | 查询条件Map，包含查询客户联系人的各种条件参数 |  |
| beanName | java.lang.String | BODY | 是 | Bean名称，用于构建XML查询条件的Bean类型标识 |  |
| startNum | int | QUERY | 是 | 起始索引，用于分页查询的起始位置 |  |
| endNum | int | QUERY | 是 | 结束索引，用于分页查询的结束位置 |  |

**请求示例**：

```http
POST /api/cm/service/ICmContactSV/queryCustContacts
Content-Type: application/json

{
  "info": {
    "CUST_ID": "21210419971223"
  },
  "beanName": "com.asiainfo.crm.cm.model.bo.ContactBean"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [],
  "metaObject": "SETContact001",
  "fieldNameConvert": null
}
```
---

### 3.128 query360AllUserList（363）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 363 |
| 接口名称 | query360AllUserList |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICrmFSV/query360AllUserList` |
| 功能描述 | 根据客户ID、产品目录、账单ID、产品ID等条件，查询并返回该客户下所有符合条件的用户列表，包含用户基本信息、产品信息、协议期、VPN信息、操作链接等，并按账单ID排序后分页返回。 |
| 方法来源 | com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV#query360AllUserList |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | BODY | 是 | 客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作 | 23210517915222 |
| prodCatalogId | java.lang.String | BODY | 是 | 产品线ID | -1 |
| billId | java.lang.String | BODY | 是 | 号码标识/客户关联标识，用于客户查询、号码识别及账户关系定位 | 45903212 |
| offerId | long | BODY | 是 | 套餐ID | 30013 |
| startIndex | int | QUERY | 是 | 页数 | 1 |
| endIndex | int | QUERY | 是 | 每页条数 | 10 |

**请求示例**：

```http
POST /api/cm/service/ICrmFSV/query360AllUserList
Content-Type: application/json

{
  "custId": "23210117776822",
  "prodCatalogId": "-1",
  "billId": "",
  "offerId": "70130"
}
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":[{"EFFECTIVE_DATE":"2022-12-05 16:13:59","VPN_NAME":"Dai zomeya","OFFER_ID":70130,"STATE":"1","SEQUENCE_ID":0,"PRODNAME":"IN VPMN_Main Group","USER":"Dai zomeya_T0","BILL_ID":"565381000","ACTION":"<a href='javascript:void(0)' class='cellpath' onclick='detailAction(\"42102131179152\",\"70130\",\"33000016422472\",\"182000000001\",\"172000000001\",\"565381000\",\"23210117776822\",\"2102\",\"\")' style='color:blue;margin-left:5px;text-decoration:underline'>Detail</a><a href='javascript:void(0)' class='cellpath' onclick='checkAction(\"565381000\",\"42102131179152\",\"IN VPMN_Main Group\",\"\",\"1\",\"172000000001\",\"OFFER_PLAN_BBOSS\",\"42102131179152\",\"\",\"70130\",\"2102\",\"33000016422472\",\"32108116452352\",\"Active\")' style='color:blue;margin-left:5px;text-decoration:underline'>Operation</a>","USERID":42102131179152,"IS_MAIN_GROUP":1,"PROD_CATALOG_ID":172000000001,"PRODID":70130}],"metaObject":"SET360VirtualUser001","fieldNameC
```
---

### 3.129 query360AllUserListCount（364）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 364 |
| 接口名称 | query360AllUserListCount |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICrmFSV/query360AllUserListCount` |
| 功能描述 | 根据客户ID、产品目录ID、账单ID和套餐ID，查询360度全量用户列表中符合条件的用户关系数量。 |
| 方法来源 | com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV#query360AllUserListCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | BODY | 是 | 客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作 | 23210517915222 |
| prodCatalogId | java.lang.String | BODY | 是 | 产品线ID | -1 |
| billId | java.lang.String | BODY | 是 | 号码标识/客户关联标识，用于客户查询、号码识别及账户关系定位 | 47389201 |
| offerId | long | BODY | 是 | 套餐ID | 30013 |

**请求示例**：

```http
POST /api/cm/service/ICrmFSV/query360AllUserListCount
Content-Type: application/json

{
  "custId": "23210117776822",
  "prodCatalogId": "-1",
  "billId": "",
  "offerId": "70130"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 1,
  "metaObject": "SET360VirtualUser001",
  "fieldNameConvert": null
}
```
---

### 3.130 query360AllUserListView（365）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 365 |
| 接口名称 | query360AllUserListView |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICrmFSV/query360AllUserListView` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV#query360AllUserListView |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | BODY | 是 |  |  |
| prodCatalogId | java.lang.String | BODY | 是 |  |  |
| billId | java.lang.String | BODY | 是 |  |  |
| offerId | long | BODY | 是 |  |  |
| circuitNumber | java.lang.String | BODY | 是 |  |  |
| CPENumber | java.lang.String | BODY | 是 |  |  |
| userName | java.lang.String | BODY | 是 |  |  |
| fibiaCustId | java.lang.String | BODY | 是 |  |  |
| states | java.lang.String | BODY | 是 |  |  |
| offerName | java.lang.String | BODY | 是 |  |  |
| startIndex | int | QUERY | 是 |  |  |
| endIndex | int | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.131 query360AllUserListViewCount（366）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 366 |
| 接口名称 | query360AllUserListViewCount |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICrmFSV/query360AllUserListViewCount` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV#query360AllUserListViewCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | BODY | 是 |  |  |
| prodCatalogId | java.lang.String | BODY | 是 |  |  |
| billId | java.lang.String | BODY | 是 |  |  |
| offerId | long | BODY | 是 |  |  |
| circuitNumber | java.lang.String | BODY | 是 |  |  |
| CPENumber | java.lang.String | BODY | 是 |  |  |
| userName | java.lang.String | BODY | 是 |  |  |
| fibiaCustId | java.lang.String | BODY | 是 |  |  |
| states | java.lang.String | BODY | 是 |  |  |
| offerName | java.lang.String | BODY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.132 getCustVpnRelation（369）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 369 |
| 接口名称 | getCustVpnRelation |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/IBbossCustVpnRelSV/getCustVpnRelation` |
| 功能描述 | 根据客户ID分页查询该客户在VPN关系中的关联客户列表；若该客户是VPN拥有者则返回其受益客户列表，若是受益者则返回其拥有者客户列表。 |
| 方法来源 | com.asiainfo.crm.so.common.bboss.service.interfaces.IBbossCustVpnRelSV#getCustVpnRelation |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | java.lang.String | BODY | 是 | 客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作 | 23210517915222 |
| start | int | QUERY | 是 | 页数 | 3 |
| end | int | QUERY | 是 | 每页条数 | 10 |

**请求示例**：

```http
POST /api/cm/service/IBbossCustVpnRelSV/getCustVpnRelation
Content-Type: application/json

{
  "custId": "23210117776822"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [],
  "metaObject": "SETVpnRelSearch001",
  "fieldNameConvert": null
}
```
---

### 3.133 getCustVpnRelationCount（370）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 370 |
| 接口名称 | getCustVpnRelationCount |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/IBbossCustVpnRelSV/getCustVpnRelationCount` |
| 功能描述 | 该方法统计指定客户在VPN关系中的关联数量（作为owner或benefi的所有关系记录数）。 |
| 方法来源 | com.asiainfo.crm.so.common.bboss.service.interfaces.IBbossCustVpnRelSV#getCustVpnRelationCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | java.lang.String | BODY | 是 | 客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作 | 23210517915222 |

**请求示例**：

```http
POST /api/cm/service/IBbossCustVpnRelSV/getCustVpnRelationCount
Content-Type: application/json

{
  "custId": "23210117776822"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 0,
  "metaObject": "SETVpnRelSearch001",
  "fieldNameConvert": null
}
```
---

### 3.134 searchServiceNum（371）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 371 |
| 接口名称 | searchServiceNum |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/RbossSoAction/searchServiceNum` |
| 功能描述 | 查询服务号码是否在实例表中存在。该方法接收服务号码，设置中心信息为账单ID，调用getUserInfoByBillId方法查询用户信息。如果查询到用户信息则返回成功标志，否则返回失败标志和错误消息 返回信息: 包含查询结果的Map，key包括"retVal"（"Y"表示服务号码存在，"N"表示不存在）和"retMsg"（结果消息，不存在时返回"Service number {serviceNum} is not on subscription list"） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.RbossSoBFImpl#searchServiceNum |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| serviceNum | java.lang.String | BODY | 是 | 服务号码，用于查询该服务号码是否在实例表中存在 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.135 queryVpmnTransferResult（372）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 372 |
| 接口名称 | queryVpmnTransferResult |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/IBbossVpnTransferResultSV/queryVpmnTransferResult` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.so.common.bboss.service.interfaces.IBbossVpnTransferResultSV#queryVpmnTransferResult |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| ownerCustId | long | BODY | 是 |  |  |
| startDate | java.lang.String | BODY | 是 |  |  |
| endDate | java.lang.String | BODY | 是 |  |  |
| startNum | int | QUERY | 是 |  |  |
| endNum | int | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.136 queryVpmnTransferResultCount（373）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 373 |
| 接口名称 | queryVpmnTransferResultCount |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/IBbossVpnTransferResultSV/queryVpmnTransferResultCount` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.so.common.bboss.service.interfaces.IBbossVpnTransferResultSV#queryVpmnTransferResultCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| ownerCustId | long | BODY | 是 |  |  |
| startDate | java.lang.String | BODY | 是 |  |  |
| endDate | java.lang.String | BODY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.137 getUsersByInsOfferIdRoleId（374）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 374 |
| 接口名称 | getUsersByInsOfferIdRoleId |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/RbossSoBF/getUsersByInsOfferIdRoleId` |
| 功能描述 | 根据产品实例ID和角色ID获取用户列表。该方法接收产品实例ID、账单ID、角色ID、有效类型、区域ID字符串、是否主角色和分页参数，设置中心信息为账单ID，调用实例用户服务查询符合条件的用户列表 返回信息: 用户信息的DataContainer数组，每个元素包含一个用户的属性信息 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.RbossSoBFImpl#getUsersByInsOfferIdRoleId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| offerInstanceId | long | BODY | 是 | 产品实例ID，用于查询该产品实例下的用户 |  |
| billId | java.lang.String | BODY | 是 | 账单ID，用于设置中心信息和过滤查询结果 |  |
| roleId | long | BODY | 是 | 角色ID，用于过滤查询结果 |  |
| validType | int | BODY | 是 | 有效类型，用于过滤查询结果 |  |
| regionIdsStr | java.lang.String | BODY | 是 | 区域ID字符串，用于过滤查询结果 |  |
| isMainRole | java.lang.String | BODY | 是 | 是否主角色，用于过滤查询结果 |  |
| startRowIndex | int | BODY | 是 | 分页起始行索引 |  |
| endRowIndex | int | BODY | 是 | 分页结束行索引 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.138 createInsUserTable（375）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 375 |
| 接口名称 | createInsUserTable |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/IInsUserSV/createInsUserTable` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.so.instance.bboss.service.interfaces.IInsUserSV#createInsUserTable |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | java.lang.String | BODY | 是 |  |  |
| billId | java.lang.String | BODY | 是 |  |  |
| offerInstId | java.lang.String | BODY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.139 getRegionIdByUserId（376）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 376 |
| 接口名称 | getRegionIdByUserId |
| HTTP方法 | GET |
| API路径 | `/api/cm/service/CommonBF/getRegionIdByUserId` |
| 功能描述 | 根据用户ID获取区域ID。该方法通过中心工具类查询指定用户ID对应的区域ID 返回信息: 区域ID字符串，如果查询失败则返回null |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CommonBFImpl#getRegionIdByUserId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| userId | long | QUERY | 是 | 用户ID，用于查询该用户对应的区域ID |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.140 getOfferRelatRoleValue（377）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 377 |
| 接口名称 | getOfferRelatRoleValue |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICrmProductSV/getOfferRelatRoleValue` |
| 功能描述 |  |
| 方法来源 | com.ai.omframe.teaminvoke.service.interfaces.ICrmProductSV#getOfferRelatRoleValue |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| aOfferId | long | BODY | 是 |  |  |
| aProductRoleId | long | BODY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.141 getProductSpecByRoleId（378）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 378 |
| 接口名称 | getProductSpecByRoleId |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICrmProductSV/getProductSpecByRoleId` |
| 功能描述 |  |
| 方法来源 | com.ai.omframe.teaminvoke.service.interfaces.ICrmProductSV#getProductSpecByRoleId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| roleId | long | BODY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.142 getUserProdsInfoTree（379）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 379 |
| 接口名称 | getUserProdsInfoTree |
| HTTP方法 | GET |
| API路径 | `/api/cm/service/Cust360ViewBF/getUserProdsInfoTree` |
| 功能描述 | 获取用户产品信息树。该方法根据用户ID设置中心信息，然后调用CRM服务获取用户的产品信息树结构，用于360视图展示用户的产品信息 返回信息: 数据容器数组，包含用户的产品信息树结构，每个元素代表一个产品节点 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.Cust360ViewBFImpl#getUserProdsInfoTree |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| userId | long | QUERY | 是 | 用户ID，用于查询该用户的产品信息树 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.143 query360UserAccrel（380）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 380 |
| 接口名称 | query360UserAccrel |
| HTTP方法 | GET |
| API路径 | `/api/cm/service/Cust360ViewBF/query360UserAccrel` |
| 功能描述 | 查询360用户账户关系。该方法根据用户ID设置中心信息，然后调用CRM服务查询用户的账户关系信息，用于360视图展示用户的账户关系 返回信息: 数据容器数组，包含用户的账户关系信息列表，每个元素代表一个账户关系记录 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.Cust360ViewBFImpl#query360UserAccrel |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| userId | long | QUERY | 是 | 用户ID，用于查询该用户的账户关系信息 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.144 checkIsRangeNumberAndSameRange（381）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 381 |
| 接口名称 | checkIsRangeNumberAndSameRange |
| HTTP方法 | POST |
| API路径 | `/api/cm/360view/RbossSoAction/checkIsRangeNumberAndSameRange` |
| 功能描述 | 检查号码是否在号段内且属于同一号段。该方法接收账单ID，设置中心信息为账单ID，调用资源服务检查号码是否在号段内。如果在号段内，则进一步检查是否属于同一号段。如果不在号段内或不属于同一号段，返回失败标志，否则返回成功标志 返回信息: 包含检查结果的Map，key为"retVal"（"Y"表示号码在号段内且属于同一号段，"N"表示不在号段内或不属于同一号段） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.RbossSoBFImpl#checkIsRangeNumberAndSameRange |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| billId | java.lang.String | BODY | 是 | 账单ID，用于检查该号码是否在号段内且属于同一号段 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.145 getOfferTypeByOfferId（382）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 382 |
| 接口名称 | getOfferTypeByOfferId |
| HTTP方法 | POST |
| API路径 | `/api/cm/360view/BbossSoAction/getOfferTypeByOfferId` |
| 功能描述 | 根据产品ID获取产品类型和特征值。该方法接收产品ID，查询产品信息，判断产品类型是否为OTT计划或OTT增值服务，查询产品的特征值，判断是否为O365类型（特征值为"21"且等于MDM_OTT_FEATURE_VALUE时不是O365），返回产品类型、是否为O365和特征值 返回信息: 包含产品类型信息的Map，key包括"type"（产品类型：OTT计划或OTT增值服务）、"isO365"（"Y"表示是O365，"N"表示不是）和"featureValue"（产品特征值） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.BbossSoBFImpl#getOfferTypeByOfferId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| offerId | long | BODY | 是 | 产品ID，用于查询产品类型和特征信息 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.146 getDM002UserFlag（383）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 383 |
| 接口名称 | getDM002UserFlag |
| HTTP方法 | POST |
| API路径 | `/api/cm/360view/BbossSoAction/getDM002UserFlag` |
| 功能描述 | 判断是否为DM002用户，用于宽带业务变更判断。该方法根据用户ID查询实例服务属性，获取技术类型属性值，如果技术类型属性值不为空，则标识为DM002用户 返回信息: 包含判断结果的Map，key包括"DM002Flag"（"Y"表示是DM002用户，"N"表示不是DM002用户）、"TechType_value"（技术类型属性值，仅当是DM002用户时存在）、"retMsg"（异常消息，发生异常时存在） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.Cust360ViewBFImpl#getDM002UserFlag |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| userId | java.lang.String | BODY | 是 | 用户ID，用于查询该用户的实例服务属性，判断是否为DM002用户 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.147 checIsHasRangesOpen（384）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 384 |
| 接口名称 | checIsHasRangesOpen |
| HTTP方法 | GET |
| API路径 | `/api/cm/360view/RbossSoAction/checIsHasRangesOpen` |
| 功能描述 | 检查是否有号段开放。该方法接收服务号码和功能ID，如果服务号码不为空，则查询前导号码信息。如果服务号码等于前导号码，则根据功能ID判断是否需要检查已使用号码。对于特定功能ID（10000019、10000022、20000039、20000121），如果县区ID为"1"则允许，否则检查是否存在已使用号码。对于其他功能ID，直接检查是否存在已使用号码 返回信息: 包含检查结果的Map，key为"retVal"（"Y"表示允许，"N"表示不允许） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.RbossSoBFImpl#checIsHasRangesOpen |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| serviceNum | java.lang.String | QUERY | 是 | 服务号码，用于检查该服务号码是否有号段开放 |  |
| functionId | java.lang.String | QUERY | 是 | 功能ID，用于判断检查逻辑，特定功能ID（10000019、10000022、20000039、20000121）有特殊处理 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.148 isCompanyOffer（385）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 385 |
| 接口名称 | isCompanyOffer |
| HTTP方法 | POST |
| API路径 | `/api/cm/360view/BbossSoAction/isCompanyOffer` |
| 功能描述 | 判断产品是否为公司产品。该方法接收产品ID，调用isCompany方法判断是否为公司产品，返回判断结果 返回信息: 包含判断结果的Map，key为"retValue"（"Y"表示是公司产品，"N"表示不是） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.BbossSoBFImpl#isCompanyOffer |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| offerId | long | BODY | 是 | 产品ID，用于判断是否为公司产品 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.149 query360OrdCustByCustIdAndStartEndDateCount（386）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 386 |
| 接口名称 | query360OrdCustByCustIdAndStartEndDateCount |
| HTTP方法 | POST |
| API路径 | `/api/cm/360view/RbossSoAction/query360OrdCustByCustIdAndStartEndDateCount` |
| 功能描述 | 根据客户ID和起止日期查询360订单客户数量。该方法接收客户ID、开始日期、结束日期、区域ID、类型、账单ID、电路号码、CPE号码、PO号码和FIBIA客户ID等参数，调用CRM服务查询符合条件的订单客户数量 返回信息: 包含查询结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息或异常信息）和"retCount"（查询到的订单客户数量，字符串类型） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.RbossSoBFImpl#query360OrdCustByCustIdAndStartEndDateCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | BODY | 是 | 客户ID，用于查询该客户的订单信息 |  |
| startDate | java.lang.String | BODY | 是 | 开始日期，用于过滤查询结果的时间范围 |  |
| endDate | java.lang.String | BODY | 是 | 结束日期，用于过滤查询结果的时间范围 |  |
| regionId | java.lang.String | BODY | 是 | 区域ID，用于过滤查询结果 |  |
| type | int | BODY | 是 | 类型，用于过滤查询结果 |  |
| billId | java.lang.String | BODY | 是 | 账单ID，用于过滤查询结果 |  |
| circuitNumber | java.lang.String | BODY | 是 | 电路号码，用于过滤查询结果 |  |
| CPENumber | java.lang.String | BODY | 是 | CPE号码，用于过滤查询结果 |  |
| PONumber | java.lang.String | BODY | 是 | PO号码，用于过滤查询结果 |  |
| fibiaCustId | java.lang.String | BODY | 是 | FIBIA客户ID，用于过滤查询结果 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.150 getOrdBasicInfo（390）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 390 |
| 接口名称 | getOrdBasicInfo |
| HTTP方法 | POST |
| API路径 | `/api/cm/360view/ICrmFSV/getOrdBasicInfo` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV#getOrdBasicInfo |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custOrderId | long | BODY | 是 |  |  |
| createDate | java.lang.String | BODY | 是 |  |  |
| regionId | java.lang.String | BODY | 是 |  |  |
| OperateType | java.lang.String | BODY | 是 |  |  |
| doneDate | java.lang.String | BODY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.151 getOrdDeliveryInfo（391）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 391 |
| 接口名称 | getOrdDeliveryInfo |
| HTTP方法 | POST |
| API路径 | `/api/cm/360view/ICrmFSV/getOrdDeliveryInfo` |
| 功能描述 | 根据订单ID查询并组装订单的配送信息，包括收货人姓名/公司名、配送地址、配送方式、联系方式、预计配送日期等，并判断收货人是否为默认客户名称。 |
| 方法来源 | com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV#getOrdDeliveryInfo |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custOrderId | long | BODY | 是 | 客户订单唯一标识，用于订单与合同的关联管理 | 32100263471304 |
| createDate | java.lang.String | BODY | 是 | 创建时间 | 2025-11-24 14:38:54 |
| regionId | java.lang.String | BODY | 是 | 区域标识，用于区分客户/账户所属行政或业务区域 | 2100 |
| OperateType | java.lang.String | BODY | 是 | 操作类型 | 0 |
| doneDate | java.lang.String | BODY | 是 | 完成时间 | 2025-11-24 |

**请求示例**：

```http
POST /api/cm/360view/ICrmFSV/getOrdDeliveryInfo
Content-Type: application/json

{
  "custOrderId": "32103263836527",
  "createDate": "2026-02-09 20:09:11",
  "regionId": "2103",
  "OperateType": "1",
  "doneDate": "2026-02-09"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "LEGAL_ADDRESS": "",
    "LEGAL_ADDRESS_NAME": "Aurikla Osabel Riikonen",
    "DELIVERY_ADDRESS": ""
  },
  "metaObject": "SET360OrdCust001",
  "fieldNameConvert": null
}
```
---

### 3.152 查询部门成员（400）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 400 |
| 接口名称 | 查询部门成员 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/member/page` |
| 功能描述 | 查询集团成员 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#queryGroupDeptBill |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 |  |  |
| deptId | long | QUERY | 是 |  |  |
| startNum | int | QUERY | 是 |  |  |
| endNum | int | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.153 查询部门成员count（401）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 401 |
| 接口名称 | 查询部门成员count |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/member/count` |
| 功能描述 | 查询集团部门账单数量。该方法接收客户ID和部门ID，构建XML查询参数，然后调用丹麦客户服务查询该部门下的账单总数 返回信息: 符合条件的账单总数，int类型 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#queryGroupDeptBillCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID，用于查询该客户下指定部门的账单总数 |  |
| deptId | long | QUERY | 是 | 部门ID，用于查询该部门下的账单总数 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.154 查询部门成员（402）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 402 |
| 接口名称 | 查询部门成员 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/user/page` |
| 功能描述 | 查询部门成员 |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV#queryGroupDeptUser |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 |  |  |
| billId | String | QUERY | 否 |  |  |
| startNum | int | QUERY | 是 |  |  |
| endNum | int | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.155 查询部门成员数量（403）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 403 |
| 接口名称 | 查询部门成员数量 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/user/count` |
| 功能描述 | 查询部门成员数量 |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV#queryGroupDeptUserCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 |  |  |
| billId | String | QUERY | 否 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.156 查询模板信息（404）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 404 |
| 接口名称 | 查询模板信息 |
| HTTP方法 | GET |
| API路径 | `/api/common/bp/template` |
| 功能描述 | 查询模板信息 |
| 方法来源 | com.asiainfo.crm.common.bp.service.interfaces.IVolumnBusinessSV#getTemplateInfo |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| templateCode | String | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.157 查询模板详细信息（405）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 405 |
| 接口名称 | 查询模板详细信息 |
| HTTP方法 | GET |
| API路径 | `/api/common/bp/template/detail` |
| 功能描述 | 查询模板详细信息 |
| 方法来源 | com.asiainfo.crm.common.bp.service.interfaces.IVolumnBusinessSV#getBPTemplate |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| templateCode | String | QUERY | 是 |  |  |
| regionId | String | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.158 新增和修改客户部门（406）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 406 |
| 接口名称 | 新增和修改客户部门 |
| HTTP方法 | POST |
| API路径 | `/api/cm/customer/dept` |
| 功能描述 | 保存集团客户部门信息 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#saveGroupDeptInfo |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.159 删除部门下所有成员（407）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 407 |
| 接口名称 | 删除部门下所有成员 |
| HTTP方法 | DELETE |
| API路径 | `/api/cm/customer/dept/{deptId}/member` |
| 功能描述 | 删除部门成员 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#delGroupDeptOfMember |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| deptId | long | PATH | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.160 删除部门（408）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 408 |
| 接口名称 | 删除部门 |
| HTTP方法 | DELETE |
| API路径 | `/api/cm/customer/dept/{deptId}` |
| 功能描述 | 删除部门 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#delGroupCustDept |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| deptId | long | PATH | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.161 删除部门下的指定成员（409）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 409 |
| 接口名称 | 删除部门下的指定成员 |
| HTTP方法 | DELETE |
| API路径 | `/api/cm/customer/dept/member` |
| 功能描述 | 删除部门下的指定成员 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#delGroupDeptNumMember |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.162 分配部门成员到其他部门（410）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 410 |
| 接口名称 | 分配部门成员到其他部门 |
| HTTP方法 | POST |
| API路径 | `/api/cm/customer/assign/dept/member` |
| 功能描述 | 分配部门成员到其他部门 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#modifyGroupDeptNumMember |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.163 查询模板今日新增成功文件的数量（411）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 411 |
| 接口名称 | 查询模板今日新增成功文件的数量 |
| HTTP方法 | GET |
| API路径 | `/api/common/bp/template/import/count` |
| 功能描述 | 获取当天已导入数据库的数量。该方法根据模板代码查询当天已经导入数据库的文件数量，用于控制文件导入的频率和数量限制 返回信息: 包含查询结果的Map，key包括"ret"（"Y"表示成功，"N"表示失败）、"msg"（结果消息，成功时返回数量字符串，失败时返回错误信息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CommonBFImpl#getCurrentDayAlreadyImportDbCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| templateCode | String | QUERY | 是 | 模板代码，用于查询该模板当天已导入数据库的文件数量 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.164 给部门分配成员（414）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 414 |
| 接口名称 | 给部门分配成员 |
| HTTP方法 | POST |
| API路径 | `/api/cm/customer/{custId}/dept/{deptId}/member` |
| 功能描述 | 给部门分配成员 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#saveGroupDeptNumMember |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.165 部门树形结构查询（415）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 415 |
| 接口名称 | 部门树形结构查询 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/dept/tree` |
| 功能描述 | 部门树形结构查询 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerOrgAndDeptBFImpl#getGroupDeptTree |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID，用于查询集团部门树 |  |

**请求示例**：

```http
GET /api/cm/customer/23210120133026/dept/tree
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "treeNodeId": "410002028238",
    "parentNodeId": null,
    "level": 1,
    "value": "410002028238",
    "label": "Asiainfo Denmark Software Limited Coperation",
    "userObj": "-1",
    "childrenNode": [],
    "foldOpenPicUrl": "/webframe/images/icon/mini131.gif",
    "foldClosePicUrl": "/webframe/images/icon/mini131.gif",
    "leafPicUrl": "/webframe/images/icon/mini131.gif",
    "leaf": false,
    "checked": false,
    "lastNode": false
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.166 保存集团客户关系（500）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 500 |
| 接口名称 | 保存集团客户关系 |
| HTTP方法 | POST |
| API路径 | `/api/cm/b2b/custRel` |
| 功能描述 | 保存集团客户关系 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#saveCustRel |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| arg0 | com.asiainfo.crm.cm.vo.CustRelVO | BODY | 是 | 保存集团客户关系 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.167 查询集团客户关系（501）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 501 |
| 接口名称 | 查询集团客户关系 |
| HTTP方法 | GET |
| API路径 | `/api/cm/b2b/custRel` |
| 功能描述 | 查询集团客户关系 |
| 方法来源 | com.asiainfo.crm.cm.custrel.service.interfaces.ICmCustRelSV#queryCustById |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 |  |  |
| startNum | int | QUERY | 是 |  |  |
| endNum | int | QUERY | 是 |  |  |

**请求示例**：

```http
GET /api/cm/b2b/custRel?custId=23210120133026&pageNum=1&pageSize=10
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [],
  "metaObject": "SETCmCustRel001",
  "fieldNameConvert": null
}
```
---

### 3.168 查询集团客户关系数量（502）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 502 |
| 接口名称 | 查询集团客户关系数量 |
| HTTP方法 | GET |
| API路径 | `/api/cm/b2b/custRel/count` |
| 功能描述 | 查询集团客户关系数量 |
| 方法来源 | com.asiainfo.crm.cm.custrel.service.interfaces.ICmCustRelSV#queryCustByIdCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 |  |  |

**请求示例**：

```http
GET /api/cm/b2b/custRel/count?custId=23210120133026
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 0,
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.169 删除集团客户关系（503）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 503 |
| 接口名称 | 删除集团客户关系 |
| HTTP方法 | DELETE |
| API路径 | `/api/cm/b2b/custRel` |
| 功能描述 | 删除集团客户关系 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#delCustRel |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| arg0 | com.asiainfo.crm.cm.vo.CustRelsVO | BODY | 是 | 删除集团客户关系 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.170 公司组织树状结构查询（600）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 600 |
| 接口名称 | 公司组织树状结构查询 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/org/tree` |
| 功能描述 | 公司组织树状结构查询。 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerOrgAndDeptBFImpl#getGroupOrgTree |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID，用于查询集团组织结构树 | 23210517915222 |

**请求示例**：

```http
GET /api/cm/customer/23210120133026/org/tree
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":{"treeNodeId":"410002020040","parentNodeId":null,"level":1,"value":"410002020040","label":"Asiainfo Denmark Software Limited Coperation","userObj":"23210120133026","childrenNode":[{"treeNodeId":"410001933038","parentNodeId":"410002020040","level":2,"value":"410001933038","label":"LiangJie0526222","userObj":"23210819814229","childrenNode":[{"treeNodeId":"410001287638","parentNodeId":"410001933038","level":3,"value":"410001287638","label":"guoxue20190916","userObj":"23210115517823","childrenNode":[],"foldOpenPicUrl":"/webframe/images/ico_customer.gif","foldClosePicUrl":"/webframe/images/ico_customer.gif","leafPicUrl":"/webframe/images/ico_customer.gif","leaf":true,"checked":false,"lastNode":false},{"treeNodeId":"410001299639","parentNodeId":"410001933038","level":3,"value":"410001299639","label":"dailm dsl 20191105","userObj":"23210015592222","childrenNode":[{"treeNodeId":"410000664038","parentNodeId":"410001299639","level":4,"value":
```
---

### 3.171 查询组织成员信息（601）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 601 |
| 接口名称 | 查询组织成员信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/org/{deptId}/member/page` |
| 功能描述 | 查询组织成员信息。 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerOrgAndDeptBFImpl#queryGroupMembersByCondition |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| deptId | long | PATH | 是 | 部门ID，用于查询该部门下的集团成员 | 410001908838 |
| startNum | int | QUERY | 是 | 起始索引，用于分页查询 | 1 |
| endNum | int | QUERY | 是 | 结束索引，用于分页查询 | 5 |

**请求示例**：

```http
GET /api/cm/customer/org/410002020040/member/page?pageNum=1&pageSize=5&orgId=410002020040
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [],
  "metaObject": "SETCmGroupMember001",
  "fieldNameConvert": null
}
```
---

### 3.172 查询组织成员总数，用于分页（602）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 602 |
| 接口名称 | 查询组织成员总数，用于分页 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/org/{deptId}/member/count` |
| 功能描述 | 查询组织成员总数，用于分页 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerOrgAndDeptBFImpl#queryGroupMembersCountByCondition |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| deptId | long | PATH | 是 | 部门ID，用于查询该部门下的集团成员总数 | 410001908838 |

**请求示例**：

```http
GET /api/cm/customer/org/410002020040/member/count?pageNum=1&pageSize=5&orgId=410002020040
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 0,
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.173 获取下属组织（603）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 603 |
| 接口名称 | 获取下属组织 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/sub-org` |
| 功能描述 | 获取下属组织。 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerOrgAndDeptBFImpl#getSubNodeDeptIds |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID，用于查询该客户组织及其所有子部门的部门ID | 23210517915222 |

**请求示例**：

```http
GET /api/cm/customer/23210120133026/sub-org
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "deptIds": "410002020040,410001933038,410001287638,410001299639,410000664038,410000725838,410001200839,410001233839,410001354638,410001518438",
    "retFlag": "Y"
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.174 校验是否有子组织（604）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 604 |
| 接口名称 | 校验是否有子组织 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/check-group-org-parent` |
| 功能描述 | 校验是否有子组织 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerOrgAndDeptBFImpl#checkGroupOrgParent |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 否 | 客户ID，用于检查集团组织父节点 |  |
| parentDeptId | long | QUERY | 是 | 父部门ID，用于检查该父部门下是否有子节点和成员 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.175 保存集团组织信息（605）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 605 |
| 接口名称 | 保存集团组织信息 |
| HTTP方法 | POST |
| API路径 | `/api/cm/customer/org` |
| 功能描述 | 保存集团组织信息 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerOrgAndDeptBFImpl#saveGroupCustOrgInfo |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

```http
POST /api/cm/customer/org
Content-Type: application/json

{
  "newData": {
    "PARENT_DEPT_ID": "410002020040",
    "PARENT_DEPT_NAME": "Asiainfo Denmark Software Limited Coperation",
    "DEPT_TYPE": 0,
    "CUST_ID": "23210120133026",
    "PRINCIPAL": "53552",
    "PRINCIPAL_TEL": "356345",
    "REL_CUST_ID": 23210819814229,
    "REL_CUST_NAME": "LiangJie0526222",
    "DEPT_NAME": "LiangJie0526222",
    "IS_REVISABLE": 1,
    "DEPT_FUNC": "4535463456"
  },
  "oldData": {}
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "id": "",
    "retVal": "N",
    "retMsg": "The corporate customer is already associated with other subsidiary. Please re-select an associated customer."
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.176 删除组织信息（606）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 606 |
| 接口名称 | 删除组织信息 |
| HTTP方法 | DELETE |
| API路径 | `/api/cm/customer/org/{orgId}` |
| 功能描述 | 删除组织信息 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerOrgAndDeptBFImpl#delGroupCustOrg |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| orgId | long | PATH | 是 | 组织ID，用于删除集团客户组织 |  |

**请求示例**：

```http
DELETE /api/cm/customer/org/410000477046
Content-Type: application/json

{
  "custId": "23210212336526",
  "parentDeptId": "410000477046"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "retVal": "Y",
    "retMsg": "Company organization deleted successfully."
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.177 删除组织中的成员（607）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 607 |
| 接口名称 | 删除组织中的成员 |
| HTTP方法 | DELETE |
| API路径 | `/api/cm/customer/org/member` |
| 功能描述 | 删除组织中的成员 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerOrgAndDeptBFImpl#delGroupMember |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.178 查询个人客户partyId（608）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 608 |
| 接口名称 | 查询个人客户partyId |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/indiv/{custId}/party-id` |
| 功能描述 | 查询个人客户partyId |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerOrgAndDeptBFImpl#queryIndivCust |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID，用于查询个人客户信息 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.179 查询客户基本信息（609）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 609 |
| 接口名称 | 查询客户基本信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/2` |
| 功能描述 | 查询客户基本信息。 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryCustomerMaskByCustId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作 | 23210517915222 |

**请求示例**：

```http
GET /api/cm/customer/23210120133026/2
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":{"CUST_ID":23210120133026,"PROTECT_EFF_DATE":"2025-10-01","ORG_ID":21000000,"GROUP_TYPE":2,"CUST_CERT_TYPE":17,"SHORT_NAME":"C","EXT15":"1:1,2:0,3:18,4:13,5:0","PROTECT_EXPIRE_DATE":"2034-12-01","GROUP_SEGMENT_ID":"SA","EXT17":"Agent","EXT16":"1:0,2:0,3:0","GROUP_WEB":"Carlsberg","ORG_ID_DESC":"Denmarkï¼TNï¼","CUST_SEGMENT":200000000005,"POST_CODE":"9172","CREATE_ORG_ID":21000000,"EXPIRE_DATE":"2099-12-31 23:59:59","CONT_ADDRESS":"5306983","LEGAL_FORM":"EÃF","CUST_SERVICE_ID":"","DONE_DATE":"2025-12-22 14:25:37","HOBBY":"K23210120133026","FORMER_NAME":"Carlsberg Group Entities","REG_AMOUNT":300,"CUST_SERVICE_LEVEL":11,"CUST_TYPE":3,"BI_COMPANY_NAME":"Carlsberg Breweries A/S","CREATE_DATE":"2025-12-15 19:36:16","STAFF_AMOUNT_TYPE":"G","IS_REVISABLE":0,"CONT_NAME":"Asiainfo Denmark Software Limited Coperation","PARTY_ID":110008472096,"REGION_ID":"2102","EFFECTIVE_DATE":"2025-12-15 19:44:56","DEVELOP_TYPE":1,"CREATE_OP_ID":10131916,"DIRE
```
---

### 3.180 查询客户信息（610）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 610 |
| 接口名称 | 查询客户信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/3` |
| 功能描述 | 查询客户信息 |
| 方法来源 | com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICmInterfaceSV#queryCustotmerByCustId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.181 360视图查询用户数据count（612）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 612 |
| 接口名称 | 360视图查询用户数据count |
| HTTP方法 | GET |
| API路径 | `/api/cm/360view/user/count` |
| 功能描述 | 360视图查询用户数据count |
| 方法来源 | com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICm2SoSV#query360AllUserListCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 | 客户ID |  |
| prodCatalogId | String | QUERY | 是 | 产品线ID |  |
| billId | String | QUERY | 否 | bill id |  |
| offerId | long | QUERY | 否 | 套餐ID |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.182 查询成员用户数（613）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 613 |
| 接口名称 | 查询成员用户数 |
| HTTP方法 | GET |
| API路径 | `/api/cm/composite/ins/member/count` |
| 功能描述 | 查询成员用户数 |
| 方法来源 | com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV#qryMemberUserListCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| offerInstanceId | long | QUERY | 是 | offer实例ID |  |
| billId | String | QUERY | 否 | bill id |  |

**请求示例**：

```http
GET /api/cm/composite/ins/member/count?CenterType=RegionId&CenterValue=2102&offerInstanceId=33000016422472
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 10,
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.183 根据客户id查询客户在集团组织的deptId（635）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 635 |
| 接口名称 | 根据客户id查询客户在集团组织的deptId |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{relCustId}/org/deptId` |
| 功能描述 | 根据关联客户ID查询客户组织部门ID。 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#queryCustOrganizeDeptIdByRelCustId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| relCustId | long | PATH | 是 | 关联客户ID，用于查询客户组织部门ID | 23210517915222 |

**请求示例**：

```http
GET /api/cm/customer/23210120133026/org/deptId
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 410002020040,
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.184 根据部门名称查询客户下的部门（700）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 700 |
| 接口名称 | 根据部门名称查询客户下的部门 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/group/org` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryCustOrgByDept |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 |  |  |
| deptName | java.lang.String | QUERY | 否 |  |  |
| startNum | int | QUERY | 是 |  |  |
| endNum | int | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.185 根据部门名称查询客户下的部门总数（701）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 701 |
| 接口名称 | 根据部门名称查询客户下的部门总数 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/group/org/count` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryCustOrgCountByDept |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 |  |  |
| deptName | java.lang.String | QUERY | 否 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.186 查询联系人信息（702）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 702 |
| 接口名称 | 查询联系人信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/indivCont` |
| 功能描述 | 查询个人联系人。该方法接收账单ID，设置中心信息，然后调用团队调用服务根据账单ID获取用户基本信息，如果用户是集团客户则抛出异常，否则返回客户ID、用户ID、品牌、区域ID和参与人ID 返回信息: 包含查询结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（客户ID，成功时存在）、"userId"（用户ID）、"barnd"（品牌）、"regionId"（区域ID）、"partyId"（参与人ID） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#queryIndivCont |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| billId | java.lang.String | QUERY | 是 | 账单ID，用于查询个人联系人信息 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.187 queryCmxIndivCustomerValue（703）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 703 |
| 接口名称 | queryCmxIndivCustomerValue |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/CmxIndivCustomer` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryCmxIndivCustomerValue |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.188 查询默认客户id（704）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 704 |
| 接口名称 | 查询默认客户id |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/defaultId` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.common.service.interfaces.ICmCommonSV#getCustId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custType | int | QUERY | 是 |  |  |

**请求示例**：

```http
GET /api/cm/customer/defaultId?custType=1
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 21210220204424,
  "metaObject": "",
  "fieldNameConvert": null
}
```
---

### 3.189 保存集团成员（705）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 705 |
| 接口名称 | 保存集团成员 |
| HTTP方法 | POST |
| API路径 | `/api/cm/customer/groupmember/ln` |
| 功能描述 | 保存LN集团成员。该方法接收集团成员VO，包含个人客户信息、集团成员信息、扩展信息等，处理新旧数据合并，设置客户状态（网外成员设置为匿名潜在客户），判断成员是否已存在（根据账单ID、状态、成员类型），对于新增网外成员插入CPR订购工单，对于修改成员插入公共工单同步客户信息，保存客户信息、成员关系和扩展信息 返回信息: 包含保存结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，成功时返回国际化资源"CMS0076045"对应的文本，失败时包含错误信息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl#saveLnGroupMember |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| infos | com.asiainfo.crm.cm.vo.GroupMemberVo | BODY | 是 | 集团成员VO，包含个人客户信息、集团成员信息、扩展信息的新旧数据，用于保存LN集团成员 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.190 保存TN集团成员（706）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 706 |
| 接口名称 | 保存TN集团成员 |
| HTTP方法 | POST |
| API路径 | `/api/cm/customer/groupmember/tn` |
| 功能描述 | 保存Telnor集团成员。该方法接收成员来源、成员参与人ID和集团成员VO，处理网内网外成员（网外成员分为4种：从CPR系统查询、从个人客户、从参与人、操作员输入），设置客户为匿名潜在客户，校验成员是否已存在，对于网内成员或选择客户作为成员则只插入角色表和成员关系表，对于网外成员需要保存客户信息、参与人信息、成员关系和扩展信息 返回信息: 包含保存结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，成功时为"success"，失败时包含错误信息）、"custId"（客户ID，成功时存在） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl#savetelnorGroupMember |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.191 获取集团关键人等级（707）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 707 |
| 接口名称 | 获取集团关键人等级 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/keyPeopGrad` |
| 功能描述 | 获取客户关键人员等级。该方法接收客户ID，查询客户信息，根据客户服务等级（LEVEL_INT_l1、LEVEL_INT_l2、LEVEL_INT_21、LEVEL_INT_22、LEVEL_INT_30）映射到对应的关键人员等级（LEVEL_3、LEVEL_4、LEVEL_5），默认返回LEVEL_1 返回信息: 包含关键人员等级和区域ID的Map，key包括"retVal"（关键人员等级，字符串形式）、"retGegionId"（区域ID） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl#getCustKyePeopGrad |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID，用于查询客户信息并获取关键人员等级 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.192 通过billid查询客户简要信息（708）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 708 |
| 接口名称 | 通过billid查询客户简要信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/simplebill` |
| 功能描述 | 根据账单ID查询客户信息。该方法接收账单ID，设置中心信息，调用团队调用服务根据账单ID获取用户基本信息，返回品牌、用户ID、区域ID和客户ID 返回信息: 包含查询结果的Map，key包括"retVal"（参与人ID，此字段未使用）、"retBrand"（品牌）、"retUserId"（用户ID）、"regionId"（区域ID）、"retCustId"（客户ID） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl#queryCustByBillId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| billId | java.lang.String | QUERY | 是 | 账单ID，用于查询用户基本信息 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.193 根据CustRelId查询集团客户（709）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 709 |
| 接口名称 | 根据CustRelId查询集团客户 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/groupMember/{custRelId}` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryGroupMemberByCustRelId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custRelId | long | PATH | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.194 获取个人客户状态（710）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 710 |
| 接口名称 | 获取个人客户状态 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/invidiv/status` |
| 功能描述 | 获取请求状态和编辑字段。该方法根据客户ID查询客户请求任务，判断客户是否可编辑（如果请求状态为处理中或已处理完成且已生成订购关系则不可编辑）。同时根据参与人角色类型（user或非user）获取对应的不可编辑字段列表（CM、CMX、CM_ADDR或USER专用字段） 返回信息: 包含请求状态和编辑字段信息的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"canEditFlag"（"true"表示可编辑，"false"表示不可编辑）、"unEditWordCM"（CM不可编辑字段列表）、"unEditWordCMX"（CMX不可编辑字段列表）、"unEditWordCMAddr"（CM_ADDR不可编辑字段列表）、"unEditWordForUser"（USER专用不可编辑字段列表） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl#getRequestStatusAndEditWord |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID，用于查询客户请求任务信息 |  |
| partyId | long | QUERY | 是 | 参与人ID，用于判断参与人角色类型（user或非user） |  |

**请求示例**：

```http
GET /api/cm/customer/21210119854822/invidiv/status?custId=21210119854822&partyId=110008194890
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "unEditWordCMX": "PERSON_STATUS,CUR_RESIDENCE_STR_DATE,DIRECT_MARKETING_PROTECTION,PROTECT_EFF_DATE,PROTECT_EXPIRE_DATE,",
    "unEditWordCMAddr": "LEGAL_ADDRESS,",
    "unEditWordCM": "FIRST_NAME,LAST_NAME,GENDER,BIRTHDAY,",
    "unEditWordForUser": "",
    "canEditFlag": "false",
    "retFlag": "Y"
  },
  "metaObject": "",
  "fieldNameConvert": null
}
```
---

### 3.195 获取ID（711）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 711 |
| 接口名称 | 获取ID |
| HTTP方法 | GET |
| API路径 | `/api/cm/common/seq/{className}` |
| 功能描述 | 获取新序列号。该方法根据类名获取对应的新序列号，通过反射获取类对象，然后调用通用服务获取该类的下一个序列号值。 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CommonBFImpl#getNewSequence |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| className | java.lang.String | PATH | 是 | 类名，用于获取该类的序列号，必须是完整的类路径 | com.asiainfo.crm.cm.inner.party.bo.BOCmPartyContactBean |

**请求示例**：

```http
GET /api/cm/common/seq/com.asiainfo.crm.cm.inner.party.bo.BOCmPartyBean
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "retVal": "Y",
    "retMsg": "110008542492"
  },
  "metaObject": "",
  "fieldNameConvert": null
}
```
---

### 3.196 查询集团客户地址（712）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 712 |
| 接口名称 | 查询集团客户地址 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/group/address` |
| 功能描述 | 查询地址信息。该方法接收客户ID，查询客户的合法地址联系媒介，然后调用地址服务获取地址详细信息（邮编、城市、地址描述） 返回信息: 包含地址信息的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息）、"zipCode"（邮编）、"cityName"（城市名称）、"address"（地址描述） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl#queryAddressInfo |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID，用于查询客户的合法地址信息 |  |

**请求示例**：

```http
GET /api/cm/customer/23210819814229/group/address
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "zipCode": "3000",
    "address": "Badevej 2",
    "cityName": "HelsingÃ¸r",
    "retFlag": "Y"
  },
  "metaObject": "",
  "fieldNameConvert": null
}
```
---

### 3.197 查询客户列表(分页)（713）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 713 |
| 接口名称 | 查询客户列表(分页) |
| HTTP方法 | POST |
| API路径 | `/api/cm/customer/xml` |
| 功能描述 | 根据XML条件查询客户。该方法接收查询条件MapList和分页参数，将条件转换为DataContainer，格式化条件（设置CUST_ID默认值、匹配类型），调用业务模型查询客户数据，然后为每个客户补充行业信息、法律地址、客户层级、客户经理信息，处理客户名称隐藏（first_name为"$$$$"时）和集团客户证件代码显示 返回信息: 客户值数组，包含符合查询条件的客户信息列表，每个客户包含行业、地址、层级、经理等补充信息 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl#queryCustomersXml |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| condition | com.asiainfo.crm.cm.vo.MapList | BODY | 是 | 查询条件MapList，包含查询客户的各种条件参数，用于查询客户列表 |  |
| startNum | int | QUERY | 是 | 起始索引，用于分页查询 |  |
| endNum | int | QUERY | 是 | 结束索引，用于分页查询 |  |

**请求示例**：

```http
POST /api/cm/customer/xml
Content-Type: application/json

{
  "condition": {
    "data": [
      {
        "CUST_TYPE": "3",
        "CUST_ID": "23210819814229",
        "CUST_NAME": "LiangJie0526222",
        "TAX_ID": "78461900",
        "CUST_CERT_TYPE": 17,
        "CUST_CERT_CODE": "K23210819814229",
        "MATCH_TYPE": "1",
        "STATE": "U"
      }
    ]
  }
}
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":[{"CUST_ID":23210819814229,"PROTECT_EFF_DATE":"2025-05-26","ORG_ID":1001594,"GROUP_TYPE":2,"CUST_CERT_TYPE":17,"SEGMENT_NAME":"LA","SHORT_NAME":"111","EXT15":"1:0,2:0,3:2,4:1,5:0","PROTECT_EXPIRE_DATE":"2031-05-31","GROUP_SEGMENT_ID":"LA","EXT16":"1:0,2:0,3:0","CUST_SEGMENT":200000000003,"POST_CODE":"2323","CREATE_ORG_ID":21000000,"EXPIRE_DATE":"2099-12-31 23:59:59","CONT_ADDRESS":"5171439","CUST_SERVICE_ID":"","DONE_DATE":"2025-12-04 14:18:01","CUST_TYPE":3,"MANAGER_ID":100000756,"CREATE_DATE":"2025-05-26 11:28:42","IS_REVISABLE":0,"CONT_NAME":"LiangJie0526222","PARTY_ID":110008152299,"REGION_ID":"2106","EFFECTIVE_DATE":"2025-05-26 11:32:13","DEVELOP_TYPE":2,"CREATE_OP_ID":100000032,"DIRECT_MARKETING_PROTECTION":0,"OP_ID":500014451,"CUST_CERT_CODE":"K23210819814229","CUST_ZIPCODE":"2323","STATE":"U","PERFER_LANGUAGE":"1","CONT_ID":110010112795,"LAST_NAME":"","CUST_ADDRESS":"Badevej 2 3000 HelsingÃ¸r","FIRST_NAME":"","PROVINCE_ID":"9
```
---

### 3.198 查询客户列表(总数)（714）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 714 |
| 接口名称 | 查询客户列表(总数) |
| HTTP方法 | POST |
| API路径 | `/api/cm/customer/xml/count` |
| 功能描述 | 根据XML条件查询客户数量。该方法接收查询条件MapList，将条件转换为DataContainer，格式化条件（设置CUST_ID默认值、匹配类型），调用客户服务查询符合条件的客户总数 返回信息: 符合条件的客户总数，int类型 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl#queryCustomerXmlCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| condition | com.asiainfo.crm.cm.vo.MapList | BODY | 是 | 查询条件MapList，包含查询客户的各种条件参数，用于查询客户总数 |  |

**请求示例**：

```http
POST /api/cm/customer/xml/count
Content-Type: application/json

{
  "condition": {
    "data": [
      {
        "NATIONALITY": "00400",
        "CUST_TYPE": "1",
        "STATE": "U",
        "CUST_ID": "21210419971223",
        "CUST_CERT_TYPE": "8",
        "CUST_CERT_CODE": "0104850117",
        "CUST_STATUS": "1",
        "INDIV_CUST_TYPE": "1"
      }
    ]
  }
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 1,
  "metaObject": "SETCustomer001",
  "fieldNameConvert": null
}
```
---

### 3.199 contentId查询（715）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 715 |
| 接口名称 | contentId查询 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/contId` |
| 功能描述 | 显示联系人ID。该方法接收参与人ID，查询参与人的联系人ID 返回信息: 包含查询结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（联系人ID，成功时存在） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl#showContId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | QUERY | 是 | 参与人ID，用于查询联系人的联系人ID |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.200 按pary名查询party信息（716）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 716 |
| 接口名称 | 按pary名查询party信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/party/byname` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmPartySV#queryMaskPartyByName |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyName | java.lang.String | QUERY | 是 |  |  |
| startIndex | int | QUERY | 是 |  |  |
| endIndex | int | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.201 按pary名查询party信息(总数)（717）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 717 |
| 接口名称 | 按pary名查询party信息(总数) |
| HTTP方法 | GET |
| API路径 | `/api/cm/party/byname/count` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmPartySV#queryMaskPartyByNameCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyName | java.lang.String | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.202 删除联系媒介信息（718）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 718 |
| 接口名称 | 删除联系媒介信息 |
| HTTP方法 | DELETE |
| API路径 | `/api/cm/customer/group/contactContMedium` |
| 功能描述 | 删除联系人联系媒介。该方法接收联系关系ID和区域ID，查询联系媒介关系是否存在，如果存在则抛出异常，否则查询联系人信息获取参与人ID，删除联系媒介，如果参与人ID大于0则发送付款人地址到计费系统 返回信息: 包含删除结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retVal"（结果消息，成功时返回国际化资源"CMS0013241"对应的文本，失败时包含错误信息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl#deleteContactContMedium |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| contRelaId | long | QUERY | 是 | 联系关系ID，用于删除联系人联系媒介 |  |
| regionId | long | QUERY | 是 | 区域ID，用于删除联系人联系媒介 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.203 保存联系媒介信息（719）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 719 |
| 接口名称 | 保存联系媒介信息 |
| HTTP方法 | PUT |
| API路径 | `/api/cm/customer/group/contactContMedium` |
| 功能描述 | 保存联系人联系媒介。该方法接收联系人ID、参与人ID和联系媒介MapList，验证联系媒介数据（联系类型不能为空、联系信息不能为空、邮箱格式验证、电话号码格式验证、邮箱重复性验证），检查优先级重复，保存联系媒介关系，如果联系人ID有效则发送付款人地址到计费系统 返回信息: 包含保存结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl#saveContactContMedium |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| contId | java.lang.String | BODY | 是 | 联系人ID，用于保存联系人联系媒介 |  |
| partyId | java.lang.String | BODY | 是 | 参与人ID，用于保存联系人联系媒介 |  |
| contactContMedium | com.asiainfo.crm.cm.vo.MapList | BODY | 是 | 联系媒介MapList，包含联系媒介的信息列表，用于保存联系人联系媒介 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.204 查询联系媒介信息(分页)（720）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 720 |
| 接口名称 | 查询联系媒介信息(分页) |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/group/contactContMedium/cond/page` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryContactContMediumInfoByContIdAndUseTypeForPage |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| contId | long | QUERY | 是 |  |  |
| useType | long | QUERY | 是 |  |  |
| start | int | QUERY | 是 |  |  |
| end | int | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.205 查询联系媒介信息(总数)（721）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 721 |
| 接口名称 | 查询联系媒介信息(总数) |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/group/contactContMedium/cond/count` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryContactContMediumInfoCountByContIdAndUseType |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| contId | long | QUERY | 是 |  |  |
| useType | long | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.206 验联系人是否已经存在（722）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 722 |
| 接口名称 | 验联系人是否已经存在 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/group/contact/validation` |
| 功能描述 | 验证集团联系人。该方法接收参与人ID、客户ID和联系人类型，查询该客户和参与人下是否存在指定类型的集团联系人 返回信息: 包含验证结果的Map，key包括"retFlag"（"Y"表示存在集团联系人，"N"表示不存在） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl#validateGroupContact |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | QUERY | 是 | 参与人ID，用于验证集团联系人 |  |
| custId | long | QUERY | 是 | 客户ID，用于验证集团联系人 |  |
| contType | long | QUERY | 是 | 联系人类型，用于验证指定类型的集团联系人 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.207 保存DK联系信息（723）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 723 |
| 接口名称 | 保存DK联系信息 |
| HTTP方法 | PUT |
| API路径 | `/api/cm/customer/group/contact/dk` |
| 功能描述 | 保存丹麦集团联系人信息。该方法接收联系人ID、集团成员Map、参与人联系Map和联系人Map，将Map转换为DataContainer，提取客户联系人ID、区域ID和优先级，调用集团合同服务保存丹麦集团联系人信息 返回信息: 包含保存结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl#saveDkGroupContactInfo |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| contId | long | BODY | 是 | 联系人ID，用于保存丹麦集团联系人信息 |  |
| groupMember | java.util.Map | BODY | 是 | 集团成员Map，包含集团成员信息，用于保存丹麦集团联系人 |  |
| partyContact | java.util.Map | BODY | 是 | 参与人联系Map，包含参与人联系信息，用于保存丹麦集团联系人 |  |
| contact | java.util.Map | BODY | 是 | 联系人Map，包含联系人信息，用于保存丹麦集团联系人 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.208 客管合同查询页面（724）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 724 |
| 接口名称 | 客管合同查询页面 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/cmpage/agreement` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.agreement.teaminvoke.out.service.interfaces.IAgreementFSV#getAgreementValueByCust |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.209 保存联系信息（725）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 725 |
| 接口名称 | 保存联系信息 |
| HTTP方法 | PUT |
| API路径 | `/api/cm/customer/group/contact` |
| 功能描述 | 保存联系人。该方法接收客户联系人ID、联系人ID、集团成员MapList、参与人MapList和参与人联系MapList，将MapList转换为DataContainerList，根据FLAG标志判断是保存丹麦集团联系人还是普通集团联系人，如果FLAG为"Y"则调用保存丹麦集团联系人方法，否则调用保存普通集团联系人方法 返回信息: 包含保存结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl#saveContact |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custContId | long | BODY | 是 | 客户联系人ID，用于保存联系人 |  |
| contId | long | BODY | 是 | 联系人ID，用于保存联系人 |  |
| groupMember | com.asiainfo.crm.cm.vo.MapList | BODY | 是 | 集团成员MapList，包含集团成员信息列表，用于保存联系人 |  |
| party | com.asiainfo.crm.cm.vo.MapList | BODY | 是 | 参与人MapList，包含参与人信息列表，用于保存联系人 |  |
| partyContact | com.asiainfo.crm.cm.vo.MapList | BODY | 否 | 参与人联系MapList，包含参与人联系信息列表，用于保存联系人 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.210 保存联系媒介关系（726）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 726 |
| 接口名称 | 保存联系媒介关系 |
| HTTP方法 | PUT |
| API路径 | `/api/cm/customer/group/contactContMediumRel` |
| 功能描述 | 保存联系人联系媒介关系。该方法接收客户联系人ID和联系媒介关系MapList，将MapList转换为DataContainer数组，为每个联系媒介关系创建或更新联系媒介关系Bean，检查关系是否已存在（避免重复），保存联系媒介关系 返回信息: 包含保存结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl#saveContactContMediumRel |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custContId | long | BODY | 是 | 客户联系人ID，用于保存联系人联系媒介关系 |  |
| info | com.asiainfo.crm.cm.vo.MapList | BODY | 是 | 联系媒介关系MapList，包含联系媒介关系信息列表，用于保存联系人联系媒介关系 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.211 联系媒介信息查询（727）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 727 |
| 接口名称 | 联系媒介信息查询 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/group/contactContMedium/page` |
| 功能描述 | 联系媒介信息查询。 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryContactContMediumForPage |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custContId | long | QUERY | 是 | 客户联系媒介唯一ID | 1100327312 |
| start | int | QUERY | 是 | 页数 | 1 |
| end | int | QUERY | 是 | 每页条数 | 10 |

**请求示例**：

```http
GET /api/cm/customer/group/contactContMedium/page?custContId=1100327312&pageNum=1&pageSize=99
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":[{"EFFECTIVE_DATE":"2025-08-15 11:23:01","REGION_ID":"2103","CONT_MED_TYPE_NAME":"201","ORG_ID":21000000,"DONE_DATE":"2025-08-15 11:23:01","DONE_CODE":112375964063,"CONT_RELA_ID":1100297828,"CONT_MED_TYPE_ID":201,"OP_ID":100000032,"STATE":"U","PRIORITY":1,"CONT_ID":110010296792,"IS_NO_DISTURBING":0,"CREATE_DATE":"2025-08-15 11:19:45","EMAIL_ADDRESS":"contact@test.dk","ACTION":"<a href='javascript:void(0)' class='cellpath' onclick='deleteContactContMediumRela(\"1100160232\")' style='color:blue;margin-left:5px;text-decoration:underline'>Delete</a>","CUST_CONT_ID":1100327312,"RELA_ID":1100160232,"USE_TYPE":1,"UP_CONT_MED_TYPE_ID":2,"EXPIRE_DATE":"2099-12-31 23:59:59"},{"EFFECTIVE_DATE":"2025-08-15 11:23:01","REGION_ID":"2103","CONT_MED_TYPE_NAME":"301","ORG_ID":21000000,"DONE_DATE":"2025-08-15 11:23:01","DONE_CODE":112375964063,"CONT_RELA_ID":1100298026,"CONT_MED_TYPE_ID":301,"OP_ID":100000032,"STATE":"U","PRIORITY":2,"CONT_ID":1100102
```
---

### 3.212 联系媒介信息查询总数（728）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 728 |
| 接口名称 | 联系媒介信息查询总数 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/group/contactContMedium/count` |
| 功能描述 | 该方法用于查询指定客户联系ID下非地址类型的联系媒介数量。 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryContactContMediumCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custContId | long | QUERY | 是 | 客户联系媒介ID | 1100343312 |

**请求示例**：

```http
GET /api/cm/customer/group/contactContMedium/count?custContId=1100351112
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 0,
  "metaObject": "SETCmContactContMedium001",
  "fieldNameConvert": null
}
```
---

### 3.213 根据联系信息编号查询参与人联系信息（729）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 729 |
| 接口名称 | 根据联系信息编号查询参与人联系信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/party/contact/{contId}` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmPartySV#queryPartyContactById |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| contId | long | PATH | 是 |  |  |

**请求示例**：

```http
GET /api/cm/party/contact/110010025394
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "EFFECTIVE_DATE": "2025-06-06 12:00:31",
    "REGION_ID": "2108",
    "CREATE_OP_ID": 100000032,
    "ORG_ID": 0,
    "DONE_DATE": "2025-12-02 16:50:55",
    "DONE_CODE": 112294182513,
    "OP_ID": 100000032,
    "FIRST_NAME_QRY": "OTHENDAL POSTBORG LILLELUND",
    "STATE": "U",
    "CONT_NAME_QRY": "OTHENDAL POSTBORG LILLELUND                        HESTBECH",
    "CONT_ID": 110010025394,
    "LAST_NAME": "Hestbech                                ",
    "FIRST_NAME": "Othendal Postborg Lillelund                       ",
    "CREATE_DATE": "2025-04-23 10:55:48",
    "CONT_NAME": "Othendal Postborg Lillelund                        Hestbech",
    "CREATE_ORG_ID": 0,
    "EXPIRE_DATE": "2099-12-31 23:59:59",
    "LAST_NAME_QRY": "HESTBECH",
    "PARTY_ID": 110008099293,
    "PRIORY_LEVEL": 1
  },
  "metaObject": "SETCmPartyInfo001",
  "fieldNameConvert": null
}
```
---

### 3.214 根据联系id查询联系信息（730）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 730 |
| 接口名称 | 根据联系id查询联系信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/party/groupContact/{custContId}` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmContactSV#queryCustConBycustContId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custContId | long | PATH | 是 |  |  |

**请求示例**：

```http
GET /api/cm/party/groupContact/1100338913
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "EFFECTIVE_DATE": "2025-10-30 15:30:14",
    "REGION_ID": "2102",
    "CUST_ID": 23210619756422,
    "ORG_ID": 21000000,
    "CONT_TYPE": 5,
    "DONE_DATE": "2025-10-30 15:30:14",
    "DONE_CODE": 112395595287,
    "OP_ID": 100000032,
    "REMARKS": "CPR",
    "CONT_ID": 110010025394,
    "CREATE_DATE": "2025-10-30 15:30:14",
    "CUST_CONT_ID": 1100338913,
    "EXPIRE_DATE": "2099-12-31 23:59:59",
    "PARTY_ID": 110008099293,
    "PRIORY_LEVEL": 1
  },
  "metaObject": "SETCmGroupContact001",
  "fieldNameConvert": null
}
```
---

### 3.215 查询集团联系人信息(分页)（731）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 731 |
| 接口名称 | 查询集团联系人信息(分页) |
| HTTP方法 | POST |
| API路径 | `/api/cm/party/group/partycontact/page` |
| 功能描述 | 查询集团联系人信息。 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmContactSV#queryGroupPartyInfo |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

```http
POST /api/cm/party/group/partycontact/page
Content-Type: application/json

{
  "criteria": {
    "CUST_ID": "23210518446230",
    "PARTY_NAME": ""
  }
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [
    {
      "EFFECTIVE_DATE": "2025-06-11 16:08:03",
      "REGION_ID": "2109",
      "CUST_ID": 23210518446230,
      "CONT_ID": 110007869797,
      "FIRST_NAME": "san",
      "LAST_NAME": "zhang",
      "PARTY_NAME": "san zhang",
      "CONT_NAME": "san zhang",
      "PARTY_ID": 110006764121,
      "PRIORY_LEVEL": 1
    }
  ],
  "metaObject": "SETCmGroupContact001",
  "fieldNameConvert": null
}
```
---

### 3.216 查询集团联系人信息(总数)（732）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 732 |
| 接口名称 | 查询集团联系人信息(总数) |
| HTTP方法 | POST |
| API路径 | `/api/cm/party/group/partycontact/count` |
| 功能描述 | 根据客户ID、账单ID、联系人名称等条件统计集团联系人数量，对于子集团会继承根集团的可继承联系人一并统计。 |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| criteria | java.util.Map | BODY | 是 | 查询条件 | {'CUST_ID': '23210619756422'} |

**请求示例**：

```http
POST /api/cm/party/group/partycontact/count
Content-Type: application/json

{
  "criteria": {
    "CUST_ID": "23210120133026"
  }
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 0,
  "metaObject": "SETCmGroupContact001",
  "fieldNameConvert": null
}
```
---

### 3.217 查询CmStaticData（733）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 733 |
| 接口名称 | 查询CmStaticData |
| HTTP方法 | GET |
| API路径 | `/api/cm/common/cmStaticData` |
| 功能描述 | 根据代码类型和代码值获取代码名称。该方法通过静态数据工具类查询指定代码类型和代码值对应的代码名称，如果查询结果为空则标识为需要返回。 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CommonBFImpl#getCodeNameByCodeTypeAndCodeValue |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| codeType | java.lang.String | QUERY | 是 | 代码类型，用于查询静态数据的代码类型 | 360_QUERY_RULE |
| codeValue | java.lang.String | QUERY | 是 | 代码值，用于查询静态数据的代码值 | customerId |

**请求示例**：

```http
GET /api/cm/common/cmStaticData?codeType=CM_GROUP_CUST_CONT_TYPE_UNDERLINE&custId=23210015873022
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "isReturn": "true",
    "retVal": "Y",
    "retMsg": ""
  },
  "metaObject": "",
  "fieldNameConvert": null
}
```
---

### 3.218 从nets查询银行卡信息(分页)（734）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 734 |
| 接口名称 | 从nets查询银行卡信息(分页) |
| HTTP方法 | GET |
| API路径 | `/api/cm/account/bankCard/page` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmBillingAcctSV#queryBankCard |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | QUERY | 是 |  |  |
| start | int | QUERY | 是 |  |  |
| end | int | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.219 从nets查询银行卡信息(总数)（735）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 735 |
| 接口名称 | 从nets查询银行卡信息(总数) |
| HTTP方法 | GET |
| API路径 | `/api/cm/account/bankCard/count` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmBillingAcctSV#queryBankCardCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.220 查询nets交易信息（736）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 736 |
| 接口名称 | 查询nets交易信息 |
| HTTP方法 | GET |
| API路径 | `/api/cm/account/nets` |
| 功能描述 | 获取交易ID并生成支付URL。该方法接收客户ID和URL，将客户ID追加到URL参数中，调用billing服务获取交易ID，然后根据商户ID和交易ID生成支付页面的完整URL 返回信息: 包含操作结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息或异常信息）和"retUrl"（生成的支付页面URL） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.AccountBFImpl#getTransactionId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 | 客户ID，用于生成支付URL参数 |  |
| url | java.lang.String | QUERY | 是 | 基础URL，用于生成支付URL |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.221 查询paraDetailValue（737）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 737 |
| 接口名称 | 查询paraDetailValue |
| HTTP方法 | GET |
| API路径 | `/api/cm/common/paraDetailValue` |
| 功能描述 | 获取参数详情值。该方法根据区域ID、参数类型和参数代码查询参数详情值，通过BCE工具类获取参数配置信息。 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CommonBFImpl#getParaDetailValue |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| regionId | java.lang.String | QUERY | 是 | 区域ID，用于查询参数配置的区域标识 | X |
| paraType | java.lang.String | QUERY | 是 | 参数类型，用于查询参数配置的参数类型 | CM_BILLING_URL |
| paraCode | java.lang.String | QUERY | 是 | 参数代码，用于查询参数配置的参数代码 | PAYMENT |

**请求示例**：

```http
GET /api/cm/common/paraDetailValue?regionId=X&paraType=CM_BILLING_URL&paraCode=PAYMENT
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "REGION_ID": "X",
    "PARA_TYPE": "CM_BILLING_URL",
    "PARA_NAME": "",
    "PARA1": "http://web.billing.telenor.ai:8181/infosystem/page-ng/cim/cim.jsp#/paymentChannelHistory?businessType=2&businessId=",
    "STATE": "U",
    "PARA_CODE": "PAYMENT"
  },
  "metaObject": "",
  "fieldNameConvert": null
}
```
---

### 3.222 queryAcctUserRel分页（738）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 738 |
| 接口名称 | queryAcctUserRel分页 |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmDkCustomerSV/queryAcctUserRel` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV#queryAcctUserRel |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | BODY | 是 |  |  |
| start | int | QUERY | 是 |  |  |
| end | int | QUERY | 是 |  |  |

**请求示例**：

```http
POST /api/cm/service/ICmDkCustomerSV/queryAcctUserRel
Content-Type: application/json

{
  "partyId": "110007465292"
}
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":[{"STATUS":"1","PARTY_NAME":"Fmo Vmeiling La                                    Ruelle                                  ","REMARKS":"<a href='javascript:void(0)' class='cellpath' onclick='showAcctInfo(\"32100118491751\")' style='color:blue;text-decoration:underline'>32100118491751</a>","IDENTIFIER":32100118491751,"TYPE":"1","CUST_NAME":"Fmo Vmeiling La Ruelle"},{"STATUS":"1","PARTY_NAME":"Fmo Vmeiling La                                    Ruelle                                  ","REMARKS":"<a href='javascript:void(0)' class='cellpath' onclick='showAcctInfo(\"32100118491951\")' style='color:blue;text-decoration:underline'>32100118491951</a>","IDENTIFIER":32100118491951,"TYPE":"1","CUST_NAME":"Fmo Vmeiling La Ruelle"},{"STATUS":"1","PARTY_NAME":"Fmo Vmeiling La                                    Ruelle                                  ","REMARKS":"<a href='javascript:void(0)' class='cellpath' onclick='showAcctInfo(\"32101118317355\")
```
---

### 3.223 queryAcctUserRel总数（739）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 739 |
| 接口名称 | queryAcctUserRel总数 |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmDkCustomerSV/queryAcctUserRelCount` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV#queryAcctUserRelCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | BODY | 是 |  |  |

**请求示例**：

```http
POST /api/cm/service/ICmDkCustomerSV/queryAcctUserRelCount
Content-Type: application/json

{
  "partyId": "110007465292"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 7,
  "metaObject": "SETCmPartyInfoDK001",
  "fieldNameConvert": null
}
```
---

### 3.224 getInsAccrelsByAcct（740）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 740 |
| 接口名称 | getInsAccrelsByAcct |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmDkCustomerSV/getInsAccrelsByAcct` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV#getInsAccrelsByAcct |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | BODY | 是 |  |  |
| payerName | java.lang.String | BODY | 是 |  |  |
| startIdx | int | QUERY | 是 |  |  |
| endIdx | int | QUERY | 是 |  |  |

**请求示例**：

```http
POST /api/cm/service/ICmDkCustomerSV/getInsAccrelsByAcct
Content-Type: application/json

{
  "acctId": 32103119534352,
  "payerName": "Samtank A/S"
}
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":[{"STATUS":"1","PARTY_NAME":"Samtank A/S","IDENTIFIER":"90005531571","USER_NAME":"Samtank A/S","TYPE":"2","CUST_NAME":"Samtank A/S"},{"STATUS":"1","PARTY_NAME":"Samtank A/S","IDENTIFIER":"90005531771","USER_NAME":"Samtank A/S","TYPE":"2","CUST_NAME":"Samtank A/S"},{"STATUS":"1","PARTY_NAME":"Samtank A/S","IDENTIFIER":"75331211","USER_NAME":"Samtank A/S","TYPE":"2","CUST_NAME":"Samtank A/S"},{"STATUS":"1","PARTY_NAME":"Samtank A/S","IDENTIFIER":"90005564571","USER_NAME":"Samtank A/S","TYPE":"2","CUST_NAME":"Samtank A/S"},{"STATUS":"1","PARTY_NAME":"Samtank A/S","IDENTIFIER":"88884788","USER_NAME":"Samtank A/S","TYPE":"2","CUST_NAME":"Samtank A/S"},{"STATUS":"1","PARTY_NAME":"Samtank A/S","IDENTIFIER":"204290000","USER_NAME":"Samtank A/S","TYPE":"2","CUST_NAME":"Samtank A/S"},{"STATUS":"1","PARTY_NAME":"Samtank A/S","IDENTIFIER":"74520935","USER_NAME":"Samtank A/S","TYPE":"2","CUST_NAME":"Samtank A/S"}],"metaObject":"SETCmPartyInfoDK0
```
---

### 3.225 getInsAccrelsCountByAcct总数（741）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 741 |
| 接口名称 | getInsAccrelsCountByAcct总数 |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmDkCustomerSV/getInsAccrelsCountByAcct` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV#getInsAccrelsCountByAcct |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | BODY | 是 |  |  |
| payerName | java.lang.String | BODY | 是 |  |  |

**请求示例**：

```http
POST /api/cm/service/ICmDkCustomerSV/getInsAccrelsCountByAcct
Content-Type: application/json

{
  "acctId": 32103119534352,
  "payerName": "Samtank A/S"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 7,
  "metaObject": "SETCmPartyInfoDK001",
  "fieldNameConvert": null
}
```
---

### 3.226 getStaticDataByCodeType（742）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 742 |
| 接口名称 | getStaticDataByCodeType |
| HTTP方法 | GET |
| API路径 | `/api/cm/common/staticData/codeType/{codeType}` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CommonBFImpl#getStaticDataByCodeType |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| codeType | java.lang.String | PATH | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.227 queryCustomerByCustId（743）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 743 |
| 接口名称 | queryCustomerByCustId |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmCustomerSV/queryCustomerByCustId` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryCustomerByCustId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | BODY | 是 |  |  |
| state | java.lang.String | BODY | 是 |  |  |

**请求示例**：

```http
POST /api/cm/service/ICmCustomerSV/queryCustomerByCustId
Content-Type: application/json

{
  "custId": "21210219123624",
  "state": "U"
}
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":{"CUST_ID":21210219123624,"ORG_ID":10056316,"FIRST_NAME_QRY":"FMO VMEILING LA","CUST_CERT_TYPE":8,"COUNTY_ID":"1001","GROUP_SEGMENT_ID":"New","PNR":22014800,"CUST_SEGMENT":100000000001,"CREATE_ORG_ID":21000000,"EXT18":"qweee","EXPIRE_DATE":"2099-12-31 23:59:59","BIRTHDAY":"1995-04-30 00:00:00","CONT_ADDRESS":"5692522","PHYSIOLOGICAL_STATE":0,"CUST_SERVICE_ID":"","DONE_DATE":"2025-07-29 18:07:50","CUST_LANGUAGE":"1","HOBBY":"3004950045","CONT_NAME_QRY":"FMO VMEILING LA RUELLE","CUST_SERVICE_LEVEL":1,"MANUAL_COMMERCIAL_PROTECTION":0,"CUST_TYPE":1,"CONTACT_PROTECTION":1,"CREATE_DATE":"2023-11-28 18:47:50","IS_REVISABLE":0,"CONT_NAME":"Fmo Vmeiling La Ruelle","PARTY_ID":110007465292,"LAST_NAME_QRY":"RUELLE","NATIONALITY":"00400","REGION_ID":"2107","EFFECTIVE_DATE":"2023-11-28 18:47:50","CREATE_OP_ID":100000032,"REAL_NAME_FLAG":0,"DIRECT_MARKETING_PROTECTION":-1,"OP_ID":500014851,"CUST_CERT_CODE":"3004950045","STATE":"U","CUST_NAME_QRY":
```
---

### 3.228 queryUserNumbers（744）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 744 |
| 接口名称 | queryUserNumbers |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmDkCustomerSV/queryUserNumbers` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV#queryUserNumbers |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | BODY | 是 |  |  |
| start | int | QUERY | 是 |  |  |
| end | int | QUERY | 是 |  |  |

**请求示例**：

```http
POST /api/cm/service/ICmDkCustomerSV/queryUserNumbers
Content-Type: application/json

{
  "custId": "21210219123624"
}
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":[{"EFFECTIVE_DATE":"2023-11-28 19:47:21","CUST_ID":21210219123624,"ORG_ID":21000000,"DONE_DATE":"2025-10-18 00:00:23","DONE_CODE":340007385455,"OP_ID":500100451,"CMREL_ID":11000010794419,"STATE":0,"USER_ID":42102131554152,"OFFER_ID":2000043,"USER_STATE":"5","EFFECTIVE_DATE_TYPE":0,"EXPIRE_DATE_TYPE":0,"EXT1":"5","EXT2":"0000000000000000000000000000100000000000000000000000000000000000","CREATE_DATE":"2023-11-28 19:47:21","EXT3":"2025-09-18 10:29:04","RELA_TYPE":1,"BILL_ID":"65345652","USER_TYPE":1,"EXPIRE_DATE":"2025-10-18 00:00:23","PROD_CATALOG_ID":171000000001,"USER_REGION_CODE":"2102"},{"EFFECTIVE_DATE":"2024-01-08 16:10:17","CUST_ID":21210219123624,"ORG_ID":21000000,"DONE_DATE":"2025-10-18 09:55:04","DONE_CODE":410008264800,"OP_ID":100000032,"CMREL_ID":11000010991609,"STATE":0,"USER_ID":42107111391471,"OFFER_ID":90127843,"USER_STATE":"6","EFFECTIVE_DATE_TYPE":0,"EXPIRE_DATE_TYPE":0,"EXT1":"5","EXT2":"0000000000000000000000000000
```
---

### 3.229 queryUserNumbersCount（745）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 745 |
| 接口名称 | queryUserNumbersCount |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmDkCustomerSV/queryUserNumbersCount` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV#queryUserNumbersCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | BODY | 是 |  |  |

**请求示例**：

```http
POST /api/cm/service/ICmDkCustomerSV/queryUserNumbersCount
Content-Type: application/json

{
  "custId": "21210219123624"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 12,
  "metaObject": "SETCmInsCmrel001",
  "fieldNameConvert": null
}
```
---

### 3.230 queryEmployeeView（746）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 746 |
| 接口名称 | queryEmployeeView |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmDkCustomerSV/queryEmployeeView` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV#queryEmployeeView |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | BODY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.231 queryPersonViewAndLog（747）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 747 |
| 接口名称 | queryPersonViewAndLog |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmDkCustomerSV/queryPersonViewAndLog` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV#queryPersonViewAndLog |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | BODY | 是 |  |  |
| custId | long | BODY | 是 |  |  |
| onlyPayer | boolean | BODY | 是 |  |  |

**请求示例**：

```http
POST /api/cm/service/ICmDkCustomerSV/queryPersonViewAndLog
Content-Type: application/json

{
  "custId": "21210219123624",
  "partyId": "110007465292",
  "onlyPayer": false
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "CREATE_DATE": "2023-11-28 18:47:50",
    "PNR": "22014800",
    "ANONYMOUS_FLAG": 0,
    "GENDER": 1,
    "PERFER_LANGUAGE": 1,
    "CUST_STATUS": 1,
    "BIRTHDAY": "1995-04-30 00:00:00",
    "PHYSIOLOGICAL_STATE": 0
  },
  "metaObject": "SETCustomer001",
  "fieldNameConvert": null
}
```
---

### 3.232 queryByCustIdForShow（748）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 748 |
| 接口名称 | queryByCustIdForShow |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmCustRequestTaskSV/queryByCustIdForShow` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmCustRequestTaskSV#queryByCustIdForShow |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | BODY | 是 |  |  |

**请求示例**：

```http
POST /api/cm/service/ICmCustRequestTaskSV/queryByCustIdForShow
Content-Type: application/json

{
  "custId": "22014800"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "REGION_ID": "2107",
    "EFFECTIVE_DATE": "2023-11-28 18:47:50",
    "RESULTS": "",
    "CREATE_OP_ID": 100000032,
    "CUST_ID": 22014800,
    "DONE_DATE": "2026-01-09 09:35:01",
    "ORG_ID": 21000000,
    "DONE_CODE": 111662745711,
    "OP_ID": 10131716,
    "STATE": "U",
    "PRIORITY": 5,
    "STATUS_DATE": "2026-01-09",
    "REQUEST_STATUS": "1",
    "CREATE_DATE": "2023-11-28 18:47:50",
    "REQUEST_TYPE": 4,
    "CREATE_ORG_ID": 21000000,
    "EXPIRE_DATE": "2099-12-31 23:59:59",
    "TASK_ID": 110001625914
  },
  "metaObject": "SETCmCustRequestTask001",
  "fieldNameConvert": null
}
```
---

### 3.233 validateCustAddress（749）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 749 |
| 接口名称 | validateCustAddress |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/CmIndivCustomerAction/validateCustAddress` |
| 功能描述 | 校验客户地址。该方法接收客户ID和地址类型，查询客户联系媒介，如果地址类型为合法地址且存在地址信息，则返回成功标志 返回信息: 包含校验结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，失败时包含异常信息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#validateCustAddress |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | java.lang.String | BODY | 是 | 客户ID，用于校验客户地址 |  |
| addressType | java.lang.String | BODY | 是 | 地址类型，用于指定要校验的地址类型 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.234 validateCustAndAddress（750）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 750 |
| 接口名称 | validateCustAndAddress |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/CmIndivCustomerAction/validateCustAndAddress` |
| 功能描述 | 校验客户和地址。该方法接收客户名称、初始客户ID和生日，查询客户的合法地址联系媒介，然后根据客户名称、生日和地址ID或地址详情查询客户信息，如果查询到的客户ID与初始客户ID不一致，则校验失败 返回信息: 包含校验结果的Map，key包括"retFlag"（"Y"表示校验通过，"N"表示校验不通过，即存在其他客户匹配） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#validateCustAndAddress |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custName | java.lang.String | BODY | 是 | 客户名称，用于校验客户和地址 |  |
| initCustId | java.lang.String | BODY | 是 | 初始客户ID，用于校验客户和地址 |  |
| birthday | java.lang.String | BODY | 是 | 生日，用于校验客户和地址 |  |

**请求示例**：

```http
POST /api/cm/service/CmIndivCustomerAction/validateCustAndAddress
Content-Type: application/json

{
  "custName": "",
  "initCustId": 21210620204423,
  "birthday": "1900-01-01"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "retFlag": "Y"
  },
  "metaObject": "",
  "fieldNameConvert": null
}
```
---

### 3.235 queryCustAcctRel（759）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 759 |
| 接口名称 | queryCustAcctRel |
| HTTP方法 | POST |
| API路径 | `/api/cm/customer/{relCustd}/account/cmCustAcctRel` |
| 功能描述 | 查询客户账户关系信息。该方法接收多个查询条件参数（关联客户ID、账户ID、账户名称、分期标志、支付方式、周期类型、客户状态、账户服务ID、服务号码、PBS、EAN等）和分页参数，查询符合条件的客户账户关系列表，并更新账户的到期信息 返回信息: 包含查询结果的Map，key包括"values"（客户账户关系列表，每个元素为属性Map）和"total"（总记录数） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.AccountBFImpl#queryCustAcctRel |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| relCustd | long | PATH | 是 | 关联客户ID，用于查询客户账户关系 |  |
| acctId | long | BODY | 否 | 账户ID，用于过滤查询结果 |  |
| acctName | java.lang.String | BODY | 否 | 账户名称，用于过滤查询结果 |  |
| installmentFalg | int | BODY | 否 | 分期标志，用于过滤查询结果 |  |
| paymethod | int | BODY | 否 | 支付方式，用于过滤查询结果 |  |
| cycleType | int | BODY | 否 | 周期类型，用于过滤查询结果 |  |
| custStatus | java.lang.String | BODY | 否 | 客户状态，用于过滤查询结果 |  |
| acctServiceId | java.lang.String | BODY | 否 | 账户服务ID，用于过滤查询结果 |  |
| serviceNumber | java.lang.String | BODY | 否 | 服务号码，用于过滤查询结果 |  |
| pbs | java.lang.String | BODY | 否 | PBS参数，用于过滤查询结果 |  |
| ean | java.lang.String | BODY | 是 | EAN参数，用于过滤查询结果 |  |
| startIndex | int | QUERY | 是 | 分页起始索引 |  |
| endIndex | int | QUERY | 是 | 分页结束索引 |  |

**请求示例**：

```http
POST /api/cm/customer/21210219123624/account/cmCustAcctRel
Content-Type: application/json

{
  "relCustd": "21210219123624",
  "acctId": -1,
  "cycleType": -1,
  "installmentFalg": -1,
  "paymethod": ""
}
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":{"total":9,"values":[{"EFFECTIVE_DATE":"2024-02-28 11:21:55","REGION_ID":"2100","REL_TYPE":1,"ORG_ID":21000000,"DONE_DATE":"2026-01-08 09:19:38","DONE_CODE":112417627859,"OP_ID":10426516,"ACCT_ID":32100118491751,"STATE":"U","CUST_TYPE":1,"EXT1":"1","CREATE_DATE":"2024-02-28 11:21:55","BILL_DUE_DATE":-1,"INSTALLMENT_FLAG":0,"ACTION":"<a href='javascript:void(0)' class='cellpath' onclick='modifyAccount(\"32100118491751\")' style='color:blue;margin-left:5px;text-decoration:underline'>Edit</a><a href='javascript:void(0)' class='cellpath' onclick='showAccount(\"32100118491751\",\"2100\")' style='color:blue;margin-left:5px;text-decoration:underline'>Operation</a>","EXT5":"Fmo Vmeiling La                                    Ruelle                                  ","REL_CUST_ID":21210219123624,"BILL_DAY":16,"PAY_METHOD":2,"EXPIRE_DATE":"2099-12-31 23:59:59","CYCLE_TYPE":5},{"EFFECTIVE_DATE":"2024-02-28 11:24:26","REGION_ID":"2100","REL_TYPE
```
---

### 3.236 queryCustAcctRelCountFor360（760）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 760 |
| 接口名称 | queryCustAcctRelCountFor360 |
| HTTP方法 | POST |
| API路径 | `/api/cm/360view/ICmAccountSV/queryCustAcctRelCountFor360` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmAccountSV#queryCustAcctRelCountFor360 |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| relCustd | long | BODY | 是 |  |  |
| acctId | long | BODY | 是 |  |  |
| acctName | java.lang.String | BODY | 是 |  |  |
| installmentFalg | int | BODY | 是 |  |  |
| paymethod | int | BODY | 是 |  |  |
| cycleType | int | BODY | 是 |  |  |
| custStatus | java.lang.String | BODY | 是 |  |  |
| acctServiceId | java.lang.String | BODY | 是 |  |  |
| serviceNumber | java.lang.String | BODY | 是 |  |  |
| pbs | java.lang.String | BODY | 是 |  |  |
| ean | java.lang.String | BODY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.237 getAcctIdByInvoiceNumber（761）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 761 |
| 接口名称 | getAcctIdByInvoiceNumber |
| HTTP方法 | POST |
| API路径 | `/api/cm/360view/RbossSoAction/getAcctIdByInvoiceNumber` |
| 功能描述 | 根据发票号码获取账户ID。该方法接收发票号码，调用订单查询服务根据发票号码查询银行账户ID。如果查询到账户ID则返回成功标志和账户ID，否则返回失败标志和账户ID为"0" 返回信息: 包含查询结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息或异常信息）和"acctId"（账户ID，字符串类型，查询不到时为"0"） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.RbossSoBFImpl#getAcctIdByInvoiceNumber |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| invoice | java.lang.String | BODY | 是 | 发票号码，用于查询该发票对应的账户ID |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.238 queryBanksByConditions（762）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 762 |
| 接口名称 | queryBanksByConditions |
| HTTP方法 | POST |
| API路径 | `/api/cm/360view/IOtherBaseSV/queryBanksByConditions` |
| 功能描述 |  |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| bankCodeType | java.lang.String | BODY | 是 |  |  |
| bankName | java.lang.String | BODY | 是 |  |  |
| startIndex | int | QUERY | 是 |  |  |
| endIndex | int | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.239 refreshSecOrgStaffOper（791）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 791 |
| 接口名称 | refreshSecOrgStaffOper |
| HTTP方法 | POST |
| API路径 | `/api/cm/360view/SecOperatorBF/refresh` |
| 功能描述 | 刷新安全组织员工操作员列表。该方法接收组织ID、姓名、代码、账单ID和分页参数，如果所有查询条件都为空则返回null。如果组织ID为空，则根据账单ID、代码和姓名查询员工信息；如果组织ID不为空，则查询该组织下的所有员工信息。查询结果使用PageUtil进行分页处理 返回信息: 包含分页数据的SummaryVO对象，包含操作员列表和总数信息，如果所有查询条件都为空则返回null |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.SecOperatorBFImpl#refreshSecOrgStaffOper |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| organizeId | java.lang.String | BODY | 是 | 组织ID，用于查询该组织下的操作员，如果为空则根据其他条件查询 |  |
| name | java.lang.String | BODY | 是 | 姓名，用于过滤查询结果 |  |
| code | java.lang.String | BODY | 是 | 代码，用于过滤查询结果 |  |
| billId | java.lang.String | BODY | 是 | 账单ID，用于过滤查询结果 |  |
| startIndex | int | QUERY | 是 | 分页起始索引，前端开始为1，0及负值代表最小 |  |
| endIndex | int | QUERY | 是 | 分页结束索引，最大为length，0及负值代表最大 |  |

**请求示例**：

```http
POST /api/cm/360view/SecOperatorBF/refresh
Content-Type: application/json

{
  "code": "dailm"
}
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":{"data":[{"ORGANIZE_NAME":"Denmarkï¼TNï¼","PARENT_ORGANIZE_ID":21,"DISTRICT_ID":"1000000","STAFF_ID":10205516,"COUNTY_ID":1000000,"EMAIL":"dd@test.dk","ALLOW_CHANGE_PASSWORD":"Y","NOTES":"","CODE":"21DAILM2","OPERATOR_ID":10203916,"ORG_CODE":"CC21000000","OPSTATE":1,"ORG_ROLE_TYPE_ID":1,"ORGANIZE_ID":21000000,"STAFF_NAME":"dailm2"},{"ORGANIZE_NAME":"Denmarkï¼TNï¼","PARENT_ORGANIZE_ID":21,"DISTRICT_ID":"1000000","STAFF_ID":10205517,"COUNTY_ID":1000000,"EMAIL":"dd@test.dk","ALLOW_CHANGE_PASSWORD":"Y","NOTES":"testyyyy123123","CODE":"21DAILM3","OPERATOR_ID":10203917,"ORG_CODE":"CC21000000","OPSTATE":1,"ORG_ROLE_TYPE_ID":1,"ORGANIZE_ID":21000000,"STAFF_NAME":"dailm3"},{"ORGANIZE_NAME":"Denmarkï¼TNï¼","PARENT_ORGANIZE_ID":21,"DISTRICT_ID":"1000000","STAFF_ID":10205518,"COUNTY_ID":1000000,"EMAIL":"dd@test.dk","ALLOW_CHANGE_PASSWORD":"Y","NOTES":"","CODE":"21DAILM4","OPERATOR_ID":10203918,"ORG_CODE":"CC21000000","OPSTATE":1,"ORG_ROLE_TYPE_ID":1,
```
---

### 3.240 getStaticDataByParent（796）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 796 |
| 接口名称 | getStaticDataByParent |
| HTTP方法 | GET |
| API路径 | `/api/cm/360view/CommonBF/getStaticDataByParent` |
| 功能描述 | 根据父代码值获取静态数据。该方法通过静态数据工具类查询指定代码类型和父代码值下的所有静态数据，支持是否包含选择项的配置 返回信息: 静态数据值数组，包含所有符合条件的静态数据记录 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CommonBFImpl#getStaticDataByParent |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| isChoose | boolean | QUERY | 是 | 是否包含选择项，用于控制返回的静态数据是否包含选择项 |  |
| codeType | java.lang.String | QUERY | 是 | 代码类型，用于查询静态数据的代码类型 |  |
| parentCodeValue | java.lang.String | QUERY | 是 | 父代码值，用于查询该父代码值下的所有子静态数据 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.241 校验cpr（800）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 800 |
| 接口名称 | 校验cpr |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/validateCPRNum` |
| 功能描述 | 校验cpr |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#validateCPRNum |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| needCheck | String | QUERY | 否 | 是否需要检查标志，如果为YES则会对已存在的客户进行姓名和生日的匹配校验 |  |
| custId | String | QUERY | 否 | 客户ID，用于标识要验证CPR的客户，如果needCheck为YES且客户存在，则进行姓名生日匹配校验 |  |
| cprNum | String | QUERY | 是 | CPR号码，即个人身份证号码，用于验证该号码是否在CRM系统或CPR系统中存在，并从CPR系统获取客户详细信息 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.242 获取证件号码（801）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 801 |
| 接口名称 | 获取证件号码 |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/getCertCode` |
| 功能描述 | 获取证件号码 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#queryCustCertCodeByCustid |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 | 获取证件号码 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.243 保存B2C客户（802）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 802 |
| 接口名称 | 保存B2C客户 |
| HTTP方法 | POST |
| API路径 | `/api/cm/customer/saveIndivCustomer` |
| 功能描述 | 保存个人客户。该方法接收客户信息Map和操作类型（add/mod/del），将客户基本信息和附加信息转换为DataContainer，如果是修改操作则标记旧数据并设置变更映射。方法会处理客户姓名（如果为空则设置默认值）、客户类型（USER或客户）、VIP客户匿名标志、客户细分关系等，然后调用客户服务保存客户信息，并保存业务日志 返回信息: 包含保存结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，成功时返回国际化资源对应的文本，失败时返回异常信息）、"custId"（客户ID）、"partyId"（参与人ID）、"custType"（客户类型） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl#saveIndivCustomer |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

```http
POST /api/cm/customer/saveIndivCustomer
Content-Type: application/json

{
  "action": "add",
  "custInfo": {
    "newData": {
      "baseInfo": {
        "PERFER_LANGUAGE": 3,
        "CUST_CERT_TYPE": 8,
        "GENDER": 1,
        "CUST_STATUS": 0,
        "REAL_NAME_FLAG": 0,
        "CUST_SERVICE_LEVEL": 1,
        "CUST_TYPE": 1,
        "ANONYMOUS_FLAG": 1,
        "PHYSIOLOGICAL_STATE": 0,
        "CUST_SEGMENT": 100000000001,
        "NATIONALITY": "00400",
        "CUST_LANGUAGE": "1",
        "FIRST_NAME": "autob2c first20260302084149",
        "LAST_NAME": "autob2c last",
        "BIRTHDAY": "1900-01-01",
        "CUST_PASSWORD": "1234567",
        "OCCUPATION": 10,
        "JOB_COMPANY": "telenor",
        "REMARKS": "autob2c remarks",
        "CUST_ID": 21210620204423,
        "IS_VIP": 1
      },
      "addInfo": {
        "CONTACT_PROTECTION": 0,
        "EXT4": "0",
        "EXT6": "0",
        "EXT7": "0",
        "EXT8": "0",
        "EXT9": "0",
        "ATTORNEYS": "75927260",
        "EXT1": "75927260",
        "EXT2": "75927260",
        "EXT3": "75927260",
        "EXT5": "75927260"
      }
    }
  }
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "custId": "21210620204423",
    "custType": "1",
    "partyId": "110008542491",
    "retVal": "Y",
    "retMsg": "Individual customer is created successfully, ID is [21210620204423]."
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.244 校验修改的cpr（803）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 803 |
| 接口名称 | 校验修改的cpr |
| HTTP方法 | POST |
| API路径 | `/api/cm/customer/validateModifyCPR` |
| 功能描述 | 验证修改CPR（个人身份证号码）。该方法接收客户证件代码、客户ID、输入的姓名、生日和保存场景等参数，调用个人客户服务的dealModifyCPR方法处理修改CPR的逻辑，标识需要送CPR（参数为YES）。如果处理返回的DataContainer不为空，则提取并返回姓名、生日、保护状态和匹配标志等信息 返回信息: 包含验证结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"firstName"（名字）、"lastName"（姓氏）、"birth"（生日）、"protected"（保护状态）、"matchFlag"（匹配标志）和"retMsg"（异常信息，仅在失败时存在） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#validateModifyCPR |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custCertCode | String | BODY | 是 | 客户证件代码，即CPR号码，用于验证和修改个人身份证信息 |  |
| custId | String | BODY | 是 | 客户ID，用于标识要修改CPR的客户 |  |
| inputFirstName | String | BODY | 否 | 输入的姓，用于验证和更新客户姓名 |  |
| inputLastName | String | BODY | 否 | 输入的名，用于验证和更新客户姓名 |  |
| inputBirthday | String | BODY | 否 | 输入的生日，用于验证和更新客户生日信息 |  |
| saveScene | String | BODY | 否 | 保存场景，用于标识保存操作的场景类型 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.245 删除联系人（804）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 804 |
| 接口名称 | 删除联系人 |
| HTTP方法 | POST |
| API路径 | `/api/cm/customer/saveGroupContact` |
| 功能描述 | 删除联系人 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#saveGroupContact |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.246 删除联系媒介（805）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 805 |
| 接口名称 | 删除联系媒介 |
| HTTP方法 | DELETE |
| API路径 | `/api/cm/customer/deleteContactContMediumRela` |
| 功能描述 | 删除联系媒介 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#deleteContactContMediumRela |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| relaId | long | QUERY | 是 | 联系地址和客户的关系id |  |
| regionId | long | QUERY | 是 | 区域编号 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.247 party信息查询（806）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 806 |
| 接口名称 | party信息查询 |
| HTTP方法 | GET |
| API路径 | `/api/cm/service/ICmDkCustomerSV/queryPartyView` |
| 功能描述 | 根据参与人ID查询参与人视图信息（包括基本信息、客户ID、法律地址等），并根据角色类型和操作类型决定是否生成客户ID的超链接，同时对证件号码进行脱敏处理。 |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV#queryPartyView |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | QUERY | 是 | 实体唯一标识，既可代表组织（B2B场景），也可代表个人（B2C场景），用于建立实体级关联关系 | 110008313090 |
| partyType | int | QUERY | 否 | 实体类型 | 1 |
| operType | String | QUERY | 否 | 操作类型 |  |

**请求示例**：

```http
GET /api/cm/service/ICmDkCustomerSV/queryPartyView?partyId=110007465292&partyType=1
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":{"EFFECTIVE_DATE":"2023-11-28 19:47:21","NATIONALITY":"00400","REGION_ID":"2104","CREATE_OP_ID":100000032,"CUST_ID":"<a href='javascript:void(0)' class='cellpath' onclick='show360View(\"21210219123624\",\"1\",\"Fmo Vmeiling La Ruelle\")' style='color:blue;text-decoration:underline'>21210219123624</a>","ORG_ID":21000000,"OP_ID":100000032,"FIRST_NAME_QRY":"FMO VMEILING LA                                   ","STATE":"U","REMARKS":"CPR","PERFER_LANGUAGE":1,"COUNTY_ID":"1001","LAST_NAME":"Ruelle                                  ","FIRST_NAME":"Fmo Vmeiling La                                   ","PARTY_TYPE":1,"PARTY_NAME":"Fmo Vmeiling La                                    Ruelle                                  ","PROVINCE_ID":"9999","PARTY_NAME_QRY":"FMO VMEILING LA                                    RUELLE                                  ","CREATE_ORG_ID":21000000,"EXPIRE_DATE":"2099-12-31 23:59:59","CERT_CODE":"300495****","DONE_DAT
```
---

### 3.248 party b2b信息查询（807）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 807 |
| 接口名称 | party b2b信息查询 |
| HTTP方法 | GET |
| API路径 | `/api/cm/service/ICmDkCustomerSV/queryOrgViewAndLog` |
| 功能描述 | party b2b信息查询 |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV#queryOrgViewAndLog |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 | custId |  |

**请求示例**：

```http
GET /api/cm/service/ICmDkCustomerSV/queryOrgViewAndLog?custId=23210820133024
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "DEVELOP_TYPE": 1,
    "CREATE_DATE": "2025-12-15 18:44:38",
    "MANUAL_CREATED_FLAG": 1,
    "CUST_CERT_CODE": "K23210820133024",
    "PERFER_LANGUAGE": 1,
    "CREDIT_LEVEL": "3",
    "CREDIT_VALUE": 1,
    "COMPANY_STATUS": 1,
    "CUST_STATUS": 1,
    "LEGAL_FORM": "AND"
  },
  "metaObject": "SETCustomer001",
  "fieldNameConvert": null
}
```
---

### 3.249 party 角色查询（808）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 808 |
| 接口名称 | party 角色查询 |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmPartyRoleSV/queryPartyRoles` |
| 功能描述 | party 角色查询 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmPartyRoleSV#queryPartyRoles |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | BODY | 是 | partyId |  |
| partyType | int | BODY | 否 | partyType |  |
| pageNum | int | BODY | 是 | pageNum |  |
| pageSize | int | BODY | 是 | pageSize |  |

**请求示例**：

```http
POST /api/cm/service/ICmPartyRoleSV/queryPartyRoles
Content-Type: application/json

{
  "partyId": "110007465292",
  "partyType": "1",
  "pageNum": -1,
  "pageSize": -1
}
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":[{"EFFECTIVE_DATE":"2023-11-28 18:49:31","REGION_ID":"2106","CREATE_OP_ID":500100451,"ROLE_TYPE":5,"DONE_DATE":"2025-09-11 09:43:56","ORG_ID":21000000,"DONE_CODE":111662750914,"ENTITY_ID":110007465292,"OP_ID":500100451,"ROLE_STATUS":1,"STATE":"U","CREATE_DATE":"2023-11-28 18:49:31","PARTY_ROLE_ID":110000014184182,"CREATE_ORG_ID":21000000,"EXPIRE_DATE":"2099-12-31 23:59:59","PARTY_ID":110007465292},{"EFFECTIVE_DATE":"2023-11-28 18:47:50","REGION_ID":"2107","CREATE_OP_ID":100000032,"ROLE_TYPE":1,"DONE_DATE":"2023-11-28 18:47:50","ORG_ID":21000000,"DONE_CODE":111662745711,"ENTITY_ID":21210219123624,"OP_ID":100000032,"ROLE_STATUS":1,"STATE":"U","CREATE_DATE":"2023-11-28 18:47:50","PARTY_ROLE_ID":110000014184781,"CREATE_ORG_ID":21000000,"EXPIRE_DATE":"2099-12-31 23:59:59","PARTY_ID":110007465292},{"EFFECTIVE_DATE":"2023-11-28 19:47:21","REGION_ID":"2102","ROLE_TYPE":2,"DONE_DATE":"2023-11-28 19:47:21","ORG_ID":21000000,"DONE_CODE":340007
```
---

### 3.250 checkHasOtherRolesWithoutPayer（809）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 809 |
| 接口名称 | checkHasOtherRolesWithoutPayer |
| HTTP方法 | GET |
| API路径 | `/api/cm/service/CmLnAccountAction/checkHasOtherRolesWithoutPayer` |
| 功能描述 | 检查是否有除付款人外的其他角色。该方法接收参与人ID，查询该参与人的所有角色，判断角色类型组合：如果只有付款人角色（5）或只有用户角色（2），或只有用户和付款人两种角色，则允许编辑；如果有客户角色（1）或其他角色组合，则不允许编辑 返回信息: 包含检查结果的Map，key包括"hasFlag"（"Y"表示不允许编辑，"N"表示允许编辑）、"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息）、"roleScene"（角色场景，"5"表示纯付款人，"2"表示纯用户或用户+付款人） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.PartyBFImpl#checkHasOtherRolesWithoutPayer |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | QUERY | 是 | 参与人ID，用于检查该参与人是否有除付款人外的其他角色 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.251 queryCmxIndivCustValueAndLog（810）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 810 |
| 接口名称 | queryCmxIndivCustValueAndLog |
| HTTP方法 | GET |
| API路径 | `/api/cm/service/ICmCustomerSV/queryCmxIndivCustValueAndLog` |
| 功能描述 | queryCmxIndivCustValueAndLog |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryCmxIndivCustValueAndLog |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 | custId |  |

**请求示例**：

```http
GET /api/cm/service/ICmCustomerSV/queryCmxIndivCustValueAndLog?custId=21210520133022
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "EFFECTIVE_DATE": "2025-12-16 10:21:33",
    "REGION_ID": "2102",
    "UPDATE_FLAG": 1,
    "CUST_ID": 21210520133022,
    "ORG_ID": 21000000,
    "DIRECT_MARKETING_PROTECTION": -1,
    "OP_ID": 10131916,
    "STATE": "U",
    "AKS_STATUS": "3",
    "PNR": 22178800,
    "EXPIRE_DATE": "2099-12-31 23:59:59",
    "DONE_DATE": "2026-01-06 17:01:28",
    "DONE_CODE": 112417359258,
    "MANUAL_PROTECT_EXPIRE_DATE": "2099-12-31",
    "MANUAL_COMMERCIAL_PROTECTION": -1,
    "CONTACT_PROTECTION": 0,
    "CREATE_DATE": "2025-12-15 18:44:05",
    "EXT27": "2025-12-16",
    "EXT4": "0",
    "EXT6": "0",
    "EXT7": "0",
    "EXT8": "0",
    "EXT9": "0",
    "MANUAL_PROTECT_EFFECTIVE_DATE": "2025-12-16"
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.252 queryCustContacts（811）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 811 |
| 接口名称 | queryCustContacts |
| HTTP方法 | GET |
| API路径 | `/api/cm/service/CmIndivAction/queryCustContacts` |
| 功能描述 | 查询客户联系人。该方法根据客户ID查询客户联系人信息，如果联系人存在且未过期，则返回监护人姓名和更新日期 返回信息: 包含查询结果的Map，key包括"retFlag"（"Y"表示查询成功且有有效联系人，"N"表示查询失败或无有效联系人）、"LEGAL_GUARDIAN"（监护人姓名，仅当有有效联系人时存在）、"GUARDIAN_UPDATE_DATE"（监护人更新日期，仅当有有效联系人时存在） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl#queryCustContacts |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 | 客户ID，用于查询该客户的联系人信息 | 23210020054636 |

**请求示例**：

```http
GET /api/cm/service/CmIndivAction/queryCustContacts?custId=21210419971223
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "retFlag": "N"
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.253 deleteIndivCustomer（812）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 812 |
| 接口名称 | deleteIndivCustomer |
| HTTP方法 | DELETE |
| API路径 | `/api/cm/service/CmIndivAction/deleteIndivCustomer` |
| 功能描述 | 删除个人客户。该方法根据客户ID删除客户信息，如果客户在群组中则执行出群、解散群或转让群操作 返回信息: 包含删除结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，失败时包含异常信息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl#deleteIndivCustomer |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 | 客户ID，用于删除客户信息 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.254 queryByCustId（814）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 814 |
| 接口名称 | queryByCustId |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/queryByCustId` |
| 功能描述 | queryByCustId |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmCustRequestTaskSV#queryByCustId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 | custId |  |

**请求示例**：

```http
GET /api/cm/customer/queryByCustId?custId=21210520133022
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [
    {
      "REGION_ID": "2100",
      "EFFECTIVE_DATE": "2025-12-16 10:27:09",
      "RESULTS": "",
      "CREATE_OP_ID": 10131916,
      "CUST_ID": 22178800,
      "DONE_DATE": "2026-01-09 16:05:02",
      "ORG_ID": 21000000,
      "DONE_CODE": 340008663452,
      "OP_ID": 10131916,
      "STATE": "U",
      "PRIORITY": 5,
      "STATUS_DATE": "2026-01-09",
      "REQUEST_STATUS": "P",
      "CREATE_DATE": "2025-12-16 10:27:09",
      "REQUEST_TYPE": 4,
      "CREATE_ORG_ID": 21000000,
      "EXPIRE_DATE": "2099-12-31 23:59:59",
      "TASK_ID": 110001668114
    }
  ],
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.255 queryPOAList（815）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 815 |
| 接口名称 | queryPOAList |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/queryPOAList` |
| 功能描述 | queryPOAList |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryPOAList |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | String | QUERY | 是 | custId |  |
| pageNum | int | QUERY | 是 |  |  |
| pageSize | int | QUERY | 是 |  |  |

**请求示例**：

```http
GET /api/cm/customer/queryPOAList?pageNum=1&pageSize=10&custId=21210419971223
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [],
  "metaObject": "SETPOA001",
  "fieldNameConvert": null
}
```
---

### 3.256 queryPOAListCount（816）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 816 |
| 接口名称 | queryPOAListCount |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/countPOAList` |
| 功能描述 | queryPOAListCount |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV#queryPOAListCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | String | QUERY | 是 | custId |  |

**请求示例**：

```http
GET /api/cm/customer/countPOAList?custId=21210419971223
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 0,
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.257 queryPayerByPartyId（817）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 817 |
| 接口名称 | queryPayerByPartyId |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/queryPayerByPartyId` |
| 功能描述 | queryPayerByPartyId |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmPartySV#queryPayerByPartyId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | QUERY | 是 | partyId |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.258 queryDuplicateCustCount（818）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 818 |
| 接口名称 | queryDuplicateCustCount |
| HTTP方法 | GET |
| API路径 | `/api/cm/service/ICmIndivCustomerSV/queryDuplicateCustCount` |
| 功能描述 | queryDuplicateCustCount |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmIndivCustomerSV#queryDuplicateCustCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| cprIds | String | QUERY | 是 | cprIds |  |

**请求示例**：

```http
GET /api/cm/service/ICmIndivCustomerSV/queryDuplicateCustCount?cprIds=
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 0,
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.259 queryDuplicateCust（819）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 819 |
| 接口名称 | queryDuplicateCust |
| HTTP方法 | GET |
| API路径 | `/api/cm/service/ICmIndivCustomerSV/queryDuplicateCust` |
| 功能描述 | queryDuplicateCust |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmIndivCustomerSV#queryDuplicateCust |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| cprIds | String | QUERY | 是 | cprIds |  |
| pageNum | int | QUERY | 是 |  |  |
| pageSize | int | QUERY | 是 |  |  |

**请求示例**：

```http
GET /api/cm/service/ICmIndivCustomerSV/queryDuplicateCust?pageNum=1&pageSize=10&cprIds=
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [],
  "metaObject": "SETCustomer001",
  "fieldNameConvert": null
}
```
---

### 3.260 queryDuplicateCprIds（820）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 820 |
| 接口名称 | queryDuplicateCprIds |
| HTTP方法 | GET |
| API路径 | `/api/cm/service/CmIndivAction/queryDuplicateCprIds` |
| 功能描述 | 查询重复CPR ID。该方法根据客户ID查询客户扩展信息，获取重复的CPR ID列表 返回信息: 包含查询结果的Map，key包括"cprIds"（重复的CPR ID字符串，多个ID用逗号分隔）、"retFlag"（"N"表示查询失败，仅当发生异常时存在） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl#queryDuplicateCprIds |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 | 客户ID，用于查询该客户的重复CPR ID |  |

**请求示例**：

```http
GET /api/cm/service/CmIndivAction/queryDuplicateCprIds?custId=21210419971223
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "cprIds": null
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.261 dealCustomer（821）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 821 |
| 接口名称 | dealCustomer |
| HTTP方法 | PUT |
| API路径 | `/api/cm/customer/modifyIndivCust` |
| 功能描述 | 处理客户业务。该方法接收客户信息Map、BCE框架ID和业务ID，将客户基本信息和附加信息转换为DataContainer，如果存在旧数据则标记为旧状态并设置变更映射，然后调用客户BCE处理服务进行业务处理 返回信息: BCE业务处理返回数据，包含业务处理的结果信息 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl#dealCustomer |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.262 getHierarchyStatus（822）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 822 |
| 接口名称 | getHierarchyStatus |
| HTTP方法 | GET |
| API路径 | `/api/cm/service/CmCustomerAction/getHierarchyStatus` |
| 功能描述 | getHierarchyStatus,没有对应方法 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#getHierarchyStatus |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 | custId |  |

**请求示例**：

```http
GET /api/cm/service/CmCustomerAction/getHierarchyStatus?custId=23210120133026
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "retFlag": "Y",
    "status": "Active"
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.263 queryGroupOrgNode（823）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 823 |
| 接口名称 | queryGroupOrgNode |
| HTTP方法 | GET |
| API路径 | `/api/cm/service/CmCustomerAction/checkGroupOrgNode` |
| 功能描述 | queryGroupOrgNode |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#queryGroupOrgNode |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| Id | long | QUERY | 是 | Id |  |
| parentId | long | QUERY | 是 | parentId |  |
| type | String | QUERY | 是 | type |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.264 addOffLineMemberByCpr（824）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 824 |
| 接口名称 | addOffLineMemberByCpr |
| HTTP方法 | GET |
| API路径 | `/api/cm/service/CmIndivCustomerAction/addOffLineMemberByCpr` |
| 功能描述 | 根据CPR添加离线成员。该方法根据CPR号码查询参与人信息，如果参与人存在则判断是否为客户、付款人或联系人，并返回相应的信息。如果参与人不存在，则调用CPR接口验证CPR号码，获取客户信息（姓名、生日、地址等），判断是否受保护、是否移民或消失，然后保存地址信息和客户联系媒介信息 返回信息: 包含添加结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，失败时包含异常信息）、"firstName"（名字）、"lastName"（姓氏）、"birth"（生日）、"isProtected"（"Y"表示受保护，"N"表示不受保护）、"memberFrom"（成员来源，"cpr"表示来自CPR，"indiv"表示来自个人客户，"party"表示来自参与人）、"partyId"（参与人ID）、"custId"（客户ID）、"addressId"（地址ID，仅当从CPR创建时存在）、"flag"（"Y"表示客户移民或消失，仅当发生异常时存在） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl#addOffLineMemberByCpr |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| cprNum | String | QUERY | 否 | CPR号码，用于查询参与人信息或调用CPR接口验证 |  |
| custId | String | QUERY | 是 | 客户ID，用于保存客户联系媒介信息 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.265 queryCustAcctRels（825）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 825 |
| 接口名称 | queryCustAcctRels |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmAccountSV/queryCustAcctRels` |
| 功能描述 | queryCustAcctRels |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#queryCustAcctRels |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| acctId | long | BODY | 是 | acctId |  |
| custId | long | BODY | 是 | custId |  |
| beanClass | String | BODY | 是 | beanClass |  |
| pageNum | int | QUERY | 是 |  |  |
| pageSize | int | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.266 getParamValue（826）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 826 |
| 接口名称 | getParamValue |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmCommonSV/getParamValue` |
| 功能描述 | getParamValue |
| 方法来源 | com.asiainfo.crm.cm.common.service.interfaces.ICmCommonSV#getParamValue |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| paramCode | String | BODY | 是 | paramCode |  |
| defaultValue | String | BODY | 否 | defaultValue |  |

**请求示例**：

```http
POST /api/cm/service/ICmCommonSV/getParamValue
Content-Type: application/json

{
  "paramCode": "X_PHONE_NUM_REGEX_OF2_FRAME",
  "defaultValue": ""
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": "^[A-Za-z0-9]*$",
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.267 queryB2BCustomers（827）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 827 |
| 接口名称 | queryB2BCustomers |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICustomerSearchSV/queryB2BCustomers` |
| 功能描述 | 根据多个条件查询并返回企业客户信息的分页列表。 |
| 方法来源 | com.ai.oneframe.search.service.interfaces.ICustomerSearchSV#queryB2BCustomers |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| customer_type | String | BODY | 否 | 客户类型 | 3 |
| customer_state | String | BODY | 否 | 客户状态 | U |
| customer_status | String | BODY | 否 | 客户状态 | 1 |
| customer_certificate_id | String | BODY | 否 | 客户证件ID | 0101380141 |
| customer_id | String | BODY | 否 | 客户ID | 23210517915222 |
| old_customer_id | String | BODY | 否 | 旧客户ID | 23210517915221 |
| icc_id | String | BODY | 否 | ICC卡ID | 8945020110111000072 |
| customer_name | String | BODY | 否 | 客户名称 | Stephhone |
| short_name | String | BODY | 否 | 简称 | Step |
| subscriber_number | String | BODY | 否 | 用户号码 | 34982019 |
| account_id | String | BODY | 否 | 账户ID | 32100119385351 |
| major_account_number | String | BODY | 否 | 主账户号码 | 57483920 |
| address_type | String | BODY | 否 | 地址类型 | -1 |
| address_id | String | BODY | 否 | 地址ID |  |
| contract_number | String | BODY | 否 | 合同编号 |  |
| imsi_number | String | BODY | 否 | IMSI号码 | 238028814101277 |
| account_manager | String | BODY | 否 | 客户经理 |  |
| cust_mana_group | String | BODY | 否 | 客户管理组 |  |
| segment | String | BODY | 否 | 客户细分 | SA |
| category | String | BODY | 否 | 客户类别 |  |
| kob_number | String | BODY | 否 | KOB编号 | KOB232312233 |
| cvr_number | String | BODY | 否 | CVR编号 | 323121231 |
| contact_phone_number | String | BODY | 否 | 联系电话 | 43232121 |
| ipAddress | String | BODY | 否 | IP地址 |  |
| cpeNumber | String | BODY | 否 | CPE编号 |  |
| eanNumber | String | BODY | 否 | EAN编号 |  |
| PBSNumber | String | BODY | 否 | PBS编号 |  |
| billingAddress | String | BODY | 否 | 账单地址 |  |
| invoiceNumber | String | BODY | 否 | 发票号码 |  |
| emailAddress | String | BODY | 否 | 电子邮箱 |  |
| ticketID | String | BODY | 否 | 工单ID |  |
| orderID | String | BODY | 否 | 订单ID |  |
| opCode | String | BODY | 否 | 操作码 |  |
| oldB2BAccountId | String | BODY | 否 | 旧B2B账户ID |  |
| circuitB2BNumber | String | BODY | 否 | B2B电路编号 |  |
| opennetCustId | String | BODY | 否 | OpenNet客户ID |  |
| pageNum | int | QUERY | 是 |  |  |
| pageSize | int | QUERY | 是 |  |  |

**请求示例**：

```http
POST /api/cm/service/ICustomerSearchSV/queryB2BCustomers
Content-Type: application/json

{
  "customer_type": "3",
  "customer_state": "U",
  "customer_status": "1",
  "customer_certificate_id": "",
  "major_account_number": "",
  "address_type": "-1",
  "category": "-1",
  "billingAddress": "",
  "opennetCustId": ""
}
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":[{"REGION_ID":"2105","CUST_ID":"23210015831222","KOB_NUMBER":"K23210015831222","EMPLOYEE_NUMBER_RANGE":null,"COMPANY_TYPE":"2","EMPLOYEE_HISTORICAL":null,"CUSTOMER_LEGAL_ADDRESS":"Vesterbro 61 A 9000 Aalborg","REMARKS":null,"PHONE_NO":"","AKS_STATUS":"5","SHORT_NAME":null,"STATUS":"1","DESCRIPTION":"","AKS_REGISTRATION_DATE":null,"CONTACT_POINT":null,"CATEGORY":null,"SUB_SEGMENT":null,"EMPLOYEE_NUMBER":null,"ACCOUNT_MANAGER":"PA1TSM","REGISTRATION_DATE":null,"LEGAL_FORM":null,"SEGMENT":"PA","CREDIT_MAX":null,"WEB_SITE":null,"MKT_PERMISSION":"-1","BI_COMPANY_NAME":null,"COMPANY_NAME":"gyuhio_0320","MAJOR_ACCOUNT_NUMBER":null,"LEGALPERSON_ID":null,"PASSWORD":null,"RATING":null,"CREDIT_CLASS":null,"CVR_NUMBER":"wanxy20200320"},{"REGION_ID":"2107","CUST_ID":"23210015838622","KOB_NUMBER":"K23210015838622","EMPLOYEE_NUMBER_RANGE":null,"COMPANY_TYPE":"2","EMPLOYEE_HISTORICAL":null,"CUSTOMER_LEGAL_ADDRESS":"Jernbanegade 21 A 9000 Aalborg","
```
---

### 3.268 countB2BCustomers（828）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 828 |
| 接口名称 | countB2BCustomers |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICustomerSearchSV/countB2BCustomers` |
| 功能描述 | 根据多个查询条件查询符合条件的客户数量。 |
| 方法来源 | com.ai.oneframe.search.service.interfaces.ICustomerSearchSV#countB2BCustomers |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| customer_type | String | BODY | 否 | 客户类型 | 3 |
| customer_state | String | BODY | 否 | 客户状态 | U |
| customer_status | String | BODY | 否 | 客户状态 | 1 |
| customer_certificate_id | String | BODY | 否 | 客户证件ID | 0001650941 |
| customer_id | String | BODY | 否 | 客户ID | 23210517915222 |
| old_customer_id | String | BODY | 否 | 旧客户ID | 23210517915221 |
| icc_id | String | BODY | 否 | ICC卡ID | 8945020110111000403 |
| customer_name | String | BODY | 否 | 客户名称 | Stephone |
| short_name | String | BODY | 否 | 简称 | Step |
| subscriber_number | String | BODY | 否 | 用户号码 | 43902901 |
| account_id | String | BODY | 否 | 账户ID | 32100119385351 |
| major_account_number | String | BODY | 否 | 主账户号码 |  |
| address_type | String | BODY | 否 | 地址类型 |  |
| address_id | String | BODY | 否 | 地址ID | 233123 |
| contract_number | String | BODY | 否 | 合同编号 | 2323241 |
| imsi_number | String | BODY | 否 | IMSI号码 | 238028814101277 |
| account_manager | String | BODY | 否 | 客户经理 |  |
| cust_mana_group | String | BODY | 否 | 客户管理组 |  |
| segment | String | BODY | 否 | 客户细分 | SA |
| category | String | BODY | 否 | 客户类别 | -1 |
| kob_number | String | BODY | 否 | KOB编号 | KOB23210517915222 |
| cvr_number | String | BODY | 否 | CVR编号 |  |
| contact_phone_number | String | BODY | 否 | 联系电话 | 33423121 |
| ipAddress | String | BODY | 否 | IP地址 |  |
| cpeNumber | String | BODY | 否 | CPE编号 |  |
| eanNumber | String | BODY | 否 | EAN编号 |  |
| PBSNumber | String | BODY | 否 | PBS编号 |  |
| billingAddress | String | BODY | 否 | 账单地址 |  |
| invoiceNumber | String | BODY | 否 | 发票号码 |  |
| emailAddress | String | BODY | 否 | 电子邮箱 | 333@123.COM |
| ticketID | String | BODY | 否 | 工单ID |  |
| orderID | String | BODY | 否 | 订单ID | 32100263471304 |
| opCode | String | BODY | 否 | 操作码 | 443325 |
| oldB2BAccountId | String | BODY | 否 | 旧B2B账户ID | 32100119385356 |
| circuitB2BNumber | String | BODY | 否 | B2B电路编号 |  |
| opennetCustId | String | BODY | 否 | OpenNet客户ID |  |

**请求示例**：

```http
POST /api/cm/service/ICustomerSearchSV/countB2BCustomers
Content-Type: application/json

{
  "customer_type": "3",
  "customer_state": "U",
  "customer_status": "1",
  "customer_certificate_id": "",
  "major_account_number": "",
  "address_type": "-1",
  "category": "-1",
  "billingAddress": "",
  "opennetCustId": ""
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 2160,
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.269 statisticCustData（835）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 835 |
| 接口名称 | statisticCustData |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/FrameCommonAction/statisticCustData` |
| 功能描述 | 统计客户数据。该方法根据客户类型获取对应的视图配置，然后调用远程服务统计客户相关的数据，包括待处理订单数、商机数、个人案例数、企业案例数和活动数。统计结果以格式化后的数字字符串形式返回 返回信息: 包含统计结果的Map，key包括"ret_code"（"success"表示成功，"failure"表示失败）、"ret_msg"（失败时的错误消息）、"OrderQuery"（待处理订单数）、"Opportunity"（商机数）、"CaseIndiHistory"（个人案例数）、"CaseCorpHistory"（企业案例数）、"Compaign"（活动数） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CommonBFImpl#statisticCustData |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | String | BODY | 否 | 客户ID，用于统计该客户的相关数据 |  |
| serviceNumber | String | BODY | 否 |  |  |
| custType | String | BODY | 否 | 客户类型，用于获取对应的视图配置 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.270 getCustImageHtml（836）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 836 |
| 接口名称 | getCustImageHtml |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/FrameCommonAction/getCustImageHtml` |
| 功能描述 | 获取客户图片HTML。该方法接收客户ID、真实客户类型、文件路径、文件名和上下文路径，根据客户类型和性别生成客户头像的HTML img标签，如果图片加载失败则显示默认头像（个人客户根据性别显示不同头像，集团客户显示集团头像） 返回信息: 包含HTML代码的Map，key包括"retCode"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，失败时包含错误信息）、"htmlCode"（客户头像的HTML代码） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#getCustImageHtml |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | BODY | 否 | 客户ID，用于查询客户信息和生成客户头像HTML |  |
| custType | int | BODY | 否 | 真实客户类型，用于确定客户头像类型,1表示个人客户,3表示集团客户 |  |
| filePath | int | BODY | 否 | 文件路径，用于生成图片URL |  |
| fileName | String | BODY | 否 | 文件名，用于生成图片URL |  |
| context | String | BODY | 否 | 上下文路径，用于生成完整的图片URL |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.271 QueryCustInfoItem（838）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 838 |
| 接口名称 | QueryCustInfoItem |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/IOf2CustInfoItemSV/QueryCustInfoItem` |
| 功能描述 | QueryCustInfoItem |
| 方法来源 | com.ai.oneframe.cust.service.interfaces.IOf2CustInfoItemSV#QueryCustInfoItem |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| ownSys | int | BODY | 否 | 系统标识 | 1 |
| itemType | int | BODY | 否 | 项目类型 | 2 |
| fieldName | String | BODY | 否 | 字段名称 | username |
| labelName | String | BODY | 否 | 标签名称 | 用户名 |
| isVisible | int | BODY | 否 | 是否可见 | 1 |
| pageNum | int | QUERY | 是 |  |  |
| pageSize | int | QUERY | 否 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.272 QueryCustInfoItemCount（839）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 839 |
| 接口名称 | QueryCustInfoItemCount |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/IOf2CustInfoItemSV/QueryCustInfoItemCount` |
| 功能描述 | QueryCustInfoItem |
| 方法来源 | com.ai.oneframe.cust.service.interfaces.IOf2CustInfoItemSV#QueryCustInfoItemCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| ownSys | int | BODY | 否 | 系统标识 | 1 |
| itemType | int | BODY | 否 | 项目类型 | 2 |
| fieldName | String | BODY | 否 | 字段名称 | username |
| labelName | String | BODY | 否 | 标签名称 | 用户名 |
| isVisible | int | BODY | 否 | 是否可见 | 1 |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.273 queryVcCustItem（840）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 840 |
| 接口名称 | queryVcCustItem |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/IOf2VcCustItemSV/queryVcCustItem` |
| 功能描述 | queryVcCustItem |
| 方法来源 | com.ai.oneframe.view.service.interfaces.IOf2VcCustItemSV#queryVcCustItem |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| visualId | long | BODY | 否 |  |  |
| ownSys | int | BODY | 否 |  |  |
| itemType | int | BODY | 否 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.274 queryVcCustItemCount（841）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 841 |
| 接口名称 | queryVcCustItemCount |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/IOf2VcCustItemSV/queryVcCustItemCount` |
| 功能描述 | queryVcCustItemCount |
| 方法来源 | com.ai.oneframe.view.service.interfaces.IOf2VcCustItemSV#queryVcCustItemCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| visualId | long | BODY | 否 |  |  |
| ownSys | int | BODY | 否 |  |  |
| itemType | int | BODY | 否 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.275 getCustType（843）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 843 |
| 接口名称 | getCustType |
| HTTP方法 | GET |
| API路径 | `/api/cm/service/CmCommonUtil/getCustType` |
| 功能描述 | 获取客户类型。该方法根据客户ID查询客户类型，如果客户ID小于等于0则抛出业务异常，通过SN工具类获取客户类型 返回信息: 客户类型整数值，如果查询失败则抛出业务异常 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.Cust360ViewBFImpl#getCustType |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 | 客户ID，用于查询该客户的客户类型 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.276 saveVcCustItemInfo（846）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 846 |
| 接口名称 | saveVcCustItemInfo |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/CustItemBFImpl/saveVcCustItemInfo` |
| 功能描述 | 保存视图客户项信息。该方法接收客户类型、所属系统和项目代码列表，获取当前用户ID和最大排序号，然后将项目代码列表按逗号分割，为每个项目代码创建视图客户项Bean（设置可见性、排序号等），最后批量保存这些客户项信息 返回信息: 包含保存结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，失败时包含国际化资源"OFS2000384"对应的文本和异常信息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustItemBFImpl#saveVcCustItemInfo |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custType | int | BODY | 是 | 客户类型，用于标识客户项所属的客户类型 |  |
| ownSys | int | BODY | 是 | 所属系统，用于标识客户项所属的系统 |  |
| itemCodes | String | BODY | 是 | 项目代码列表，多个代码用逗号分隔，用于创建多个客户项 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.277 deleteVcCustItemInfo（847）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 847 |
| 接口名称 | deleteVcCustItemInfo |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/CustItemBFImpl/deleteVcCustItemInfo` |
| 功能描述 | 删除视图客户项信息。该方法接收客户类型、所属系统和项目代码列表，获取当前用户ID，删除指定的视图客户项，然后重新获取剩余的客户项并重新排序（从1开始），最后批量保存更新后的排序号 返回信息: 包含删除结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，失败时包含国际化资源"OFS2000385"对应的文本和异常信息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustItemBFImpl#deleteVcCustItemInfo |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custType | int | BODY | 是 | 客户类型，用于标识要删除的客户项所属的客户类型 |  |
| ownSys | int | BODY | 是 | 所属系统，用于标识要删除的客户项所属的系统 |  |
| itemCodes | String | BODY | 是 | 项目代码列表，多个代码用逗号分隔，用于删除多个客户项 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.278 moveVcCustItemData（848）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 848 |
| 接口名称 | moveVcCustItemData |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/CustItemBFImpl/moveVcCustItemData` |
| 功能描述 | 移动视图客户项数据。该方法接收项目代码、客户类型、所属系统、操作标志和排序号，获取当前用户ID，然后调用视图客户项服务移动客户项数据（用于调整客户项的顺序） 返回信息: 包含移动结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，失败时包含国际化资源"OFS2000387"对应的文本和异常信息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustItemBFImpl#moveVcCustItemData |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| itemCode | String | BODY | 是 | 项目代码，用于标识要移动的客户项 |  |
| custType | int | BODY | 是 | 客户类型，用于标识客户项所属的客户类型 |  |
| ownSys | int | BODY | 是 | 所属系统，用于标识客户项所属的系统 |  |
| opFlag | String | BODY | 否 | 操作标志，用于指定移动操作的类型（如向上移动、向下移动等） |  |
| sortNo | int | BODY | 否 | 排序号，用于指定移动后的目标排序位置 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.279 queryUserSplitAccount（849）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 849 |
| 接口名称 | queryUserSplitAccount |
| HTTP方法 | POST |
| API路径 | `/api/cm/acct/ICrmFSV/queryUserSplitAccount` |
| 功能描述 | queryUserSplitAccount |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.AccountBFImpl#queryUserSplitAccount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | BODY | 否 |  |  |
| serviceNumber | String | BODY | 否 |  |  |
| defaultAcctId | long | BODY | 否 |  |  |
| splitAcctId | long | BODY | 否 |  |  |
| splitRuleId | long | BODY | 否 |  |  |
| itemIdName | String | BODY | 否 |  |  |
| pageNum | int | QUERY | 否 |  |  |
| pageSize | int | QUERY | 否 |  |  |

**请求示例**：

```http
POST /api/cm/acct/ICrmFSV/queryUserSplitAccount
Content-Type: application/json

{
  "custId": "23210619756422",
  "defaultAcctId": -1,
  "splitAcctId": -1,
  "splitRuleId": -1
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "TOTAL": 0,
    "LIST": []
  },
  "metaObject": "SETAcctContactInfo001",
  "fieldNameConvert": null
}
```
---

### 3.280 queryUserSplitAccountLength（850）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 850 |
| 接口名称 | queryUserSplitAccountLength |
| HTTP方法 | POST |
| API路径 | `/api/cm/acct/ICrmFSV/queryUserSplitAccountLength` |
| 功能描述 | queryUserSplitAccountLength |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.AccountBFImpl#queryUserSplitAccountLength |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | BODY | 否 |  |  |
| serviceNumber | String | BODY | 否 |  |  |
| defaultAcctId | long | BODY | 否 |  |  |
| splitAcctId | long | BODY | 否 |  |  |
| splitRuleId | long | BODY | 否 |  |  |
| itemIdName | String | BODY | 否 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.281 queryPayerAccountByAgr（851）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 851 |
| 接口名称 | queryPayerAccountByAgr |
| HTTP方法 | POST |
| API路径 | `/api/cm/acct/ICrmFSV/queryPayerAccountByAgr` |
| 功能描述 | queryPayerAccountByAgr |
| 方法来源 | com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV#queryPayerAccountByAgr |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| agreementId | String | BODY | 否 |  |  |
| custType | int | BODY | 否 |  |  |
| custId | long | BODY | 否 |  |  |
| firstName | String | BODY | 否 |  |  |
| LastName | String | BODY | 否 |  |  |
| cpr | String | BODY | 否 |  |  |
| birthDay | String | BODY | 否 |  |  |
| addressId | long | BODY | 否 |  |  |
| companyName | String | BODY | 否 |  |  |
| kob | String | BODY | 否 |  |  |
| cvr | String | BODY | 否 |  |  |
| accountId | String | BODY | 否 |  |  |
| isIotOffer | String | BODY | 否 |  |  |
| pageNum | int | QUERY | 否 |  |  |
| pageSize | int | QUERY | 否 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.282 queryPayerAccountByAgrCount（852）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 852 |
| 接口名称 | queryPayerAccountByAgrCount |
| HTTP方法 | POST |
| API路径 | `/api/cm/acct/ICrmFSV/queryPayerAccountByAgrCount` |
| 功能描述 | 根据合同ID（agreementId）和客户信息（客户类型、客户ID、姓名、CPR、生日、地址、公司名、KOB、CVR等）查询与合同关联的付款账户数量。 |
| 方法来源 | com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV#queryPayerAccountByAgrCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| agreementId | String | BODY | 否 | 合同唯一标识，用于合同与订单关联及业务流程控制 | 3102815583 |
| custType | int | BODY | 否 | 客户类型 | 1 |
| custId | long | BODY | 否 | 客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作 | 23210517915222 |
| firstName | String | BODY | 否 | 名字 | John |
| LastName | String | BODY | 否 | 姓氏 | Smith |
| cpr | String | BODY | 否 | 个人身份证号 | 312312 |
| birthDay | String | BODY | 否 | 生日 | 1980-01-15 |
| addressId | long | BODY | 否 | 地址ID | 23243423 |
| companyName | String | BODY | 否 | 公司名称 | ABC Corporation |
| kob | String | BODY | 否 | KOB（集团编号） | K123456 |
| cvr | String | BODY | 否 | CVR（税务登记号/税号） | 12345678 |
| accountId | String | BODY | 否 | 账户唯一标识，用于账户编辑、查看及用户关联等账户级操作 | 32100119385351 |
| isIotOffer | String | BODY | 否 | 是否为IoT套餐标识 | Y |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.283 queryPayerAccountByDts（853）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 853 |
| 接口名称 | queryPayerAccountByDts |
| HTTP方法 | POST |
| API路径 | `/api/cm/acct/ICrmFSV/queryPayerAccountByDts` |
| 功能描述 | 根据客户类型、客户ID、姓名、CPR、生日、地址、公司名、KOB、CVR等条件查询付款账户列表，支持按账户ID精确过滤和分页查询。 |
| 方法来源 | com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV#queryPayerAccountByDts |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.284 queryPayerAccountByDtsCount（854）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 854 |
| 接口名称 | queryPayerAccountByDtsCount |
| HTTP方法 | POST |
| API路径 | `/api/cm/acct/ICrmFSV/queryPayerAccountByDtsCount` |
| 功能描述 | 根据客户类型、客户ID、姓名、CPR、生日、地址、公司名、KOB、CVR等条件查询付款账户的数量。 |
| 方法来源 | com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV#queryPayerAccountByDtsCount |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.285 getSkinAndMenuStyle（856）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 856 |
| 接口名称 | getSkinAndMenuStyle |
| HTTP方法 | GET |
| API路径 | `/api/cm/service/PartyBFImpl/getSkinAndMenuStyle` |
| 功能描述 | 获取皮肤和菜单样式。该方法查询当前用户的视觉配置信息，返回皮肤颜色和菜单样式，如果用户未配置则返回默认值（"0,1"） 返回信息: 包含皮肤和菜单样式的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（皮肤颜色和菜单样式，格式为"皮肤颜色,菜单样式"，默认值为"0,1"，失败时包含错误信息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.PartyBFImpl#getSkinAndMenuStyle |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.286 queryCustAcctRelFor360New（857）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 857 |
| 接口名称 | queryCustAcctRelFor360New |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/Cust360ViewBFImpl/queryCustAcctRelFor360New` |
| 功能描述 | 查询客户账户关系（360视图新版本）。该方法接收多个查询条件（关联客户ID、账户ID、账户名称、分期标志、支付方式、周期类型、客户状态、账户服务ID、服务号码、PBS、EAN等）和分页参数，调用账户服务查询客户账户关系列表。同时根据用户ID查询实例账户关系，如果账户ID匹配则将账户关系标记为"Split Account" 返回信息: 客户账户关系值数组，包含符合查询条件的账户关系列表，每个元素代表一个账户关系记录，如果账户是拆分账户则ext4字段为"Split Account" |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.Cust360ViewBFImpl#queryCustAcctRelFor360New |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| relCustd | long | BODY | 是 | 关联客户ID，用于查询客户账户关系 | 23210517915222 |
| acctId | long | BODY | 是 | 账户ID，用于过滤查询条件 | 32100119385351 |
| acctName | java.lang.String | BODY | 是 | 账户名称，用于过滤查询条件 | YUFEI-TEST02 |
| installmentFalg | int | BODY | 是 | 分期标志，用于过滤查询条件 |  |
| paymethod | int | BODY | 是 | 支付方式，用于过滤查询条件 | 3 |
| cycleType | int | BODY | 是 | 周期类型，用于过滤查询条件 | 1 |
| custStatus | java.lang.String | BODY | 是 | 客户状态，用于过滤查询条件 | 1 |
| acctServiceId | java.lang.String | BODY | 是 | 账户服务ID，用于过滤查询条件 |  |
| serviceNumber | java.lang.String | BODY | 是 | 服务号码，用于过滤查询条件 | 54542322 |
| pbs | java.lang.String | BODY | 是 | PBS标识，用于过滤查询条件 |  |
| ean | java.lang.String | BODY | 是 | EAN标识，用于过滤查询条件 |  |
| start | int | QUERY | 是 | 起始索引，用于分页查询 | 1 |
| end | int | QUERY | 是 | 结束索引，用于分页查询 | 10 |
| userId | long | BODY | 是 | 用户ID，用于查询实例账户关系，判断账户是否为拆分账户 | 42100100000015 |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.287 获取legal person（858）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 858 |
| 接口名称 | 获取legal person |
| HTTP方法 | GET |
| API路径 | `/api/cm/b2b/legal-person` |
| 功能描述 | 获取法人。该方法接收CPR号码，首先查询CRM系统中是否存在该CPR对应的客户，如果存在则返回客户名称（首字母大写）。如果不存在，则调用CPR接口验证CPR号码，从CPR系统获取客户名称并返回 返回信息: 法人名称字符串，如果CPR在CPR系统中不存在则返回null |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#getLegalPerson |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| cprNum | String | QUERY | 是 | CPR号码，用于查询法人信息 | 0101380141 |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.288 acctInfoBybillAndCust（877）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 877 |
| 接口名称 | acctInfoBybillAndCust |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/query/acctInfoBybillAndCust` |
| 功能描述 | 根据客户ID和账单ID查询账户详情。该方法接收客户ID、区域ID、账单ID、支付方式、保险标志、协议ID、账户名称、账户ID和分页参数，查询符合条件的账户详情列表和总数 返回信息: 包含查询结果的Map，key包括"TOTAL"（总记录数）和"ACCT_LIST"（账户详情列表，每个元素为账户属性Map） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.AccountBFImpl#queryAcctDtsByCustIdAndBillId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | BODY | 否 | 客户ID，用于查询该客户的账户详情 | 23210517915222 |
| regionId | String | BODY | 否 | 区域ID，用于过滤查询结果 | 2100 |
| billId | String | BODY | 否 | 账单ID，用于过滤查询结果 | 12367543 |
| payMethod | String | BODY | 否 | 支付方式，用于过滤查询结果 | 3 |
| insFlag | int | BODY | 否 | 保险标志，用于过滤查询结果 | -1 |
| agrId | String | BODY | 否 | 协议ID，用于过滤查询结果 | -1 |
| acctName | String | BODY | 否 | 账户名称，用于过滤查询结果 | AutotesterAccount |
| acctId | long | BODY | 否 | 账户ID，用于过滤查询结果 | 32100110014863 |
| start | int | QUERY | 是 | 分页起始位置 | 1 |
| end | int | QUERY | 是 | 分页结束位置 | 10 |

**请求示例**：

```http
POST /api/cm/service/query/acctInfoBybillAndCust
Content-Type: application/json

{
  "regionId": "",
  "agrId": "-1",
  "insFlag": "-1",
  "custId": "21210817624022"
}
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":{"TOTAL":599,"ACCT_LIST":[{"REL_TYPE":1,"EFFECTIVE_DATE":"2025-09-15 15:37:56","REGION_ID":"2100","CUST_ID":21210817624022,"ACCT_ID":32100116329951,"LAST_NAME":"Riikonen","CUST_TYPE":1,"FIRST_NAME":"Aurikla Osabel","ACCT_NAME":"ac name","BILL_DUE_DATE":0,"INSTALLMENT_FLAG":0,"REL_CUST_ID":21210817624022,"ACCT_STATUS":1,"BILL_DAY":16,"PAY_METHOD":2,"CYCLE_TYPE":5,"CUST_NAME":"Aurikla Osabel Riikonen"},{"REL_TYPE":1,"EFFECTIVE_DATE":"2022-04-12 00:49:46","REGION_ID":"2100","CUST_ID":21210817624022,"ACCT_ID":32100116468757,"LAST_NAME":"Riikonen","CUST_TYPE":1,"FIRST_NAME":"Aurikla Osabel","BILL_DUE_DATE":0,"INSTALLMENT_FLAG":0,"REL_CUST_ID":21210817624022,"ACCT_STATUS":1,"BILL_DAY":16,"PAY_METHOD":2,"CYCLE_TYPE":5,"CUST_NAME":"Aurikla Osabel Riikonen"},{"REL_TYPE":1,"EFFECTIVE_DATE":"2022-04-27 00:35:28","REGION_ID":"2100","CUST_ID":21210817624022,"ACCT_ID":32100116522551,"LAST_NAME":"Riikonen","CUST_TYPE":1,"FIRST_NAME":"Aurikla Osabe
```
---

### 3.289 queryCust（887）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 887 |
| 接口名称 | queryCust |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/queryCust` |
| 功能描述 | 查询客户。该方法接收查询类型和查询值，根据查询类型进行不同处理：类型"1"表示根据账单ID（实际为电话号码）查询，调用getCustInfoByBillId方法；类型"0"表示根据邮箱查询，调用CM2CS服务查询客户。如果查询到客户信息，则返回客户ID和客户名称，否则返回无数据消息 返回信息: 包含查询结果的Map，key包括"rsltVal"（"Y"表示成功，"N"表示失败）、"customerId"（客户ID，成功时存在）、"customerName"（客户名称，成功时存在）、"rsltMsg"（结果消息，失败时包含错误信息或无数据消息） |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.PushCCustBFImpl#queryCustomer |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.290 queryAdvanceCustomerDetail（1018）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 1018 |
| 接口名称 | queryAdvanceCustomerDetail |
| HTTP方法 | GET |
| API路径 | `/api/cm/customer/{custId}/advance/detail` |
| 功能描述 | 查询高级客户详情。该方法接收客户ID，查询客户类型和客户基本信息，如果是集团客户且存在法人识别号码，则获取法人信息。同时查询客户的邮箱和合法地址详情，将所有信息合并到Map中返回 返回信息: 包含客户详细信息的Map，包括客户类型、客户基本属性、法人信息（仅集团客户）、邮箱和地址详情 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#queryAdvanceCustomerDetail |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | PATH | 是 | 客户ID，用于查询高级客户详情 | 23210517915222 |

**请求示例**：

```http
GET /api/cm/customer/21210613693022/advance/detail
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "CUST_ID": 21210613693022,
    "ORG_ID": 21000000,
    "CUST_CERT_TYPE": 8,
    "EMAIL": "tanyan9328234234@asiainfo-int.com",
    "BIRTHDAY": "1957-02-07 00:00:00",
    "PARTY_ID": 110002350093,
    "REGION_ID": "2109",
    "STATE": "U"
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.291 查询参与人列表（2000）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 2000 |
| 接口名称 | 查询参与人列表 |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmDkCustomerSV/queryPartyList` |
| 功能描述 | 查询参与人列表。该方法接收查询参与人VO和分页参数，提取查询条件（参与人类型、参与人名称、名字、姓氏、证件类型、证件代码、地址ID、参与人ID），构建XML查询参数，调用丹麦客户服务查询参与人列表 返回信息: DataContainer数组，包含符合查询条件的参与人信息列表 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.PartyBFImpl#queryPartyList |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| queryCmPartyVO | com.asiainfo.crm.cm.vo.QueryCmPartyVO | BODY | 是 | 查询参与人VO，包含查询条件（参与人类型、参与人名称、名字、姓氏、证件类型、证件代码、地址ID、参与人ID），用于查询参与人列表 |  |
| startNum | int | QUERY | 是 | 起始索引，用于分页查询 |  |
| endNum | int | QUERY | 是 | 结束索引，用于分页查询 |  |

**请求示例**：

```http
POST /api/cm/service/ICmDkCustomerSV/queryPartyList
Content-Type: application/json

{
  "PARTY_ID": 110008313090,
  "PARTY_TYPE": "1"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [
    {
      "EFFECTIVE_DATE": "2025-08-22 14:20:32",
      "CERT_CODE": "010485****",
      "PARTY_TYPE": 1,
      "ADDRESS_DETAIL": "Pr. Christians AllÃ© 61 5250 Odense SV",
      "CERT_TYPE": 8,
      "PARTY_NAME": "KentÂ¿S Skou Finsen",
      "STATE": "U",
      "EXPIRE_DATE": "2099-12-31 00:00:00",
      "PARTY_ID": 110008313090
    }
  ],
  "metaObject": "SETCmPartyInfoDK001",
  "fieldNameConvert": null
}
```
---

### 3.292 查询参与人列表count（2001）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 2001 |
| 接口名称 | 查询参与人列表count |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmDkCustomerSV/queryPartyListCount` |
| 功能描述 | 查询参与人列表数量。该方法接收查询参与人VO，提取查询条件，构建XML查询参数，调用丹麦客户服务查询符合条件的参与人总数 返回信息: 符合条件的参与人总数，int类型 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.PartyBFImpl#queryPartyListCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| queryCmPartyVO | com.asiainfo.crm.cm.vo.QueryCmPartyVO | BODY | 是 | 查询参与人VO，包含查询条件，用于查询参与人总数 |  |

**请求示例**：

```http
POST /api/cm/service/ICmDkCustomerSV/queryPartyListCount
Content-Type: application/json

{
  "PARTY_NAME": "Samtank A/S",
  "PARTY_TYPE": 3,
  "PARTY_ID": "110008472094"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 1,
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.293 查询支付者信息（2002）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 2002 |
| 接口名称 | 查询支付者信息 |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmDkCustomerSV/queryPayerView` |
| 功能描述 | 查询支付者信息 |
| 方法来源 | com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV#queryPayerView |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | BODY | 是 |  |  |
| custId | long | BODY | 否 |  |  |

**请求示例**：

```http
POST /api/cm/service/ICmDkCustomerSV/queryPayerView
Content-Type: application/json

{
  "partyId": "110007465292",
  "custId": "21210219123624"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "DIRECT_MARKETING_PROTECTION": -1,
    "STATE": "U",
    "CONT_ID": 110009188199,
    "CUST_TYPE": 1,
    "MANUAL_COMMERCIAL_PROTECTION": -1,
    "PARTY_ID": 110007465292,
    "CUST_STATUS": 1
  },
  "metaObject": "SETCmPartyInfo001",
  "fieldNameConvert": null
}
```
---

### 3.294 查询支付者账户列表（2003）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 2003 |
| 接口名称 | 查询支付者账户列表 |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmAccountSV/queryPayerAccts` |
| 功能描述 | 查询支付者账户列表 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmAccountSV#queryPayerAccts |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | BODY | 是 |  |  |
| startIndex | int | QUERY | 是 |  |  |
| endIndex | int | QUERY | 是 |  |  |

**请求示例**：

```http
POST /api/cm/service/ICmAccountSV/queryPayerAccts
Content-Type: application/json

{
  "partyId": "110007465292"
}
```

**响应示例**：

```json
{"code":0,"message":"success","errorInfo":null,"data":[{"EFFECTIVE_DATE":"2024-01-25 17:56:14","REGION_ID":"2108","CREATE_OP_ID":500014851,"CUST_ID":21210219123624,"URGE_STOP_FLAG":"1","ORG_ID":21000000,"OP_ID":10426716,"CUST_CERT_CODE":"3004950045","STATE":"U","LAST_NAME":"Ruelle                                  ","FIRST_NAME":"Fmo Vmeiling La                                   ","INSTALLMENT_FLAG":0,"CREATE_ORG_ID":10056316,"EXPIRE_DATE":"2099-12-31 23:59:59","DONE_DATE":"2025-12-24 17:59:34","DONE_CODE":103416969,"ACCT_ID":32108118427752,"ACCT_TYPE":2,"ACCT_NAME":"ffLaaaaaa","CREATE_DATE":"2024-01-25 17:56:14","PAYER":"Fmo Vmeiling La                                    Ruelle                                  ","ACTION":"<a href='javascript:void(0)' class='cellpath' onclick='viewAcct(\"32108118427752\",\"21210219123624\")' style='color:blue;text-decoration:underline'>View</a>","ACCT_STATUS":1,"CREDIT_VALUE":0,"ACCT_BEHALF_PHONE":"0","CUST_NAME":"Fmo Vmeiling La                        
```
---

### 3.295 查询支付者账户列表count（2004）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 2004 |
| 接口名称 | 查询支付者账户列表count |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmAccountSV/queryPayerAcctsCount` |
| 功能描述 | 查询支付者账户列表count |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmAccountSV#queryPayerAcctsCount |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | BODY | 是 |  |  |

**请求示例**：

```http
POST /api/cm/service/ICmAccountSV/queryPayerAcctsCount
Content-Type: application/json

{
  "partyId": "110007465292"
}
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": 8,
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.296 根据PartyId，查询所有关联的b2b客户（2005）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 2005 |
| 接口名称 | 根据PartyId，查询所有关联的b2b客户 |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmContactSV/queryCustConByPartyIdForPage` |
| 功能描述 | 根据PartyId，查询所有关联的b2b客户 |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmContactSV#queryCustConByPartyIdForPage |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | BODY | 是 |  |  |
| start | int | QUERY | 是 |  |  |
| end | int | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.297 根据PartyId，查询所有关联的b2b客户count（2006）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 2006 |
| 接口名称 | 根据PartyId，查询所有关联的b2b客户count |
| HTTP方法 | POST |
| API路径 | `/api/cm/service/ICmContactSV/queryCustConCountByPartyId` |
| 功能描述 | 根据PartyId，查询所有关联的b2b客户count |
| 方法来源 | com.asiainfo.crm.cm.service.interfaces.ICmContactSV#queryCustConCountByPartyId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| partyId | long | BODY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.298 getVoipNumberByUserIdAndAttrId（3010）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 3010 |
| 接口名称 | getVoipNumberByUserIdAndAttrId |
| HTTP方法 | GET |
| API路径 | `/api/cm/360view/RbossSoBF/getVoipNumberByUserIdAndAttrId` |
| 功能描述 | 根据用户ID和属性ID获取VoIP号码。该方法接收区域ID、用户ID和属性ID，设置中心信息为区域ID，调用实例查询服务批量获取实例服务属性，返回第一个属性的属性值作为VoIP号码 返回信息: VoIP号码字符串，如果查询不到则返回空字符串 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.RbossSoBFImpl#getVoipNumberByUserIdAndAttrId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| regionId | java.lang.String | QUERY | 是 | 区域ID，用于设置中心信息 |  |
| userId | long | QUERY | 是 | 用户ID，用于查询该用户的VoIP号码 |  |
| attrId | long | QUERY | 是 | 属性ID，用于查询指定属性的值 |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.299 queryGroupByCustId（3018）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 3018 |
| 接口名称 | queryGroupByCustId |
| HTTP方法 | GET |
| API路径 | `/api/cm/360view/CustomerViewBF/queryGroupByCustId` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerViewBFImpl#queryGroupByCustId |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.300 getGroupBasicInfo（3019）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 3019 |
| 接口名称 | getGroupBasicInfo |
| HTTP方法 | GET |
| API路径 | `/api/cm/360view/CustGroupOut/getGroupBasicInfo` |
| 功能描述 |  |
| 方法来源 | com.asiainfo.crm.cm.custgroup.teaminvoke.out.service.interfaces.ICustGroupOutSV#getGroupBasicInfo |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 是 |  |  |

**请求示例**：

（暂无样例数据）

**响应示例**：

（暂无样例数据）
---

### 3.301 queryMemListByCondition（3030）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 3030 |
| 接口名称 | queryMemListByCondition |
| HTTP方法 | GET |
| API路径 | `/api/cm/360view/groupmember/queryMemListByCondition` |
| 功能描述 | 根据客户ID、VPN套餐实例、账单ID、角色ID、开通平台等条件，分页查询群组成员短号信息列表。 |
| 方法来源 | com.asiainfo.crm.so.common.party.service.interfaces.IGroupCommonQuerySV#queryMemListByCondition |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | long | QUERY | 否 | 客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作 | 23210517915222 |
| vpnOfferInstStr | java.lang.String | QUERY | 否 | 多个offer实例ID的集合 | 30000000000251,30000000000254 |
| billId | java.lang.String | QUERY | 否 | 号码标识/客户关联标识，用于客户查询、号码识别及账户关系定位 | 38290010 |
| roleId | long | QUERY | 否 | 角色ID | 182100000002 |
| provisionedPlatform | java.lang.String | QUERY | 否 | 开通平台 | IN |
| startRowIndex | int | QUERY | 是 | 页数 | 5 |
| endRowIndex | int | QUERY | 是 | 每页条数 | 10 |

**请求示例**：

```http
GET /api/cm/360view/groupmember/queryMemListByCondition?custId=21210419971223&billId=16018142&pageNum=-1&pageSize=-1
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": [],
  "metaObject": "",
  "fieldNameConvert": null
}
```
---

### 3.302 Query Permission Clause Tree（10006）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 10006 |
| 接口名称 | Query Permission Clause Tree |
| HTTP方法 | GET |
| API路径 | `/api/cm/permission-clause/tree` |
| 功能描述 | Query permission clause tree in one-shot response. |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#qryCmCustPermissionClauseTree |

**请求参数**：

| - | - | - | - | - | - |

**请求示例**：

```http
GET /api/cm/permission-clause/tree
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "value": "-1",
    "treeNodeId": "1",
    "label": "Permission",
    "leaf": false,
    "children": [
      {
        "value": "1",
        "treeNodeId": "1",
        "label": "B2C",
        "leaf": false,
        "children": [
          {
            "value": "10",
            "treeNodeId": "10",
            "label": "LBS  Collection",
            "leaf": true,
            "children": []
          },
          {
            "value": "11",
            "treeNodeId": "11",
            "label": "NP  Allowed",
            "leaf": true,
            "children": []
          },
          {
            "value": "12",
            "treeNodeId": "12",
            "label": "DPI  Collection",
            "leaf": true,
            "children": []
          },
          {
            "value": "13",
            "treeNodeId": "13",
            "label": "LBS  Analysis",
            "leaf": true,
            "children": []
          },
          {
            "value": "14",
            "treeNodeId": "14",
            "label": "CustInfo  Collection",
            "leaf": true,
            "children": []
          }
        ]
      },
      {
        "value": "2",
        "treeNodeId": "2",
        "label": "B2B",
        "leaf": false,
        "children": [
          {
            "value": "20",
            "treeNodeId": "20",
            "label": "NP  Allowed",
            "leaf": true,
            "children": []
          }
        ]
      }
    ]
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---

### 3.303 集团客户查询（8033）

**接口信息**：

| 字段 | 值 |
|------|------|
| sys_id | 8033 |
| 接口名称 | 集团客户查询 |
| HTTP方法 | GET |
| API路径 | `/api/cm/group-customers` |
| 功能描述 | 按客户ID、客户名称、KOB、CVR 查询集团客户，返回列表及总数。 |
| 方法来源 | com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl#queryGroupCustomers |

**请求参数**：

| 参数名 | 类型 | 位置 | 必填 | 说明 | 示例值 |
|--------|------|------|------|------|--------|
| custId | java.lang.String | QUERY | 否 |  |  |
| custName | java.lang.String | QUERY | 否 |  |  |
| kobNumber | java.lang.String | QUERY | 否 |  |  |
| cvrNumber | java.lang.String | QUERY | 否 |  |  |
| pageNum | int | QUERY | 是 |  |  |
| pageSize | int | QUERY | 是 |  |  |

**请求示例**：

```http
GET /api/cm/group-customers?custId=23210718531422&custType=3&pageNum=1&pageSize=50
```

**响应示例**：

```json
{
  "code": 0,
  "message": "success",
  "errorInfo": null,
  "data": {
    "total": 1,
    "data": [
      {
        "CUST_ID": 23210718531422,
        "CUST_CERT_CODE": "K23210718531422",
        "SEGMENT_NAME": "PA",
        "REGION_ID": "2100",
        "CUST_ADDRESS": "Boulevarden 26 A 9000 Aalborg"
      }
    ]
  },
  "metaObject": null,
  "fieldNameConvert": null
}
```
---
