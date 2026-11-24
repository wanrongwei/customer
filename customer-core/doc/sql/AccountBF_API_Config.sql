-- ============================================
-- CM Module - AccountBFImpl API Configuration SQL
-- CM 域账户档案、账期、账单定制查询接口（从 ord-core CmAcctInfo4Open 迁移）
-- sys_id range: 8026-8028
-- bean: com.asiainfo.crm.cm.bf.impl.AccountBFImpl
-- ============================================

-- ============================================
-- 1. queryAccountProfileByAcctId - SYS_ID: 8026
-- 对应 ICmLnAccountSV.queryAccountProfileByAcctId，CmAcctInfo4Open.jsp 中 cmAcctFrmAccount 表单
-- ============================================
DELETE FROM base.`sys_api_config` WHERE sys_id = '8026';
INSERT INTO base.`sys_api_config` (
    `sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`
) VALUES(
    '8026', 'Query Account Profile By Acct Id', '根据账户ID查询账户档案', NULL, '/api', '/cm/account-profile-by-acct-id', 'GET', '根据账户ID查询账户档案信息。对应 CmAcctInfo4Open.jsp 中 cmAcctFrmAccount 表单数据源。CM 域接口。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {"name": "acctId", "displayName": "acctId", "source": "QUERY", "path": "acctId", "type": "long", "required": true, "exampleValue": "123456", "description": "账户ID，必填。"}
  ]
}', NULL, NULL, NULL, 'cm', 'cm-account', 'SETQCmAcctPayMent001', NOW(), NOW(), NULL, NULL, NULL, 'Y', NULL, 'N'
);

DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '8026';
INSERT INTO base.`sys_api_service_binding` (
    `sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`
) VALUES(
    '8026', 'Query Account Profile By Acct Id', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.AccountBFImpl', 'queryAccountProfileByAcctId', '{"paramDefinitions":[{"name":"acctId","argName":"arg0","type":"long","source":"QUERY","path":"acctId","required":true}]}', '', NULL, NOW(), NULL, NULL, NULL, NULL, 'Y', NULL
);

DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '8026';
INSERT INTO base.`sys_api_service_execute` (
    `sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`
) VALUES(
    '8026', 'QUERY_ACCOUNT_PROFILE_BY_ACCT_ID_8026', '8026', '8026', '1', 'METHOD', 'N', NOW(), NOW(), NULL, NULL, NULL, 'Y', NULL
);

-- ============================================
-- 2. queryCurrAcctBillCyclesByAcctId - SYS_ID: 8027
-- 对应 ICmAccountSV.queryCurrAcctBillCyclesByAcctId，CmAcctInfo4Open.jsp 中 cmAcctFrmBillCycle 表单
-- ============================================
DELETE FROM base.`sys_api_config` WHERE sys_id = '8027';
INSERT INTO base.`sys_api_config` (
    `sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`
) VALUES(
    '8027', 'Query Bill Cycles By Acct Id', '根据账户ID查询当前账期', NULL, '/api', '/cm/bill-cycles-by-acct-id', 'GET', '根据账户ID查询当前账期信息（CYCLE_TYPE、BILL_DAY、BILL_DUE_DATE等）。对应 CmAcctInfo4Open.jsp 中 cmAcctFrmBillCycle 表单。CM 域接口。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {"name": "acctId", "displayName": "acctId", "source": "QUERY", "path": "acctId", "type": "long", "required": true, "exampleValue": "123456", "description": "账户ID，必填。"}
  ]
}', NULL, NULL, NULL, 'cm', 'cm-account', 'queryAccountProfileByAcctId001', NOW(), NOW(), NULL, NULL, NULL, 'Y', NULL, 'N'
);

DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '8027';
INSERT INTO base.`sys_api_service_binding` (
    `sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`
) VALUES(
    '8027', 'Query Bill Cycles By Acct Id', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.AccountBFImpl', 'queryCurrAcctBillCyclesByAcctId', '{"paramDefinitions":[{"name":"acctId","argName":"arg0","type":"long","source":"QUERY","path":"acctId","required":true}]}', '', NULL, NOW(), NULL, NULL, NULL, NULL, 'Y', NULL
);

DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '8027';
INSERT INTO base.`sys_api_service_execute` (
    `sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`
) VALUES(
    '8027', 'QUERY_BILL_CYCLES_BY_ACCT_ID_8027', '8027', '8027', '1', 'METHOD', 'N', NOW(), NOW(), NULL, NULL, NULL, 'Y', NULL
);

-- ============================================
-- 3. queryCmBillCustomizeByUserId - SYS_ID: 8028
-- 对应 ICmAccountSV.queryCmBillCustomizeByUserId，CmAcctInfo4Open.jsp 中 cmAcctFrmCustomize 表单
-- ============================================
DELETE FROM base.`sys_api_config` WHERE sys_id = '8028';
INSERT INTO base.`sys_api_config` (
    `sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`
) VALUES(
    '8028', 'Query Bill Customize By User Id', '根据账户和用户查询账单定制', NULL, '/api', '/cm/bill-customize-by-user-id', 'GET', '根据账户ID和用户ID查询账单定制信息。对应 CmAcctInfo4Open.jsp 中 cmAcctFrmCustomize 表单。CM 域接口。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {"name": "acctId", "displayName": "acctId", "source": "QUERY", "path": "acctId", "type": "long", "required": true},
    {"name": "userId", "displayName": "userId", "source": "QUERY", "path": "userId", "type": "long", "required": false, "exampleValue": "-1"},
    {"name": "startNum", "displayName": "startNum", "source": "QUERY", "path": "startNum", "type": "int", "required": false, "exampleValue": "-1"},
    {"name": "endNum", "displayName": "endNum", "source": "QUERY", "path": "endNum", "type": "int", "required": false, "exampleValue": "-1"}
  ]
}', NULL, NULL, NULL, 'cm', 'cm-account', 'SETCmBillCustomize001', NOW(), NOW(), NULL, NULL, NULL, 'Y', NULL, 'N'
);

DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '8028';
INSERT INTO base.`sys_api_service_binding` (
    `sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`
) VALUES(
    '8028', 'Query Bill Customize By User Id', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.AccountBFImpl', 'queryCmBillCustomizeByUserId', '{"paramDefinitions":[{"name":"acctId","argName":"arg0","type":"long","source":"QUERY","required":true},{"name":"userId","argName":"arg1","type":"long","source":"QUERY","required":false},{"name":"startNum","argName":"arg2","type":"int","source":"QUERY","required":false},{"name":"endNum","argName":"arg3","type":"int","source":"QUERY","required":false}]}', '', NULL, NOW(), NULL, NULL, NULL, NULL, 'Y', NULL
);

DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '8028';
INSERT INTO base.`sys_api_service_execute` (
    `sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`
) VALUES(
    '8028', 'QUERY_BILL_CUSTOMIZE_BY_USER_ID_8028', '8028', '8028', '1', 'METHOD', 'N', NOW(), NOW(), NULL, NULL, NULL, 'Y', NULL
);
