-- ========================================
-- sys_id: 10006
-- API: GET /api/cm/permission-clause/tree
-- BF: com.asiainfo.crm.cm.bf.impl.CustomerBFImpl#qryCmCustPermissionClauseTree
-- ========================================

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '10006';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('10006', 'Query Permission Clause Tree', 'query permission clause tree', NULL, '/api', '/cm/permission-clause/tree', 'GET', 'Query permission clause tree in one-shot response.', NULL, NULL, NULL, '{
	"paramDefinitions": []
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '10006';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('10006', 'Query Permission Clause Tree', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'qryCmCustPermissionClauseTree', '{
	"paramDefinitions": []
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '10006';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('10006', 'QUERY_PERMISSION_CLAUSE_TREE', '10006', '10006', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

