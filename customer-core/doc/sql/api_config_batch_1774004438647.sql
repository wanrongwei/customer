-- ========================================
-- Export Summary
-- Total: 303
-- Success: 301
-- Failed: 2
-- Not Found IDs: 412, 413
-- ========================================

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '100';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('100', '查询客户经理1', 'query customer manager', NULL, '/api', '/cm/manager/query', 'GET', '查询客户经理', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "code",
			"displayName": "code",
			"source": "QUERY",
			"path": "code",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "Staff Code",
			"exampleValue": ""
		},
		{
			"name": "staffName",
			"displayName": "staffName",
			"source": "QUERY",
			"path": "staffName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "staff Name",
			"exampleValue": ""
		},
		{
			"name": "orgName",
			"displayName": "orgName",
			"source": "QUERY",
			"path": "orgName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "select organization id",
			"exampleValue": ""
		},
		{
			"name": "districtId",
			"displayName": "districtId",
			"source": "QUERY",
			"path": "districtId",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "not use",
			"exampleValue": ""
		},
		{
			"name": "countyId",
			"displayName": "countyId",
			"source": "QUERY",
			"path": "countyId",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "not use",
			"exampleValue": ""
		},
		{
			"name": "ownerArea",
			"displayName": "ownerArea",
			"source": "QUERY",
			"path": "ownerArea",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "not use",
			"exampleValue": ""
		},
		{
			"name": "billId",
			"displayName": "billId",
			"source": "QUERY",
			"path": "billId",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "billId",
			"exampleValue": ""
		},
		{
			"name": "start",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},
		{
			"name": "end",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '100';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('100', '查询客户经理', 'APPFRAME', 'com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.ISec2CmSV', 'queryCustManager', '{
	"paramDefinitions": [
		{
			"name": "code",
			"type": "String",
			"argName": "arg0"
		},
		{
			"name": "staffName",
			"type": "String",
			"argName": "arg1"
		},
		{
			"name": "orgName",
			"type": "String",
			"argName": "arg2"
		},
		{
			"name": "districtId",
			"type": "String",
			"argName": "arg3"
		},
		{
			"name": "countyId",
			"type": "String",
			"argName": "arg4"
		},
		{
			"name": "ownerArea",
			"type": "String",
			"argName": "arg5"
		},
		{
			"name": "billId",
			"type": "String",
			"argName": "arg6"
		},
		{
			"name": "start",
			"type": "int",
			"argName": "arg7",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum"
		},
		{
			"name": "end",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"argName": "arg8"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '100';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('100', 'QUERY_CUST_MANAGER', '100', '100', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '101';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('101', '查询客户经理总数', 'query customer manager count', NULL, '/api', '/cm/manager/queryCount', 'GET', '查询客户经理总数', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "code",
			"displayName": "code",
			"source": "QUERY",
			"path": "code",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "Staff Code",
			"exampleValue": ""
		},
		{
			"name": "staffName",
			"displayName": "staffName",
			"source": "QUERY",
			"path": "staffName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "staff Name",
			"exampleValue": ""
		},
		{
			"name": "orgName",
			"displayName": "orgName",
			"source": "QUERY",
			"path": "orgName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "select organization id",
			"exampleValue": ""
		},
		{
			"name": "districtId",
			"displayName": "districtId",
			"source": "QUERY",
			"path": "districtId",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "not use",
			"exampleValue": ""
		},
		{
			"name": "countyId",
			"displayName": "countyId",
			"source": "QUERY",
			"path": "countyId",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "not use",
			"exampleValue": ""
		},
		{
			"name": "ownerArea",
			"displayName": "ownerArea",
			"source": "QUERY",
			"path": "ownerArea",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "not use",
			"exampleValue": ""
		},
		{
			"name": "billId",
			"displayName": "billId",
			"source": "QUERY",
			"path": "billId",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "billId",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '101';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('101', '查询客户经理总数', 'APPFRAME', 'com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.ISec2CmSV', 'queryCustManagerCond', '{
	"paramDefinitions": [
		{
			"name": "code",
			"type": "String",
			"argName": "arg0"
		},
		{
			"name": "staffName",
			"type": "String",
			"argName": "arg1"
		},
		{
			"name": "orgName",
			"type": "String",
			"argName": "arg2"
		},
		{
			"name": "districtId",
			"type": "String",
			"argName": "arg3"
		},
		{
			"name": "countyId",
			"type": "String",
			"argName": "arg4"
		},
		{
			"name": "ownerArea",
			"type": "String",
			"argName": "arg5"
		},
		{
			"name": "billId",
			"type": "String",
			"argName": "arg6"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '101';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('101', 'COUNT_CUST_MANAGER', '101', '101', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '1018';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('1018', 'queryAdvanceCustomerDetail', 'queryAdvanceCustomerDetail', NULL, '/api', '/cm/customer/{custId}/advance/detail', 'GET', '查询高级客户详情。该方法接收客户ID，查询客户类型和客户基本信息，如果是集团客户且存在法人识别号码，则获取法人信息。同时查询客户的邮箱和合法地址详情，将所有信息合并到Map中返回
返回信息:
包含客户详细信息的Map，包括客户类型、客户基本属性、法人信息（仅集团客户）、邮箱和地址详情', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "long", "source": "PATH", "required": true, "description": "客户ID，用于查询高级客户详情", "displayName": "custId", "defaultValue": "", "exampleValue": "23210517915222"}]}', NULL, NULL, NULL, 'cm', '360view', 'SETCustomer001', NULL, '2025-12-01 16:04:19', 'yj', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '1018';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('1018', '超级查询详细信息', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'queryAdvanceCustomerDetail', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"type": "long",
			"argName": "arg0"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '1018';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('1018', 'QUERY_ADVANCE_CUSTOMER_DTL', '1018', '1018', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '102';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('102', '查询客户偏好', 'query customer PreferenceInfo', NULL, '/api', '/cm/preferance/queryInfo/{custId}', 'GET', '查询客户偏好', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "cust id",
			"exampleValue": ""
		},
		{
			"name": "start",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},
		{
			"name": "end",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETCmCustPerferInfomation001', NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '102';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('102', '查询客户偏好', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmCustPreferenceInfoSV', 'queryCustPreferInformation', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"type": "long",
			"argName": "arg0"
		},
		{
			"name": "start",
			"type": "int",
			"argName": "arg1",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum"
		},
		{
			"name": "end",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"argName": "arg2"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '102';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('102', 'QUERY_CUST_PREFERANCE', '102', '102', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '103';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('103', '查询客户偏好总数', 'count customer PreferenceInfo', NULL, '/api', '/cm/preferance/countInfo/{custId}', 'GET', '查询客户偏好总数', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "cust id",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'Y');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '103';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('103', '查询客户偏好总数', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmCustPreferenceInfoSV', 'queryCustPreferInformationCount', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"type": "long",
			"argName": "arg0"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '103';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('103', 'COUNT_CUST_PREFERANCE', '103', '103', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '104';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('104', '查询组织信息', 'query  organization info', NULL, '/api', '/cm/organization/queryInfo', 'GET', '查询组织信息', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "orgId",
			"displayName": "orgId",
			"source": "QUERY",
			"path": "orgId",
			"type": "long",
			"required": false,
			"defaultValue": "",
			"description": "org id",
			"exampleValue": ""
		},
		{
			"name": "orgName",
			"displayName": "orgName",
			"source": "QUERY",
			"path": "orgName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "org name",
			"exampleValue": ""
		},
		{
			"name": "districtId",
			"displayName": "districtId",
			"source": "QUERY",
			"path": "districtId",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "districtId",
			"exampleValue": ""
		},
		{
			"name": "countyId",
			"displayName": "countyId",
			"source": "QUERY",
			"path": "countyId",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "countyId",
			"exampleValue": ""
		},
		{
			"name": "ownerArea",
			"displayName": "ownerArea",
			"source": "QUERY",
			"path": "ownerArea",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "ownerArea",
			"exampleValue": ""
		},
        {
            "name": "start",
            "displayName": "pageNum",
            "source": "QUERY",
            "path": "pageNum",
            "type": "int",
            "handlerClass": "com.aie.api.tool.PageTool:getStartNum",
            "required": true
        },
        {
            "name": "end",
            "displayName": "pageSize",
            "source": "QUERY",
            "path": "pageSize",
            "type": "int",
            "handlerClass": "com.aie.api.tool.PageTool:getEndNum",
            "required": true
        }
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '104';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('104', '查询组织信息', 'APPFRAME', 'com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.ISec2CmSV', 'querySecOrg', '{
	"paramDefinitions": [
		{
			"name": "orgId",
			"type": "long",
			"argName": "arg0"
		},
		{
			"name": "orgName",
			"type": "String",
			"argName": "arg1"
		},
		{
			"name": "districtId",
			"type": "String",
			"argName": "arg2"
		},
		{
			"name": "countyId",
			"type": "String",
			"argName": "arg3"
		},
		{
			"name": "ownerArea",
			"type": "String",
			"argName": "arg4"
		},
		{
			"name": "start",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"argName": "arg5"
		},
		{
			"name": "end",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"argName": "arg6"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '104';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('104', 'QUERY_ORGANIZE_INFO', '104', '104', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '105';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('105', '查询组织总数', 'count  organization info', NULL, '/api', '/cm/organization/countInfo', 'GET', '查询组织总数', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "orgId",
			"displayName": "orgId",
			"source": "QUERY",
			"path": "orgId",
			"type": "long",
			"required": false,
			"defaultValue": "",
			"description": "org id",
			"exampleValue": ""
		},
		{
			"name": "orgName",
			"displayName": "orgName",
			"source": "QUERY",
			"path": "orgName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "org name",
			"exampleValue": ""
		},
		{
			"name": "districtId",
			"displayName": "districtId",
			"source": "QUERY",
			"path": "districtId",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "districtId",
			"exampleValue": ""
		},
		{
			"name": "countyId",
			"displayName": "countyId",
			"source": "QUERY",
			"path": "countyId",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "countyId",
			"exampleValue": ""
		},
		{
			"name": "ownerArea",
			"displayName": "ownerArea",
			"source": "QUERY",
			"path": "ownerArea",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "ownerArea",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '105';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('105', '查询组织总数', 'APPFRAME', 'com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.ISec2CmSV', 'querySecOrgCount', '{
	"paramDefinitions": [
		{
			"name": "orgId",
			"type": "long",
			"argName": "arg0"
		},
		{
			"name": "orgName",
			"type": "String",
			"argName": "arg1"
		},
		{
			"name": "districtId",
			"type": "String",
			"argName": "arg2"
		},
		{
			"name": "countyId",
			"type": "String",
			"argName": "arg3"
		},
		{
			"name": "ownerArea",
			"type": "String",
			"argName": "arg4"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '105';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('105', 'COUNT_ORGANIZE_INFO', '105', '105', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '106';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('106', '获取省级等操作权限', 'get prvince.eg control', NULL, '/api', '/cm/province/control', 'GET', '获取省级等操作权限', NULL, NULL, NULL, '{
	"paramDefinitions": []}
		', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '106';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('106', '获取省级等操作权限', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'checkManagerPrivs', '{
	"paramDefinitions": [
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '106';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('106', 'GET_PROVINCE_CONTROL', '106', '106', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '107';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('107', '获取偏好时间', 'get prefrance time', NULL, '/api', '/cm/preferanceTime/queryInfo/{preferChannelId}', 'GET', '获取偏好时间', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "preferChannelId",
			"displayName": "preferChannelId",
			"source": "PATH",
			"path": "preferChannelId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "preferChannelId",
			"exampleValue": ""
		},
        {
            "name": "pageNum",
            "displayName": "pageNum",
            "source": "QUERY",
            "path": "pageNum",
            "type": "int",
            "handlerClass": "com.aie.api.tool.PageTool:getStartNum",
            "required": true
        },
        {
            "name": "pageSize",
            "displayName": "pageSize",
            "source": "QUERY",
            "path": "pageSize",
            "type": "int",
            "handlerClass": "com.aie.api.tool.PageTool:getEndNum",
            "required": true
        }
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETCmCustPerferInfo001', NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '107';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('107', '获取偏好时间', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmCustPreferenceInfoSV', 'queryCustPreferTimeInfor', '{
	"paramDefinitions": [
		{
			"name": "preferChannelId",
			"type": "long",
			"argName": "arg0"
		},
		{
			"name": "start",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"argName": "arg1"
		},
		{
			"name": "end",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"argName": "arg2"
		}
	]
}
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '107';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('107', 'QUERY_CUST_PREFERANCETIME', '107', '107', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '108';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('108', '获取偏好时间总数', 'get prefrance time', NULL, '/api', '/cm/preferanceTime/countInfo/{preferChannelId}', 'GET', '获取偏好时间总数', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "preferChannelId",
			"displayName": "preferChannelId",
			"source": "PATH",
			"path": "preferChannelId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "preferChannelId",
			"exampleValue": ""
		}
	]
}
		', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '108';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('108', '获取偏好时间总数', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmCustPreferenceInfoSV', 'queryCustPreferTimeInforCount', '{
	"paramDefinitions": [
		{
			"name": "preferChannelId",
			"type": "long",
			"argName": "arg0"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '108';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('108', 'COUNT_CUST_PREFERANCETIME', '108', '108', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '109';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('109', '获取客户联系媒介', 'query cust ElectronicMedium', NULL, '/api', '/cm/cust/ElectronicMedium/query/{custId}', 'GET', '获取客户联系媒介', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "custId",
			"exampleValue": ""
		},
		{
			"name": "start",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},
		{
			"name": "end",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETCmCustContMediumAndType001', NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '109';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('109', '获取客户联系媒介', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryCustElectronicMediumForPageSele', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"type": "long",
			"argName": "arg0"
		},
		{
			"name": "start",
			"type": "int",
			"argName": "arg1",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum"
		},
		{
			"name": "end",
			"type": "int",
			"argName": "arg2",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '109';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('109', 'QUERY_CUST_ELECMEDIUM', '109', '109', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '110';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('110', '获取客户联系媒介总数', 'count cust ElectronicMedium', NULL, '/api', '/cm/cust/ElectronicMedium/count/{custId}', 'GET', '获取客户联系媒介总数', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "custId",
			"exampleValue": ""
		}
	]
}
		', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '110';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('110', '获取客户联系媒介总数', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryCustElectronicMediumCountSele', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"type": "long",
			"argName": "arg0"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '110';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('110', 'COUNT_CUST_ELECMEDIUM', '110', '110', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '111';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('111', '删除偏好信息', 'delete preference info', NULL, '/api', '/cm/preferance/delete', 'DELETE', '删除偏好信息', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "custId",
			"exampleValue": ""
		},
		{
			"name": "preferChannelId",
			"displayName": "preferChannelId",
			"source": "QUERY",
			"path": "preferChannelId",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "preferChannelId",
			"exampleValue": ""
		}
	]
}
		', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '111';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('111', '删除偏好信息', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'deleteCustPreference', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"type": "String",
			"argName": "arg0"
		},
		{
			"name": "preferChannelId",
			"type": "String",
			"argName": "arg1"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '111';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('111', 'DELETE_CUST_PREFERANCE', '111', '111', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '112';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('112', '删除偏好时间', 'delete preference info', NULL, '/api', '/cm/preferanceTime/delete', 'DELETE', '删除偏好时间', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "custId",
			"exampleValue": ""
		},{
			"name": "preferPeriodId",
			"displayName": "preferPeriodId",
			"source": "QUERY",
			"path": "preferPeriodId",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "preferPeriodId",
			"exampleValue": ""
		}
	]
}
		', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '112';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('112', '删除偏好时间', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'deleteCustPreferTime', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"type": "String",
			"argName": "arg0"
		},{
			"name": "preferPeriodId",
			"type": "String",
			"argName": "arg1"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '112';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('112', 'DELETE_CUST_PREFERANCETIME', '112', '112', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '113';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('113', '查询集团客户', 'query B2B customer', NULL, '/api', '/cm/b2b/queryCust', 'POST', '查询集团客户。', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "customerVO",
			"displayName": "customerVO",
			"source": "BODY",
			"path": "",
			"type": "com.asiainfo.crm.cm.vo.QueryB2BCustomerVO",
			"required": true,
			"defaultValue": "",
			"description": "查询b2b客户信息",
			"exampleValue": "{\\r\\n    \\"custId\\": \\"23210012156707\\",\\r\\n    \\"custName\\": null,\\r\\n    \\"custStatus\\": null,\\r\\n    \\"custCertCode\\": null,\\r\\n    \\"startCreateDate\\": null,\\r\\n    \\"endCreateDate\\": null,\\r\\n    \\"managerId\\": \\"\\",\\r\\n    \\"cvrNumber\\": \\"\\",\\r\\n    \\"contMobile\\": \\"\\",\\r\\n    \\"custServiceId\\": \\"\\",\\r\\n    \\"groupCustSegement\\": \\"\\",\\r\\n    \\"cityId\\": \\"\\",\\r\\n    \\"countyId\\": \\"\\",\\r\\n    \\"custServiceLevel\\": \\"\\",\\r\\n    \\"custCertAddress\\": \\"\\",\\r\\n    \\"prodName\\": \\"\\",\\r\\n    \\"effectiveDate\\": \\"\\",\\r\\n    \\"expirieDate\\": \\"\\",\\r\\n    \\"managerCode\\": \\"\\",\\r\\n    \\"countyCode\\": \\"\\",\\r\\n    \\"memberBillId\\": \\"\\",\\r\\n    \\"accountId\\": \\"\\",\\r\\n    \\"BillId\\": \\"\\",\\r\\n    \\"page\\": \\"1\\",\\r\\n    \\"size\\": \\"10\\"\\r\\n}"
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETCmCommonCust001', NULL, '2025-12-03 10:55:42', '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '113';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('113', '查询集团客户', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'queryB2BCustomers', '{
	"paramDefinitions": [
		{
			"name": "customerVO",
			"argName": "arg0",
			"type": "com.asiainfo.crm.cm.vo.QueryB2BCustomerVO"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '113';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('113', 'QUERY_GROUPCUST_INFO', '113', '113', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '114';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('114', '查询集团客户总数', 'count B2B customer', NULL, '/api', '/cm/b2b/countCust', 'POST', '统计B2B客户数量。该方法接收B2B客户查询VO，构建XML查询参数（包括客户ID、客户名称、证件代码、创建日期、客户状态、经理ID、CVR号码、联系手机、客户服务ID、账单ID、县ID、城市ID、证件级别、证件地址、产品名称、生效日期、到期日期、县代码、经理代码、成员类型、成员账单ID、账户ID等），然后调用客户服务查询符合条件的B2B客户总数
返回信息:
符合条件的B2B客户总数，int类型', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "customerVO",
			"displayName": "QueryB2BCustomerVO",
			"source": "BODY",
			"path": "",
			"type": "com.asiainfo.crm.cm.vo.QueryB2BCustomerVO",
			"required": true,
			"defaultValue": "",
			"description": "查询b2b客户总数",
			"exampleValue": "{\\r\\n    \\"custId\\": \\"23210012156707\\",\\r\\n    \\"custName\\": null,\\r\\n    \\"custStatus\\": null,\\r\\n    \\"custCertCode\\": null,\\r\\n    \\"startCreateDate\\": null,\\r\\n    \\"endCreateDate\\": null,\\r\\n    \\"managerId\\": \\"\\",\\r\\n    \\"cvrNumber\\": \\"\\",\\r\\n    \\"contMobile\\": \\"\\",\\r\\n    \\"custServiceId\\": \\"\\",\\r\\n    \\"groupCustSegement\\": \\"\\",\\r\\n    \\"cityId\\": \\"\\",\\r\\n    \\"countyId\\": \\"\\",\\r\\n    \\"custServiceLevel\\": \\"\\",\\r\\n    \\"custCertAddress\\": \\"\\",\\r\\n    \\"prodName\\": \\"\\",\\r\\n    \\"effectiveDate\\": \\"\\",\\r\\n    \\"expirieDate\\": \\"\\",\\r\\n    \\"managerCode\\": \\"\\",\\r\\n    \\"countyCode\\": \\"\\",\\r\\n    \\"memberBillId\\": \\"\\",\\r\\n    \\"accountId\\": \\"\\",\\r\\n    \\"BillId\\": \\"\\"\\r\\n}"
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '114';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('114', '查询集团客户总数', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'countB2BCustomers', '{
	"paramDefinitions": [
		{
			"name": "customerVO",
			"argName": "arg0",
			"type": "com.asiainfo.crm.cm.vo.QueryB2BCustomerVO"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '114';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('114', 'COUNT_GROUPCUST_INFO', '114', '114', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '115';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('115', '保存客户偏好', 'save customer preferance', NULL, '/api', '/cm/preferance/save', 'POST', '保存客户偏好', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "preferInfoVO",
			"displayName": "CreatePerferInfoVO",
			"source": "BODY",
			"path": "",
			"type": "com.asiainfo.crm.cm.vo.CreatePerferInfoVO",
			"required": true,
			"defaultValue": "",
			"description": "保存客户偏好",
			"exampleValue": "{\\r\\n    \\"custId\\": \\"23210012156707\\",\\r\\n    \\"custPerferInfoVOList\\": [\\r\\n        {\\r\\n            \\"perferType\\": \\"2\\",\\r\\n            \\"preferChannelName\\": \\"Order Ticket Handling\\",\\r\\n            \\"prior\\": \\"1\\",\\r\\n            \\"custContRelaId\\": \\"92044\\",\\r\\n            \\"upContMedTypeId\\": \\"3\\",\\r\\n\\"priority\\":\\"1\\"\\r\\n        }\\r\\n    ]\\r\\n}"
		}
	]
}
		', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '115';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('115', '保存客户偏好', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'saveCustPreference', '{
	"paramDefinitions": [
		{
			"name": "preferInfoVO",
			"argName": "arg0",
			"type": "com.asiainfo.crm.cm.vo.CreatePerferInfoVO"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '115';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('115', 'SAVE_CUST_PREFERANCEINFO', '115', '115', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '116';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('116', '保存偏好时间', 'save preference time', NULL, '/api', '/cm/preferanceTime/save', 'POST', '保存偏好时间', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "preferTimeVO",
			"displayName": "CreatePerferTimeVO",
			"source": "BODY",
			"path": "",
			"type": "com.asiainfo.crm.cm.vo.CreatePerferTimeVO",
			"required": true,
			"defaultValue": "",
			"description": "保存客户偏好时间",
			"exampleValue": "{\\r\\n\\t\\"custId\\": \\"23210012156707\\",\\r\\n\\t\\"preferChannelId\\": \\"110000021413\\",\\r\\n\\t\\"custPerferInfoVOList\\": [\\r\\n\\t\\t{\\r\\n\\t\\t\\t\\"timeType\\": \\"3\\",\\r\\n\\t\\t\\t\\"remarks\\": \\"Order Ticket Handling\\",\\r\\n\\t\\t\\t\\"prior\\": \\"1\\",\\r\\n\\t\\t\\t\\"timeBeginUnit\\": \\"0\\",\\r\\n\\t\\t\\t\\"timeEndUnit\\": \\"3\\"\\r\\n\\t\\t}\\r\\n\\t]\\r\\n}"
		}
	]
}
		', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '116';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('116', '保存偏好时间', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'saveCustPrefeTime', '{
	"paramDefinitions": [
		{
			"name": "preferTimeVO",
			"argName": "arg0",
			"type": "com.asiainfo.crm.cm.vo.CreatePerferTimeVO"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '116';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('116', 'SAVE_CUST_PREFERANCETIME', '116', '116', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '117';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('117', 'KOB tt 查询', 'query kob tt', NULL, '/api', '/cm/kobTT/query', 'GET', 'KOB tt 查询', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "custId",
			"exampleValue": ""
		},
		{
			"name": "SrcType",
			"displayName": "SrcType",
			"source": "QUERY",
			"path": "SrcType",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "SrcType",
			"exampleValue": ""
		},
		{
			"name": "errorCode",
			"displayName": "errorCode",
			"source": "QUERY",
			"path": "errorCode",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "errorCode",
			"exampleValue": ""
		},
		{
			"name": "strDate",
			"displayName": "strDate",
			"source": "QUERY",
			"path": "strDate",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "strDate",
			"exampleValue": ""
		},
		{
			"name": "endDate",
			"displayName": "endDate",
			"source": "QUERY",
			"path": "endDate",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "endDate",
			"exampleValue": ""
		},
		{
			"name": "start",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},
		{
			"name": "end",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": true
		}
	]
}
		', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETCmTicketInfo001', NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '117';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('117', '查询kob tt', 'APPFRAME', 'com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.ICs2CmSV', 'queryTicketListForCm', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"type": "String",
			"argName": "arg0"
		},
		{
			"name": "SrcType",
			"type": "String",
			"argName": "arg1"
		},
		{
			"name": "errorCode",
			"type": "String",
			"argName": "arg2"
		},
		{
			"name": "strDate",
			"type": "String",
			"argName": "arg3"
		},
		{
			"name": "endDate",
			"type": "String",
			"argName": "arg4"
		},
		{
			"name": "start",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"argName": "arg5"
		},
		{
			"name": "end",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"argName": "arg6"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '117';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('117', 'QUERY_KOBTT', '117', '117', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '118';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('118', 'KOB tt 查询总数', 'count kob tt', NULL, '/api', '/cm/kobTT/count', 'GET', 'KOB tt 查询总数', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "custId",
			"exampleValue": ""
		},
		{
			"name": "SrcType",
			"displayName": "SrcType",
			"source": "QUERY",
			"path": "SrcType",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "SrcType",
			"exampleValue": ""
		},
		{
			"name": "errorCode",
			"displayName": "errorCode",
			"source": "QUERY",
			"path": "errorCode",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "errorCode",
			"exampleValue": ""
		},
		{
			"name": "strDate",
			"displayName": "strDate",
			"source": "QUERY",
			"path": "strDate",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "strDate",
			"exampleValue": ""
		},
		{
			"name": "endDate",
			"displayName": "endDate",
			"source": "QUERY",
			"path": "endDate",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "endDate",
			"exampleValue": ""
		}
	]
}
		', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '118';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('118', '查询kob tt 总数', 'APPFRAME', 'com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.ICs2CmSV', 'queryTicketListCountForCm', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"type": "String",
			"argName": "arg0"
		},
		{
			"name": "SrcType",
			"type": "String",
			"argName": "arg1"
		},
		{
			"name": "errorCode",
			"type": "String",
			"argName": "arg2"
		},
		{
			"name": "strDate",
			"type": "String",
			"argName": "arg3"
		},
		{
			"name": "endDate",
			"type": "String",
			"argName": "arg4"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '118';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('118', 'COUNT_KOBTT', '118', '118', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '119';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('119', '查询客户组织', 'query cust org', NULL, '/api', '/cm/custOrg/query/{deptId}', 'GET', '查询客户组织。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "deptId",
      "displayName": "deptId",
      "source": "PATH",
      "path": "deptId",
      "type": "long",
      "required": true,
      "defaultValue": "",
      "description": "部门ID",
      "exampleValue": "410001940838"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', NULL, NULL, '2025-12-03 14:56:02', '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '119';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('119', 'query cust org', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryCustOrganizeById', '{
	"paramDefinitions": [
		{
			"name": "deptId",
			"type": "long",
			"argName": "arg0"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '119';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('119', 'QUERY_CUST_ORG', '119', '119', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '120';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('120', '校验是否有子部门', 'check organize', NULL, '/api', '/cm/custOrg/check', 'GET', '校验是否有子部门', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "deptId",
			"displayName": "deptId",
			"source": "QUERY",
			"path": "deptId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "deptId",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '120';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('120', '校验是否有子部门', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'checkGroupDeptParent', '{
	"paramDefinitions": [
		{
			"name": "deptId",
			"type": "long",
			"argName": "arg0"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '120';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('120', 'CHECK_CUST_ORG', '120', '120', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '121';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('121', '获取TT详情链接', 'get tt detail page url', NULL, '/api', '/cm/kobTT/queryUrl', 'GET', '获取TT详情页面URL。该方法根据租户ID从静态数据中获取TT详情页面的URL配置
返回信息:
TT详情页面URL字符串', NULL, NULL, NULL, '{
	"paramDefinitions": [
		
	]
}
		', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '121';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('121', 'get tt detail page url', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'getTTDetailPageUrl', '{
	"paramDefinitions": [
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '121';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('121', 'QUERY_KOBTT_PAGEURL', '121', '121', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '122';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('122', '校验是否同名', 'check same name', NULL, '/api', '/cm/custOrg/checkSameName', 'GET', '校验是否同名', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "custId",
			"exampleValue": ""
		},{
			"name": "deptName",
			"displayName": "deptName",
			"source": "QUERY",
			"path": "deptName",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "deptName",
			"exampleValue": ""
		}
	]
}
	', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '122';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('122', '校验是否同名', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'checkDeptName', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"type": "long",
			"argName": "arg0"
		},{
			"name": "deptName",
			"type": "String",
			"argName": "arg1"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '122';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('122', 'CHECK_SAME_NAME', '122', '122', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '123';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('123', '查询用户party信息', 'get partyInfo for user', NULL, '/api', '/cm/userPartyInfo/query', 'GET', '查询用户party信息', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "partyName",
			"displayName": "partyName",
			"source": "QUERY",
			"path": "partyName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "partyName",
			"exampleValue": ""
		},
		{
			"name": "certType",
			"displayName": "certType",
			"source": "QUERY",
			"path": "certType",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "certType",
			"exampleValue": ""
		},
		{
			"name": "certCode",
			"displayName": "certCode",
			"source": "QUERY",
			"path": "certCode",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "certCode",
			"exampleValue": ""
		},
		{
			"name": "cvr",
			"displayName": "cvr",
			"source": "QUERY",
			"path": "cvr",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "cvr",
			"exampleValue": ""
		},
		{
			"name": "firstName",
			"displayName": "firstName",
			"source": "QUERY",
			"path": "firstName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "firstName",
			"exampleValue": ""
		},
		{
			"name": "lastName",
			"displayName": "lastName",
			"source": "QUERY",
			"path": "lastName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "lastName",
			"exampleValue": ""
		},
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "custId",
			"exampleValue": ""
		},
		{
			"name": "partyId",
			"displayName": "partyId",
			"source": "QUERY",
			"path": "partyId",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "partyId",
			"exampleValue": ""
		},
		{
			"name": "start",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},
		{
			"name": "end",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETCmPartyInfoNew001', NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '123';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('123', 'get partyInfo for user', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmPartySV', 'queryPartyInfoForUser', '{
	"paramDefinitions": [
		{
			"name": "partyName",
			"type": "String",
			"argName": "arg0"
		},
		{
			"name": "certType",
			"type": "String",
			"argName": "arg1"
		},
		{
			"name": "certCode",
			"type": "String",
			"argName": "arg2"
		},
		{
			"name": "cvr",
			"type": "String",
			"argName": "arg3"
		},
		{
			"name": "firstName",
			"type": "String",
			"argName": "arg4"
		},
		{
			"name": "lastName",
			"type": "String",
			"argName": "arg5"
		},
		{
			"name": "custId",
			"type": "String",
			"argName": "arg6"
		},
		{
			"name": "partyId",
			"type": "String",
			"argName": "arg7"
		},
		{
			"name": "start",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"argName": "arg8"
		},
		{
			"name": "end",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"argName": "arg9"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '123';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('123', 'QUERY_USER_PARTYINFO', '123', '123', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '124';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('124', '查询客户下的用户总数', 'count user for cust', NULL, '/api', '/cm/userPartyInfo/count', 'GET', '查询客户下的用户总数', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "partyName",
			"displayName": "partyName",
			"source": "QUERY",
			"path": "partyName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "partyName",
			"exampleValue": ""
		},
		{
			"name": "certType",
			"displayName": "certType",
			"source": "QUERY",
			"path": "certType",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "certType",
			"exampleValue": ""
		},
		{
			"name": "certCode",
			"displayName": "certCode",
			"source": "QUERY",
			"path": "certCode",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "certCode",
			"exampleValue": ""
		},
		{
			"name": "cvr",
			"displayName": "cvr",
			"source": "QUERY",
			"path": "cvr",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "cvr",
			"exampleValue": ""
		},
		{
			"name": "firstName",
			"displayName": "firstName",
			"source": "QUERY",
			"path": "firstName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "firstName",
			"exampleValue": ""
		},
		{
			"name": "lastName",
			"displayName": "lastName",
			"source": "QUERY",
			"path": "lastName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "lastName",
			"exampleValue": ""
		},
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "custId",
			"exampleValue": ""
		},
		{
			"name": "partyId",
			"displayName": "partyId",
			"source": "QUERY",
			"path": "partyId",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "partyId",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '124';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('124', 'count user for cust', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmPartySV', 'queryPartyInfoForUserCount', '{
	"paramDefinitions": [
		{
			"name": "partyName",
			"type": "String",
			"argName": "arg0"
		},
		{
			"name": "certType",
			"type": "String",
			"argName": "arg1"
		},
		{
			"name": "certCode",
			"type": "String",
			"argName": "arg2"
		},
		{
			"name": "cvr",
			"type": "String",
			"argName": "arg3"
		},
		{
			"name": "firstName",
			"type": "String",
			"argName": "arg4"
		},
		{
			"name": "lastName",
			"type": "String",
			"argName": "arg5"
		},
		{
			"name": "custId",
			"type": "String",
			"argName": "arg6"
		},
		{
			"name": "partyId",
			"type": "String",
			"argName": "arg7"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '124';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('124', 'COUNT_CUST_USER', '124', '124', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '125';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('125', '查询用户使用者', 'query user', NULL, '/api', '/cm/userInfo/query', 'GET', '查询用户使用者', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "custId",
			"exampleValue": ""
		},
		{
			"name": "start",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},
		{
			"name": "end",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETCmInsCmrel001', NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '125';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('125', 'query user', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryCmInsCmrel', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"type": "long",
			"argName": "arg0"
		},
		{
			"name": "start",
			"type": "int",
			"argName": "arg1",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum"
		},
		{
			"name": "end",
			"type": "int",
			"argName": "arg2",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '125';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('125', 'QUERY_USER', '125', '125', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '126';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('126', '查询用户使用者总数', 'count user', NULL, '/api', '/cm/userInfo/count', 'GET', '查询用户使用者总数', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "custId",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '126';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('126', 'count user', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryCmInsCmrelCount', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"type": "long",
			"argName": "arg0"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '126';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('126', 'COUNT_USER', '126', '126', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '127';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('127', '查询custview 树形', 'query custView tree', NULL, '/api', '/cm/custView/query', 'POST', '查询custview 树形', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "params",
			"displayName": "params",
			"source": "BODY",
			"path": "",
			"type": "com.asiainfo.crm.cm.vo.QueryCustViewTreeVo",
			"required": true,
			"defaultValue": "",
			"description": "查询custview 树形",
			"exampleValue": "{\\r\\n    \\"params\\": {\\r\\n        \\"custId\\": \\"23210012156707\\",\\r\\n        \\"custName\\": \\"yqrtest1225\\",\\r\\n        \\"custServiceId\\": \\"\\",\\r\\n        \\"allEditFlag\\": \\"N\\",\\r\\n        \\"partyId\\": \\"110000637785\\",\\r\\n        \\"businessId\\": \\"2000000001\\"\\r\\n    }\\r\\n}"
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '127';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('127', 'query custView tree', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerViewBFImpl', 'init', '{
	"paramDefinitions": [
		{
			"name": "params",
			"argName": "arg0",
			"type": "com.asiainfo.crm.cm.vo.QueryCustViewTreeVo"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '127';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('127', 'GET_CUSTVIEW_TREE', '127', '127', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '128';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('128', '查询custId', 'query custId', NULL, '/api', '/cm/party/queryCustId/{partyId}', 'GET', '根据参与人ID获取客户ID。该方法接收参与人ID，调用参与人服务查询该参与人对应的客户ID。如果查询到客户ID大于0，则返回成功标志和客户ID，否则返回成功标志和空客户ID
返回信息:
包含查询结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"custId"（客户ID字符串，查询不到时为空字符串）和"retMsg"（异常信息，仅在失败时存在）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "partyId", "path": "partyId", "type": "String", "source": "PATH", "required": true, "description": "参与人ID，用于查询该参与人对应的客户ID", "displayName": "partyId", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'party', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '128';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('128', 'query custID', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.UserBFImpl', 'getCustId', '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"argName": "arg0",
			"type": "String"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '128';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('128', 'QUERY_CUSTID', '128', '128', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '129';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('129', '保存使用者', 'save user', NULL, '/api', '/cm/party/saveInsUser', 'POST', '保存实例用户信息。该方法接收实例用户VO对象，从用户信息数组中提取区域ID，如果区域ID不为空则设置中心信息为区域ID，然后调用客户服务处理号码分配，将用户信息分配给指定客户
返回信息:
包含操作结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）和"retMsg"（异常信息，仅在失败时存在）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "insUserVO", "path": "", "type": "com.asiainfo.crm.cm.vo.InsUserVO", "source": "BODY", "required": true, "description": "实例用户VO对象，包含客户ID、用户信息数组和拥有者客户ID等信息，用于保存实例用户和分配号码", "displayName": "insUserVO", "defaultValue": "", "exampleValue": "{\\r\\n\\t\\t\\"custId\\": \\"21210517759226\\",\\r\\n\\t\\t\\"ownerCustId\\": \\"23210012156707\\",\\r\\n\\t\\t\\"userInfos\\": [\\r\\n\\t\\t\\t\\"42100130127122,30014,2100,171000000001,1,0000000000000000000000000000000000000000000000000000000000000000,23210012156707\\"\\r\\n\\t\\t]\\r\\n\\t}"}]}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '129';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('129', 'save insUser', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.UserBFImpl', 'saveInsUser', '{
	"paramDefinitions": [
		{
			"name": "insUserVO",
			"argName": "arg0",
			"type": "com.asiainfo.crm.cm.vo.InsUserVO"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '129';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('129', 'SAVE_INSUSER', '129', '129', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '130';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('130', '查询客户组织', 'query cust org', NULL, '/api', '/cm/customer/queryCustOrg', 'GET', '查询客户组织', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "查询客户组织",
			"exampleValue": ""
		},
		{
			"name": "start",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},
		{
			"name": "end",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETGroupContact001', NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '130';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('130', 'query cust org', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryCustOrganizesByCustId', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		},
		{
			"name": "start",
			"type": "int",
			"argName": "arg1",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum"
		},
		{
			"name": "end",
			"type": "int",
			"argName": "arg2",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '130';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('130', 'QUERY_CUSTORG', '130', '130', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '131';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('131', '查询客户组织总数', 'count cust org', NULL, '/api', '/cm/customer/countCustOrg', 'GET', '查询客户组织总数', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "查询客户组织总数",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '131';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('131', 'count cust org', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryCustOrganizeCountByCustId', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '131';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('131', 'COUNT_CUSTORG', '131', '131', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '132';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('132', 'getCustInfoByBillId', 'getCustInfoByBillId', NULL, '/api', '/cm/service/getCustInfoByBillId', 'GET', '根据账单ID获取客户信息。该方法接收账单ID，调用客户服务查询客户简单信息，返回客户ID和客户名称
返回信息:
包含客户信息的Map，key包括"KEY_RSLT_VAL"（"DO_SUCC"表示成功，"DO_FAIL"表示失败）、"KEY_RSLT_MSG"（失败时的错误消息）、"CUST_ID"（客户ID）、"CUST_NAME"（客户名称）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "billId", "path": "billId", "type": "String", "source": "QUERY", "required": true, "description": "账单ID，用于查询客户信息", "displayName": "billId", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'tt', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '132';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('132', 'getCustInfoByBillId', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'getCustInfoByBillId', '{
	"paramDefinitions": [
		{
			"name": "billId",
			"argName": "arg0",
			"type": "String"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '132';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('132', 'GET_CUSTINFO_BY_BILLID_132', '132', '132', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '136';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('136', '查询用户使用者', 'query user', NULL, '/api', '/cm/user/query', 'GET', '查询用户使用者', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "userId",
			"displayName": "userId",
			"source": "QUERY",
			"path": "userId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "userId",
			"exampleValue": ""
		},
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "custId",
			"exampleValue": ""
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETCmInsCmrel001', NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '136';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('136', 'query user', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryCmInsCmrel', '{
	"paramDefinitions": [
		{
			"name": "userId",
			"type": "long",
			"argName": "arg0"
		},
		{
			"name": "custId",
			"type": "long",
			"argName": "arg1"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '136';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('136', 'QUERY_USER_136', '136', '136', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '146';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('146', 'getCustSegmentById', 'getCustSegmentById', NULL, '/api', '/cm/customers/{custId}/identifications', 'GET', '根据客户ID获取客户细分。该方法接收客户ID，查询客户信息，返回客户细分ID、客户代码和税号
返回信息:
包含客户细分信息的Map，key包括"custSeg"（客户细分ID）、"custCode"（客户代码）、"taxId"（税号）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "long", "source": "PATH", "required": true, "description": "客户ID，用于查询客户细分信息", "displayName": "custId", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'agr', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '146';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('146', 'getCustSegmentById', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'getCustSegmentById', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"type": "long",
			"argName": "arg0"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '146';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('146', 'GET_CUST_SEGMENT_BY_ID_146', '146', '146', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '2';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('2', '创建B2B客户', 'create b2b customer', NULL, '/api', '/cm/b2b/customer', 'POST', '创建B2B客户', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "createVO",
			"displayName": "createVO",
			"source": "BODY",
			"path": "",
			"type": "java.util.Map",
			"required": true,
			"defaultValue": "",
			"description": "创建B2B客户的数据对象",
			"exampleValue": "{\\"cmxGroupCustomer\\":{\\"taxId\\":\\"1123\\",\\"preferredPlatform\\":\\"CloudPBX\\",\\"directMarketingProtection\\":\\"0\\",\\"protectEffDate\\":\\"2025-03-06 12:00:00\\",\\"protectExpireDate\\":\\"2025-03-11 12:00:00\\",\\"taxFlag\\":\\"3\\",\\"ext17\\":\\"12312313\\",\\"corporateIdentificationNumbe\\":\\"\\",\\"legalForm\\":\\"APS\\",\\"biCompanyName\\":\\"551\\",\\"formerName\\":\\"1312\\",\\"headOffice\\":\\"231233\\",\\"ext5\\":\\"131231\\",\\"ext6\\":\\"2312312\\",\\"ext7\\":\\"312312312\\"},\\"cmGroupAccounting\\":{\\"ratingCode\\":\\"3\\",\\"fiscalYear\\":\\"2\\",\\"revenue\\":\\"1\\",\\"lastYearEmployees\\":\\"1\\",\\"accountRemark\\":\\"2\\"},\\"cmGroupManager\\":{\\"managerId\\":100000763,\\"staffName\\":\\"NO SEGMENT1TSM\\",\\"contEmail\\":\\"33@qq.com\\",\\"operType\\":\\"0\\",\\"relType\\":\\"1\\"},\\"cmIdentification\\":{\\"idenNr\\":\\"3132\\"},\\"opId\\":100000032,\\"custId\\":23210318304689,\\"partyId\\":110006622157,\\"custType\\":\\"3\\",\\"custStatus\\":\\"0\\",\\"createDate\\":\\"2025-03-12 15:18:19\\",\\"doneDate\\":\\"2025-03-12 15:18:19\\",\\"expireDate\\":\\"2099-12-31 08:00:00\\",\\"custCertType\\":\\"17\\",\\"perferLanguage\\":\\"1\\",\\"ext22\\":\\"0\\",\\"groupType\\":\\"2\\",\\"taxFlag\\":\\"1\\",\\"custName\\":\\"冯志\\",\\"groupSegmentId\\":200000000000,\\"custSegment\\":200000000000,\\"segmentName\\":\\"NO_SEGMENT\\",\\"allowInheritable\\":1,\\"allowRevisable\\":1,\\"allowCreditCalculated\\":1,\\"allowApprovable\\":0,\\"developType\\":\\"2\\",\\"custZipcode\\":\\"3322\\",\\"shortName\\":\\"Short Name\\",\\"staffAmount\\":\\"\\",\\"custServiceLevel\\":\\"0\\",\\"groupSubType\\":1,\\"regAmount\\":\\"100\\",\\"custPassword\\":\\"4141213123\\",\\"creditLevel\\":\\"6\\",\\"creditValue\\":\\"11\\",\\"groupWeb\\":\\"12312312\\",\\"remarks\\":\\"3123123\\"}"
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '2';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('2', '创建B2B客户', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'saveGroupCustomer', '{
	"paramDefinitions": [
		{
			"name": "createVO",
			"argName": "arg0",
			"type": "java.util.Map"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '2';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('2', 'CREATE_B2B_CUSTOMER', '2', '2', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '200';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('200', '是否只能查看客户信息', 'if only can view customer', NULL, '/api', '/cm/customer/if-only-can-view', 'GET', '是否只能查看客户信息', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "long",
			"required": true
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, '2025-03-31 16:15:39', NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '200';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('200', '是否只能查看客户信息', 'APPFRAME', 'com.asiainfo.crm.cm.common.service.interfaces.ICmCommonSV', 'queryIfOnlyCanViewCustomer', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-03-31 16:12:01', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '200';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('200', 'IF_ONLY_CAN_VIEW_CUSTOMER', '200', '200', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '2000';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('2000', '查询参与人列表', 'queryPartyList', NULL, '/api', '/cm/service/ICmDkCustomerSV/queryPartyList', 'POST', '查询参与人列表。该方法接收查询参与人VO和分页参数，提取查询条件（参与人类型、参与人名称、名字、姓氏、证件类型、证件代码、地址ID、参与人ID），构建XML查询参数，调用丹麦客户服务查询参与人列表
返回信息:
DataContainer数组，包含符合查询条件的参与人信息列表', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "queryCmPartyVO", "path": "", "type": "com.asiainfo.crm.cm.vo.QueryCmPartyVO", "source": "BODY", "required": true, "description": "查询参与人VO，包含查询条件（参与人类型、参与人名称、名字、姓氏、证件类型、证件代码、地址ID、参与人ID），用于查询参与人列表", "displayName": "queryCmPartyVO"}, {"name": "startNum", "path": "pageNum", "type": "int", "source": "QUERY", "required": true, "description": "起始索引，用于分页查询", "displayName": "pageNum", "handlerClass": "com.aie.api.tool.PageTool:getStartNum"}, {"name": "endNum", "path": "pageSize", "type": "int", "source": "QUERY", "required": true, "description": "结束索引，用于分页查询", "displayName": "pageSize", "handlerClass": "com.aie.api.tool.PageTool:getEndNum"}]}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'party', 'SETCmPartyInfoDK001', '2025-05-09 17:31:55', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '2000';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('2000', '查询参与者列表', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.PartyBFImpl', 'queryPartyList', '{
	"paramDefinitions": [
		{
			"name": "queryCmPartyVO",
			"argName": "arg0",
			"type": "com.asiainfo.crm.cm.vo.QueryCmPartyVO"
		},{
			"name": "startNum",
			"argName": "arg1",
			"type": "int"
		},{
			"name": "endNum",
			"argName": "arg2",
			"type": "int"
		}
	]
}', NULL, NULL, '2025-05-09 17:31:29', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '2000';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('2000', 'QUERY_PARTY_LIST', '2000', '2000', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '2001';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('2001', '查询参与人列表count', 'queryPartyListCount', NULL, '/api', '/cm/service/ICmDkCustomerSV/queryPartyListCount', 'POST', '查询参与人列表数量。该方法接收查询参与人VO，提取查询条件，构建XML查询参数，调用丹麦客户服务查询符合条件的参与人总数
返回信息:
符合条件的参与人总数，int类型', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "queryCmPartyVO", "path": "", "type": "com.asiainfo.crm.cm.vo.QueryCmPartyVO", "source": "BODY", "required": true, "description": "查询参与人VO，包含查询条件，用于查询参与人总数", "displayName": "queryCmPartyVO"}]}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'party', NULL, '2025-05-12 10:49:57', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '2001';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('2001', '查询参与者列表count', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.PartyBFImpl', 'queryPartyListCount', '{
	"paramDefinitions": [
		{
			"name": "queryCmPartyVO",
			"argName": "arg0",
			"type": "com.asiainfo.crm.cm.vo.QueryCmPartyVO"
		}
	]
}', NULL, NULL, '2025-05-12 10:48:25', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '2001';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('2001', 'QUERY_PARTY_LIST_COUNT', '2001', '2001', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '2002';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('2002', '查询支付者信息', 'queryPayerView', NULL, '/api', '/cm/service/ICmDkCustomerSV/queryPayerView', 'POST', '查询支付者信息', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"displayName": "partyId",
			"source": "BODY",
			"path": "partyId",
			"type": "long",
			"required": true
		},{
			"name": "custId",
			"displayName": "custId",
			"source": "BODY",
			"path": "custId",
			"type": "long",
			"required": false
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'party', 'SETCmPartyInfo001', '2025-05-19 11:36:09', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '2002';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('2002', '查询支付者信息', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV', 'queryPayerView', '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"argName": "arg0",
			"displayName": "partyId",
			"type": "long"
		},{
			"name": "custId",
			"argName": "arg1",
			"displayName": "custId",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-05-19 11:39:08', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '2002';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('2002', 'QUERY_PAYER_VIEW', '2002', '2002', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '2003';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('2003', '查询支付者账户列表', 'queryPayerAccts', NULL, '/api', '/cm/service/ICmAccountSV/queryPayerAccts', 'POST', '查询支付者账户列表', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"displayName": "partyId",
			"source": "BODY",
			"path": "partyId",
			"type": "long",
			"required": true
		},{
			"name": "startIndex",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},{
			"name": "endIndex",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'party', 'SETCmAccount001', '2025-05-19 14:10:36', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '2003';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('2003', '查询支付者账户列表', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmAccountSV', 'queryPayerAccts', '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"argName": "arg0",
			"displayName": "partyId",
			"type": "long"
		},{
			"name": "startIndex",
			"argName": "arg1",
			"displayName": "pageNum",
			"type": "int"
		},{
			"name": "endIndex",
			"argName": "arg2",
			"displayName": "pageSize",
			"type": "int"
		}
	]
}', NULL, NULL, '2025-05-19 14:11:26', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '2003';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('2003', 'QUERY_PAYER_ACCTS', '2003', '2003', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '2004';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('2004', '查询支付者账户列表count', 'queryPayerAcctsCount', NULL, '/api', '/cm/service/ICmAccountSV/queryPayerAcctsCount', 'POST', '查询支付者账户列表count', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"displayName": "partyId",
			"source": "BODY",
			"path": "partyId",
			"type": "long",
			"required": true
		}
	]
}', NULL, NULL, NULL, 'cm', 'party', NULL, '2025-05-19 14:13:22', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '2004';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('2004', '查询支付者账户列表count', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmAccountSV', 'queryPayerAcctsCount', '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"argName": "arg0",
			"displayName": "partyId",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-05-19 14:14:04', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '2004';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('2004', 'QUERY_PAYER_ACCTS_COUNT', '2004', '2004', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '2005';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('2005', '根据PartyId，查询所有关联的b2b客户', 'queryCustConByPartyIdForPage', NULL, '/api', '/cm/service/ICmContactSV/queryCustConByPartyIdForPage', 'POST', '根据PartyId，查询所有关联的b2b客户', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"displayName": "partyId",
			"source": "BODY",
			"path": "partyId",
			"type": "long",
			"required": true
		},{
			"name": "start",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},{
			"name": "end",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'party', 'SETCmGroupContact001', '2025-05-28 09:50:55', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '2005';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('2005', '根据PartyId，查询所有关联的b2b客户', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmContactSV', 'queryCustConByPartyIdForPage', '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"argName": "arg0",
			"displayName": "partyId",
			"type": "long"
		},{
			"name": "start",
			"argName": "arg1",
			"displayName": "pageNum",
			"type": "int"
		},{
			"name": "end",
			"argName": "arg2",
			"displayName": "pageSize",
			"type": "int"
		}
	]
}', NULL, NULL, '2025-05-28 09:52:01', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '2005';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('2005', 'QUERY_CUSTOMER_CONTACT_BY_PARTYID_PAGE', '2005', '2005', '1', 'METHOD', 'N', '2025-05-28 09:53:34', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '2006';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('2006', '根据PartyId，查询所有关联的b2b客户count', 'queryCustConCountByPartyId', NULL, '/api', '/cm/service/ICmContactSV/queryCustConCountByPartyId', 'POST', '根据PartyId，查询所有关联的b2b客户count', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"displayName": "partyId",
			"source": "BODY",
			"path": "partyId",
			"type": "long",
			"required": true
		}
	]
}', NULL, NULL, NULL, 'cm', 'party', NULL, '2025-05-28 09:57:57', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '2006';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('2006', '根据PartyId，查询所有关联的b2b客户count', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmContactSV', 'queryCustConCountByPartyId', '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"argName": "arg0",
			"displayName": "partyId",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-05-28 09:58:59', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '2006';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('2006', 'QUERY_CUSTOMER_CONTACT_BY_PARTYID_COUNT', '2006', '2006', '1', 'METHOD', 'N', '2025-05-28 10:00:24', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '201';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('201', '获取新的客户ID', 'get new customer id', NULL, '/api', '/cm/customer/id', 'GET', '获取新的客户ID', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custType",
			"displayName": "custType",
			"source": "QUERY",
			"path": "custType",
			"type": "int",
			"required": true,
			"defaultValue": "",
			"description": "客户类型"
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '201';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('201', '获取新的客户ID', 'APPFRAME', 'com.asiainfo.crm.cm.common.service.interfaces.ICmCommonSV', 'getCustId', '{
	"paramDefinitions": [
		{
			"name": "custType",
			"argName": "arg0",
			"type": "int"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '201';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('201', 'GET_NEW_CUST_ID', '201', '201', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '202';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('202', '查询客户信息', 'query DK customer', NULL, '/api', '/cm/customer/{custId}', 'GET', '查询客户信息', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "客户ID"
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', NULL, '2025-04-01 09:57:46', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '202';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('202', '查询客户信息', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryDKCustomer', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '202';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('202', 'QUERY_DK_CUSTOMER', '202', '202', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '203';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('203', '获取新的参与者ID', 'get new party id', NULL, '/api', '/cm/party/id', 'GET', '获取新的参与人ID。该方法调用通用服务生成新的参与人序列ID
返回信息:
新的参与人ID，Long类型', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cm', 'party', NULL, '2025-04-01 10:15:42', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '203';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('203', '获取新的参与者ID', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.PartyBFImpl', 'getPartyId', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '203';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('203', 'GET_NEW_PARTY_ID', '203', '203', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '204';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('204', '查询客户扩展信息', 'query customer ext', NULL, '/api', '/cm/customer/{custId}/ext', 'GET', '查询客户扩展信息。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "custId",
      "displayName": "custId",
      "source": "PATH",
      "path": "custId",
      "type": "long",
      "required": true,
      "defaultValue": "",
      "description": "客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作",
      "exampleValue": "23210517915222"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETCmLnGroupCustExt001', '2025-04-01 10:28:43', '2025-12-03 15:54:45', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '204';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('204', '客户扩展信息查询', 'APPFRAME', 'com.asiainfo.crm.cm.ln.customer.group.service.interfaces.ICmLnGroupSV', 'queryGroupCustExtByIdAndLog', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '204';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('204', 'QUERY_CUSTOMER_EXT', '204', '204', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '205';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('205', '客户基本信息查询', 'query customer detail', NULL, '/api', '/cm/customer/{custId}/detail', 'GET', '客户基本信息查询。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "custId",
      "displayName": "custId",
      "source": "PATH",
      "path": "custId",
      "type": "long",
      "required": true,
      "defaultValue": "",
      "description": "客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作",
      "exampleValue": "23210619756422"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETCustomer001', '2025-04-01 11:03:11', '2025-12-02 15:55:45', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '205';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('205', '客户基本信息查询', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryCustomerMaskByCustIdAndLog', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-01 11:06:27', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '205';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('205', 'QUERY_CUSTOMER_DETAIL', '205', '205', '1', 'METHOD', 'N', '2025-04-01 11:07:53', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '206';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('206', 'B2B客户行业信息查询', 'query customer industry page', NULL, '/api', '/cm/customer/{custId}/industry/page', 'GET', 'B2B客户行业信息查询', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "客户ID"
		},{
			"name": "start",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},{
			"name": "end",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'industry', 'SETCmGroupRelIndustry002', '2025-04-01 11:13:58', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '206';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('206', 'B2B客户行业信息查询', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryGroupIndustryForPage', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		},{
			"name": "start",
			"argName": "arg1",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"type": "int"
		},{
			"name": "end",
			"argName": "arg2",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"type": "int"
		}
	]
}', NULL, NULL, '2025-04-01 11:15:21', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '206';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('206', 'QUERY_CUSTOMER_INDUSTRY_PAGE', '206', '206', '1', 'METHOD', 'N', '2025-04-01 11:15:58', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '207';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('207', 'B2B客户行业信息查询count', 'query customer industry count', NULL, '/api', '/cm/customer/{custId}/industry/count', 'GET', 'B2B客户行业信息查询count', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "客户ID"
		}
	]
}', NULL, NULL, NULL, 'cm', 'industry', NULL, '2025-04-01 11:29:38', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '207';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('207', 'B2B客户行业总数查询', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryGroupIndustryCount', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-01 14:07:24', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '207';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('207', 'QUERY_CUSTOMER_INDUSTRY_COUNT', '207', '207', '1', 'METHOD', 'N', '2025-04-01 14:08:10', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '208';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('208', 'B2B客户经理信息查询', 'query customer manage page', NULL, '/api', '/cm/customer/{custId}/manager/page', 'GET', 'B2B客户经理信息查询。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "custId",
      "displayName": "custId",
      "source": "PATH",
      "path": "custId",
      "type": "long",
      "required": true,
      "defaultValue": "",
      "description": "客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作",
      "exampleValue": "23210517915222"
    },
    {
      "name": "startNum",
      "displayName": "pageNum",
      "source": "QUERY",
      "path": "pageNum",
      "type": "int",
      "handlerClass": "com.aie.api.tool.PageTool:getStartNum",
      "required": true,
      "description": "分页起始位置，用于分页查询。表示从第几条记录开始返回，从0开始计数",
      "exampleValue": "1"
    },
    {
      "name": "endNum",
      "displayName": "pageSize",
      "source": "QUERY",
      "path": "pageSize",
      "type": "int",
      "handlerClass": "com.aie.api.tool.PageTool:getEndNum",
      "required": true,
      "description": "分页结束位置，用于分页查询。表示返回到第几条记录为止（不包含该位置）",
      "exampleValue": "10"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'manager', 'SETCmCustManager001', '2025-04-01 14:15:59', '2025-12-02 15:20:41', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '208';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('208', 'B2B客户经理信息查询', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryAllCustMgrsByCustId', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		},{
			"name": "startNum",
			"argName": "arg1",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"type": "int"
		},{
			"name": "endNum",
			"argName": "arg2",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"type": "int"
		}
	]
}', NULL, NULL, '2025-04-01 14:10:39', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '208';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('208', 'QUERY_CUSTOMER_MANAGER_PAGE', '208', '208', '1', 'METHOD', 'N', '2025-04-01 14:11:41', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '209';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('209', '客户经理总数查询count', 'query customer manage count', NULL, '/api', '/cm/customer/{custId}/manager/count', 'GET', '查询客户经理总数。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "custId",
      "displayName": "custId",
      "source": "PATH",
      "path": "custId",
      "type": "long",
      "required": true,
      "defaultValue": "",
      "description": "客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作",
      "exampleValue": "23210517915222"
    }
  ]
}', NULL, NULL, NULL, 'cm', 'manager', NULL, '2025-04-01 14:17:34', '2025-12-03 16:13:08', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '209';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('209', '客户经理总数查询', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryCustManagerCountByCustId', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-01 14:21:32', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '209';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('209', 'QUERY_CUSTOMER_MANAGER_COUNT', '209', '209', '1', 'METHOD', 'N', '2025-04-01 14:23:30', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '210';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('210', '查询认证信息表单', 'query identification', NULL, '/api', '/cm/identification/list', 'GET', '查询认证信息表单。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "partyId",
      "displayName": "partyId",
      "source": "QUERY",
      "path": "partyId",
      "type": "long",
      "description": "实体唯一标识，既可代表组织（B2B场景），也可代表个人（B2C场景），用于建立实体级关联关系",
      "exampleValue": "110008089692"
    },
    {
      "name": "idenType",
      "displayName": "idenType",
      "source": "QUERY",
      "path": "idenType",
      "type": "int",
      "description": "识别类型",
      "exampleValue": "5"
    },
    {
      "name": "idenCode",
      "displayName": "idenCode",
      "source": "QUERY",
      "path": "idenCode",
      "type": "String",
      "description": "识别码",
      "exampleValue": ""
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'identification', 'SETCmIdentification001', '2025-04-01 14:32:03', '2025-12-03 16:02:52', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '210';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('210', '查询认证信息表单', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV', 'queryCustIdentifications', '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"argName": "arg0",
			"type": "long"
		},{
			"name": "idenType",
			"argName": "arg1",
			"type": "int"
		},{
			"name": "idenCode",
			"argName": "arg2",
			"type": "String"
		}
	]
}', NULL, NULL, '2025-04-01 14:33:44', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '210';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('210', 'QUERY_IDENTIFICATION_LIST', '210', '210', '1', 'METHOD', 'N', '2025-04-01 14:34:05', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '211';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('211', '账户数据信息查询', 'query customer accounting detail', NULL, '/api', '/cm/customer/{custId}/accounting/detail', 'GET', '账户数据信息查询。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "custId",
      "displayName": "custId",
      "source": "PATH",
      "path": "custId",
      "type": "long",
      "required": true,
      "description": "客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作",
      "exampleValue": "23210517915222"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'accounting', 'SETCmGroupAccounting001', '2025-04-01 14:59:46', '2025-12-03 15:59:42', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '211';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('211', '账户数据信息查询', 'APPFRAME', 'com.asiainfo.crm.cm.ln.customer.group.service.interfaces.ICmLnGroupSV', 'queryGroupAccountingById', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-01 15:01:58', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '211';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('211', 'QUERY_CUSTOMER_ACCOUNTING_DETAIL', '211', '211', '1', 'METHOD', 'N', '2025-04-01 15:02:18', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '212';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('212', '查询客户状态', 'query customer status', NULL, '/api', '/cm/customer/{custId}/status', 'GET', '查询客户状态。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "custId",
      "displayName": "custId",
      "source": "PATH",
      "path": "custId",
      "type": "long",
      "required": true,
      "description": "客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作",
      "exampleValue": "23210517915222"
    }
  ]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, '2025-04-01 15:11:13', '2025-12-03 14:19:27', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '212';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('212', '查询客户状态 ', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'getGroupCustStatus', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-01 15:26:20', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '212';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('212', 'QUERY_CUSTOMER_STATUS', '212', '212', '1', 'METHOD', 'N', '2025-04-01 15:26:39', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '213';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('213', '检验操作员是否只有查看权限', 'group access control', NULL, '/api', '/cm/customer/access-control', 'GET', '检验操作员是否只有查看权限。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "custId",
      "displayName": "custId",
      "source": "QUERY",
      "path": "custId",
      "type": "long",
      "required": true,
      "description": "客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作",
      "exampleValue": "23210517915222"
    }
  ]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, '2025-04-01 16:05:19', '2025-12-03 15:55:40', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '213';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('213', '检验操作员是否只有查看权限', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'groupAccessControl', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-01 16:06:35', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '213';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('213', 'GROUP_ACCESS_CONTROL', '213', '213', '1', 'METHOD', 'N', '2025-04-01 16:06:53', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '214';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('214', '人工离网', 'manual offline ', NULL, '/api', '/cm/customer/{custId}/offline', 'POST', '人工离网', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, '2025-04-01 20:04:36', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '214';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('214', '人工离网', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'manualOffline', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-01 20:05:22', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '214';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('214', 'CUSTOMER_OFFLINE', '214', '214', '1', 'METHOD', 'N', '2025-04-01 20:06:20', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '215';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('215', '校验是否可以修改客户细分', 'if can modify segment', NULL, '/api', '/cm/customer/if-can-modify-segment', 'GET', '校验是否可以修改客户细分', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "long",
			"required": true,
			"description": "客户ID"
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, '2025-04-02 14:18:03', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '215';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('215', '校验是否可以修改客户细分', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'queryIfCanModifySegment', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-02 14:18:56', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '215';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('215', 'IF_CAN_MODIFY_SEGMENT', '215', '215', '1', 'METHOD', 'N', '2025-04-02 14:19:29', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '216';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('216', '修改B2B客户数据', 'modify b2b customer', NULL, '/api', '/cm/b2b/customer', 'PUT', '修改B2B客户数据', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "modifyMap",
			"displayName": "modifyMap",
			"source": "BODY",
			"path": "",
			"type": "java.util.Map",
			"required": true,
			"description": "修改B2B客户的数据",
			"exampleValue": "{\\"oldData\\":{\\"cmxGroupCustomer\\":{\\"effectiveDate\\":\\"2025-04-07 10:36:49\\",\\"regionId\\":\\"2103\\",\\"updateFlag\\":1,\\"custId\\":23210816756022,\\"createOpId\\":100000030,\\"orgId\\":21000000,\\"protectEffDate\\":\\"2021-03-09\\",\\"directMarketingProtection\\":0,\\"opId\\":100000030,\\"state\\":\\"U\\",\\"aksStatus\\":\\"5\\",\\"ext15\\":\\"1:0,2:0,3:0,4:0,5:0\\",\\"protectExpireDate\\":\\"2021-04-07\\",\\"ext16\\":\\"1:0,2:0,3:0\\",\\"aksRegistrationDate\\":\\"2021-04-23\\",\\"createOrgId\\":21000000,\\"expireDate\\":\\"2099-12-31 23:59:59\\",\\"doneDate\\":\\"2025-04-07 10:36:49\\",\\"doneCode\\":111508348308,\\"companyStatus\\":1,\\"createDate\\":\\"2021-03-25 17:30:13\\",\\"ext27\\":\\"2021-03-25\\",\\"ext22\\":0,\\"preferredPlatform\\":\\"IN\\",\\"taxFlag\\":1},\\"cmIdentification\\":{\\"idenNr\\":\\"K23210816756022\\"},\\"custId\\":23210816756022,\\"protectEffDate\\":\\"2021-03-09\\",\\"orgId\\":21000000,\\"groupType\\":2,\\"custCertType\\":17,\\"countyId\\":\\"1001\\",\\"ext15\\":\\"1:0,2:0,3:0,4:0,5:0\\",\\"protectExpireDate\\":\\"2021-04-07\\",\\"groupSegmentId\\":\\"KA\\",\\"ext16\\":\\"1:0,2:0,3:0\\",\\"orgIdDesc\\":\\"Denmark（TN）\\",\\"custSegment\\":200000000002,\\"postCode\\":\\"1234\\",\\"createOrgId\\":21000000,\\"expireDate\\":\\"2099-12-31 23:59:59\\",\\"contAddress\\":\\"5300103\\",\\"custServiceId\\":\\"\\",\\"doneDate\\":\\"2021-03-25 17:34:02\\",\\"hobby\\":\\"K23210816756022\\",\\"custType\\":3,\\"createDate\\":\\"2021-03-25 17:30:13\\",\\"isRevisable\\":0,\\"contName\\":\\"hl123\\",\\"partyId\\":110005247290,\\"nationality\\":\\"00400\\",\\"regionId\\":\\"2103\\",\\"effectiveDate\\":\\"2021-03-25 17:30:13\\",\\"developType\\":1,\\"createOpId\\":100000030,\\"directMarketingProtection\\":0,\\"opId\\":999999025,\\"custCertCode\\":\\"K23210816756022\\",\\"custZipcode\\":\\"1234\\",\\"state\\":\\"U\\",\\"perferLanguage\\":\\"1\\",\\"contId\\":110006043994,\\"lastName\\":\\"\\",\\"firstName\\":\\"\\",\\"provinceId\\":\\"9999\\",\\"doneCode\\":110730917061,\\"companyStatus\\":1,\\"opIdDesc\\":\\"21CM101\\",\\"cityId\\":\\"1000\\",\\"ext27\\":\\"2021-03-25\\",\\"ext22\\":0,\\"taxFlag\\":1,\\"custStatus\\":1,\\"custName\\":\\"hl123\\"},\\"newData\\":{\\"cmxGroupCustomer\\":{\\"effectiveDate\\":\\"2025-04-07 10:36:49\\",\\"regionId\\":\\"2103\\",\\"updateFlag\\":1,\\"custId\\":23210816756022,\\"createOpId\\":100000030,\\"orgId\\":21000000,\\"protectEffDate\\":\\"2021-03-09\\",\\"directMarketingProtection\\":0,\\"opId\\":100000030,\\"state\\":\\"U\\",\\"aksStatus\\":\\"5\\",\\"ext15\\":\\"1:0,2:0,3:0,4:0,5:0\\",\\"protectExpireDate\\":\\"2021-04-07\\",\\"ext16\\":\\"1:0,2:0,3:0\\",\\"aksRegistrationDate\\":\\"2021-04-23\\",\\"createOrgId\\":21000000,\\"expireDate\\":\\"2099-12-31 23:59:59\\",\\"doneDate\\":\\"2025-04-07 10:36:49\\",\\"doneCode\\":111508348308,\\"companyStatus\\":1,\\"createDate\\":\\"2021-03-25 17:30:13\\",\\"ext27\\":\\"2021-03-25\\",\\"ext22\\":0,\\"preferredPlatform\\":\\"CloudPBX\\",\\"taxFlag\\":1},\\"cmIdentification\\":{\\"idenNr\\":\\"K23210816756022\\"},\\"custId\\":23210816756022,\\"protectEffDate\\":\\"2021-03-09\\",\\"orgId\\":21000000,\\"groupType\\":2,\\"custCertType\\":17,\\"countyId\\":\\"1001\\",\\"ext15\\":\\"1:0,2:0,3:0,4:0,5:0\\",\\"protectExpireDate\\":\\"2021-04-07\\",\\"groupSegmentId\\":\\"KA\\",\\"ext16\\":\\"1:0,2:0,3:0\\",\\"orgIdDesc\\":\\"Denmark（TN）\\",\\"custSegment\\":200000000002,\\"postCode\\":\\"1234\\",\\"createOrgId\\":21000000,\\"expireDate\\":\\"2099-12-31 23:59:59\\",\\"contAddress\\":\\"5300103\\",\\"custServiceId\\":\\"\\",\\"doneDate\\":\\"2021-03-25 17:34:02\\",\\"hobby\\":\\"K23210816756022\\",\\"custType\\":3,\\"createDate\\":\\"2021-03-25 17:30:13\\",\\"isRevisable\\":0,\\"contName\\":\\"hl123\\",\\"partyId\\":110005247290,\\"nationality\\":\\"00400\\",\\"regionId\\":\\"2103\\",\\"effectiveDate\\":\\"2021-03-25 17:30:13\\",\\"developType\\":1,\\"createOpId\\":100000030,\\"directMarketingProtection\\":0,\\"opId\\":999999025,\\"custCertCode\\":\\"K23210816756022\\",\\"custZipcode\\":\\"20250407\\",\\"state\\":\\"U\\",\\"perferLanguage\\":\\"1\\",\\"contId\\":110006043994,\\"lastName\\":\\"\\",\\"firstName\\":\\"\\",\\"provinceId\\":\\"9999\\",\\"doneCode\\":110730917061,\\"companyStatus\\":1,\\"opIdDesc\\":\\"21CM101\\",\\"cityId\\":\\"1000\\",\\"ext27\\":\\"2021-03-25\\",\\"ext22\\":0,\\"taxFlag\\":1,\\"custStatus\\":1,\\"custName\\":\\"hl123\\"}}"
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, '2025-04-02 16:23:57', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '216';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('216', '修改B2B客户数据', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'modifyGroupCustomer', '{
	"paramDefinitions": [
		{
			"name": "modifyMap",
			"argName": "arg0",
			"type": "java.util.Map"
		}
	]
}', NULL, NULL, '2025-04-02 16:25:15', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '216';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('216', 'MODIFY_B2B_CUSTOMER', '216', '216', '1', 'METHOD', 'N', '2025-04-02 16:26:41', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '217';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('217', '客户销户', 'modify b2b customer state', NULL, '/api', '/cm/customer/{custId}/terminate', 'POST', '客户销户', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true,
			"description": "客户id"
		},{
			"name": "businessId",
			"displayName": "businessId",
			"source": "QUERY",
			"path": "businessId",
			"type": "long",
			"required": true,
			"description": "业务id"
		},{
			"name": "partyId",
			"displayName": "partyId",
			"source": "QUERY",
			"path": "partyId",
			"type": "long",
			"description": "参与者id"
		}
	]
}

', NULL, NULL, NULL, 'cm', 'customer', NULL, '2025-04-03 09:38:54', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '217';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('217', '客户销户', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'modifyGroupCustState', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		},{
			"name": "businessId",
			"argName": "arg1",
			"type": "long"
		},{
			"name": "partyId",
			"argName": "arg2",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-03 09:40:36', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '217';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('217', 'CUSTOMER_TERMINATE', '217', '217', '1', 'METHOD', 'N', '2025-04-03 09:41:51', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '218';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('218', '查询客户附加信息', 'query customer addtional', NULL, '/api', '/cm/customer/{custId}/addtional', 'GET', '查询客户附加信息。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "custId",
      "displayName": "custId",
      "source": "PATH",
      "path": "custId",
      "type": "long",
      "required": true,
      "description": "客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作",
      "exampleValue": "23210517915222"
    }
  ]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, '2025-04-03 09:45:33', '2025-12-02 15:22:17', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '218';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('218', '查询客户附加信息', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'queryAddtionalInfo', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-03 09:46:20', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '218';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('218', 'QUERY_CUSTOMER_ADDTIONALINFO', '218', '218', '1', 'METHOD', 'N', '2025-04-03 09:46:42', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '219';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('219', '查询客户资料显示项个性配置', 'query of2 vc customer item', NULL, '/api', '/cm/customer/of2-vc', 'GET', '查询客户资料显示项个性配置。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "custId",
      "displayName": "custId",
      "source": "QUERY",
      "path": "custId",
      "type": "long",
      "required": true,
      "description": "客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作",
      "exampleValue": "23210517915222"
    },
    {
      "name": "custType",
      "displayName": "custType",
      "source": "QUERY",
      "path": "custType",
      "type": "int",
      "required": true,
      "description": "客户类型",
      "exampleValue": "1"
    }
  ]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, '2025-04-03 10:28:41', '2025-12-02 15:07:11', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '219';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('219', '查询客户资料显示项个性配置', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'queryCustomerInfo', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		},{
			"name": "custType",
			"argName": "arg1",
			"type": "int"
		}
	]
}', NULL, NULL, '2025-04-03 10:29:49', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '219';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('219', 'QUERY_OF2_VC_CUSTOMER_ITEM', '219', '219', '1', 'METHOD', 'N', '2025-04-03 10:30:52', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '220';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('220', '保存客户附加信息', 'save customer addtional', NULL, '/api', '/cm/customer/{custId}/addtional', 'POST', '保存客户附加信息，修改/新增', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true,
			"description": "客户id"
		},{
			"name": "popup",
			"displayName": "popup",
			"source": "BODY",
			"path": "popup",
			"type": "String",
			"description": ""
		},{
			"name": "onlyUpdatePopValue",
			"displayName": "onlyUpdatePopValue",
			"source": "BODY",
			"path": "onlyUpdatePopValue",
			"type": "String",
			"required": true,
			"description": ""
		},{
			"name": "additionalInfo",
			"displayName": "additionalInfo",
			"source": "BODY",
			"path": "additionalInfo",
			"type": "String",
			"required": true,
			"exampleValue": "{\\"additionalInfo\\":\\"test123\\"}",
			"description": "附加信息"
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, '2025-04-03 11:03:08', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '220';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('220', '保存客户附加信息', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'saveAddtionalInfo', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		},{
			"name": "popup",
			"argName": "arg1",
			"type": "String"
		},{
			"name": "onlyUpdatePopValue",
			"argName": "arg2",
			"type": "String"
		},{
			"name": "additionalInfo",
			"argName": "arg3",
			"type": "String"
		}
	]
}', NULL, NULL, '2025-04-03 11:05:09', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '220';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('220', 'SAVE_CUSTOMER_ADDTIONALINFO', '220', '220', '1', 'METHOD', 'N', '2025-04-03 11:05:30', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '221';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('221', '查询客户备案记录', 'query customer puton record', NULL, '/api', '/cm/customer/{custId}/puton-record', 'GET', '查询客户备案记录', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true,
			"description": "客户ID"
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, '2025-04-03 11:11:49', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '221';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('221', '查询客户备案记录', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'queryCmCustPutOnRecord', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-03 11:13:06', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '221';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('221', 'QUERY_CUSTOMER_PUTON_RECORD', '221', '221', '1', 'METHOD', 'N', '2025-04-03 11:13:23', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '222';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('222', 'aks信息保存', 'save customer aks', NULL, '/api', '/cm/customer/{custId}/aks', 'POST', 'aks信息保存', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true,
			"description": "客户ID"
		},{
			"name": "aksFlag",
			"displayName": "aksFlag",
			"source": "QUERY",
			"path": "aksFlag",
			"type": "String",
			"required": true,
			"description": "aks信息"
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, '2025-04-03 11:18:49', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '222';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('222', 'aks信息保存', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'saveAKSInfo', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
		,{
			"name": "aksFlag",
			"argName": "arg1",
			"type": "String"
		}
	]
}', NULL, NULL, '2025-04-03 11:19:54', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '222';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('222', 'SAVE_CUSTOMER_AKS', '222', '222', '1', 'METHOD', 'N', '2025-04-03 11:20:12', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '223';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('223', '查询客户不良信息', 'query customer bad record page', NULL, '/api', '/cm/customer/{custId}/bad-record/page', 'GET', '查询客户不良信息', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "客户ID"
		},{
			"name": "startIndex",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},{
			"name": "endIndex",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETCmCustBadRecord001', '2025-04-07 17:35:12', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '223';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('223', '查询客户不良记录', 'APPFRAME', 'com.asiainfo.crm.cm.common.service.interfaces.ICmCommonSV', 'queryCustBadInfo', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		},{
			"name": "startIndex",
			"argName": "arg1",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"type": "int"
		},{
			"name": "endIndex",
			"argName": "arg2",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"type": "int"
		}
	]
}', NULL, NULL, '2025-04-07 17:37:00', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '223';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('223', 'QUERY_CUSTOMER_BAD_RECORD_PAGE', '223', '223', '1', 'METHOD', 'N', '2025-04-07 17:37:25', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '224';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('224', '查询客户不良信息count', 'query customer bad record count', NULL, '/api', '/cm/customer/{custId}/bad-record/count', 'GET', '查询客户不良信息count', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "客户ID"
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, '2025-04-07 17:39:29', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '224';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('224', '查询客户不良记录count', 'APPFRAME', 'com.asiainfo.crm.cm.common.service.interfaces.ICmCommonSV', 'queryCustBadInformationCount', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-07 17:40:17', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '224';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('224', 'QUERY_CUSTOMER_BAD_RECORD_COUNT', '224', '224', '1', 'METHOD', 'N', '2025-04-07 17:41:34', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '225';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('225', '判断客户是否有在途单', 'check has on going order', NULL, '/api', '/cm/customer/{custId}/check-ongoging-order', 'GET', '判断客户是否有在途单', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true,
			"description": "客户ID"
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, '2025-04-08 11:27:20', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '225';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('225', '判断客户是否有在途单', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'checkHasOngoingOrder', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-08 11:28:35', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '225';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('225', 'CHECK_HAS_ONGOING_ORDER', '225', '225', '1', 'METHOD', 'N', '2025-04-08 11:28:57', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '300';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('300', '根据账户id查询账户资料', 'query Account Profile By AcctId', NULL, '/api', '/cm/account/{acctId}/profile', 'GET', '根据账户id查询账户资料。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "acctId",
      "displayName": "acctId",
      "source": "PATH",
      "path": "acctId",
      "type": "long",
      "required": true,
      "defaultValue": "",
      "description": "账户唯一标识，用于账户编辑、查看及用户关联等账户级操作",
      "exampleValue": "32100119385351"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'account', 'SETQCmAcctPayMentNew001', NULL, '2025-12-03 15:54:03', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '300';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('300', '根据账户id查询账户资料', 'APPFRAME', 'com.asiainfo.crm.cm.ln.account.service.interfaces.ICmLnAccountSV', 'queryAccountProfileByAcctId', '{
	"paramDefinitions": [
		{
			"name": "acctId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '300';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('300', 'QUERY_ACCOUNT_PROFILE_BY_ACCTID', '300', '300', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '301';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('301', '查询partyAcctrel信息', 'query Party Acc Rel', NULL, '/api', '/cm/party/acc/rel', 'GET', '根据传入的参数查询partyAcctrel信息', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "acctId",
      "displayName": "acctId",
      "source": "QUERY",
      "path": "acctId",
      "type": "long",
      "required": true,
      "defaultValue": "",
      "description": "账户唯一标识，用于账户编辑、查看及用户关联等账户级操作",
      "exampleValue": "32100119385351"
    },
    {
      "name": "partyId",
      "displayName": "partyId",
      "source": "QUERY",
      "path": "partyId",
      "type": "long",
      "required": true,
      "defaultValue": "",
      "description": "实体唯一标识，既可代表组织（B2B场景），也可代表个人（B2C场景），用于建立实体级关联关系",
      "exampleValue": "110006120290"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'party', NULL, NULL, '2025-12-03 15:43:44', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '301';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('301', '查询partyAcctrel信息', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmAccountSV', 'queryPartyAccRel', '{
	"paramDefinitions": [
		{
			"name": "acctId",
			"argName": "arg0",
			"type": "long"
		},
		{
			"name": "partyId",
			"argName": "arg1",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '301';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('301', 'QUERY_PARTY_ACC_REL', '301', '301', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '3010';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('3010', 'getVoipNumberByUserIdAndAttrId', 'getVoipNumberByUserIdAndAttrId', NULL, '/api', '/cm/360view/RbossSoBF/getVoipNumberByUserIdAndAttrId', 'GET', '根据用户ID和属性ID获取VoIP号码。该方法接收区域ID、用户ID和属性ID，设置中心信息为区域ID，调用实例查询服务批量获取实例服务属性，返回第一个属性的属性值作为VoIP号码
返回信息:
VoIP号码字符串，如果查询不到则返回空字符串', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "regionId", "path": "regionId", "type": "java.lang.String", "source": "QUERY", "argName": "arg0", "required": true, "description": "区域ID，用于设置中心信息", "displayName": "regionId"}, {"name": "userId", "path": "userId", "type": "long", "source": "QUERY", "argName": "arg1", "required": true, "description": "用户ID，用于查询该用户的VoIP号码", "displayName": "userId"}, {"name": "attrId", "path": "attrId", "type": "long", "source": "QUERY", "argName": "arg2", "required": true, "description": "属性ID，用于查询指定属性的值", "displayName": "attrId"}]}', '', NULL, NULL, 'cm', '360view', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '3010';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('3010', 'getVoipNumberByUserIdAndAttrId', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.RbossSoBFImpl', 'getVoipNumberByUserIdAndAttrId', '{"paramDefinitions":[{"path":"regionId","argName":"arg0","displayName":"regionId","name":"regionId","source":"QUERY","type":"java.lang.String","required":true},{"path":"userId","argName":"arg1","displayName":"userId","name":"userId","source":"QUERY","type":"long","required":true},{"path":"attrId","argName":"arg2","displayName":"attrId","name":"attrId","source":"QUERY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '3010';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('3010', 'GETVOIPNUMBERBYUSERIDANDATTRID_3010', '3010', '3010', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '3018';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('3018', 'queryGroupByCustId', 'queryGroupByCustId', NULL, '/api', '/cm/360view/CustomerViewBF/queryGroupByCustId', 'GET', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"QUERY","type":"long","required":true}]}', '', NULL, NULL, 'cm', '360view', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '3018';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('3018', 'queryGroupByCustId', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerViewBFImpl', 'queryGroupByCustId', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"QUERY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '3018';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('3018', 'QUERYGROUPBYCUSTID_3018', '3018', '3018', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '3019';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('3019', 'getGroupBasicInfo', 'getGroupBasicInfo', NULL, '/api', '/cm/360view/CustGroupOut/getGroupBasicInfo', 'GET', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"QUERY","type":"long","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', '360view', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '3019';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('3019', 'getGroupBasicInfo', 'APPFRAME', 'com.asiainfo.crm.cm.custgroup.teaminvoke.out.service.interfaces.ICustGroupOutSV', 'getGroupBasicInfo', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"QUERY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '3019';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('3019', 'GETGROUPBASICINFO_3019', '3019', '3019', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '302';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('302', '根据partyId查询party信息', 'query Party By Id', NULL, '/api', '/cm/party/{partyId}', 'GET', '根据partyId查询party信息。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "partyId",
      "displayName": "partyId",
      "source": "PATH",
      "path": "partyId",
      "type": "long",
      "required": true,
      "defaultValue": "",
      "description": "实体唯一标识，既可代表组织（B2B场景），也可代表个人（B2C场景），用于建立实体级关联关系",
      "exampleValue": "110006120290"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'party', NULL, NULL, '2025-12-03 15:38:53', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '302';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('302', '根据id查询party信息', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmPartySV', 'queryPartyById', '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '302';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('302', 'QUERY_PARTY_BY_ID', '302', '302', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '303';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('303', '根据账户ID查询账户', 'query Mask Account Profile By AcctId', NULL, '/api', '/cm/account/{acctId}/profile/mask', 'GET', '根据账户ID查询账户', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "acctId",
      "displayName": "acctId",
      "source": "PATH",
      "path": "acctId",
      "type": "long",
      "required": true,
      "defaultValue": "",
      "description": "账户唯一标识，用于账户编辑、查看及用户关联等账户级操作",
      "exampleValue": "32100119385351"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'account', 'SETQCmAcctPayMentNew001', NULL, '2025-12-03 15:42:54', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '303';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('303', '根据账户ID查询账户（模糊化查询）', 'APPFRAME', 'com.asiainfo.crm.cm.ln.account.service.interfaces.ICmLnAccountSV', 'queryMaskAccountProfileByAcctId', '{
	"paramDefinitions": [
		{
			"name": "acctId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '303';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('303', 'QUERY_MASK_ACCOUNT_PROFILE_BY_ACCTID', '303', '303', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '3030';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('3030', 'queryMemListByCondition', 'queryMemListByCondition', NULL, '/api', '/cm/360view/groupmember/queryMemListByCondition', 'GET', '根据客户ID、VPN套餐实例、账单ID、角色ID、开通平台等条件，分页查询群组成员短号信息列表。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "path": "custId",
      "argName": "arg0",
      "displayName": "custId",
      "name": "custId",
      "source": "QUERY",
      "type": "long",
      "required": false,
      "description": "客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作",
      "exampleValue": "23210517915222"
    },
    {
      "path": "vpnOfferInstStr",
      "argName": "arg1",
      "displayName": "vpnOfferInstStr",
      "name": "vpnOfferInstStr",
      "source": "QUERY",
      "type": "java.lang.String",
      "required": false,
      "description": "多个offer实例ID的集合",
      "exampleValue": "30000000000251,30000000000254"
    },
    {
      "path": "billId",
      "argName": "arg2",
      "displayName": "billId",
      "name": "billId",
      "source": "QUERY",
      "type": "java.lang.String",
      "required": false,
      "description": "号码标识/客户关联标识，用于客户查询、号码识别及账户关系定位",
      "exampleValue": "38290010"
    },
    {
      "path": "roleId",
      "argName": "arg3",
      "displayName": "roleId",
      "name": "roleId",
      "source": "QUERY",
      "type": "long",
      "required": false,
      "description": "角色ID",
      "exampleValue": "182100000002"
    },
    {
      "path": "provisionedPlatform",
      "argName": "arg4",
      "displayName": "provisionedPlatform",
      "name": "provisionedPlatform",
      "source": "QUERY",
      "type": "java.lang.String",
      "required": false,
      "description": "开通平台",
      "exampleValue": "IN"
    },
    {
      "path": "pageNum",
      "handlerClass": "com.aie.api.tool.PageTool:getStartNum",
      "argName": "arg5",
      "displayName": "pageNum",
      "name": "startRowIndex",
      "source": "QUERY",
      "type": "int",
      "required": true,
      "description": "页数",
      "exampleValue": "5"
    },
    {
      "path": "pageSize",
      "handlerClass": "com.aie.api.tool.PageTool:getEndNum",
      "argName": "arg6",
      "displayName": "pageSize",
      "name": "endRowIndex",
      "source": "QUERY",
      "type": "int",
      "required": true,
      "description": "每页条数",
      "exampleValue": "10"
    }
  ]
}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', '360view', '', NULL, '2025-12-03 10:42:15', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '3030';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('3030', 'getSpecialOrderInfo', 'APPFRAME', 'com.asiainfo.crm.so.common.party.service.interfaces.IGroupCommonQuerySV', 'queryMemListByCondition', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"QUERY","type":"long","required":false},{"path":"vpnOfferInstStr","argName":"arg1","displayName":"vpnOfferInstStr","name":"vpnOfferInstStr","source":"QUERY","type":"java.lang.String","required":false},{"path":"billId","argName":"arg2","displayName":"billId","name":"billId","source":"QUERY","type":"java.lang.String","required":false},{"path":"roleId","argName":"arg3","displayName":"roleId","name":"roleId","source":"QUERY","type":"long","required":false},{"path":"provisionedPlatform","argName":"arg4","displayName":"provisionedPlatform","name":"provisionedPlatform","source":"QUERY","type":"java.lang.String","required":false},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg5","displayName":"pageNum","name":"startRowIndex","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg6","displayName":"pageSize","name":"endRowIndex","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '3030';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('3030', 'QUERYMEMLISTBYCONDITION_3030', '3030', '3030', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '304';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('304', '查询账户当前账期信息', 'query Curr Acct Bill Cycles By AcctId', NULL, '/api', '/cm/account/{acctId}/bill/cycle/current', 'GET', '查询账户当前账期信息', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "acctId",
      "displayName": "acctId",
      "source": "PATH",
      "path": "acctId",
      "type": "long",
      "required": true,
      "defaultValue": "",
      "description": "账户唯一标识，用于账户编辑、查看及用户关联等账户级操作",
      "exampleValue": "32100119385351"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'account', 'SETAcctBillCycle001', NULL, '2025-12-03 15:44:12', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '304';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('304', '查询账户当前账期信息', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmAccountSV', 'queryCurrAcctBillCyclesByAcctId', '{
	"paramDefinitions": [
		{
			"name": "acctId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '304';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('304', 'QUERY_CURR_ACCT_BILL_CYCLES_BY_ACCTID', '304', '304', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '305';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('305', '查询账号支付渠道', 'queryAcctPayChannel', NULL, '/api', '/cm/account/{acctId}/paychannle', 'GET', '查询账户支付渠道。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "acctId",
      "displayName": "acctId",
      "source": "PATH",
      "path": "acctId",
      "type": "long",
      "required": true,
      "defaultValue": "",
      "description": "账户id",
      "exampleValue": "32100119385351"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'account', 'SETCmPayChannel001', NULL, '2025-12-03 11:35:11', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '305';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('305', '查询账户支付渠道', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmBillingAcctSV', 'queryAcctPayChannel', '{
	"paramDefinitions": [
		{
			"name": "acctId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '305';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('305', 'QUERY_ACCT_PAYCHANNEL', '305', '305', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '306';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('306', 'queryAcctFormatType', 'queryAcctFormatType', NULL, '/api', '/cm/account/{acctId}/bill/formattype', 'GET', '查询账号账单格式。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "acctId",
      "displayName": "acctId",
      "source": "PATH",
      "path": "acctId",
      "type": "long",
      "required": true,
      "defaultValue": "",
      "description": "账户唯一标识，用于账户编辑、查看及用户关联等账户级操作",
      "exampleValue": "32100119385351"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'account', NULL, NULL, '2025-12-03 15:42:22', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '306';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('306', '查询账户账单格式类型', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmBillingAcctSV', 'queryAcctFormatType', '{
	"paramDefinitions": [
		{
			"name": "acctId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '306';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('306', 'QUERY_ACCT_BILL_FORMAT_TYPE', '306', '306', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '307';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('307', '查询后付费账单格式', 'queryAcctBillFormat', NULL, '/api', '/cm/account/{acctId}/billformat', 'GET', '查询后付费账单格式。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "acctId",
      "displayName": "acctId",
      "source": "PATH",
      "path": "acctId",
      "type": "long",
      "required": true,
      "defaultValue": "",
      "description": "账户唯一标识，用于账户编辑、查看及用户关联等账户级操作",
      "exampleValue": "32100119385351"
    },
    {
      "name": "type",
      "displayName": "type",
      "source": "QUERY",
      "path": "type",
      "type": "int",
      "required": true,
      "defaultValue": "",
      "description": "类型",
      "exampleValue": "1"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'account', 'SETCmAcctBillFormat001', NULL, '2025-12-03 14:23:53', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '307';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('307', '查询后付费账单格式', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmBillingAcctSV', 'queryAcctBillFormat', '{
	"paramDefinitions": [
		{
			"name": "acctId",
			"argName": "arg0",
			"type": "long"
		},
		{
			"name": "type",
			"argName": "arg1",
			"type": "int"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '307';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('307', 'QUERY_ACCT_BILL_FORMAT', '307', '307', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '308';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('308', '查询账单格式(分页)', 'queryBillformats', NULL, '/api', '/cm/account/{acctId}/billformat/list', 'GET', '查询账单格式明细列表。该方法接收账户ID、账单类型和分页参数，调用查询服务获取账户信息，从响应中提取客户ID和客户类型（如果是集团客户则减1）。然后从账户信息中获取账单格式列表，根据账单类型过滤出匹配的账单格式明细。遍历明细列表，封装成账单格式明细Bean对象，设置账户ID、客户类型、明细编号、是否收费、是否主要、账单类型等属性。查询账单格式枚举值获取邮件代码名称和账单格式名称，设置地址ID、地址描述、邮箱地址、附件发票、发送附件等属性。为每个明细生成编辑和删除操作的HTML链接。支持分页查询，返回指定范围内的账单格式明细数组\', \'账单格式明细信息数组，每个元素包含账户ID、客户类型、明细编号、是否收费、是否主要、账单类型、邮件代码、邮件名称、账单格式ID、账单格式名称、地址ID、地址描述、邮箱地址、附件发票、发送附件和操作链接等属性。如果没有查询到数据则返回空数组\', \'查询过程中发生异常时会抛出异常
', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "acctId",
      "displayName": "acctId",
      "source": "PATH",
      "path": "acctId",
      "type": "long",
      "required": true,
      "defaultValue": "",
      "description": "账户唯一标识，用于账户编辑、查看及用户关联等账户级操作",
      "exampleValue": "32100119385351"
    },
    {
      "name": "billingType",
      "displayName": "billingType",
      "source": "QUERY",
      "path": "billingType",
      "type": "int",
      "required": true,
      "defaultValue": "",
      "description": "计费类型",
      "exampleValue": "1"
    },
    {
      "name": "start",
      "displayName": "pageNum",
      "source": "QUERY",
      "path": "pageNum",
      "type": "int",
      "handlerClass": "com.aie.api.tool.PageTool:getStartNum",
      "required": true,
      "description": "分页起始位置，用于分页查询。表示从第几条记录开始返回，从0开始计数",
      "exampleValue": "1"
    },
    {
      "name": "end",
      "displayName": "pageSize",
      "source": "QUERY",
      "path": "pageSize",
      "type": "int",
      "handlerClass": "com.aie.api.tool.PageTool:getEndNum",
      "required": true,
      "description": "分页结束位置，用于分页查询。表示返回到第几条记录为止（不包含该位置）",
      "exampleValue": "10"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'account', 'SETCMBillFormatDtl001', NULL, '2025-12-03 14:26:15', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '308';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('308', '查询账单格式(分页)', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmBillingAcctSV', 'queryBillformats', '{
	"paramDefinitions": [
		{
			"name": "acctId",
			"argName": "arg0",
			"type": "long"
		},
		{
			"name": "billingType",
			"argName": "arg1",
			"type": "int"
		},
		{
			"name": "start",
			"argName": "arg2",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"type": "int"
		},
		{
			"name": "end",
			"argName": "arg3",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"type": "int"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '308';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('308', 'QUERY_BILL_FORMAT_FOR_PAGE', '308', '308', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '309';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('309', '查询账单格式总数，用于分页', 'queryBillformatsCount', NULL, '/api', '/cm/account/{acctId}/billformat/count', 'GET', '查询账单总数，用于分页。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "acctId",
      "displayName": "acctId",
      "source": "PATH",
      "path": "acctId",
      "type": "long",
      "required": true,
      "defaultValue": "",
      "description": "账户唯一标识，用于账户编辑、查看及用户关联等账户级操作",
      "exampleValue": "32100119385351"
    },
    {
      "name": "billingType",
      "displayName": "billingType",
      "source": "QUERY",
      "path": "billingType",
      "type": "int",
      "required": true,
      "defaultValue": "",
      "description": "账单类型",
      "exampleValue": "1"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'account', 'SETCMBillFormatDtl001', NULL, '2025-12-03 14:21:00', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '309';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('309', '查询账单格式总数，用于分页', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmBillingAcctSV', 'queryBillformatsCount', '{
	"paramDefinitions": [
		{
			"name": "acctId",
			"argName": "arg0",
			"type": "long"
		},
		{
			"name": "billingType",
			"argName": "arg1",
			"type": "int"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '309';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('309', 'QUERY_BILL_FORMATS_COUNT', '309', '309', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '310';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('310', '查询账单地址', 'queryBillAddress', NULL, '/api', '/cm/account/{acctId}/bill/address', 'GET', '查询账户账单地址', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "acctId",
      "displayName": "acctId",
      "source": "PATH",
      "path": "acctId",
      "type": "long",
      "required": true,
      "defaultValue": "",
      "description": "账户唯一标识，用于账户编辑、查看及用户关联等账户级操作",
      "exampleValue": "32100119385351"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'account', 'SETCmAcctContact001', NULL, '2025-12-03 16:00:20', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '310';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('310', '查询账户账单地址', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmBillingAcctSV', 'queryBillAddress', '{
	"paramDefinitions": [
		{
			"name": "acctId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '310';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('310', 'QUERY_BILL_ADDRESS', '310', '310', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '311';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('311', '查询客户信息', 'queryCustomerByCustId', NULL, '/api', '/cm/customer/{custId}/1', 'GET', '根据客户id查询客户信息', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "客户id",
			"exampleValue": ""
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '311';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('311', '查询客户信息', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryCustomerByCustId', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '311';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('311', 'QUERY_CUSTOMER_BY_CUSTID', '311', '311', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '312';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('312', 'ICmxCustomerSV.queryCmxCustomer', 'queryCmxCustomer', NULL, '/api', '/cm/customer/{custId}/cmx', 'GET', 'ICmxCustomerSV.queryCmxCustomer', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "客户id",
			"exampleValue": ""
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '312';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('312', '查询客户信息cmx', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmxCustomerSV', 'queryCmxCustomer', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '312';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('312', 'QUERY_CMX_CUSTOMER', '312', '312', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '313';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('313', '查询账期表单数据', 'queryCurrAcctBillCyclesByAcctId', NULL, '/api', '/cm/account/{acctId}/billcycle', 'GET', '查询账期表单数据', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "acctId",
			"displayName": "acctId",
			"source": "PATH",
			"path": "acctId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "账户id",
			"exampleValue": ""
		}
	]
}
', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'account', 'SETAcctBillCycle001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '313';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('313', '查询账户账期信息', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmAccountSV', 'queryCurrAcctBillCyclesByAcctId', '{
	"paramDefinitions": [
		{
			"name": "acctId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '313';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('313', 'QUERY_CURRACCT_BILLCYCLES_BY_ACCTID', '313', '313', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '314';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('314', '保存修改账户', 'dealAccount', NULL, '/api', '/cm/account', 'POST', '处理账户业务。该方法接收账户信息VO、BCE框架ID和业务ID，将账户信息和账单周期信息转换为DataContainer，如果存在旧数据则标记为旧状态并建立关联关系，然后调用BCE处理服务进行业务处理
返回信息:
BCE处理返回数据对象，包含业务处理的结果信息', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "voAccountValue", "path": "", "type": "com.asiainfo.crm.cm.vo.CmAccountInfoVo", "source": "BODY", "required": true, "description": "账户信息VO对象，包含账户表单信息和账单周期表单信息，以及可选的旧账户信息和旧账单周期信息", "displayName": "voAccountValue", "defaultValue": "", "exampleValue": ""}, {"name": "bceFrameId", "path": "bceFrameId", "type": "java.lang.Long", "source": "QUERY", "required": true, "description": "BCE框架ID，用于指定业务处理框架", "displayName": "bceFrameId", "defaultValue": "", "exampleValue": ""}, {"name": "businessId", "path": "businessId", "type": "java.lang.String", "source": "QUERY", "required": true, "description": "业务ID，用于标识业务操作类型", "displayName": "businessId", "defaultValue": "", "exampleValue": ""}]}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'account', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '314';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('314', '保存修改账户', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.AccountBFImpl', 'dealAccount', '{
	"paramDefinitions": [
		{
			"name": "voAccountValue",
			"argName": "arg0",
			"type": "com.asiainfo.crm.cm.vo.CmAccountInfoVo"
		},
		{
			"name": "bceFrameId",
			"argName": "arg1",
			"type": "java.lang.Long"
		},
		{
			"name": "businessId",
			"argName": "arg2",
			"type": "java.lang.String"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '314';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('314', 'DEAL_MODIFY_ACCOUNT', '314', '314', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '315';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('315', '查询Bill Format详情', 'queryBillFormatDtl', NULL, '/api', '/cm/acount/{acctId}/billformatdtl', 'GET', '查询Bill Format详情', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "acctId",
			"displayName": "acctId",
			"source": "PATH",
			"path": "acctId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "账户id",
			"exampleValue": ""
		},
		{
			"name": "dtlNo",
			"displayName": "dtlNo",
			"source": "QUERY",
			"path": "dtlNo",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "dtlNo",
			"exampleValue": ""
		}
	]
}
', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'account', 'SETCMBillFormatDtl001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '315';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('315', '查询Bill Format详情', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmBillingAcctSV', 'queryBillFormatDtl', '{
	"paramDefinitions": [
		{
			"name": "acctId",
			"argName": "arg0",
			"type": "long"
		},
		{
			"name": "dtlNo",
			"argName": "arg1",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '315';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('315', 'QUERY_BILL_FORMATDTL', '315', '315', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '316';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('316', '查询业务历史记录', 'queryHisRecordByCdn', NULL, '/api', '/cm/log/busi/his/{id}/cnd', 'GET', '查询业务记录历史', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "id",
			"type": "long",
			"displayName": "id",
			"source": "PATH",
			"path": "id",			
			"required": true,
			"defaultValue": "",
			"description": "id",
			"exampleValue": ""
		},
		{
			"name": "name",
			"type": "java.lang.String",
			"displayName": "name",
			"source": "QUERY",
			"path": "name",			
			"required": false,
			"defaultValue": "",
			"description": "name",
			"exampleValue": ""
		},
		{
			"name": "type",
			"type": "int",
			"displayName": "type",
			"source": "QUERY",
			"path": "type",			
			"required": true,
			"defaultValue": "",
			"description": "type",
			"exampleValue": ""
		},
		{
			"name": "startDate",
			"type": "java.lang.String",
			"displayName": "startDate",
			"source": "QUERY",
			"path": "startDate",			
			"required": true,
			"defaultValue": "",
			"description": "startDate",
			"exampleValue": ""
		},
		{
			"name": "endDate",
			"type": "java.lang.String",
			"displayName": "endDate",
			"source": "QUERY",
			"path": "endDate",			
			"required": true,
			"defaultValue": "",
			"description": "endDate",
			"exampleValue": ""
		},
		{
			"name": "start",
			"type": "int",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",			
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},
		{
			"name": "end",
			"type": "int",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",			
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'log', 'SETCmHisRecord001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '316';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('316', '查询业务历史记录', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmBusiLogSV', 'queryHisRecordByCdn', '{
	"paramDefinitions": [
		{
			"name": "id",
			"type": "long",
			"argName": "arg0"
		},
		{
			"name": "name",
			"type": "java.lang.String",
			"argName": "arg1"
		},
		{
			"name": "type",
			"type": "int",
			"argName": "arg2"
		},
		{
			"name": "startDate",
			"type": "java.lang.String",
			"argName": "arg3"
		},
		{
			"name": "endDate",
			"type": "java.lang.String",
			"argName": "arg4"
		},
		{
			"name": "start",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"argName": "arg5"
		},
		{
			"name": "end",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"argName": "arg6"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '316';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('316', 'QUERY_HISRECORD_BY_CDN', '316', '316', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '317';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('317', '查询业务历史记录数', 'queryHisRecordCountByCdn', NULL, '/api', '/cm/log/busi/his/{id}/count', 'GET', '查询业务记录历史数', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "id",
			"type": "long",
			"displayName": "id",
			"source": "PATH",
			"path": "id",			
			"required": true,
			"defaultValue": "",
			"description": "id",
			"exampleValue": ""
		},
		{
			"name": "name",
			"type": "java.lang.String",
			"displayName": "name",
			"source": "QUERY",
			"path": "name",			
			"required": false,
			"defaultValue": "",
			"description": "name",
			"exampleValue": ""
		},
		{
			"name": "type",
			"type": "int",
			"displayName": "type",
			"source": "QUERY",
			"path": "type",			
			"required": true,
			"defaultValue": "",
			"description": "type",
			"exampleValue": ""
		},
		{
			"name": "startDate",
			"type": "java.lang.String",
			"displayName": "startDate",
			"source": "QUERY",
			"path": "startDate",			
			"required": true,
			"defaultValue": "",
			"description": "startDate",
			"exampleValue": ""
		},
		{
			"name": "endDate",
			"type": "java.lang.String",
			"displayName": "endDate",
			"source": "QUERY",
			"path": "endDate",			
			"required": true,
			"defaultValue": "",
			"description": "endDate",
			"exampleValue": ""
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'log', 'SETCmHisRecord001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '317';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('317', '查询业务历史记录数', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmBusiLogSV', 'queryHisRecordCountByCdn', '{
	"paramDefinitions": [
		{
			"name": "id",
			"type": "long",
			"argName": "arg0"
		},
		{
			"name": "name",
			"type": "java.lang.String",
			"argName": "arg1"
		},
		{
			"name": "type",
			"type": "int",
			"argName": "arg2"
		},
		{
			"name": "startDate",
			"type": "java.lang.String",
			"argName": "arg3"
		},
		{
			"name": "endDate",
			"type": "java.lang.String",
			"argName": "arg4"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '317';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('317', 'QUERY_HISRECORD_COUNT_BY_CDN', '317', '317', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '318';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('318', '根据partyId查party信息', 'queryMaskPartyById', NULL, '/api', '/cm/party/{partyId}/mask', 'GET', '根据partyId查party信息', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"displayName": "partyId",
			"source": "PATH",
			"path": "partyId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "partyId",
			"exampleValue": ""
		}
	]
}
', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'party', 'SETCmPartyInfo001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '318';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('318', '根据partyId查party信息', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmPartySV', 'queryMaskPartyById', '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '318';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('318', 'QUERY_MASK_PARTY_BY_ID', '318', '318', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '319';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('319', 'queryPartyRole', 'queryPartyRole', NULL, '/api', '/cm/party/{partyId}/role', 'GET', 'queryPartyRole', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"displayName": "partyId",
			"source": "PATH",
			"path": "partyId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "partyId",
			"exampleValue": ""
		}
	]
}
', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'party', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '319';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('319', 'queryPartyRole', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmPartySV', 'queryPartyRole', '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '319';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('319', 'QUERY_PARTY_ROLE', '319', '319', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '320';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('320', 'queryAsPartyByCertCodeAndLog', 'queryAsPartyByCertCodeAndLog', NULL, '/api', '/cm/party/certcodelog', 'POST', '根据证件代码和日志查询参与人。该方法接收查询条件Map和分页参数，将条件转换为DataContainer，调用参与人服务根据证件代码和日志查询参与人信息。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "condition",
      "path": "",
      "type": "java.util.Map",
      "source": "BODY",
      "required": true,
      "description": "查询条件Map，包含查询参与人的各种条件参数，用于根据证件代码和日志查询参与人",
      "displayName": "condition",
      "defaultValue": "",
      "exampleValue": {"Party_Name_OfSearch":"","Party_ID":"","Customer_ID_OfSearch":"","CERT_TYPE":17,"PARTY_TYPE":17}
    },
    {
      "name": "start",
      "path": "pageNum",
      "type": "int",
      "source": "QUERY",
      "required": true,
      "description": "起始索引，用于分页查询",
      "displayName": "pageNum",
      "handlerClass": "com.aie.api.tool.PageTool:getStartNum",
      "exampleValue": "1"
    },
    {
      "name": "end",
      "path": "pageSize",
      "type": "int",
      "source": "QUERY",
      "required": true,
      "description": "结束索引，用于分页查询",
      "displayName": "pageSize",
      "handlerClass": "com.aie.api.tool.PageTool:getEndNum",
      "exampleValue": "10"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'party', 'SETCmPartyInfo001', NULL, '2025-12-03 14:30:09', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '320';

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '320';

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '321';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('321', '查询partyList分页', 'queryPartyByCondition', NULL, '/api', '/cm/party/condition', 'POST', '根据条件查询参与人列表。该方法接收查询条件Map和分页参数，将条件转换为DataContainer，调用跨中心参与人服务查询符合条件的参与人列表
返回信息:
参与人值数组，包含符合查询条件的参与人信息列表', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "condition", "path": "condition", "type": "java.util.Map", "source": "BODY", "argName": "arg0", "required": true, "description": "查询条件Map，包含查询参与人的各种条件参数，用于查询参与人列表", "displayName": "condition"}, {"name": "startNum", "path": "pageNum", "type": "int", "source": "QUERY", "argName": "arg1", "required": true, "description": "起始索引，用于分页查询", "displayName": "pageNum", "handlerClass": "com.aie.api.tool.PageTool:getStartNum"}, {"name": "endNum", "path": "pageSize", "type": "int", "source": "QUERY", "argName": "arg2", "required": true, "description": "结束索引，用于分页查询", "displayName": "pageSize", "handlerClass": "com.aie.api.tool.PageTool:getEndNum"}]}', '{"paramDefinitions":[{"name":null,"displayName":null,"exampleValue":null,"argName":null,"source":null,"path":null,"type":null,"required":false,"defaultValue":null,"description":null,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties","validationRules":null,"fieldMappings":null}]}', NULL, NULL, 'cm', 'party', 'SETCmPartyInfo001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '321';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('321', '查询partyList总数', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.PartyBFImpl', 'queryPartyByCondition', '{"paramDefinitions":[{"path":"condition","argName":"arg0","displayName":"condition","name":"condition","source":"BODY","type":"java.util.Map","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg1","displayName":"pageNum","name":"startNum","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg2","displayName":"pageSize","name":"endNum","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '321';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('321', 'QUERYPARTYBYCONDITION_321', '321', '321', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '322';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('322', '查询partyList总数', 'queryPartyByConditionCount', NULL, '/api', '/cm/party/condition/count', 'POST', '根据条件查询参与人数量。该方法接收查询条件Map，将条件转换为DataContainer，调用跨中心参与人服务查询符合条件的参与人总数
返回信息:
符合条件的参与人总数，int类型', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "condition", "path": "condition", "type": "java.util.Map", "source": "BODY", "argName": "arg0", "required": true, "description": "查询条件Map，包含查询参与人的各种条件参数，用于查询参与人总数", "displayName": "condition"}]}', '', NULL, NULL, 'cm', 'party', 'SETCmPartyInfo001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '322';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('322', '查询partyList总数', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.PartyBFImpl', 'queryPartyByConditionCount', '{"paramDefinitions":[{"path":"condition","argName":"arg0","displayName":"condition","name":"condition","source":"BODY","type":"java.util.Map","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '322';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('322', 'QUERYPARTYBYCONDITIONCOUNT_322', '322', '322', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '323';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('323', '账户客户关系查询', 'queryCustAcctRel', NULL, '/api', '/cm/account/{acctId}/custacctrel', 'GET', '账户客户关系查询', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "relCustd",
			"type": "long",
			"displayName": "relCustd",
			"source": "QUERY",
			"path": "relCustd",			
			"required": true,
			"defaultValue": "",
			"description": "relCustd",
			"exampleValue": ""
		},
		{
			"name": "acctId",
			"type": "long",
			"displayName": "acctId",
			"source": "QUERY",
			"path": "acctId",			
			"required": true,
			"defaultValue": "",
			"description": "acctId",
			"exampleValue": ""
		},
		{
			"name": "acctName",
			"type": "java.lang.String",
			"displayName": "acctName",
			"source": "QUERY",
			"path": "acctName",			
			"required": false,
			"defaultValue": "",
			"description": "acctName",
			"exampleValue": ""
		},
		{
			"name": "installmentFalg",
			"type": "int",
			"displayName": "installmentFalg",
			"source": "QUERY",
			"path": "installmentFalg",			
			"required": true,
			"defaultValue": "",
			"description": "installmentFalg",
			"exampleValue": ""
		},
		{
			"name": "paymethod",
			"type": "int",
			"displayName": "paymethod",
			"source": "QUERY",
			"path": "paymethod",			
			"required": true,
			"defaultValue": "",
			"description": "paymethod",
			"exampleValue": ""
		},
		{
			"name": "cycleType",
			"type": "int",
			"displayName": "cycleType",
			"source": "QUERY",
			"path": "cycleType",			
			"required": true,
			"defaultValue": "",
			"description": "cycleType",
			"exampleValue": ""
		},
		{
			"name": "custStatus",
			"type": "java.lang.String",
			"displayName": "custStatus",
			"source": "QUERY",
			"path": "custStatus",			
			"required": false,
			"defaultValue": "",
			"description": "custStatus",
			"exampleValue": ""
		},
		{
			"name": "start",
			"type": "int",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",			
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},
		{
			"name": "end",
			"type": "int",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",			
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'account', 'SETCmAccount001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '323';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('323', '账户客户关系查询', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmAccountSV', 'queryCustAcctRel', '{
	"paramDefinitions": [
		{
			"name": "relCustd",
			"type": "long",
			"argName": "arg0"
		},
		{
			"name": "acctId",
			"type": "long",
			"argName": "arg1"
		},
		{
			"name": "acctName",
			"type": "java.lang.String",
			"argName": "arg2"
		},
		{
			"name": "installmentFalg",
			"type": "int",
			"argName": "arg3"
		},
		{
			"name": "paymethod",
			"type": "int",
			"argName": "arg4"
		},
		{
			"name": "cycleType",
			"type": "int",
			"argName": "arg5"
		},
		{
			"name": "custStatus",
			"type": "java.lang.String",
			"argName": "arg6"
		},
		{
			"name": "start",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"argName": "arg7"
		},
		{
			"name": "end",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"argName": "arg8"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '323';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('323', 'QUERY_CUST_ACCT_REL', '323', '323', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '324';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('324', '查询账户客户关系总数', 'queryCustAcctRelCount', NULL, '/api', '/cm/account/{acctId}/custacctrel/count', 'GET', '查询账户客户关系总数', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "relCustd",
			"type": "long",
			"displayName": "relCustd",
			"source": "QUERY",
			"path": "relCustd",			
			"required": true,
			"defaultValue": "",
			"description": "relCustd",
			"exampleValue": ""
		},
		{
			"name": "acctId",
			"type": "long",
			"displayName": "acctId",
			"source": "QUERY",
			"path": "acctId",			
			"required": true,
			"defaultValue": "",
			"description": "acctId",
			"exampleValue": ""
		},
		{
			"name": "acctName",
			"type": "java.lang.String",
			"displayName": "acctName",
			"source": "QUERY",
			"path": "acctName",			
			"required": false,
			"defaultValue": "",
			"description": "acctName",
			"exampleValue": ""
		},
		{
			"name": "installmentFalg",
			"type": "int",
			"displayName": "installmentFalg",
			"source": "QUERY",
			"path": "installmentFalg",			
			"required": true,
			"defaultValue": "",
			"description": "installmentFalg",
			"exampleValue": ""
		},
		{
			"name": "paymethod",
			"type": "int",
			"displayName": "paymethod",
			"source": "QUERY",
			"path": "paymethod",			
			"required": true,
			"defaultValue": "",
			"description": "paymethod",
			"exampleValue": ""
		},
		{
			"name": "cycleType",
			"type": "int",
			"displayName": "cycleType",
			"source": "QUERY",
			"path": "cycleType",			
			"required": true,
			"defaultValue": "",
			"description": "cycleType",
			"exampleValue": ""
		},
		{
			"name": "custStatus",
			"type": "java.lang.String",
			"displayName": "custStatus",
			"source": "QUERY",
			"path": "custStatus",			
			"required": false,
			"defaultValue": "",
			"description": "custStatus",
			"exampleValue": ""
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'account', 'SETCmAccount001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '324';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('324', '查询账户客户关系总数', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmAccountSV', 'queryCustAcctRelCount', '{
	"paramDefinitions": [
		{
			"name": "relCustd",
			"type": "long",
			"argName": "arg0"
		},
		{
			"name": "acctId",
			"type": "long",
			"argName": "arg1"
		},
		{
			"name": "acctName",
			"type": "java.lang.String",
			"argName": "arg2"
		},
		{
			"name": "installmentFalg",
			"type": "int",
			"argName": "arg3"
		},
		{
			"name": "paymethod",
			"type": "int",
			"argName": "arg4"
		},
		{
			"name": "cycleType",
			"type": "int",
			"argName": "arg5"
		},
		{
			"name": "custStatus",
			"type": "java.lang.String",
			"argName": "arg6"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '324';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('324', 'QUERY_CUST_ACCT_REL_COUNT', '324', '324', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '325';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('325', '删除grp账户信息', 'delGrpAcctInfo', NULL, '/api', '/cm/account/{acctId}/grp', 'DELETE', '删除集团账户信息。该方法接收账户ID，检查租户ID是否为TENANT_21（不允许删除），调用billing接口将账户状态设置为inactive（状态值为2），然后更新账户信息。删除成功返回成功标志和消息，失败返回异常信息
返回信息:
包含操作结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）和"retMsg"（结果消息或异常信息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "acctId", "path": "acctId", "type": "long", "source": "PATH", "required": true, "description": "账户ID，用于标识要删除的账户", "displayName": "acctId", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'account', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '325';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('325', '删除grp账户信息', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.AccountBFImpl', 'delGrpAcctInfo', '{
	"paramDefinitions": [
		{
			"name": "acctId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '325';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('325', 'DEL_GRP_ACCTINFO', '325', '325', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '326';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('326', '验证客户协议', 'validAgreement', NULL, '/api', '/cm/customer/{custId}/agreement/{agrId}', 'GET', '验证协议。该方法接收客户ID和协议ID，调用协议服务查询该客户和协议ID对应的协议信息，如果存在则返回"Y"，否则返回"N"。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "custId",
      "path": "custId",
      "type": "long",
      "source": "PATH",
      "required": true,
      "description": "客户ID，用于验证协议",
      "displayName": "custId",
      "defaultValue": "",
      "exampleValue": "23210517915222"
    },
    {
      "name": "agrId",
      "path": "agrId",
      "type": "long",
      "source": "PATH",
      "required": true,
      "description": "协议ID，用于验证协议",
      "displayName": "agrId",
      "defaultValue": "",
      "exampleValue": "2434351"
    }
  ]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, '2025-12-03 10:56:59', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '326';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('326', '校验客户协议', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'validAgreement', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		},
		{
			"name": "agrId",
			"argName": "arg1",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '326';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('326', 'VALID_AGREEMENT', '326', '326', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '327';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('327', '查询客户简单信息', 'queryCustSimpleById', NULL, '/api', '/cm/customer/{custId}/simple', 'GET', '根据客户ID查询客户简单信息。该方法接收客户ID，查询客户基本信息（客户名称、名字、姓氏、参与人ID、证件代码等）。如果是集团客户，还会查询税号，并处理证件代码（判断是否为外国集团）
返回信息:
包含客户简单信息的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"custName"（客户名称）、"firstName"（名字）、"lastName"（姓氏）、"custCertCode"（证件代码）、"TaxID"（税号，仅集团客户）、"partyId"（参与人ID）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "long", "source": "PATH", "required": true, "description": "客户ID，用于查询客户简单信息", "displayName": "custId", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '327';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('327', '查询客户简单信息', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'queryCustSimpleById', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '327';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('327', 'QUERY_CUST_SIMPLE_BYID', '327', '327', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '328';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('328', '删除账单格式详情', 'delBillFormatDtl', NULL, '/api', '/cm/bill/account/{acctId}', 'DELETE', '删除账单格式详情', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "acctId", "path": "acctId", "type": "long", "source": "PATH", "required": true, "description": "账户ID，用于标识要删除的账单格式明细所属账户", "displayName": "acctId", "defaultValue": "", "exampleValue": ""}, {"name": "dtlNo", "path": "dtlNo", "type": "long", "source": "QUERY", "required": true, "description": "明细编号，用于标识要删除的账单格式明细", "displayName": "dtlNo", "defaultValue": "", "exampleValue": ""}, {"name": "billingType", "path": "billingType", "type": "int", "source": "QUERY", "required": true, "description": "账单类型，用于标识要删除的账单格式明细类型", "displayName": "billingType", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'bill', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '328';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('328', '删除账单格式详情', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.BillBFImpl', 'delBillFormatDtl', '{
	"paramDefinitions": [
		{
			"name": "acctId",
			"argName": "arg0",
			"type": "long"
		},{
			"name": "dtlNo",
			"argName": "arg1",
			"type": "long"
		},{
			"name": "billingType",
			"argName": "arg2",
			"type": "int"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '328';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('328', 'DEL_BILL_FORMATDTL', '328', '328', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '329';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('329', 'email校验', 'checkEmailAddress', NULL, '/api', '/cm/common/email/validation', 'GET', '校验email地址。该方法检查email白名单控制开关，如果开关开启则调用CRM服务查询邮箱地址是否在白名单中。如果邮箱地址在白名单中则校验成功，否则校验失败
返回信息:
包含校验结果的Map，key包括"emailCtrl"（"Y"表示开启邮箱控制，"N"表示未开启）、"retVal"（"Y"表示校验成功，"N"表示校验失败）、"retMsg"（结果消息，失败时包含异常信息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "emailAddress", "path": "emailAddress", "type": "java.lang.String", "source": "QUERY", "required": true, "description": "邮箱地址，用于校验是否在白名单中", "displayName": "emailAddress", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'common', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '329';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('329', 'email地址校验', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CommonBFImpl', 'checkEmailAddress', '{
	"paramDefinitions": [
		{
			"name": "emailAddress",
			"argName": "arg0",
			"type": "java.lang.String"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '329';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('329', 'CHECK_EMAILADDRESS', '329', '329', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '330';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('330', '查询创建party', 'createParty', NULL, '/api', '/cm/party/search/{searchType}', 'POST', '创建参与人。该方法接收参与人信息Map，根据搜索类型（SEARCH_TYPE）进行不同处理：类型"1"表示根据证件类型和证件代码查询，如果不存在则调用CPR系统查询，如果CPR返回有firstName则创建参与人；类型"2"表示根据名称生日地址（NBA）查询，先检查是否存在相同信息的参与人，如果不存在则创建；类型"3"则返回特殊标识
返回信息:
包含创建结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败，或"create"表示新创建，"searchTypeIs3"表示搜索类型为3）、"retMsg"（结果消息，可能包含已存在的参与人信息或错误信息）、"pId"（参与人ID）、"pName"（参与人名称）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "bean", "path": "", "type": "java.util.Map", "source": "BODY", "required": true, "description": "参与人信息Map，包含搜索类型（SEARCH_TYPE）、证件类型（CERT_TYPE）、证件代码（CERT_CODE）、名字（FIRST_NAME）、姓氏（LAST_NAME）、生日（BIRTHDAY）、联系地址（CONT_ADDRESS）、地址详情（REMARKS）等信息，用于创建参与人", "displayName": "bean", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'party', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '330';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('330', '查询创建party', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.PartyBFImpl', 'createParty', '{
	"paramDefinitions": [
		{
			"name": "bean",
			"type": "java.util.Map",
			"displayName": "bean",
			"argName": "arg0"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '330';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('330', 'CREATE_PARTY', '330', '330', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '331';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('331', '保存账单格式', 'saveBillFormatDtl', NULL, '/api', '/cm/bill/formatDtl', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions": [{"name": "bean", "path": "", "type": "java.util.Map", "source": "BODY", "required": true, "description": "包含账单格式明细数据的Map，key包括\\"data\\"（当前数据Map）和\\"oldData\\"（旧数据Map，可选），用于保存或更新账单格式明细", "displayName": "bean", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'bill', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '331';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('331', '保存bill format', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.BillBFImpl', 'saveBillFormatDtl', '{
	"paramDefinitions": [
		{
			"name": "bean",
			"type": "java.util.Map",
			"displayName": "bean",
			"argName": "arg0"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '331';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('331', 'SAVE_BILL_FORMATDTL', '331', '331', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '332';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('332', '创建payer', 'createPayer', NULL, '/api', '/cm/account/payer', 'POST', '创建付款人信息。该方法接收付款人信息Map，如果PARTY_ID为空则创建新的参与人、参与人角色（PAYER）和联系信息；如果PARTY_ID已存在则更新参与人信息，检查并创建PAYER角色（如果不存在），保存联系信息。支持个人类参与人的创建和更新
返回信息:
包含操作结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（"create"表示新创建，"exsist"表示已存在，或错误消息）和"pId"（参与人ID）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "bean", "path": "", "type": "java.util.HashMap", "source": "BODY", "required": true, "description": "付款人信息Map，包含参与人、个人类参与人和联系信息的所有属性，用于创建或更新付款人", "displayName": "bean", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'account', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '332';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('332', '创建payer', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.AccountBFImpl', 'createPayer', '{
	"paramDefinitions": [
		{
			"name": "bean",
			"type": "java.util.HashMap",
			"displayName": "bean",
			"argName": "arg0"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '332';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('332', 'CREATE_PAYER', '332', '332', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '333';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('333', '验证此Party是否含有除payer,user以外的其他角色', 'checkHasOtherRolesWithoutPayer', NULL, '/api', '/cm/account/role/other', 'GET', '检查参与人是否具有除Payer和User之外的其他角色。该方法接收参与人ID，查询该参与人的所有角色，判断是否为纯User、纯Payer或User/Payer两种角色的组合。只有这三种情况才允许编辑，其他情况（包含客户角色或其他角色）不允许编辑
返回信息:
包含检查结果的Map，key包括"hasFlag"（"Y"表示不允许编辑，"N"表示允许编辑）、"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息或异常信息）和"roleScene"（角色场景："2"表示User，"5"表示Payer）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "partyId", "path": "partyId", "type": "long", "source": "QUERY", "required": true, "description": "参与人ID，用于查询该参与人的所有角色信息", "displayName": "partyId", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'account', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '333';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('333', '验证此Party是否含有除payer,user以外的其他角色', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.AccountBFImpl', 'checkHasOtherRolesWithoutPayer', '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"type": "long",
			"displayName": "partyId",
			"argName": "arg0"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '333';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('333', 'CHECKHASOTHERROLESWITHOUTPAYER', '333', '333', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '334';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('334', 'validateModifyPayerCPR', 'validateModifyPayerCPR', NULL, '/api', '/cm/account/payer/modifiable', 'GET', '验证修改付款人CPR。该方法接收证件代码、参与人ID、输入的名字、姓氏和生日，调用个人客户服务处理修改付款人CPR，返回处理结果（名字、姓氏、生日、是否受保护、匹配标志、地址ID、地址详情等）
返回信息:
包含验证结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"firstName"（名字）、"lastName"（姓氏）、"birth"（生日）、"protected"（是否受保护）、"matchFlag"（匹配标志）、"addressId"（地址ID）、"addressDetail"（地址详情）、"retMsg"（失败时的错误消息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custCertCode", "path": "custCertCode", "type": "java.lang.String", "source": "QUERY", "required": true, "description": "证件代码，用于验证修改付款人CPR", "displayName": "custCertCode", "defaultValue": "", "exampleValue": ""}, {"name": "partyId", "path": "partyId", "type": "long", "source": "QUERY", "required": true, "description": "参与人ID，用于验证修改付款人CPR", "displayName": "partyId", "defaultValue": "", "exampleValue": ""}, {"name": "inputFirstName", "path": "inputFirstName", "type": "java.lang.String", "source": "QUERY", "required": true, "description": "输入的名字，用于验证修改付款人CPR", "displayName": "inputFirstName", "defaultValue": "", "exampleValue": ""}, {"name": "inputLastName", "path": "inputLastName", "type": "java.lang.String", "source": "QUERY", "required": true, "description": "输入的姓氏，用于验证修改付款人CPR", "displayName": "inputLastName", "defaultValue": "", "exampleValue": ""}, {"name": "inputBirthday", "path": "inputBirthday", "type": "java.lang.String", "source": "QUERY", "required": true, "description": "输入的生日，用于验证修改付款人CPR", "displayName": "inputBirthday", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'account', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '334';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('334', 'validateModifyPayerCPR', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'validateModifyPayerCPR', '{
	"paramDefinitions": [
		{
			"name": "custCertCode",
			"type": "java.lang.String",
			"argName": "arg0"
		},{
			"name": "partyId",
			"type": "long",
			"argName": "arg1"
		},{
			"name": "inputFirstName",
			"type": "java.lang.String",
			"argName": "arg2"
		},{
			"name": "inputLastName",
			"type": "java.lang.String",
			"argName": "arg3"
		},{
			"name": "inputBirthday",
			"type": "java.lang.String",
			"argName": "arg4"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '334';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('334', 'VALIDATE_MODIFY_PAYERCPR', '334', '334', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '335';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('335', '查询certCode', 'queryCertCodeByPartyId', NULL, '/api', '/cm/party/{partyId}/indiv/cercode', 'GET', '根据参与人ID查询证件代码。该方法接收参与人ID，查询参与人信息，返回证件代码
返回信息:
包含查询结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"certCode"（证件代码）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "partyId", "path": "partyId", "type": "long", "source": "PATH", "required": true, "description": "参与人ID，用于查询参与人的证件代码", "displayName": "partyId", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'party', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '335';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('335', '查询certCode', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.PartyBFImpl', 'queryCertCodeByPartyId', '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"type": "long",
			"argName": "arg0"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '335';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('335', 'QUERY_CERTCODE_BYPARTYID', '335', '335', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '336';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('336', 'checkPartyInfor', 'checkPartyInfor', NULL, '/api', '/cm/party/{partyId}/info', 'GET', '检查参与人信息。该方法接收参与人ID，查询参与人信息，返回CPR号码、状态和参与人类型
返回信息:
包含检查结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息）、"cprNumber"（CPR号码）、"state"（状态）、"partyType"（参与人类型，字符串形式）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "partyId", "path": "partyId", "type": "long", "source": "PATH", "required": true, "description": "参与人ID，用于检查参与人信息", "displayName": "partyId", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'party', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '336';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('336', 'checkPartyInfor', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.PartyBFImpl', 'checkPartyInfor', '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"type": "long",
			"argName": "arg0"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '336';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('336', 'CHECK_PARTY_INFOR', '336', '336', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '337';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('337', 'getCprEditConfigMapFromMatrix ', 'getCprEditConfigMapFromMatrix ', NULL, '/api', '/cm/customer/cpreditconfig', 'GET', '从矩阵获取CPR编辑配置Map。该方法接收客户ID、参与人ID、GUI类型和注册类型，验证输入参数的有效性，然后调用个人客户服务从矩阵获取CPR编辑配置（包括是否可编辑CPR号码和CPR档案）
返回信息:
包含CPR编辑配置的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"EDIT_CPR_NUMBER"（是否可编辑CPR号码）、"EDIT_CPR_PROFILE"（是否可编辑CPR档案）、"retMsg"（失败时的错误消息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "long", "source": "QUERY", "argName": "arg0", "required": true, "description": "客户ID，用于从矩阵获取CPR编辑配置（当GUI类型为CUSTOMER_VIEW时必填）", "displayName": "custId", "defaultValue": "", "exampleValue": ""}, {"name": "partyId", "path": "partyId", "type": "long", "source": "QUERY", "argName": "arg1", "required": true, "description": "参与人ID，用于从矩阵获取CPR编辑配置（当GUI类型不为CUSTOMER_VIEW时必填）", "displayName": "partyId", "defaultValue": "", "exampleValue": ""}, {"name": "guiType", "path": "guiType", "type": "java.lang.String", "source": "QUERY", "argName": "arg2", "required": true, "description": "GUI类型，用于标识界面类型（如CUSTOMER_VIEW）", "displayName": "guiType", "defaultValue": "", "exampleValue": ""}, {"name": "registerType", "path": "registerType", "type": "java.lang.String", "source": "QUERY", "argName": "arg3", "required": true, "description": "注册类型，用于标识注册类型", "displayName": "registerType", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '337';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('337', 'getCprEditConfigMapFromMatrix', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'getCprEditConfigMapFromMatrix', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"type": "long",
			"argName": "arg0",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",			
			"required": true,
			"defaultValue": "",
			"description": "custId",
			"exampleValue": ""
		},
		{
			"name": "partyId",
			"type": "long",
			"argName": "arg1",
			"displayName": "partyId",
			"source": "QUERY",
			"path": "partyId",			
			"required": true,
			"defaultValue": "",
			"description": "partyId",
			"exampleValue": ""
		},
		{
			"name": "guiType",
			"type": "java.lang.String",
			"argName": "arg2",
			"displayName": "guiType",
			"source": "QUERY",
			"path": "guiType",			
			"required": true,
			"defaultValue": "",
			"description": "guiType",
			"exampleValue": ""
		},
		{
			"name": "registerType",
			"type": "java.lang.String",
			"argName": "arg3",
			"displayName": "registerType",
			"source": "QUERY",
			"path": "registerType",			
			"required": true,
			"defaultValue": "",
			"description": "registerType",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '337';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('337', 'GETCPREDITCONFIGMAPFROMMATRIX', '337', '337', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '338';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('338', 'checkUniqueParty', 'checkUniqueParty', NULL, '/api', '/cm/party/{partyId}/unique', 'GET', '检查唯一参与人。该方法接收参与人ID、名字、姓氏、地址ID和生日，通过名称生日地址校验参与人是否已经存在，如果存在且不是当前参与人，则返回已存在的参与人ID
返回信息:
包含检查结果的Map，key包括"hasExist"（"Y"表示已存在，"N"表示不存在）、"partyIdOfReturn"（已存在的参与人ID，不存在时为"N"）、"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "partyId", "path": "partyId", "type": "long", "source": "PATH", "argName": "arg0", "required": true, "description": "参与人ID，用于检查唯一参与人（排除当前参与人）", "displayName": "partyId", "defaultValue": "", "exampleValue": ""}, {"name": "firstName", "path": "firstName", "type": "java.lang.String", "source": "QUERY", "argName": "arg1", "required": true, "description": "名字，用于检查唯一参与人", "displayName": "firstName", "defaultValue": "", "exampleValue": ""}, {"name": "lastName", "path": "lastName", "type": "java.lang.String", "source": "QUERY", "argName": "arg2", "required": true, "description": "姓氏，用于检查唯一参与人", "displayName": "lastName", "defaultValue": "", "exampleValue": ""}, {"name": "addressId", "path": "addressId", "type": "long", "source": "QUERY", "argName": "arg3", "required": true, "description": "地址ID，用于检查唯一参与人", "displayName": "addressId", "defaultValue": "", "exampleValue": ""}, {"name": "birthday", "path": "birthday", "type": "java.lang.String", "source": "QUERY", "argName": "arg4", "required": true, "description": "生日，用于检查唯一参与人", "displayName": "birthday", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'party', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '338';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('338', 'checkUniqueParty', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.PartyBFImpl', 'checkUniqueParty', '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"type": "long",
			"argName": "arg0",
			"displayName": "partyId",
			"source": "PATH",
			"path": "partyId",			
			"required": true,
			"defaultValue": "",
			"description": "partyId",
			"exampleValue": ""
		},
		{
			"name": "firstName",
			"type": "java.lang.String",
			"argName": "arg1",
			"displayName": "firstName",
			"source": "QUERY",
			"path": "firstName",			
			"required": true,
			"defaultValue": "",
			"description": "firstName",
			"exampleValue": ""
		},
		{
			"name": "lastName",
			"type": "java.lang.String",
			"argName": "arg2",
			"displayName": "lastName",
			"source": "QUERY",
			"path": "lastName",			
			"required": true,
			"defaultValue": "",
			"description": "lastName",
			"exampleValue": ""
		},
		{
			"name": "addressId",
			"type": "long",
			"argName": "arg3",
			"displayName": "addressId",
			"source": "QUERY",
			"path": "addressId",			
			"required": true,
			"defaultValue": "",
			"description": "addressId",
			"exampleValue": ""
		},
		{
			"name": "birthday",
			"type": "java.lang.String",
			"argName": "arg4",
			"displayName": "birthday",
			"source": "QUERY",
			"path": "birthday",			
			"required": true,
			"defaultValue": "",
			"description": "birthday",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '338';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('338', 'CHECK_UNIQUE_PARTY', '338', '338', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '339';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('339', 'checkCprRegistHasComplete', 'checkCprRegistHasComplete', NULL, '/api', '/cm/party/{partyId}/regist', 'GET', '检查CPR注册是否完成。该方法接收参与人ID，查询参与人信息获取CPR ID，然后查询CPR注册工单状态，如果存在状态为"P"（进行中）的工单，则表示注册未完成
返回信息:
包含检查结果的Map，key包括"hasComplete"（"Y"表示注册已完成（无进行中工单），"N"表示注册未完成（有进行中工单））、"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "partyId", "path": "partyId", "type": "long", "source": "PATH", "argName": "arg0", "required": true, "description": "参与人ID，用于检查CPR注册是否完成", "displayName": "partyId", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'party', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '339';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('339', 'checkCprRegistHasComplete', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.PartyBFImpl', 'checkCprRegistHasComplete', '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"type": "long",
			"argName": "arg0",
			"displayName": "partyId",
			"source": "PATH",
			"path": "partyId",			
			"required": true,
			"defaultValue": "",
			"description": "partyId",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '339';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('339', 'CHECKCPRREGISTHASCOMPLETE', '339', '339', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '340';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('340', 'modifyPartyInformation', 'modifyPartyInformation', NULL, '/api', '/cm/party/info', 'PUT', '修改参与人信息。该方法接收参与人信息VO，如果参与人ID大于0，则调用参与人服务修改参与人的名字、姓氏、生日、地址ID、地址详情、性别和证件代码
返回信息:
包含修改结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "info", "path": "", "type": "com.asiainfo.crm.cm.vo.PartyInfoVO", "source": "BODY", "argName": "arg0", "required": true, "description": "参与人信息VO，包含参与人ID、名字、姓氏、生日、地址ID、地址详情、性别、证件代码等信息，用于修改参与人信息", "displayName": "info", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'party', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '340';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('340', 'modifyPartyInformation', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.PartyBFImpl', 'modifyPartyInformation', '{
	"paramDefinitions": [
		{
			"name": "info",
			"type": "com.asiainfo.crm.cm.vo.PartyInfoVO",
			"argName": "arg0",
			"displayName": "info",
			"source": "BODY",
			"path": "",			
			"required": true,
			"defaultValue": "",
			"description": "info",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '340';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('340', 'MODIFYPARTYINFORMATION', '340', '340', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '341';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('341', '保存修改User信息', 'modifyUserInfo', NULL, '/api', '/cm/party/userInfo', 'PUT', '修改用户信息（仅用于choose payer页面修改user信息）。该方法接收参与人信息VO，查询该参与人下的客户信息，如果客户类型为USER，则修改客户基本信息（名字、姓氏、客户名称、性别、证件代码、生日等），如果地址发生变化则更新地址信息并重新发送CPR工单
返回信息:
包含修改结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "info", "path": "", "type": "com.asiainfo.crm.cm.vo.PartyInfoVO", "source": "BODY", "argName": "arg0", "required": true, "description": "参与人信息VO，包含参与人ID、名字、姓氏、生日、地址ID、地址详情、性别、证件代码等信息，用于修改用户信息", "displayName": "info", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'party', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '341';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('341', '保存修改User信息', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.PartyBFImpl', 'modifyUserInfo', '{
	"paramDefinitions": [
		{
			"name": "info",
			"type": "com.asiainfo.crm.cm.vo.PartyInfoVO",
			"argName": "arg0",
			"displayName": "info",
			"source": "BODY",
			"path": "",			
			"required": true,
			"defaultValue": "",
			"description": "info",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '341';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('341', 'MODIFY_USER_INFO', '341', '341', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '342';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('342', 'getBillDayAndBillCycleDisplay', 'getBillDayAndBillCycleDisplay', NULL, '/api', '/cm/customer/{custId}/agreement/{agrId}/billdaycycle', 'GET', '获取账单日和账单周期显示信息。该方法接收客户ID和协议ID，调用协议服务查询协议的账单周期信息（账单周期、协议代码、付款条款等）
返回信息:
包含账单周期信息的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，失败时包含错误信息）、"billCycle"（账单周期）、"agrCode"（协议代码）、"paymentTerms"（付款条款）', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"path": "custId",
			"type": "long",
			"source": "PATH",
			"argName": "arg0",
			"required": true,
			"description": "客户ID，用于查询协议的账单周期信息",
			"displayName": "custId",
			"defaultValue": "",
			"exampleValue": ""
		},
		{
			"name": "agrId",
			"path": "agrId",
			"type": "long",
			"source": "PATH",
			"argName": "arg1",
			"required": true,
			"description": "agrId",
			"displayName": "agrId",
			"defaultValue": "",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, '2026-01-29 17:29:56', NULL, NULL, '1', 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '342';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('342', 'getBillDayAndBillCycleDisplay', 'java', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'getBillDayAndBillCycleDisplay', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"path": "custId",
			"type": "long",
			"source": "PATH",
			"argName": "arg0",
			"required": true,
			"description": "客户ID，用于查询协议的账单周期信息",
			"displayName": "custId",
			"defaultValue": "",
			"exampleValue": ""
		},
		{
			"name": "agrId",
			"path": "agrId",
			"type": "long",
			"source": "PATH",
			"argName": "arg1",
			"required": true,
			"description": "agrId",
			"displayName": "agrId",
			"defaultValue": "",
			"exampleValue": ""
		}
	]
}', '', NULL, NULL, '2026-01-29 17:29:56', NULL, NULL, '1', 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '342';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('342', 'CUSTOMER_342', '342', '342', '1', 'METHOD', 'N', NULL, '2026-01-29 17:29:56', NULL, NULL, '1', 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '343';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('343', 'getBillingAddress', 'getBillingAddress', NULL, '/api', '/cm/bill/account/{acctId}/address', 'GET', NULL, NULL, NULL, NULL, '{"paramDefinitions": [{"name": "acctId", "path": "acctId", "type": "long", "source": "PATH", "argName": "arg0", "required": true, "description": "账户ID，用于查询该账户的账单地址信息", "displayName": "acctId", "defaultValue": "", "exampleValue": ""}, {"name": "custId", "path": "custId", "type": "long", "source": "QUERY", "argName": "arg1", "required": true, "description": "客户ID，用于查询该客户的账单地址信息", "displayName": "custId", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'bill', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '343';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('343', 'getBillingAddress', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.BillBFImpl', 'getBillingAddress', '{
	"paramDefinitions": [
           {
			"name": "acctId",
			"type": "long",
			"argName": "arg0",
			"displayName": "acctId",
			"source": "PATH",
			"path": "acctId",			
			"required": true,
			"defaultValue": "",
			"description": "acctId",
			"exampleValue": ""
		},		
		{
			"name": "custId",
			"type": "long",
			"argName": "arg1",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",			
			"required": true,
			"defaultValue": "",
			"description": "custId",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '343';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('343', 'getBillingAddress', '343', '343', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '344';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('344', '查询cpr', 'queryCPR', NULL, '/api', '/cm/customer/cpr', 'GET', '查询CPR。该方法接收CPR号码，调用个人客户服务验证CPR号码是否在CPR系统中存在
返回信息:
包含查询结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，成功时返回国际化资源"CMS0001263"对应的文本，失败时返回错误信息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "cpr", "path": "cpr", "type": "java.lang.String", "source": "QUERY", "argName": "arg0", "required": true, "description": "CPR号码，用于验证是否在CPR系统中存在", "displayName": "cpr"}]}', '', NULL, NULL, 'cm', 'customer', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '344';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('344', '查询cpr', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'queryCPR', '{"paramDefinitions":[{"path":"cpr","argName":"arg0","displayName":"cpr","name":"cpr","source":"QUERY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '344';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('344', 'QUERYCPR_344', '344', '344', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '345';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('345', '保存payer地址变更', 'saveAddressChange', NULL, '/api', '/cm/account/{acctId}/address/log', 'POST', '保存地址变更记录。该方法接收旧地址、新地址、客户ID和账户ID，记录地址变更的操作日志，包括账户号码、旧付款人账单地址和新付款人账单地址
返回信息:
包含操作结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）和"retMsg"（结果消息或异常信息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "oldAddress", "path": "oldAddress", "type": "java.lang.String", "source": "BODY", "argName": "arg0", "required": true, "description": "旧的付款人账单地址", "displayName": "oldAddress"}, {"name": "newAddress", "path": "newAddress", "type": "java.lang.String", "source": "BODY", "argName": "arg1", "required": true, "description": "新的付款人账单地址", "displayName": "newAddress"}, {"name": "custId", "path": "custId", "type": "long", "source": "BODY", "argName": "arg2", "required": true, "description": "客户ID，用于记录操作日志", "displayName": "custId"}, {"name": "acctId", "path": "acctId", "type": "long", "source": "PATH", "argName": "arg3", "required": true, "description": "账户ID，用于记录操作日志", "displayName": "acctId"}]}', '', NULL, NULL, 'cm', 'account', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '345';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('345', '更新payer地址', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.AccountBFImpl', 'saveAddressChange', '{"paramDefinitions":[{"path":"oldAddress","argName":"arg0","displayName":"oldAddress","name":"oldAddress","source":"BODY","type":"java.lang.String","required":true},{"path":"newAddress","argName":"arg1","displayName":"newAddress","name":"newAddress","source":"BODY","type":"java.lang.String","required":true},{"path":"custId","argName":"arg2","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"acctId","argName":"arg3","displayName":"acctId","name":"acctId","source":"PATH","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '345';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('345', 'SAVEADDRESSCHANGE_345', '345', '345', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '346';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('346', '保存账单支付方式', 'saveBillingPayment', NULL, '/api', '/cm/account/{acctId}/billingpayment', 'POST', '保存账单支付信息。该方法接收客户ID、账户ID和账单支付VO对象，将支付渠道信息、账户联系信息和账单格式信息转换为对应的Bean对象，然后调用billing服务保存账户支付信息
返回信息:
包含操作结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）和"retMsg"（成功时返回国际化资源"CMS0088085"对应的文本，失败时返回异常信息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "long", "source": "BODY", "argName": "arg0", "required": true, "description": "客户ID，用于保存账单支付信息", "displayName": "custId"}, {"name": "acctId", "path": "acctId", "type": "long", "source": "PATH", "argName": "arg1", "required": true, "description": "账户ID，用于保存账单支付信息", "displayName": "acctId"}, {"name": "infos", "path": "infos", "type": "com.asiainfo.crm.cm.vo.BillingPaymentVo", "source": "BODY", "argName": "arg2", "required": true, "description": "账单支付信息VO对象，包含支付渠道信息、账户联系信息和账单格式信息列表", "displayName": "infos"}]}', '', NULL, NULL, 'cm', 'account', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '346';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('346', '保存账单支付方式', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.AccountBFImpl', 'saveBillingPayment', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"acctId","argName":"arg1","displayName":"acctId","name":"acctId","source":"PATH","type":"long","required":true},{"path":"infos","argName":"arg2","displayName":"infos","name":"infos","source":"BODY","type":"com.asiainfo.crm.cm.vo.BillingPaymentVo","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '346';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('346', 'SAVEBILLINGPAYMENT_346', '346', '346', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '347';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('347', 'validateContact', 'validateContact', NULL, '/api', '/cm/service/CmIndivAction/validateContact', 'POST', '校验联系人。该方法接收客户ID、名字、姓氏和生日，查询客户的邮箱和联系电话联系媒介，验证邮箱和电话不能重复，然后根据客户名称、生日和地址验重，如果存在重复则抛出业务异常
返回信息:
包含校验结果的Map，key包括"retFlag"（"Y"表示校验通过，"N"表示校验不通过）、"retMsg"（失败时的错误消息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "long", "source": "BODY", "argName": "arg0", "required": true, "description": "客户ID，用于校验联系人", "displayName": "custId"}, {"name": "firstName", "path": "firstName", "type": "java.lang.String", "source": "BODY", "argName": "arg1", "required": true, "description": "名字，用于校验联系人", "displayName": "firstName"}, {"name": "lastName", "path": "lastName", "type": "java.lang.String", "source": "BODY", "argName": "arg2", "required": true, "description": "姓氏，用于校验联系人", "displayName": "lastName"}, {"name": "birthday", "path": "birthday", "type": "java.lang.String", "source": "BODY", "argName": "arg3", "required": true, "description": "生日，用于校验联系人", "displayName": "birthday"}]}', '', NULL, NULL, 'cm', 'service', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '347';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('347', 'validateContact', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'validateContact', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"firstName","argName":"arg1","displayName":"firstName","name":"firstName","source":"BODY","type":"java.lang.String","required":true},{"path":"lastName","argName":"arg2","displayName":"lastName","name":"lastName","source":"BODY","type":"java.lang.String","required":true},{"path":"birthday","argName":"arg3","displayName":"birthday","name":"birthday","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '347';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('347', 'VALIDATECONTACT_347', '347', '347', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '348';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('348', 'validateCust', 'validateCust', NULL, '/api', '/cm/service/CmIndivCustomerAction/validateCust', 'POST', '校验客户。该方法根据客户ID查询客户联系媒介，然后根据地址ID和客户名称查询客户联系人，如果存在匹配的联系人则校验失败
返回信息:
包含校验结果的Map，key包括"retFlag"（"Y"表示校验通过，"N"表示校验不通过，即存在匹配的联系人）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "long", "source": "BODY", "argName": "arg0", "required": true, "description": "客户ID，用于查询客户联系媒介信息", "displayName": "custId"}, {"name": "custName", "path": "custName", "type": "java.lang.String", "source": "BODY", "argName": "arg1", "required": true, "description": "客户名称，用于查询匹配的客户联系人", "displayName": "custName"}]}', '', NULL, NULL, 'cm', 'service', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '348';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('348', 'validateCust', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl', 'validateCust', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"custName","argName":"arg1","displayName":"custName","name":"custName","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '348';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('348', 'VALIDATECUST_348', '348', '348', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '349';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('349', 'checkTransferDonner', 'checkTransferDonner', NULL, '/api', '/cm/service/RbossSoAction/checkTransferDonner', 'POST', '校验过户下家。该方法根据客户ID查询客户信息，校验客户状态是否有效（在网、潜在、非活跃状态），如果客户状态为停机状态或无效状态则不允许过户。同时判断是否为匿名客户，匿名客户不允许过户。如果是批量过户流程（billId不为空），则判断B2B Single号段内客户是否允许过户，B2B号码段内不允许过户
返回信息:
包含校验结果的Map，key包括"retVal"（"Y"表示校验通过，"N"表示校验不通过）、"retMsg"（结果消息，校验不通过时返回对应的错误提示信息，如"该客户为停机状态，不允许过户"、"无效客户，不能受理"、"不能过户给匿名客户"、"B2B号码段内不允许过户"等）', NULL, NULL, NULL, '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"oldCustId","argName":"arg1","displayName":"oldCustId","name":"oldCustId","source":"BODY","type":"long","required":true},{"path":"billId","argName":"arg2","displayName":"billId","name":"billId","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, 'cm', 'service', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '349';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('349', 'checkTransferDonner', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.Cust2CrmBFImpl', 'checkTransferDonner', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"oldCustId","argName":"arg1","displayName":"oldCustId","name":"oldCustId","source":"BODY","type":"long","required":true},{"path":"billId","argName":"arg2","displayName":"billId","name":"billId","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '349';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('349', 'CHECKTRANSFERDONNER_349', '349', '349', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '350';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('350', 'getFormOfAddress', 'getFormOfAddress', NULL, '/api', '/cm/service/Common/getFormOfAddress', 'GET', '获取称呼形式。该方法查询客户状态为"1"的静态数据，将其转换为JSON格式的字符串数组，每个元素包含text（代码名称）和value（代码值）
返回信息:
JSON格式的字符串，包含称呼形式的选项列表，格式为[{"text":"代码名称","value":"代码值"},...]', NULL, NULL, NULL, '{"paramDefinitions":[]}', '', NULL, NULL, 'cm', 'service', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '350';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('350', 'getFormOfAddress', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CommonBFImpl', 'getFormOfAddress', '{"paramDefinitions":[]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '350';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('350', 'GETFORMOFADDRESS_350', '350', '350', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '351';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('351', 'queryCustomersAndLog', 'queryCustomersAndLog', NULL, '/api', '/cm/service/ICmCustomerSV/queryCustomersAndLog', 'POST', '根据XML条件查询客户列表，记录查询日志，并补充行业、地址、层级、客户经理等关联信息后返回。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "path": "info",
      "argName": "arg0",
      "displayName": "info",
      "name": "info",
      "source": "BODY",
      "type": "java.util.Map",
      "required": true,
      "description": "",
      "exampleValue": {"NATIONALITY":"00400","CUST_TYPE":"1","STATE":"U","CUST_ID":"21210419971223","CUST_CERT_TYPE":"8","CUST_CERT_CODE":"0104850117","CUST_STATUS":"1","INDIV_CUST_TYPE":"1"}
    },
    {
      "path": "pageNum",
      "handlerClass": "com.aie.api.tool.PageTool:getStartNum",
      "argName": "arg1",
      "displayName": "pageNum",
      "name": "startNum",
      "source": "QUERY",
      "type": "int",
      "required": true,
      "description": "页数",
      "exampleValue": "1"
    },
    {
      "path": "pageSize",
      "handlerClass": "com.aie.api.tool.PageTool:getEndNum",
      "argName": "arg2",
      "displayName": "pageSize",
      "name": "endNum",
      "source": "QUERY",
      "type": "int",
      "required": true,
      "description": "每页条数",
      "exampleValue": "10"
    }
  ]
}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'service', 'SETCustomer001', NULL, '2025-12-03 16:34:46', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '351';

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '351';

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '352';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('352', 'queryPOAByCustId', 'queryPOAByCustId', NULL, '/api', '/cm/service/CmIndivAction/queryPOAByCustId', 'POST', '根据客户ID查询POA（授权委托书）信息。该方法调用客户服务查询POA信息，如果查询结果不为空则解析JSON数据，根据全名、生日、生效时间和到期时间过滤匹配的POA记录，返回POA信息的JSON字符串
返回信息:
包含查询结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"poaResult"（POA信息的JSON字符串，包含协议类型、协议期间、状态、特征、协议项、参与方等信息）', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "custId",
      "path": "custId",
      "type": "java.lang.String",
      "source": "BODY",
      "argName": "arg0",
      "required": true,
      "description": "客户ID，用于查询该客户的POA信息",
      "displayName": "custId",
      "exampleValue": "23210517915222"
    },
    {
      "name": "fullName",
      "path": "fullName",
      "type": "java.lang.String",
      "source": "BODY",
      "argName": "arg1",
      "required": true,
      "description": "全名，用于过滤匹配的POA记录，可以为空",
      "displayName": "fullName",
      "exampleValue": ""
    },
    {
      "name": "birthday",
      "path": "birthday",
      "type": "java.lang.String",
      "source": "BODY",
      "argName": "arg2",
      "required": true,
      "description": "生日，用于过滤匹配的POA记录，可以为空",
      "displayName": "birthday",
      "exampleValue": ""
    },
    {
      "name": "effTime",
      "path": "effTime",
      "type": "java.lang.String",
      "source": "BODY",
      "argName": "arg3",
      "required": true,
      "description": "生效时间，用于过滤匹配的POA记录，可以为空",
      "displayName": "effTime",
      "exampleValue": ""
    },
    {
      "name": "expTime",
      "path": "expTime",
      "type": "java.lang.String",
      "source": "BODY",
      "argName": "arg4",
      "required": true,
      "description": "到期时间，用于过滤匹配的POA记录，可以为空",
      "displayName": "expTime",
      "exampleValue": ""
    }
  ]
}', '', NULL, NULL, 'cm', 'service', '', NULL, '2025-12-02 15:10:19', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '352';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('352', 'queryPOAByCustId', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl', 'queryPOAByCustId', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"java.lang.String","required":true},{"path":"fullName","argName":"arg1","displayName":"fullName","name":"fullName","source":"BODY","type":"java.lang.String","required":true},{"path":"birthday","argName":"arg2","displayName":"birthday","name":"birthday","source":"BODY","type":"java.lang.String","required":true},{"path":"effTime","argName":"arg3","displayName":"effTime","name":"effTime","source":"BODY","type":"java.lang.String","required":true},{"path":"expTime","argName":"arg4","displayName":"expTime","name":"expTime","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '352';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('352', 'QUERYPOABYCUSTID_352', '352', '352', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '353';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('353', 'queryAcctsById', 'queryAcctsById', NULL, '/api', '/cm/service/ICmAccountSV/queryAcctsById', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"acctId","argName":"arg0","displayName":"acctId","name":"acctId","source":"BODY","type":"long","required":true},{"path":"custId","argName":"arg1","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg2","displayName":"pageNum","name":"startIndex","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg3","displayName":"pageSize","name":"endIndex","source":"QUERY","type":"int","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'service', 'SETAccount001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '353';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('353', 'queryAcctsById', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmAccountSV', 'queryAcctsById', '{"paramDefinitions":[{"path":"acctId","argName":"arg0","displayName":"acctId","name":"acctId","source":"BODY","type":"long","required":true},{"path":"custId","argName":"arg1","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg2","displayName":"pageNum","name":"startIndex","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg3","displayName":"pageSize","name":"endIndex","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '353';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('353', 'QUERYACCTSBYID_353', '353', '353', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '354';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('354', 'queryAcctsCountById', 'queryAcctsCountById', NULL, '/api', '/cm/service/ICmAccountSV/queryAcctsCountById', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"acctId","argName":"arg0","displayName":"acctId","name":"acctId","source":"BODY","type":"long","required":true},{"path":"custId","argName":"arg1","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true}]}', '', NULL, NULL, 'cm', 'service', 'SETAccount001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '354';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('354', 'queryAcctsCountById', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmAccountSV', 'queryAcctsCountById', '{"paramDefinitions":[{"path":"acctId","argName":"arg0","displayName":"acctId","name":"acctId","source":"BODY","type":"long","required":true},{"path":"custId","argName":"arg1","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '354';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('354', 'QUERYACCTSCOUNTBYID_354', '354', '354', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '355';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('355', 'queryIndivContactByCustContId', 'queryIndivContactByCustContId', NULL, '/api', '/cm/service/ICmContactSV/queryIndivContactByCustContId', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"custContId","argName":"arg0","displayName":"custContId","name":"custContId","source":"BODY","type":"long","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'service', 'SETContact001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '355';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('355', 'queryIndivContactByCustContId', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmContactSV', 'queryIndivContactByCustContId', '{"paramDefinitions":[{"path":"custContId","argName":"arg0","displayName":"custContId","name":"custContId","source":"BODY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '355';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('355', 'QUERYINDIVCONTACTBYCUSTCONTID_355', '355', '355', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '356';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('356', 'savePartyContactInfo', 'savePartyContactInfo', NULL, '/api', '/cm/service/CmIndivAction/savePartyContactInfo', 'POST', '保存参与人联系信息。该方法接收集团成员Bean、参与人联系Bean和参与人Bean，如果参与人联系信息被修改则保存参与人联系信息，然后创建个人联系关系记录
返回信息:
包含保存结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "groupMemberBean", "path": "groupMemberBean", "type": "java.util.Map", "source": "BODY", "argName": "arg0", "required": true, "description": "集团成员Bean，包含个人联系关系信息", "displayName": "groupMemberBean"}, {"name": "partyContactBean", "path": "partyContactBean", "type": "java.util.Map", "source": "BODY", "argName": "arg1", "required": true, "description": "参与人联系Bean，包含参与人联系信息", "displayName": "partyContactBean"}, {"name": "partyBean", "path": "partyBean", "type": "java.util.Map", "source": "BODY", "argName": "arg2", "required": true, "description": "参与人Bean，包含参与人基本信息", "displayName": "partyBean"}]}', '', NULL, NULL, 'cm', 'service', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '356';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('356', 'savePartyContactInfo', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl', 'savePartyContactInfo', '{"paramDefinitions":[{"path":"groupMemberBean","argName":"arg0","displayName":"groupMemberBean","name":"groupMemberBean","source":"BODY","type":"java.util.Map","required":true},{"path":"partyContactBean","argName":"arg1","displayName":"partyContactBean","name":"partyContactBean","source":"BODY","type":"java.util.Map","required":true},{"path":"partyBean","argName":"arg2","displayName":"partyBean","name":"partyBean","source":"BODY","type":"java.util.Map","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '356';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('356', 'SAVEPARTYCONTACTINFO_356', '356', '356', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '357';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('357', 'saveDkIndivContactInfo', 'saveDkIndivContactInfo', NULL, '/api', '/cm/service/CmIndivAction/saveDkIndivContactInfo', 'POST', '保存丹麦个人联系信息。该方法接收集团成员Bean、参与人联系Bean和参与人Bean，如果是新增则创建个人联系关系、参与人联系信息和参与人基本信息；如果是修改则更新这些信息。方法会设置参与人名称（根据firstName、middleName和lastName组合）
返回信息:
包含保存结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "groupMemberBean", "path": "groupMemberBean", "type": "java.util.Map", "source": "BODY", "argName": "arg0", "required": true, "description": "集团成员Bean，包含个人联系关系信息", "displayName": "groupMemberBean"}, {"name": "partyContactBean", "path": "partyContactBean", "type": "java.util.Map", "source": "BODY", "argName": "arg1", "required": true, "description": "参与人联系Bean，包含参与人联系信息", "displayName": "partyContactBean"}, {"name": "partyBean", "path": "partyBean", "type": "java.util.Map", "source": "BODY", "argName": "arg2", "required": true, "description": "参与人Bean，包含参与人基本信息", "displayName": "partyBean"}]}', '', NULL, NULL, 'cm', 'service', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '357';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('357', 'saveDkIndivContactInfo', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl', 'saveDkIndivContactInfo', '{"paramDefinitions":[{"path":"groupMemberBean","argName":"arg0","displayName":"groupMemberBean","name":"groupMemberBean","source":"BODY","type":"java.util.Map","required":true},{"path":"partyContactBean","argName":"arg1","displayName":"partyContactBean","name":"partyContactBean","source":"BODY","type":"java.util.Map","required":true},{"path":"partyBean","argName":"arg2","displayName":"partyBean","name":"partyBean","source":"BODY","type":"java.util.Map","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '357';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('357', 'SAVEDKINDIVCONTACTINFO_357', '357', '357', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '358';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('358', 'validateIndivContact', 'validateIndivContact', NULL, '/api', '/cm/service/CmIndivAction/validateIndivContact', 'POST', '校验个人联系人。该方法根据参与人ID和客户ID查询个人联系人，如果存在匹配的联系人则校验成功
返回信息:
包含校验结果的Map，key包括"retFlag"（"Y"表示校验成功（存在匹配的联系人），"N"表示校验失败（不存在匹配的联系人））', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "partyId", "path": "partyId", "type": "long", "source": "BODY", "argName": "arg0", "required": true, "description": "参与人ID，用于查询个人联系人", "displayName": "partyId"}, {"name": "custId", "path": "custId", "type": "long", "source": "BODY", "argName": "arg1", "required": true, "description": "客户ID，用于查询个人联系人", "displayName": "custId"}]}', '', NULL, NULL, 'cm', 'service', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '358';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('358', 'validateIndivContact', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl', 'validateIndivContact', '{"paramDefinitions":[{"path":"partyId","argName":"arg0","displayName":"partyId","name":"partyId","source":"BODY","type":"long","required":true},{"path":"custId","argName":"arg1","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '358';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('358', 'VALIDATEINDIVCONTACT_358', '358', '358', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '359';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('359', 'queryCprLogInfo', 'queryCprLogInfo', NULL, '/api', '/cm/service/ICmCustomerSV/queryCprLogInfo', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"info","argName":"arg0","displayName":"info","name":"info","source":"BODY","type":"java.util.Map","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg1","displayName":"pageNum","name":"startIndex","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg2","displayName":"pageSize","name":"endIndex","source":"QUERY","type":"int","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'service', 'SETCMCustCprLog001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '359';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('359', 'queryCprLogInfo', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'queryCprLogInfo', '{"paramDefinitions":[{"path":"info","argName":"arg0","displayName":"info","name":"info","source":"BODY","type":"java.util.Map","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg1","displayName":"pageNum","name":"startIndex","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg2","displayName":"pageSize","name":"endIndex","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '359';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('359', 'QUERYCPRLOGINFO_359', '359', '359', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '360';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('360', 'queryCprLogInfoCount', 'queryCprLogInfoCount', NULL, '/api', '/cm/service/ICmCustomerSV/queryCprLogInfoCount', 'POST', '查询CPR日志信息数量。该方法接收查询条件Map，构建XML查询条件，然后调用客户服务查询符合条件的CPR日志信息总数
返回信息:
符合条件的CPR日志信息总数，int类型', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "info", "path": "info", "type": "java.util.Map", "source": "BODY", "argName": "arg0", "required": true, "description": "查询条件Map，包含查询CPR日志信息的各种条件参数", "displayName": "info"}]}', '', NULL, NULL, 'cm', 'service', 'SETCMCustCprLog001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '360';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('360', 'queryCprLogInfoCount', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'queryCprLogInfoCount', '{"paramDefinitions":[{"path":"info","argName":"arg0","displayName":"info","name":"info","source":"BODY","type":"java.util.Map","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '360';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('360', 'QUERYCPRLOGINFOCOUNT_360', '360', '360', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '361';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('361', 'queryCustContactCount', 'queryCustContactCount', NULL, '/api', '/cm/service/ICmContactSV/queryCustContactCount', 'POST', '查询客户联系人数量。该方法接收查询条件Map和Bean名称，通过参数工具类构建XML查询条件，然后调用联系人服务查询符合条件的客户联系人总数
返回信息:
客户联系人总数，返回符合查询条件的联系人记录数量', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "info", "path": "info", "type": "java.util.Map", "source": "BODY", "argName": "arg0", "required": true, "description": "查询条件Map，包含查询客户联系人的各种条件参数", "displayName": "info"}, {"name": "beanName", "path": "beanName", "type": "java.lang.String", "source": "BODY", "argName": "arg1", "required": true, "description": "Bean名称，用于构建XML查询条件的Bean类型标识", "displayName": "beanName"}]}', '', NULL, NULL, 'cm', 'service', 'SETContact001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '361';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('361', 'queryCustContactCount', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.ContactBFImpl', 'queryCustContactCount', '{"paramDefinitions":[{"path":"info","argName":"arg0","displayName":"info","name":"info","source":"BODY","type":"java.util.Map","required":true},{"path":"beanName","argName":"arg1","displayName":"beanName","name":"beanName","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '361';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('361', 'QUERYCUSTCONTACTCOUNT_361', '361', '361', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '362';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('362', 'queryCustContacts', 'queryCustContacts', NULL, '/api', '/cm/service/ICmContactSV/queryCustContacts', 'POST', '查询客户联系人列表。该方法接收查询条件Map、Bean名称和分页参数（起始索引和结束索引），通过参数工具类构建XML查询条件，然后调用联系人服务查询符合条件的客户联系人列表，支持分页查询
返回信息:
客户联系人值数组，包含符合查询条件的联系人信息列表，每个元素代表一个联系人记录', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "info", "path": "info", "type": "java.util.Map", "source": "BODY", "argName": "arg0", "required": true, "description": "查询条件Map，包含查询客户联系人的各种条件参数", "displayName": "info"}, {"name": "beanName", "path": "beanName", "type": "java.lang.String", "source": "BODY", "argName": "arg1", "required": true, "description": "Bean名称，用于构建XML查询条件的Bean类型标识", "displayName": "beanName"}, {"name": "startNum", "path": "pageNum", "type": "int", "source": "QUERY", "argName": "arg2", "required": true, "description": "起始索引，用于分页查询的起始位置", "displayName": "pageNum", "handlerClass": "com.aie.api.tool.PageTool:getStartNum"}, {"name": "endNum", "path": "pageSize", "type": "int", "source": "QUERY", "argName": "arg3", "required": true, "description": "结束索引，用于分页查询的结束位置", "displayName": "pageSize", "handlerClass": "com.aie.api.tool.PageTool:getEndNum"}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'service', 'SETContact001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '362';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('362', 'queryCustContacts', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.ContactBFImpl', 'queryCustContacts', '{"paramDefinitions":[{"path":"info","argName":"arg0","displayName":"info","name":"info","source":"BODY","type":"java.util.Map","required":true},{"path":"beanName","argName":"arg1","displayName":"beanName","name":"beanName","source":"BODY","type":"java.lang.String","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg2","displayName":"pageNum","name":"startNum","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg3","displayName":"pageSize","name":"endNum","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '362';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('362', 'QUERYCUSTCONTACTS_362', '362', '362', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '363';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('363', 'query360AllUserList', 'query360AllUserList', NULL, '/api', '/cm/service/ICrmFSV/query360AllUserList', 'POST', '根据客户ID、产品目录、账单ID、产品ID等条件，查询并返回该客户下所有符合条件的用户列表，包含用户基本信息、产品信息、协议期、VPN信息、操作链接等，并按账单ID排序后分页返回。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "path": "custId",
      "argName": "arg0",
      "displayName": "custId",
      "name": "custId",
      "source": "BODY",
      "type": "long",
      "required": true,
      "description": "客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作",
      "exampleValue": "23210517915222"
    },
    {
      "path": "prodCatalogId",
      "argName": "arg1",
      "displayName": "prodCatalogId",
      "name": "prodCatalogId",
      "source": "BODY",
      "type": "java.lang.String",
      "required": true,
      "description": "产品线ID",
      "exampleValue": "-1"
    },
    {
      "path": "billId",
      "argName": "arg2",
      "displayName": "billId",
      "name": "billId",
      "source": "BODY",
      "type": "java.lang.String",
      "required": true,
      "description": "号码标识/客户关联标识，用于客户查询、号码识别及账户关系定位",
      "exampleValue": "45903212"
    },
    {
      "path": "offerId",
      "argName": "arg3",
      "displayName": "offerId",
      "name": "offerId",
      "source": "BODY",
      "type": "long",
      "required": true,
      "description": "套餐ID",
      "exampleValue": "30013"
    },
    {
      "path": "pageNum",
      "handlerClass": "com.aie.api.tool.PageTool:getStartNum",
      "argName": "arg4",
      "displayName": "pageNum",
      "name": "startIndex",
      "source": "QUERY",
      "type": "int",
      "required": true,
      "description": "页数",
      "exampleValue": "1"
    },
    {
      "path": "pageSize",
      "handlerClass": "com.aie.api.tool.PageTool:getEndNum",
      "argName": "arg5",
      "displayName": "pageSize",
      "name": "endIndex",
      "source": "QUERY",
      "type": "int",
      "required": true,
      "description": "每页条数",
      "exampleValue": "10"
    }
  ]
}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'service', 'SET360VirtualUser001', NULL, '2025-12-03 15:33:20', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '363';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('363', 'query360AllUserList', 'APPFRAME', 'com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV', 'query360AllUserList', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"prodCatalogId","argName":"arg1","displayName":"prodCatalogId","name":"prodCatalogId","source":"BODY","type":"java.lang.String","required":true},{"path":"billId","argName":"arg2","displayName":"billId","name":"billId","source":"BODY","type":"java.lang.String","required":true},{"path":"offerId","argName":"arg3","displayName":"offerId","name":"offerId","source":"BODY","type":"long","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg4","displayName":"pageNum","name":"startIndex","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg5","displayName":"pageSize","name":"endIndex","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '363';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('363', 'QUERY360ALLUSERLIST_363', '363', '363', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '364';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('364', 'query360AllUserListCount', 'query360AllUserListCount', NULL, '/api', '/cm/service/ICrmFSV/query360AllUserListCount', 'POST', '根据客户ID、产品目录ID、账单ID和套餐ID，查询360度全量用户列表中符合条件的用户关系数量。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "path": "custId",
      "argName": "arg0",
      "displayName": "custId",
      "name": "custId",
      "source": "BODY",
      "type": "long",
      "required": true,
      "description": "客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作",
      "exampleValue": "23210517915222"
    },
    {
      "path": "prodCatalogId",
      "argName": "arg1",
      "displayName": "prodCatalogId",
      "name": "prodCatalogId",
      "source": "BODY",
      "type": "java.lang.String",
      "required": true,
      "description": "产品线ID",
      "exampleValue": "-1"
    },
    {
      "path": "billId",
      "argName": "arg2",
      "displayName": "billId",
      "name": "billId",
      "source": "BODY",
      "type": "java.lang.String",
      "required": true,
      "description": "号码标识/客户关联标识，用于客户查询、号码识别及账户关系定位",
      "exampleValue": "47389201"
    },
    {
      "path": "offerId",
      "argName": "arg3",
      "displayName": "offerId",
      "name": "offerId",
      "source": "BODY",
      "type": "long",
      "required": true,
      "description": "套餐ID",
      "exampleValue": "30013"
    }
  ]
}', '', NULL, NULL, 'cm', 'service', 'SET360VirtualUser001', NULL, '2025-12-03 15:30:26', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '364';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('364', 'query360AllUserListCount', 'APPFRAME', 'com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV', 'query360AllUserListCount', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"prodCatalogId","argName":"arg1","displayName":"prodCatalogId","name":"prodCatalogId","source":"BODY","type":"java.lang.String","required":true},{"path":"billId","argName":"arg2","displayName":"billId","name":"billId","source":"BODY","type":"java.lang.String","required":true},{"path":"offerId","argName":"arg3","displayName":"offerId","name":"offerId","source":"BODY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '364';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('364', 'QUERY360ALLUSERLISTCOUNT_364', '364', '364', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '365';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('365', 'query360AllUserListView', 'query360AllUserListView', NULL, '/api', '/cm/service/ICrmFSV/query360AllUserListView', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"prodCatalogId","argName":"arg1","displayName":"prodCatalogId","name":"prodCatalogId","source":"BODY","type":"java.lang.String","required":true},{"path":"billId","argName":"arg2","displayName":"billId","name":"billId","source":"BODY","type":"java.lang.String","required":true},{"path":"offerId","argName":"arg3","displayName":"offerId","name":"offerId","source":"BODY","type":"long","required":true},{"path":"circuitNumber","argName":"arg4","displayName":"circuitNumber","name":"circuitNumber","source":"BODY","type":"java.lang.String","required":true},{"path":"CPENumber","argName":"arg5","displayName":"CPENumber","name":"CPENumber","source":"BODY","type":"java.lang.String","required":true},{"path":"userName","argName":"arg6","displayName":"userName","name":"userName","source":"BODY","type":"java.lang.String","required":true},{"path":"fibiaCustId","argName":"arg7","displayName":"fibiaCustId","name":"fibiaCustId","source":"BODY","type":"java.lang.String","required":true},{"path":"states","argName":"arg8","displayName":"states","name":"states","source":"BODY","type":"java.lang.String","required":true},{"path":"offerName","argName":"arg9","displayName":"offerName","name":"offerName","source":"BODY","type":"java.lang.String","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg10","displayName":"pageNum","name":"startIndex","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg11","displayName":"pageSize","name":"endIndex","source":"QUERY","type":"int","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'service', 'SET360VirtualUser001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '365';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('365', 'query360AllUserListView', 'APPFRAME', 'com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV', 'query360AllUserListView', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"prodCatalogId","argName":"arg1","displayName":"prodCatalogId","name":"prodCatalogId","source":"BODY","type":"java.lang.String","required":true},{"path":"billId","argName":"arg2","displayName":"billId","name":"billId","source":"BODY","type":"java.lang.String","required":true},{"path":"offerId","argName":"arg3","displayName":"offerId","name":"offerId","source":"BODY","type":"long","required":true},{"path":"circuitNumber","argName":"arg4","displayName":"circuitNumber","name":"circuitNumber","source":"BODY","type":"java.lang.String","required":true},{"path":"CPENumber","argName":"arg5","displayName":"CPENumber","name":"CPENumber","source":"BODY","type":"java.lang.String","required":true},{"path":"userName","argName":"arg6","displayName":"userName","name":"userName","source":"BODY","type":"java.lang.String","required":true},{"path":"fibiaCustId","argName":"arg7","displayName":"fibiaCustId","name":"fibiaCustId","source":"BODY","type":"java.lang.String","required":true},{"path":"states","argName":"arg8","displayName":"states","name":"states","source":"BODY","type":"java.lang.String","required":true},{"path":"offerName","argName":"arg9","displayName":"offerName","name":"offerName","source":"BODY","type":"java.lang.String","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg10","displayName":"pageNum","name":"startIndex","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg11","displayName":"pageSize","name":"endIndex","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '365';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('365', 'QUERY360ALLUSERLISTVIEW_365', '365', '365', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '366';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('366', 'query360AllUserListViewCount', 'query360AllUserListViewCount', NULL, '/api', '/cm/service/ICrmFSV/query360AllUserListViewCount', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"prodCatalogId","argName":"arg1","displayName":"prodCatalogId","name":"prodCatalogId","source":"BODY","type":"java.lang.String","required":true},{"path":"billId","argName":"arg2","displayName":"billId","name":"billId","source":"BODY","type":"java.lang.String","required":true},{"path":"offerId","argName":"arg3","displayName":"offerId","name":"offerId","source":"BODY","type":"long","required":true},{"path":"circuitNumber","argName":"arg4","displayName":"circuitNumber","name":"circuitNumber","source":"BODY","type":"java.lang.String","required":true},{"path":"CPENumber","argName":"arg5","displayName":"CPENumber","name":"CPENumber","source":"BODY","type":"java.lang.String","required":true},{"path":"userName","argName":"arg6","displayName":"userName","name":"userName","source":"BODY","type":"java.lang.String","required":true},{"path":"fibiaCustId","argName":"arg7","displayName":"fibiaCustId","name":"fibiaCustId","source":"BODY","type":"java.lang.String","required":true},{"path":"states","argName":"arg8","displayName":"states","name":"states","source":"BODY","type":"java.lang.String","required":true},{"path":"offerName","argName":"arg9","displayName":"offerName","name":"offerName","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, 'cm', 'service', 'SET360VirtualUser001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '366';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('366', 'query360AllUserListViewCount', 'APPFRAME', 'com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV', 'query360AllUserListViewCount', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"prodCatalogId","argName":"arg1","displayName":"prodCatalogId","name":"prodCatalogId","source":"BODY","type":"java.lang.String","required":true},{"path":"billId","argName":"arg2","displayName":"billId","name":"billId","source":"BODY","type":"java.lang.String","required":true},{"path":"offerId","argName":"arg3","displayName":"offerId","name":"offerId","source":"BODY","type":"long","required":true},{"path":"circuitNumber","argName":"arg4","displayName":"circuitNumber","name":"circuitNumber","source":"BODY","type":"java.lang.String","required":true},{"path":"CPENumber","argName":"arg5","displayName":"CPENumber","name":"CPENumber","source":"BODY","type":"java.lang.String","required":true},{"path":"userName","argName":"arg6","displayName":"userName","name":"userName","source":"BODY","type":"java.lang.String","required":true},{"path":"fibiaCustId","argName":"arg7","displayName":"fibiaCustId","name":"fibiaCustId","source":"BODY","type":"java.lang.String","required":true},{"path":"states","argName":"arg8","displayName":"states","name":"states","source":"BODY","type":"java.lang.String","required":true},{"path":"offerName","argName":"arg9","displayName":"offerName","name":"offerName","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '366';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('366', 'QUERY360ALLUSERLISTVIEWCOUNT_366', '366', '366', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '369';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('369', 'getCustVpnRelation', 'getCustVpnRelation', NULL, '/api', '/cm/service/IBbossCustVpnRelSV/getCustVpnRelation', 'POST', '根据客户ID分页查询该客户在VPN关系中的关联客户列表；若该客户是VPN拥有者则返回其受益客户列表，若是受益者则返回其拥有者客户列表。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "path": "custId",
      "argName": "arg0",
      "displayName": "custId",
      "name": "custId",
      "source": "BODY",
      "type": "java.lang.String",
      "required": true,
      "description": "客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作",
      "exampleValue": "23210517915222"
    },
    {
      "path": "pageNum",
      "handlerClass": "com.aie.api.tool.PageTool:getStartNum",
      "argName": "arg1",
      "displayName": "pageNum",
      "name": "start",
      "source": "QUERY",
      "type": "int",
      "required": true,
      "description": "页数",
      "exampleValue": "3"
    },
    {
      "path": "pageSize",
      "handlerClass": "com.aie.api.tool.PageTool:getEndNum",
      "argName": "arg2",
      "displayName": "pageSize",
      "name": "end",
      "source": "QUERY",
      "type": "int",
      "required": true,
      "description": "每页条数",
      "exampleValue": "10"
    }
  ]
}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'service', 'SETVpnRelSearch001', NULL, '2025-12-03 15:03:50', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '369';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('369', 'getCustVpnRelation', 'APPFRAME', 'com.asiainfo.crm.so.common.bboss.service.interfaces.IBbossCustVpnRelSV', 'getCustVpnRelation', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"java.lang.String","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg1","displayName":"pageNum","name":"start","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg2","displayName":"pageSize","name":"end","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '369';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('369', 'GETCUSTVPNRELATION_369', '369', '369', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '370';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('370', 'getCustVpnRelationCount', 'getCustVpnRelationCount', NULL, '/api', '/cm/service/IBbossCustVpnRelSV/getCustVpnRelationCount', 'POST', '该方法统计指定客户在VPN关系中的关联数量（作为owner或benefi的所有关系记录数）。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "path": "custId",
      "argName": "arg0",
      "displayName": "custId",
      "name": "custId",
      "source": "BODY",
      "type": "java.lang.String",
      "required": true,
      "description": "客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作",
      "exampleValue": "23210517915222"
    }
  ]
}', '', NULL, NULL, 'cm', 'service', 'SETVpnRelSearch001', NULL, '2025-12-03 14:58:55', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '370';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('370', 'getCustVpnRelationCount', 'APPFRAME', 'com.asiainfo.crm.so.common.bboss.service.interfaces.IBbossCustVpnRelSV', 'getCustVpnRelationCount', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '370';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('370', 'GETCUSTVPNRELATIONCOUNT_370', '370', '370', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '371';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('371', 'searchServiceNum', 'searchServiceNum', NULL, '/api', '/cm/service/RbossSoAction/searchServiceNum', 'POST', '查询服务号码是否在实例表中存在。该方法接收服务号码，设置中心信息为账单ID，调用getUserInfoByBillId方法查询用户信息。如果查询到用户信息则返回成功标志，否则返回失败标志和错误消息
返回信息:
包含查询结果的Map，key包括"retVal"（"Y"表示服务号码存在，"N"表示不存在）和"retMsg"（结果消息，不存在时返回"Service number {serviceNum} is not on subscription list"）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "serviceNum", "path": "serviceNum", "type": "java.lang.String", "source": "BODY", "argName": "arg0", "required": true, "description": "服务号码，用于查询该服务号码是否在实例表中存在", "displayName": "serviceNum"}]}', '', NULL, NULL, 'cm', 'service', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '371';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('371', 'searchServiceNum', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.RbossSoBFImpl', 'searchServiceNum', '{"paramDefinitions":[{"path":"serviceNum","argName":"arg0","displayName":"serviceNum","name":"serviceNum","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '371';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('371', 'SEARCHSERVICENUM_371', '371', '371', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '372';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('372', 'queryVpmnTransferResult', 'queryVpmnTransferResult', NULL, '/api', '/cm/service/IBbossVpnTransferResultSV/queryVpmnTransferResult', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"ownerCustId","argName":"arg0","displayName":"ownerCustId","name":"ownerCustId","source":"BODY","type":"long","required":true},{"path":"startDate","argName":"arg1","displayName":"startDate","name":"startDate","source":"BODY","type":"java.lang.String","required":true},{"path":"endDate","argName":"arg2","displayName":"endDate","name":"endDate","source":"BODY","type":"java.lang.String","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg3","displayName":"pageNum","name":"startNum","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg4","displayName":"pageSize","name":"endNum","source":"QUERY","type":"int","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'service', 'SETVpnTransferResult001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '372';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('372', 'queryVpmnTransferResult', 'APPFRAME', 'com.asiainfo.crm.so.common.bboss.service.interfaces.IBbossVpnTransferResultSV', 'queryVpmnTransferResult', '{"paramDefinitions":[{"path":"ownerCustId","argName":"arg0","displayName":"ownerCustId","name":"ownerCustId","source":"BODY","type":"long","required":true},{"path":"startDate","argName":"arg1","displayName":"startDate","name":"startDate","source":"BODY","type":"java.lang.String","required":true},{"path":"endDate","argName":"arg2","displayName":"endDate","name":"endDate","source":"BODY","type":"java.lang.String","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg3","displayName":"pageNum","name":"startNum","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg4","displayName":"pageSize","name":"endNum","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '372';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('372', 'QUERYVPMNTRANSFERRESULT_372', '372', '372', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '373';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('373', 'queryVpmnTransferResultCount', 'queryVpmnTransferResultCount', NULL, '/api', '/cm/service/IBbossVpnTransferResultSV/queryVpmnTransferResultCount', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"ownerCustId","argName":"arg0","displayName":"ownerCustId","name":"ownerCustId","source":"BODY","type":"long","required":true},{"path":"startDate","argName":"arg1","displayName":"startDate","name":"startDate","source":"BODY","type":"java.lang.String","required":true},{"path":"endDate","argName":"arg2","displayName":"endDate","name":"endDate","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, 'cm', 'service', 'SETVpnTransferResult001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '373';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('373', 'queryVpmnTransferResultCount', 'APPFRAME', 'com.asiainfo.crm.so.common.bboss.service.interfaces.IBbossVpnTransferResultSV', 'queryVpmnTransferResultCount', '{"paramDefinitions":[{"path":"ownerCustId","argName":"arg0","displayName":"ownerCustId","name":"ownerCustId","source":"BODY","type":"long","required":true},{"path":"startDate","argName":"arg1","displayName":"startDate","name":"startDate","source":"BODY","type":"java.lang.String","required":true},{"path":"endDate","argName":"arg2","displayName":"endDate","name":"endDate","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '373';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('373', 'QUERYVPMNTRANSFERRESULTCOUNT_373', '373', '373', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '374';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('374', 'getUsersByInsOfferIdRoleId', 'getUsersByInsOfferIdRoleId', NULL, '/api', '/cm/service/RbossSoBF/getUsersByInsOfferIdRoleId', 'POST', '根据产品实例ID和角色ID获取用户列表。该方法接收产品实例ID、账单ID、角色ID、有效类型、区域ID字符串、是否主角色和分页参数，设置中心信息为账单ID，调用实例用户服务查询符合条件的用户列表
返回信息:
用户信息的DataContainer数组，每个元素包含一个用户的属性信息', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "offerInstanceId", "path": "offerInstanceId", "type": "long", "source": "BODY", "argName": "arg0", "required": true, "description": "产品实例ID，用于查询该产品实例下的用户", "displayName": "offerInstanceId"}, {"name": "billId", "path": "billId", "type": "java.lang.String", "source": "BODY", "argName": "arg1", "required": true, "description": "账单ID，用于设置中心信息和过滤查询结果", "displayName": "billId"}, {"name": "roleId", "path": "roleId", "type": "long", "source": "BODY", "argName": "arg2", "required": true, "description": "角色ID，用于过滤查询结果", "displayName": "roleId"}, {"name": "validType", "path": "validType", "type": "int", "source": "BODY", "argName": "arg3", "required": true, "description": "有效类型，用于过滤查询结果", "displayName": "validType"}, {"name": "regionIdsStr", "path": "regionIdsStr", "type": "java.lang.String", "source": "BODY", "argName": "arg4", "required": true, "description": "区域ID字符串，用于过滤查询结果", "displayName": "regionIdsStr"}, {"name": "isMainRole", "path": "isMainRole", "type": "java.lang.String", "source": "BODY", "argName": "arg5", "required": true, "description": "是否主角色，用于过滤查询结果", "displayName": "isMainRole"}, {"name": "startRowIndex", "path": "startRowIndex", "type": "int", "source": "BODY", "argName": "arg6", "required": true, "description": "分页起始行索引", "displayName": "startRowIndex"}, {"name": "endRowIndex", "path": "endRowIndex", "type": "int", "source": "BODY", "argName": "arg7", "required": true, "description": "分页结束行索引", "displayName": "endRowIndex"}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'service', 'SETQInsProdOffer001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '374';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('374', 'getUsersByInsOfferIdRoleId', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.RbossSoBFImpl', 'getUsersByInsOfferIdRoleId', '{"paramDefinitions":[{"path":"offerInstanceId","argName":"arg0","displayName":"offerInstanceId","name":"offerInstanceId","source":"BODY","type":"long","required":true},{"path":"billId","argName":"arg1","displayName":"billId","name":"billId","source":"BODY","type":"java.lang.String","required":true},{"path":"roleId","argName":"arg2","displayName":"roleId","name":"roleId","source":"BODY","type":"long","required":true},{"path":"validType","argName":"arg3","displayName":"validType","name":"validType","source":"BODY","type":"int","required":true},{"path":"regionIdsStr","argName":"arg4","displayName":"regionIdsStr","name":"regionIdsStr","source":"BODY","type":"java.lang.String","required":true},{"path":"isMainRole","argName":"arg5","displayName":"isMainRole","name":"isMainRole","source":"BODY","type":"java.lang.String","required":true},{"path":"startRowIndex","argName":"arg6","displayName":"startRowIndex","name":"startRowIndex","source":"BODY","type":"int","required":true},{"path":"endRowIndex","argName":"arg7","displayName":"endRowIndex","name":"endRowIndex","source":"BODY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '374';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('374', 'GETUSERSBYINSOFFERIDROLEID_374', '374', '374', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '375';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('375', 'createInsUserTable', 'createInsUserTable', NULL, '/api', '/cm/service/IInsUserSV/createInsUserTable', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"java.lang.String","required":true},{"path":"billId","argName":"arg1","displayName":"billId","name":"billId","source":"BODY","type":"java.lang.String","required":true},{"path":"offerInstId","argName":"arg2","displayName":"offerInstId","name":"offerInstId","source":"BODY","type":"java.lang.String","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'service', 'SETInsUserAttr001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '375';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('375', 'createInsUserTable', 'APPFRAME', 'com.asiainfo.crm.so.instance.bboss.service.interfaces.IInsUserSV', 'createInsUserTable', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"java.lang.String","required":true},{"path":"billId","argName":"arg1","displayName":"billId","name":"billId","source":"BODY","type":"java.lang.String","required":true},{"path":"offerInstId","argName":"arg2","displayName":"offerInstId","name":"offerInstId","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '375';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('375', 'CREATEINSUSERTABLE_375', '375', '375', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '376';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('376', 'getRegionIdByUserId', 'getRegionIdByUserId', NULL, '/api', '/cm/service/CommonBF/getRegionIdByUserId', 'GET', '根据用户ID获取区域ID。该方法通过中心工具类查询指定用户ID对应的区域ID
返回信息:
区域ID字符串，如果查询失败则返回null', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "userId", "path": "userId", "type": "long", "source": "QUERY", "argName": "arg0", "required": true, "description": "用户ID，用于查询该用户对应的区域ID", "displayName": "userId"}]}', '', NULL, NULL, 'cm', 'service', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '376';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('376', 'getRegionIdByUserId', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CommonBFImpl', 'getRegionIdByUserId', '{"paramDefinitions":[{"path":"userId","argName":"arg0","displayName":"userId","name":"userId","source":"QUERY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '376';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('376', 'GETREGIONIDBYUSERID_376', '376', '376', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '377';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('377', 'getOfferRelatRoleValue', 'getOfferRelatRoleValue', NULL, '/api', '/cm/service/ICrmProductSV/getOfferRelatRoleValue', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"aOfferId","argName":"arg0","displayName":"aOfferId","name":"aOfferId","source":"BODY","type":"long","required":true},{"path":"aProductRoleId","argName":"arg1","displayName":"aProductRoleId","name":"aProductRoleId","source":"BODY","type":"long","required":true}]}', '', NULL, NULL, 'cm', 'service', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '377';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('377', 'getOfferRelatRoleValue', 'APPFRAME', 'com.ai.omframe.teaminvoke.service.interfaces.ICrmProductSV', 'getOfferRelatRoleValue', '{"paramDefinitions":[{"path":"aOfferId","argName":"arg0","displayName":"aOfferId","name":"aOfferId","source":"BODY","type":"long","required":true},{"path":"aProductRoleId","argName":"arg1","displayName":"aProductRoleId","name":"aProductRoleId","source":"BODY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '377';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('377', 'GETOFFERRELATROLEVALUE_377', '377', '377', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '378';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('378', 'getProductSpecByRoleId', 'getProductSpecByRoleId', NULL, '/api', '/cm/service/ICrmProductSV/getProductSpecByRoleId', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"roleId","argName":"arg0","displayName":"roleId","name":"roleId","source":"BODY","type":"long","required":true}]}', '', NULL, NULL, 'cm', 'service', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '378';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('378', 'getProductSpecByRoleId', 'APPFRAME', 'com.ai.omframe.teaminvoke.service.interfaces.ICrmProductSV', 'getProductSpecByRoleId', '{"paramDefinitions":[{"path":"roleId","argName":"arg0","displayName":"roleId","name":"roleId","source":"BODY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '378';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('378', 'GETPRODUCTSPECBYROLEID_378', '378', '378', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '379';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('379', 'getUserProdsInfoTree', 'getUserProdsInfoTree', NULL, '/api', '/cm/service/Cust360ViewBF/getUserProdsInfoTree', 'GET', '获取用户产品信息树。该方法根据用户ID设置中心信息，然后调用CRM服务获取用户的产品信息树结构，用于360视图展示用户的产品信息
返回信息:
数据容器数组，包含用户的产品信息树结构，每个元素代表一个产品节点', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "userId", "path": "userId", "type": "long", "source": "QUERY", "argName": "arg0", "required": true, "description": "用户ID，用于查询该用户的产品信息树", "displayName": "userId"}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'service', 'SETSoProdAttrForUserProds001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '379';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('379', 'getUserProdsInfoTree', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.Cust360ViewBFImpl', 'getUserProdsInfoTree', '{"paramDefinitions":[{"path":"userId","argName":"arg0","displayName":"userId","name":"userId","source":"QUERY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '379';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('379', 'GETUSERPRODSINFOTREE_379', '379', '379', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '380';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('380', 'query360UserAccrel', 'query360UserAccrel', NULL, '/api', '/cm/service/Cust360ViewBF/query360UserAccrel', 'GET', '查询360用户账户关系。该方法根据用户ID设置中心信息，然后调用CRM服务查询用户的账户关系信息，用于360视图展示用户的账户关系
返回信息:
数据容器数组，包含用户的账户关系信息列表，每个元素代表一个账户关系记录', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "userId", "path": "userId", "type": "long", "source": "QUERY", "argName": "arg0", "required": true, "description": "用户ID，用于查询该用户的账户关系信息", "displayName": "userId"}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'service', 'SETCmAcctInstance002', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '380';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('380', 'query360UserAccrel', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.Cust360ViewBFImpl', 'query360UserAccrel', '{"paramDefinitions":[{"path":"userId","argName":"arg0","displayName":"userId","name":"userId","source":"QUERY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '380';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('380', 'QUERY360USERACCREL_380', '380', '380', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '381';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('381', 'checkIsRangeNumberAndSameRange', 'checkIsRangeNumberAndSameRange', NULL, '/api', '/cm/360view/RbossSoAction/checkIsRangeNumberAndSameRange', 'POST', '检查号码是否在号段内且属于同一号段。该方法接收账单ID，设置中心信息为账单ID，调用资源服务检查号码是否在号段内。如果在号段内，则进一步检查是否属于同一号段。如果不在号段内或不属于同一号段，返回失败标志，否则返回成功标志
返回信息:
包含检查结果的Map，key为"retVal"（"Y"表示号码在号段内且属于同一号段，"N"表示不在号段内或不属于同一号段）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "billId", "path": "billId", "type": "java.lang.String", "source": "BODY", "argName": "arg0", "required": true, "description": "账单ID，用于检查该号码是否在号段内且属于同一号段", "displayName": "billId"}]}', '', NULL, NULL, 'cm', '360view', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '381';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('381', 'checkIsRangeNumberAndSameRange', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.RbossSoBFImpl', 'checkIsRangeNumberAndSameRange', '{"paramDefinitions":[{"path":"billId","argName":"arg0","displayName":"billId","name":"billId","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '381';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('381', 'CHECKISRANGENUMBERANDSAMERANGE_381', '381', '381', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '382';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('382', 'getOfferTypeByOfferId', 'getOfferTypeByOfferId', NULL, '/api', '/cm/360view/BbossSoAction/getOfferTypeByOfferId', 'POST', '根据产品ID获取产品类型和特征值。该方法接收产品ID，查询产品信息，判断产品类型是否为OTT计划或OTT增值服务，查询产品的特征值，判断是否为O365类型（特征值为"21"且等于MDM_OTT_FEATURE_VALUE时不是O365），返回产品类型、是否为O365和特征值
返回信息:
包含产品类型信息的Map，key包括"type"（产品类型：OTT计划或OTT增值服务）、"isO365"（"Y"表示是O365，"N"表示不是）和"featureValue"（产品特征值）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "offerId", "path": "offerId", "type": "long", "source": "BODY", "argName": "arg0", "required": true, "description": "产品ID，用于查询产品类型和特征信息", "displayName": "offerId"}]}', '', NULL, NULL, 'cm', '360view', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '382';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('382', 'getOfferTypeByOfferId', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.BbossSoBFImpl', 'getOfferTypeByOfferId', '{"paramDefinitions":[{"path":"offerId","argName":"arg0","displayName":"offerId","name":"offerId","source":"BODY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '382';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('382', 'GETOFFERTYPEBYOFFERID_382', '382', '382', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '383';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('383', 'getDM002UserFlag', 'getDM002UserFlag', NULL, '/api', '/cm/360view/BbossSoAction/getDM002UserFlag', 'POST', '判断是否为DM002用户，用于宽带业务变更判断。该方法根据用户ID查询实例服务属性，获取技术类型属性值，如果技术类型属性值不为空，则标识为DM002用户
返回信息:
包含判断结果的Map，key包括"DM002Flag"（"Y"表示是DM002用户，"N"表示不是DM002用户）、"TechType_value"（技术类型属性值，仅当是DM002用户时存在）、"retMsg"（异常消息，发生异常时存在）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "userId", "path": "userId", "type": "java.lang.String", "source": "BODY", "argName": "arg0", "required": true, "description": "用户ID，用于查询该用户的实例服务属性，判断是否为DM002用户", "displayName": "userId"}]}', '', NULL, NULL, 'cm', '360view', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '383';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('383', 'getDM002UserFlag', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.Cust360ViewBFImpl', 'getDM002UserFlag', '{"paramDefinitions":[{"path":"userId","argName":"arg0","displayName":"userId","name":"userId","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '383';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('383', 'GETDM002USERFLAG_383', '383', '383', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '384';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('384', 'checIsHasRangesOpen', 'checIsHasRangesOpen', NULL, '/api', '/cm/360view/RbossSoAction/checIsHasRangesOpen', 'GET', '检查是否有号段开放。该方法接收服务号码和功能ID，如果服务号码不为空，则查询前导号码信息。如果服务号码等于前导号码，则根据功能ID判断是否需要检查已使用号码。对于特定功能ID（10000019、10000022、20000039、20000121），如果县区ID为"1"则允许，否则检查是否存在已使用号码。对于其他功能ID，直接检查是否存在已使用号码
返回信息:
包含检查结果的Map，key为"retVal"（"Y"表示允许，"N"表示不允许）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "serviceNum", "path": "serviceNum", "type": "java.lang.String", "source": "QUERY", "argName": "arg0", "required": true, "description": "服务号码，用于检查该服务号码是否有号段开放", "displayName": "serviceNum"}, {"name": "functionId", "path": "functionId", "type": "java.lang.String", "source": "QUERY", "argName": "arg1", "required": true, "description": "功能ID，用于判断检查逻辑，特定功能ID（10000019、10000022、20000039、20000121）有特殊处理", "displayName": "functionId"}]}', '', NULL, NULL, 'cm', '360view', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '384';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('384', 'checIsHasRangesOpen', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.RbossSoBFImpl', 'checIsHasRangesOpen', '{"paramDefinitions":[{"path":"serviceNum","argName":"arg0","displayName":"serviceNum","name":"serviceNum","source":"QUERY","type":"java.lang.String","required":true},{"path":"functionId","argName":"arg1","displayName":"functionId","name":"functionId","source":"QUERY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '384';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('384', 'CHECISHASRANGESOPEN_384', '384', '384', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '385';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('385', 'isCompanyOffer', 'isCompanyOffer', NULL, '/api', '/cm/360view/BbossSoAction/isCompanyOffer', 'POST', '判断产品是否为公司产品。该方法接收产品ID，调用isCompany方法判断是否为公司产品，返回判断结果
返回信息:
包含判断结果的Map，key为"retValue"（"Y"表示是公司产品，"N"表示不是）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "offerId", "path": "offerId", "type": "long", "source": "BODY", "argName": "arg0", "required": true, "description": "产品ID，用于判断是否为公司产品", "displayName": "offerId"}]}', '', NULL, NULL, 'cm', '360view', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '385';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('385', 'isCompanyOffer', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.BbossSoBFImpl', 'isCompanyOffer', '{"paramDefinitions":[{"path":"offerId","argName":"arg0","displayName":"offerId","name":"offerId","source":"BODY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '385';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('385', 'ISCOMPANYOFFER_385', '385', '385', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '386';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('386', 'query360OrdCustByCustIdAndStartEndDateCount', 'query360OrdCustByCustIdAndStartEndDateCount', NULL, '/api', '/cm/360view/RbossSoAction/query360OrdCustByCustIdAndStartEndDateCount', 'POST', '根据客户ID和起止日期查询360订单客户数量。该方法接收客户ID、开始日期、结束日期、区域ID、类型、账单ID、电路号码、CPE号码、PO号码和FIBIA客户ID等参数，调用CRM服务查询符合条件的订单客户数量
返回信息:
包含查询结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息或异常信息）和"retCount"（查询到的订单客户数量，字符串类型）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "long", "source": "BODY", "argName": "arg0", "required": true, "description": "客户ID，用于查询该客户的订单信息", "displayName": "custId"}, {"name": "startDate", "path": "startDate", "type": "java.lang.String", "source": "BODY", "argName": "arg1", "required": true, "description": "开始日期，用于过滤查询结果的时间范围", "displayName": "startDate"}, {"name": "endDate", "path": "endDate", "type": "java.lang.String", "source": "BODY", "argName": "arg2", "required": true, "description": "结束日期，用于过滤查询结果的时间范围", "displayName": "endDate"}, {"name": "regionId", "path": "regionId", "type": "java.lang.String", "source": "BODY", "argName": "arg3", "required": true, "description": "区域ID，用于过滤查询结果", "displayName": "regionId"}, {"name": "type", "path": "type", "type": "int", "source": "BODY", "argName": "arg4", "required": true, "description": "类型，用于过滤查询结果", "displayName": "type"}, {"name": "billId", "path": "billId", "type": "java.lang.String", "source": "BODY", "argName": "arg5", "required": true, "description": "账单ID，用于过滤查询结果", "displayName": "billId"}, {"name": "circuitNumber", "path": "circuitNumber", "type": "java.lang.String", "source": "BODY", "argName": "arg6", "required": true, "description": "电路号码，用于过滤查询结果", "displayName": "circuitNumber"}, {"name": "CPENumber", "path": "CPENumber", "type": "java.lang.String", "source": "BODY", "argName": "arg7", "required": true, "description": "CPE号码，用于过滤查询结果", "displayName": "CPENumber"}, {"name": "PONumber", "path": "PONumber", "type": "java.lang.String", "source": "BODY", "argName": "arg8", "required": true, "description": "PO号码，用于过滤查询结果", "displayName": "PONumber"}, {"name": "fibiaCustId", "path": "fibiaCustId", "type": "java.lang.String", "source": "BODY", "argName": "arg9", "required": true, "description": "FIBIA客户ID，用于过滤查询结果", "displayName": "fibiaCustId"}]}', '', NULL, NULL, 'cm', '360view', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '386';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('386', 'query360OrdCustByCustIdAndStartEndDateCount', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.RbossSoBFImpl', 'query360OrdCustByCustIdAndStartEndDateCount', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"startDate","argName":"arg1","displayName":"startDate","name":"startDate","source":"BODY","type":"java.lang.String","required":true},{"path":"endDate","argName":"arg2","displayName":"endDate","name":"endDate","source":"BODY","type":"java.lang.String","required":true},{"path":"regionId","argName":"arg3","displayName":"regionId","name":"regionId","source":"BODY","type":"java.lang.String","required":true},{"path":"type","argName":"arg4","displayName":"type","name":"type","source":"BODY","type":"int","required":true},{"path":"billId","argName":"arg5","displayName":"billId","name":"billId","source":"BODY","type":"java.lang.String","required":true},{"path":"circuitNumber","argName":"arg6","displayName":"circuitNumber","name":"circuitNumber","source":"BODY","type":"java.lang.String","required":true},{"path":"CPENumber","argName":"arg7","displayName":"CPENumber","name":"CPENumber","source":"BODY","type":"java.lang.String","required":true},{"path":"PONumber","argName":"arg8","displayName":"PONumber","name":"PONumber","source":"BODY","type":"java.lang.String","required":true},{"path":"fibiaCustId","argName":"arg9","displayName":"fibiaCustId","name":"fibiaCustId","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '386';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('386', 'QUERY360ORDCUSTBYCUSTIDANDSTARTENDDATECOUNT_386', '386', '386', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '390';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('390', 'getOrdBasicInfo', 'getOrdBasicInfo', NULL, '/api', '/cm/360view/ICrmFSV/getOrdBasicInfo', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"custOrderId","argName":"arg0","displayName":"custOrderId","name":"custOrderId","source":"BODY","type":"long","required":true},{"path":"createDate","argName":"arg1","displayName":"createDate","name":"createDate","source":"BODY","type":"java.lang.String","required":true},{"path":"regionId","argName":"arg2","displayName":"regionId","name":"regionId","source":"BODY","type":"java.lang.String","required":true},{"path":"OperateType","argName":"arg3","displayName":"OperateType","name":"OperateType","source":"BODY","type":"java.lang.String","required":true},{"path":"doneDate","argName":"arg4","displayName":"doneDate","name":"doneDate","source":"BODY","type":"java.lang.String","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', '360view', 'SET360OrdCust001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '390';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('390', 'getOrdBasicInfo', 'APPFRAME', 'com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV', 'getOrdBasicInfo', '{"paramDefinitions":[{"path":"custOrderId","argName":"arg0","displayName":"custOrderId","name":"custOrderId","source":"BODY","type":"long","required":true},{"path":"createDate","argName":"arg1","displayName":"createDate","name":"createDate","source":"BODY","type":"java.lang.String","required":true},{"path":"regionId","argName":"arg2","displayName":"regionId","name":"regionId","source":"BODY","type":"java.lang.String","required":true},{"path":"OperateType","argName":"arg3","displayName":"OperateType","name":"OperateType","source":"BODY","type":"java.lang.String","required":true},{"path":"doneDate","argName":"arg4","displayName":"doneDate","name":"doneDate","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '390';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('390', 'GETORDBASICINFO_390', '390', '390', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '391';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('391', 'getOrdDeliveryInfo', 'getOrdDeliveryInfo', NULL, '/api', '/cm/360view/ICrmFSV/getOrdDeliveryInfo', 'POST', '根据订单ID查询并组装订单的配送信息，包括收货人姓名/公司名、配送地址、配送方式、联系方式、预计配送日期等，并判断收货人是否为默认客户名称。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "path": "custOrderId",
      "argName": "arg0",
      "displayName": "custOrderId",
      "name": "custOrderId",
      "source": "BODY",
      "type": "long",
      "required": true,
      "description": "客户订单唯一标识，用于订单与合同的关联管理",
      "exampleValue": "32100263471304"
    },
    {
      "path": "createDate",
      "argName": "arg1",
      "displayName": "createDate",
      "name": "createDate",
      "source": "BODY",
      "type": "java.lang.String",
      "required": true,
      "description": "创建时间",
      "exampleValue": "2025-11-24 14:38:54"
    },
    {
      "path": "regionId",
      "argName": "arg2",
      "displayName": "regionId",
      "name": "regionId",
      "source": "BODY",
      "type": "java.lang.String",
      "required": true,
      "description": "区域标识，用于区分客户/账户所属行政或业务区域",
      "exampleValue": "2100"
    },
    {
      "path": "OperateType",
      "argName": "arg3",
      "displayName": "OperateType",
      "name": "OperateType",
      "source": "BODY",
      "type": "java.lang.String",
      "required": true,
      "description": "操作类型",
      "exampleValue": "0"
    },
    {
      "path": "doneDate",
      "argName": "arg4",
      "displayName": "doneDate",
      "name": "doneDate",
      "source": "BODY",
      "type": "java.lang.String",
      "required": true,
      "description": "完成时间",
      "exampleValue": "2025-11-24"
    }
  ]
}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', '360view', 'SET360OrdCust001', NULL, '2025-12-03 11:28:52', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '391';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('391', 'getOrdDeliveryInfo', 'APPFRAME', 'com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV', 'getOrdDeliveryInfo', '{"paramDefinitions":[{"path":"custOrderId","argName":"arg0","displayName":"custOrderId","name":"custOrderId","source":"BODY","type":"long","required":true},{"path":"createDate","argName":"arg1","displayName":"createDate","name":"createDate","source":"BODY","type":"java.lang.String","required":true},{"path":"regionId","argName":"arg2","displayName":"regionId","name":"regionId","source":"BODY","type":"java.lang.String","required":true},{"path":"OperateType","argName":"arg3","displayName":"OperateType","name":"OperateType","source":"BODY","type":"java.lang.String","required":true},{"path":"doneDate","argName":"arg4","displayName":"doneDate","name":"doneDate","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '391';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('391', 'GETORDDELIVERYINFO_391', '391', '391', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '4';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('4', '保存客户地址', 'save customer address', NULL, '/api', '/cm/address', 'POST', '保存客户地址', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "createVO",
			"displayName": "createVO",
			"source": "BODY",
			"path": "",
			"type": "com.asiainfo.crm.cm.vo.CreateCustAddressVO",
			"required": true,
			"defaultValue": "",
			"description": "创建客户地址的数据对象",
			"exampleValue": "{\\"custId\\":\\"23210118288822\\",\\"regionId\\":\\"2101\\",\\"addressId\\":\\"5547122\\",\\"addressType\\":\\"11\\",\\"addressName\\":\\"C/O CO P.O.BOX POB Sn 123 H,Floor. Main.Direction for a Aakirkeby\\",\\"effDate\\":\\"\\",\\"expDate\\":\\"\\",\\"contactPerson\\":\\"\\"}"
		}
	]
}', NULL, NULL, NULL, 'cm', 'address', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '4';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('4', '保存客户地址', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'addCustAddress', '{
	"paramDefinitions": [
		{
			"name": "createVO",
			"argName": "arg0",
			"type": "com.asiainfo.crm.cm.vo.CreateCustAddressVO"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '4';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('4', 'ADD_CUSTOMER_ADDRESS', '4', '4', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '400';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('400', '查询部门成员', 'queryGroupDeptBill', NULL, '/api', '/cm/customer/{custId}/member/page', 'GET', '查询集团成员', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true
		},{
			"name": "deptId",
			"displayName": "deptId",
			"source": "QUERY",
			"path": "deptId",
			"type": "long",
			"required": true
		},{
			"name": "startNum",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},{
			"name": "endNum",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'groupdepartment', NULL, '2025-04-01 14:41:48', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '400';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('400', '查询组织信息', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'queryGroupDeptBill', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		},
		{
			"name": "deptId",
			"argName": "arg1",
			"type": "long"
		},
		{
			"name": "startNum",
			"argName": "arg2",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"type": "int"
		},
		{
			"name": "endNum",
			"argName": "arg3",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"type": "int"
		}
	]
}', NULL, NULL, '2025-04-01 14:46:37', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '400';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('400', 'GROUP_DEPT_LIST', '400', '400', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '401';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('401', '查询部门成员count', 'queryGroupDeptBillCount', NULL, '/api', '/cm/customer/{custId}/member/count', 'GET', '查询集团部门账单数量。该方法接收客户ID和部门ID，构建XML查询参数，然后调用丹麦客户服务查询该部门下的账单总数
返回信息:
符合条件的账单总数，int类型', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "long", "source": "PATH", "required": true, "description": "客户ID，用于查询该客户下指定部门的账单总数", "displayName": "custId"}, {"name": "deptId", "path": "deptId", "type": "long", "source": "QUERY", "required": true, "description": "部门ID，用于查询该部门下的账单总数", "displayName": "deptId"}]}', NULL, NULL, NULL, 'cm', 'groupdepartment', NULL, '2025-04-01 14:41:48', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '401';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('401', '查询组织信息总数', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'queryGroupDeptBillCount', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		},
		{
			"name": "deptId",
			"argName": "arg1",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-01 14:46:37', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '401';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('401', 'GROUP_DEPT_COUNT', '401', '401', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '402';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('402', '查询部门成员', 'queryGroupDeptUser', NULL, '/api', '/cm/customer/{custId}/user/page', 'GET', '查询部门成员', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true
		},{
			"name": "billId",
			"displayName": "billId",
			"source": "QUERY",
			"path": "billId",
			"type": "String",
			"required": false
		},
		{
			"name": "startNum",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},{
			"name": "endNum",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'groupdepartment', 'SETCmInsCmrel001', '2025-04-01 15:13:05', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '402';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('402', '查询部门成员', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV', 'queryGroupDeptUser', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		},
		{
			"name": "billId",
			"argName": "arg1",
			"type": "String"
		},
		{
			"name": "startNum",
			"argName": "arg2",
			"type": "int"
		},
		{
			"name": "endNum",
			"argName": "arg3",
			"type": "int"
		}
	]
}', NULL, NULL, '2025-04-01 14:46:37', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '402';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('402', 'GROUP_DEPT_USER', '402', '402', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '403';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('403', '查询部门成员数量', 'queryGroupDeptUserCount', NULL, '/api', '/cm/customer/{custId}/user/count', 'GET', '查询部门成员数量', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true
		},{
			"name": "billId",
			"displayName": "billId",
			"source": "QUERY",
			"path": "billId",
			"type": "String",
			"required": false
		}
	]
}', NULL, NULL, NULL, 'cm', 'groupdepartment', NULL, '2025-04-01 15:13:05', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '403';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('403', '查询部门成员数量', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV', 'queryGroupDeptUserCount', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		},
		{
			"name": "billId",
			"argName": "arg1",
			"type": "String"
		}
	]
}', NULL, NULL, '2025-04-01 14:46:37', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '403';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('403', 'GROUP_DEPT_USER_COUNT', '403', '403', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '404';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('404', '查询模板信息', 'getTemplateInfo', NULL, '/api', '/common/bp/template', 'GET', '查询模板信息', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "templateCode",
			"displayName": "templateCode",
			"source": "QUERY",
			"path": "templateCode",
			"type": "String",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'bp-template', NULL, '2025-04-01 15:13:05', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '404';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('404', '查询模板信息', 'APPFRAME', 'com.asiainfo.crm.common.bp.service.interfaces.IVolumnBusinessSV', 'getTemplateInfo', '{
	"paramDefinitions": [
		{
			"name": "templateCode",
			"argName": "arg0",
			"type": "String"
		}
	]
}', NULL, NULL, '2025-04-01 14:46:37', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '404';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('404', 'GROUP_DEPT_TEMPLATE', '404', '404', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '405';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('405', '查询模板详细信息', 'getBPTemplate', NULL, '/api', '/common/bp/template/detail', 'GET', '查询模板详细信息', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "templateCode",
			"displayName": "templateCode",
			"source": "QUERY",
			"path": "templateCode",
			"type": "String",
			"required": true
		},{
			"name": "regionId",
			"displayName": "regionId",
			"source": "QUERY",
			"path": "regionId",
			"type": "String",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'bp-template', NULL, '2025-04-01 15:13:05', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '405';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('405', '查询模板详细信息', 'APPFRAME', 'com.asiainfo.crm.common.bp.service.interfaces.IVolumnBusinessSV', 'getBPTemplate', '{
	"paramDefinitions": [
		{
			"name": "templateCode",
			"argName": "arg0",
			"type": "String"
		},{
			"name": "regionId",
			"argName": "arg1",
			"type": "String"
		}
	]
}', NULL, NULL, '2025-04-01 14:46:37', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '405';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('405', 'GROUP_DEPT_TEMPLATE_DETAIL', '405', '405', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '406';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('406', '新增和修改客户部门', 'save customer organize dept', NULL, '/api', '/cm/customer/dept', 'POST', '保存集团客户部门信息', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "saveVO",
			"displayName": "saveVO",
			"source": "BODY",
			"path": "",
			"type": "com.asiainfo.crm.cm.vo.SaveCustOrganizeVO",
			"required": true,
			"defaultValue": "",
			"description": "保存集团客户部门信息",
			"exampleValue": "{\\"newData\\":{\\"REMARKS\\":\\"dev20250408\\",\\"DEPT_TYPE\\":0,\\"DEPT_NAME\\":\\"dev20250408\\",\\"IS_REVISABLE\\":1,\\"CUST_ID\\":23210818381022,\\"PARENT_DEPT_ID\\":23210818381022,\\"WIFI_NAME\\":\\"test\\",\\"REL_CUST_ID\\":23210818381022,\\"REGION_ID\\":\\"2108\\",\\"WIFI_PASSWORD\\":\\"test1234\\"},\\"oldData\\":{}}"
		}
	]
}', NULL, NULL, NULL, 'cm', 'groupdepartment', NULL, '2025-04-08 19:10:34', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '406';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('406', '保存集团客户部门信息', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'saveGroupDeptInfo', '{
	"paramDefinitions": [
		{
			"name": "saveVO",
			"argName": "arg0",
			"type": "com.asiainfo.crm.cm.vo.SaveCustOrganizeVO"
		}
	]
}', NULL, NULL, '2025-04-08 19:11:31', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '406';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('406', 'SAVE_CUSTOMER_DEPT', '406', '406', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '407';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('407', '删除部门下所有成员', 'delete dept member', NULL, '/api', '/cm/customer/dept/{deptId}/member', 'DELETE', '删除部门成员', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "deptId",
			"displayName": "deptId",
			"source": "PATH",
			"path": "deptId",
			"type": "long",
			"required": true
		}
	]
}', NULL, NULL, NULL, 'cm', 'groupdepartment', NULL, '2025-04-08 20:04:04', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '407';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('407', '删除部门成员', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'delGroupDeptOfMember', '{
	"paramDefinitions": [
		{
			"name": "deptId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-08 20:07:47', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '407';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('407', 'DELETE_CUSTOMER_DEPT_MEMBER', '407', '407', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '408';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('408', '删除部门', 'delete dept', NULL, '/api', '/cm/customer/dept/{deptId}', 'DELETE', '删除部门', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "deptId",
			"displayName": "deptId",
			"source": "PATH",
			"path": "deptId",
			"type": "long",
			"required": true
		}
	]
}', NULL, NULL, NULL, 'cm', 'groupdepartment', NULL, '2025-04-08 20:24:34', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '408';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('408', '删除部门', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'delGroupCustDept', '{
	"paramDefinitions": [
		{
			"name": "deptId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-08 20:25:29', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '408';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('408', 'DELETE_CUSTOMER_DEPT', '408', '408', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '409';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('409', '删除部门下的指定成员', 'delete dept designated member', NULL, '/api', '/cm/customer/dept/member', 'DELETE', '删除部门下的指定成员', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "deleteVO",
			"displayName": "deleteVO",
			"source": "BODY",
			"path": "",
			"type": "com.asiainfo.crm.cm.vo.SelectedCustDeptMemberVO",
			"required": true,
			"defaultValue": "",
			"description": "删除部门下指定成员",
			"exampleValue": "{\\"selectMembers\\":[{\\"DEPT_ID\\":410001655440,\\"EFFECTIVE_DATE\\":\\"2025-04-09T10:02:34\\",\\"REGION_ID\\":\\"2107\\",\\"CUST_ID\\":23210018153824,\\"CREATE_OP_ID\\":100000032,\\"ORG_ID\\":21000000,\\"DONE_DATE\\":\\"2025-04-09T10:02:34\\",\\"DONE_CODE\\":111508973471,\\"OP_ID\\":100000032,\\"USER_ID\\":42101111412021,\\"STATE\\":\\"U\\",\\"MEMBER_TYPE\\":3,\\"CUST_REL_ID\\":1100201387,\\"CREATE_DATE\\":\\"2025-04-09T10:02:34\\",\\"BILL_ID\\":\\"47651640\\",\\"MEMBER_CUST_ID\\":-1,\\"CREATE_ORG_ID\\":21000000,\\"EXPIRE_DATE\\":\\"2099-12-31T23:59:59\\"},{\\"DEPT_ID\\":410001655440,\\"EFFECTIVE_DATE\\":\\"2025-04-09T10:15:27\\",\\"REGION_ID\\":\\"2109\\",\\"CUST_ID\\":23210018153824,\\"CREATE_OP_ID\\":100000032,\\"ORG_ID\\":21000000,\\"DONE_DATE\\":\\"2025-04-09T10:15:27\\",\\"DONE_CODE\\":111508974070,\\"OP_ID\\":100000032,\\"USER_ID\\":42105111379721,\\"STATE\\":\\"U\\",\\"MEMBER_TYPE\\":3,\\"CUST_REL_ID\\":1100201586,\\"CREATE_DATE\\":\\"2025-04-09T10:15:27\\",\\"BILL_ID\\":\\"47651619\\",\\"MEMBER_CUST_ID\\":-1,\\"CREATE_ORG_ID\\":21000000,\\"EXPIRE_DATE\\":\\"2099-12-31T23:59:59\\"},{\\"DEPT_ID\\":410001655440,\\"EFFECTIVE_DATE\\":\\"2025-04-09T10:15:27\\",\\"REGION_ID\\":\\"2109\\",\\"CUST_ID\\":23210018153824,\\"CREATE_OP_ID\\":100000032,\\"ORG_ID\\":21000000,\\"DONE_DATE\\":\\"2025-04-09T10:15:27\\",\\"DONE_CODE\\":111508974070,\\"OP_ID\\":100000032,\\"USER_ID\\":42101111411021,\\"STATE\\":\\"U\\",\\"MEMBER_TYPE\\":3,\\"CUST_REL_ID\\":1100201587,\\"CREATE_DATE\\":\\"2025-04-09T10:15:27\\",\\"BILL_ID\\":\\"47651617\\",\\"MEMBER_CUST_ID\\":-1,\\"CREATE_ORG_ID\\":21000000,\\"EXPIRE_DATE\\":\\"2099-12-31T23:59:59\\"}]}"
		}
	]
}
', NULL, NULL, NULL, 'cm', 'groupdepartment', NULL, '2025-04-09 10:27:52', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '409';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('409', '删除部门下的指定成员', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'delGroupDeptNumMember', '{
	"paramDefinitions": [
		{
			"name": "deleteVO",
			"argName": "arg0",
			"type": "com.asiainfo.crm.cm.vo.SelectedCustDeptMemberVO"
		}
	]
}', NULL, NULL, '2025-04-09 10:28:57', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '409';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('409', 'DELETE_CUSTOMER_DEPT_DESIGNATED_MEMBER', '409', '409', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '410';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('410', '分配部门成员到其他部门', 'assign member to other dept', NULL, '/api', '/cm/customer/assign/dept/member', 'POST', '分配部门成员到其他部门', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "deptId",
			"displayName": "deptId",
			"source": "QUERY",
			"path": "deptId",
			"type": "long",
			"required": true
		},{
			"name": "selectVO",
			"displayName": "selectVO",
			"source": "BODY",
			"path": "",
			"type": "com.asiainfo.crm.cm.vo.SelectedCustDeptMemberVO",
			"required": true,
			"defaultValue": "",
			"description": "分配部门成员到其他部门",
			"exampleValue": "{\\"selectMembers\\":[{\\"DEPT_ID\\":410001655440,\\"EFFECTIVE_DATE\\":\\"2025-04-09T10:02:34\\",\\"REGION_ID\\":\\"2107\\",\\"CUST_ID\\":23210018153824,\\"CREATE_OP_ID\\":100000032,\\"ORG_ID\\":21000000,\\"DONE_DATE\\":\\"2025-04-09T10:02:34\\",\\"DONE_CODE\\":111508973471,\\"OP_ID\\":100000032,\\"USER_ID\\":42101111412021,\\"STATE\\":\\"U\\",\\"MEMBER_TYPE\\":3,\\"CUST_REL_ID\\":1100201387,\\"CREATE_DATE\\":\\"2025-04-09T10:02:34\\",\\"BILL_ID\\":\\"47651640\\",\\"MEMBER_CUST_ID\\":-1,\\"CREATE_ORG_ID\\":21000000,\\"EXPIRE_DATE\\":\\"2099-12-31T23:59:59\\"},{\\"DEPT_ID\\":410001655440,\\"EFFECTIVE_DATE\\":\\"2025-04-09T10:15:27\\",\\"REGION_ID\\":\\"2109\\",\\"CUST_ID\\":23210018153824,\\"CREATE_OP_ID\\":100000032,\\"ORG_ID\\":21000000,\\"DONE_DATE\\":\\"2025-04-09T10:15:27\\",\\"DONE_CODE\\":111508974070,\\"OP_ID\\":100000032,\\"USER_ID\\":42105111379721,\\"STATE\\":\\"U\\",\\"MEMBER_TYPE\\":3,\\"CUST_REL_ID\\":1100201586,\\"CREATE_DATE\\":\\"2025-04-09T10:15:27\\",\\"BILL_ID\\":\\"47651619\\",\\"MEMBER_CUST_ID\\":-1,\\"CREATE_ORG_ID\\":21000000,\\"EXPIRE_DATE\\":\\"2099-12-31T23:59:59\\"},{\\"DEPT_ID\\":410001655440,\\"EFFECTIVE_DATE\\":\\"2025-04-09T10:15:27\\",\\"REGION_ID\\":\\"2109\\",\\"CUST_ID\\":23210018153824,\\"CREATE_OP_ID\\":100000032,\\"ORG_ID\\":21000000,\\"DONE_DATE\\":\\"2025-04-09T10:15:27\\",\\"DONE_CODE\\":111508974070,\\"OP_ID\\":100000032,\\"USER_ID\\":42101111411021,\\"STATE\\":\\"U\\",\\"MEMBER_TYPE\\":3,\\"CUST_REL_ID\\":1100201587,\\"CREATE_DATE\\":\\"2025-04-09T10:15:27\\",\\"BILL_ID\\":\\"47651617\\",\\"MEMBER_CUST_ID\\":-1,\\"CREATE_ORG_ID\\":21000000,\\"EXPIRE_DATE\\":\\"2099-12-31T23:59:59\\"}]}"
		}
	]
}', NULL, NULL, NULL, 'cm', 'groupdepartment', NULL, '2025-04-09 11:00:50', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '410';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('410', '分配部门成员到其他部门', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'modifyGroupDeptNumMember', '{
	"paramDefinitions": [
		{
			"name": "deptId",
			"argName": "arg0",
			"type": "long"
		},{
			"name": "selectVO",
			"argName": "arg1",
			"type": "com.asiainfo.crm.cm.vo.SelectedCustDeptMemberVO"
		}
	]
}', NULL, NULL, '2025-04-09 11:01:27', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '410';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('410', 'ASSIGN_MEMBER_TO_OTHER_DEPT', '410', '410', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '411';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('411', '查询模板今日新增成功文件的数量', 'get current day already import db count', NULL, '/api', '/common/bp/template/import/count', 'GET', '获取当天已导入数据库的数量。该方法根据模板代码查询当天已经导入数据库的文件数量，用于控制文件导入的频率和数量限制
返回信息:
包含查询结果的Map，key包括"ret"（"Y"表示成功，"N"表示失败）、"msg"（结果消息，成功时返回数量字符串，失败时返回错误信息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "templateCode", "path": "templateCode", "type": "String", "source": "QUERY", "required": true, "description": "模板代码，用于查询该模板当天已导入数据库的文件数量", "displayName": "templateCode"}]}', NULL, NULL, NULL, 'cm', 'bp-template', NULL, '2025-04-09 14:41:57', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '411';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('411', '查询模板今日新增成功文件的数量', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CommonBFImpl', 'getCurrentDayAlreadyImportDbCount', '{
	"paramDefinitions": [
		{
			"name": "templateCode",
			"argName": "arg0",
			"type": "String"
		}
	]
}', NULL, NULL, '2025-04-09 14:53:49', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '411';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('411', 'QUERY_TEMPLATE_IMPORT_COUNT', '411', '411', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '414';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('414', '给部门分配成员', 'assign member to dept', NULL, '/api', '/cm/customer/{custId}/dept/{deptId}/member', 'POST', '给部门分配成员', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true
		},{
			"name": "deptId",
			"displayName": "deptId",
			"source": "PATH",
			"path": "deptId",
			"type": "long",
			"required": true
		},{
			"name": "select",
			"displayName": "select",
			"source": "BODY",
			"path": "",
			"type": "com.asiainfo.crm.cm.vo.SelectCmInsCmrelVO",
			"required": true,
			"defaultValue": "",
			"description": "给部门分配成员",
			"exampleValue": "{\\"select\\":[{\\"EFFECTIVE_DATE\\":\\"2023-08-14T14:28:22\\",\\"CUST_ID\\":23210018153824,\\"ORG_ID\\":21000000,\\"DONE_DATE\\":\\"2023-08-14T15:54:52\\",\\"DONE_CODE\\":410006447600,\\"OP_ID\\":100000032,\\"IS_ASSIGNED\\":2,\\"CMREL_ID\\":11000008740408,\\"STATE\\":0,\\"USER_ID\\":42105111379721,\\"OFFER_ID\\":90230249,\\"EFFECTIVE_DATE_TYPE\\":0,\\"EXPIRE_DATE_TYPE\\":0,\\"EXT1\\":\\"1\\",\\"EXT2\\":\\"0000000000000000000000000000000000000000000000000000000000000000\\",\\"CREATE_DATE\\":\\"2023-08-14T14:28:34\\",\\"EXT3\\":\\"2023-08-14 14:28:34.654\\",\\"RELA_TYPE\\":2,\\"BILL_ID\\":\\"47651619\\",\\"USER_TYPE\\":8,\\"EXPIRE_DATE\\":\\"2099-12-31T23:59:59\\",\\"PROD_CATALOG_ID\\":172000000001,\\"USER_REGION_CODE\\":\\"2105\\"},{\\"EFFECTIVE_DATE\\":\\"2023-08-14T14:09:10\\",\\"CUST_ID\\":23210018153824,\\"ORG_ID\\":21000000,\\"DONE_DATE\\":\\"2023-08-14T14:10:29\\",\\"DONE_CODE\\":410006447200,\\"OP_ID\\":100000032,\\"IS_ASSIGNED\\":2,\\"CMREL_ID\\":11000008740208,\\"STATE\\":1,\\"USER_ID\\":42101111411021,\\"OFFER_ID\\":90230201,\\"EFFECTIVE_DATE_TYPE\\":0,\\"EXPIRE_DATE_TYPE\\":0,\\"EXT1\\":\\"1\\",\\"EXT2\\":\\"0000000000000000000000000000000000000000000000000000000000000000\\",\\"CREATE_DATE\\":\\"2023-08-14T14:09:20\\",\\"EXT3\\":\\"2023-08-14 14:09:21.668\\",\\"RELA_TYPE\\":2,\\"BILL_ID\\":\\"47651617\\",\\"USER_TYPE\\":1,\\"EXPIRE_DATE\\":\\"2099-12-31T23:59:59\\",\\"PROD_CATALOG_ID\\":171000000001,\\"USER_REGION_CODE\\":\\"2101\\"}]}"
		}
	]
}', NULL, NULL, NULL, 'cm', 'groupdepartment', NULL, '2025-04-10 11:01:56', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '414';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('414', '给部门分配成员', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'saveGroupDeptNumMember', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		},{
			"name": "deptId",
			"argName": "arg1",
			"type": "long"
		},{
			"name": "select",
			"argName": "arg2",
			"type": "com.asiainfo.crm.cm.vo.SelectCmInsCmrelVO"
		}
	]
}', NULL, NULL, '2025-04-10 11:03:15', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '414';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('414', 'ASSIGN_MEMBER_TO_DEPT', '414', '414', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '415';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('415', '部门树形结构查询', 'query dept tree', NULL, '/api', '/cm/customer/{custId}/dept/tree', 'GET', '部门树形结构查询', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "long", "source": "PATH", "required": true, "description": "客户ID，用于查询集团部门树", "displayName": "custId"}]}', NULL, NULL, NULL, 'cm', 'groupdepartment', NULL, '2025-04-10 14:36:07', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '415';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('415', '部门树状结构查询', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerOrgAndDeptBFImpl', 'getGroupDeptTree', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-10 14:37:05', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '415';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('415', 'QUERY_CUSTOMER_DEPT_TREE', '415', '415', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '5';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('5', '查询客户联系媒介', 'query customer contact mediums', NULL, '/api', '/cm/contactMedium/page', 'GET', '查询客户联系媒介', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "long",
			"required": true
		},{
			"name": "start",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},{
			"name": "end",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'contactMedium', 'SETCmCustContMediumAndType001', NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '5';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('5', '查询客户联系媒介', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryCustElectronicMediumForPage', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		},{
			"name": "start",
			"argName": "arg1",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"type": "int"
		},{
			"name": "end",
			"argName": "arg2",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"type": "int"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '5';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('5', 'QUERY_CUSTOMER_CONTACT_MEDIUMS', '5', '5', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '500';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('500', '保存集团客户关系', 'save group relationship', NULL, '/api', '/cm/b2b/custRel', 'POST', '保存集团客户关系', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "arg0",
			"displayName": "arg0",
			"source": "BODY",
			"path": "",
			"type": "com.asiainfo.crm.cm.vo.CustRelVO",
			"required": true,
			"defaultValue": "",
			"description": "保存集团客户关系",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, 'cm', 'groupRela', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '500';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('500', '保存集团客户关系', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'saveCustRel', '{
	"paramDefinitions": [
		{
			"name": "arg0",
			"argName":"arg0",
			"type": "com.asiainfo.crm.cm.vo.CustRelVO"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '500';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('500', 'SAVE_GROUP_RELATIONSHIP', '500', '500', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '501';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('501', '查询集团客户关系', 'queryGroupRelaInfo', NULL, '/api', '/cm/b2b/custRel', 'GET', '查询集团客户关系', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "long",
			"required": true
		},
		{
			"name": "startNum",
			"displayName": "startNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},{
			"name": "endNum",
			"displayName": "endNum",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'groupRela', 'SETCmCustRel001', '2025-04-01 15:13:05', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '501';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('501', '查询集团客户关系', 'APPFRAME', 'com.asiainfo.crm.cm.custrel.service.interfaces.ICmCustRelSV', 'queryCustById', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		},
		{
			"name": "startNum",
			"argName": "arg1",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"type": "int"
		},
		{
			"name": "endNum",
			"argName": "arg2",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"type": "int"
		}
	]
}', NULL, NULL, '2025-04-01 14:46:37', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '501';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('501', 'QUERY_GROUP_RELA_INFO', '501', '501', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '502';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('502', '查询集团客户关系数量', 'queryGroupRelaInfoCount', NULL, '/api', '/cm/b2b/custRel/count', 'GET', '查询集团客户关系数量', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "long",
			"required": true
		}
	]
}', NULL, NULL, NULL, 'cm', 'groupRela', NULL, '2025-04-01 15:13:05', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '502';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('502', '查询集团客户关系数量', 'APPFRAME', 'com.asiainfo.crm.cm.custrel.service.interfaces.ICmCustRelSV', 'queryCustByIdCount', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-01 14:46:37', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '502';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('502', 'QUERY_GROUP_RELA_INFO_COUNT', '502', '502', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '503';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('503', '删除集团客户关系', 'delete group relationship', NULL, '/api', '/cm/b2b/custRel', 'DELETE', '删除集团客户关系', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "arg0",
			"displayName": "arg0",
			"source": "BODY",
			"path": "",
			"type": "com.asiainfo.crm.cm.vo.CustRelsVO",
			"required": true,
			"defaultValue": "",
			"description": "删除集团客户关系",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, 'cm', 'groupRela', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '503';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('503', '删除集团客户关系', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'delCustRel', '{
    "paramDefinitions": [
        {
            "name": "arg0",
            "argName": "arg0",
            "type": "com.asiainfo.crm.cm.vo.CustRelsVO"
        }
    ]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '503';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('503', 'DELETE_GROUP_RELA_INFO', '503', '503', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '600';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('600', '公司组织树状结构查询', 'query organize tree', NULL, '/api', '/cm/customer/{custId}/org/tree', 'GET', '公司组织树状结构查询。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "custId",
      "path": "custId",
      "type": "long",
      "source": "PATH",
      "required": true,
      "description": "客户ID，用于查询集团组织结构树",
      "displayName": "custId",
      "exampleValue": "23210517915222"
    }
  ]
}', NULL, NULL, NULL, 'cm', 'groupOrganize', NULL, '2025-04-14 15:25:16', '2025-12-03 14:48:30', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '600';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('600', '公司组织树状结构查询', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerOrgAndDeptBFImpl', 'getGroupOrgTree', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-14 15:29:00', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '600';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('600', 'QUERY_CUSTOMER_ORG_TREE', '600', '600', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '601';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('601', '查询组织成员信息', 'query organize member page', NULL, '/api', '/cm/customer/org/{deptId}/member/page', 'GET', '查询组织成员信息。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "deptId",
      "path": "deptId",
      "type": "long",
      "source": "PATH",
      "required": true,
      "description": "部门ID，用于查询该部门下的集团成员",
      "displayName": "deptId",
      "defaultValue": "",
      "exampleValue": "410001908838"
    },
    {
      "name": "startNum",
      "path": "pageNum",
      "type": "int",
      "source": "QUERY",
      "required": true,
      "description": "起始索引，用于分页查询",
      "displayName": "pageNum",
      "handlerClass": "com.aie.api.tool.PageTool:getStartNum",
      "exampleValue": "1"
    },
    {
      "name": "endNum",
      "path": "pageSize",
      "type": "int",
      "source": "QUERY",
      "required": true,
      "description": "结束索引，用于分页查询",
      "displayName": "pageSize",
      "handlerClass": "com.aie.api.tool.PageTool:getEndNum",
      "exampleValue": "5"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'groupOrganize', 'SETCmGroupMember001', '2025-04-15 14:12:05', '2025-12-03 14:33:49', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '601';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('601', '查询组织成员信息', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerOrgAndDeptBFImpl', 'queryGroupMembersByCondition', '{
	"paramDefinitions": [
		{
			"name": "deptId",
			"argName": "arg0",
			"type": "long"
		},{
			"name": "startNum",
			"argName": "arg1",
			"type": "int"
		},{
			"name": "endNum",
			"argName": "arg2",
			"type": "int"
		}
	]
}', NULL, NULL, '2025-04-15 14:14:10', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '601';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('601', 'QUERY_CUSTOMER_ORG_MEMBER_PAGE', '601', '601', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '602';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('602', '查询组织成员总数，用于分页', 'query organize member count', NULL, '/api', '/cm/customer/org/{deptId}/member/count', 'GET', '查询组织成员总数，用于分页', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "deptId",
      "path": "deptId",
      "type": "long",
      "source": "PATH",
      "required": true,
      "description": "部门ID，用于查询该部门下的集团成员总数",
      "displayName": "deptId",
      "defaultValue": "",
      "exampleValue": "410001908838"
    }
  ]
}', NULL, NULL, NULL, 'cm', 'groupOrganize', NULL, '2025-04-15 14:40:08', '2025-12-03 14:34:35', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '602';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('602', '查询组织成员总数，用于分页', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerOrgAndDeptBFImpl', 'queryGroupMembersCountByCondition', '{
	"paramDefinitions": [
		{
			"name": "deptId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-15 14:40:49', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '602';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('602', 'QUERY_CUSTOMER_ORG_MEMBER_COUNT', '602', '602', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '603';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('603', '获取下属组织', 'query sub organize', NULL, '/api', '/cm/customer/{custId}/sub-org', 'GET', '获取下属组织。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "custId",
      "path": "custId",
      "type": "long",
      "source": "PATH",
      "required": true,
      "description": "客户ID，用于查询该客户组织及其所有子部门的部门ID",
      "displayName": "custId",
      "defaultValue": "",
      "exampleValue": "23210517915222"
    }
  ]
}', NULL, NULL, NULL, 'cm', 'groupOrganize', NULL, '2025-04-15 16:02:15', '2025-12-03 16:29:48', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '603';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('603', '获取下属组织', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerOrgAndDeptBFImpl', 'getSubNodeDeptIds', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-15 15:03:38', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '603';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('603', 'QUERY_CUSTOMER_SUB_ORG', '603', '603', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '604';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('604', '校验是否有子组织', 'has sub organize', NULL, '/api', '/cm/customer/check-group-org-parent', 'GET', '校验是否有子组织', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "long", "source": "QUERY", "required": false, "description": "客户ID，用于检查集团组织父节点", "displayName": "custId", "defaultValue": ""}, {"name": "parentDeptId", "path": "parentDeptId", "type": "long", "source": "QUERY", "required": true, "description": "父部门ID，用于检查该父部门下是否有子节点和成员", "displayName": "parentDeptId", "defaultValue": ""}]}', NULL, NULL, NULL, 'cm', 'groupOrganize', NULL, '2025-04-15 16:02:16', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '604';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('604', '校验是否有子组织', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerOrgAndDeptBFImpl', 'checkGroupOrgParent', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		},{
			"name": "parentDeptId",
			"argName": "arg1",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-15 15:20:10', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '604';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('604', 'HAS_SUB_ORG', '604', '604', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '605';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('605', '保存集团组织信息', 'save customer organize', NULL, '/api', '/cm/customer/org', 'POST', '保存集团组织信息', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "saveVO", "path": "", "type": "com.asiainfo.crm.cm.vo.SaveCustOrganizeVO", "source": "BODY", "required": true, "description": "保存客户组织VO，包含新旧组织数据，用于保存或修改集团客户组织信息", "displayName": "saveVO", "defaultValue": "", "exampleValue": "{\\"newData\\":{\\"REMARKS\\":\\"dev20250408\\",\\"DEPT_TYPE\\":0,\\"DEPT_NAME\\":\\"dev20250408\\",\\"IS_REVISABLE\\":1,\\"CUST_ID\\":23210818381022,\\"PARENT_DEPT_ID\\":23210818381022,\\"WIFI_NAME\\":\\"test\\",\\"REL_CUST_ID\\":23210818381022,\\"REGION_ID\\":\\"2108\\",\\"WIFI_PASSWORD\\":\\"test1234\\"},\\"oldData\\":{}}"}, {"name": "oldParentDeptId", "path": "oldParentDeptId", "type": "String", "source": "QUERY", "description": "旧父部门ID，用于判断上级组织是否变更", "displayName": "oldParentDeptId"}, {"name": "oldRelCustId", "path": "oldRelCustId", "type": "String", "source": "QUERY", "description": "旧关联客户ID，用于判断关联客户是否变更", "displayName": "oldRelCustId"}]}', NULL, NULL, NULL, 'cm', 'groupOrganize', NULL, '2025-04-15 16:02:12', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '605';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('605', '保存集团组织信息', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerOrgAndDeptBFImpl', 'saveGroupCustOrgInfo', '{
	"paramDefinitions": [
		{
			"name": "saveVO",
			"argName": "arg0",
			"type": "com.asiainfo.crm.cm.vo.SaveCustOrganizeVO"
		},{
			"name": "oldParentDeptId",
			"argName": "arg1",
			"type": "String"
		},{
			"name": "oldRelCustId",
			"argName": "arg2",
			"type": "String"
		}
	]
}', NULL, NULL, '2025-04-15 16:15:21', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '605';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('605', 'SAVE_CUSTOMER_ORG', '605', '605', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '606';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('606', '删除组织信息', 'delete customer organize', NULL, '/api', '/cm/customer/org/{orgId}', 'DELETE', '删除组织信息', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "orgId", "path": "orgId", "type": "long", "source": "PATH", "required": true, "description": "组织ID，用于删除集团客户组织", "displayName": "orgId", "defaultValue": ""}]}', NULL, NULL, NULL, 'cm', 'groupOrganize', NULL, '2025-04-15 16:10:54', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '606';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('606', '删除组织信息', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerOrgAndDeptBFImpl', 'delGroupCustOrg', '{
	"paramDefinitions": [
		{
			"name": "orgId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-15 16:17:34', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '606';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('606', 'DELETE_CUSTOMER_ORG', '606', '606', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '607';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('607', '删除组织中的成员', 'delete customer organize member', NULL, '/api', '/cm/customer/org/member', 'DELETE', '删除组织中的成员', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "deleteVO", "path": "", "type": "com.asiainfo.crm.cm.vo.SelectedCustDeptMemberVO", "source": "BODY", "required": true, "description": "删除成员VO，包含要删除的成员列表，用于删除集团成员", "displayName": "deleteVO", "exampleValue": "{\\"selectMembers\\":[{\\"DEPT_ID\\":410001655440,\\"EFFECTIVE_DATE\\":\\"2025-04-09T10:02:34\\",\\"REGION_ID\\":\\"2107\\",\\"CUST_ID\\":23210018153824,\\"CREATE_OP_ID\\":100000032,\\"ORG_ID\\":21000000,\\"DONE_DATE\\":\\"2025-04-09T10:02:34\\",\\"DONE_CODE\\":111508973471,\\"OP_ID\\":100000032,\\"USER_ID\\":42101111412021,\\"STATE\\":\\"U\\",\\"MEMBER_TYPE\\":3,\\"CUST_REL_ID\\":1100201387,\\"CREATE_DATE\\":\\"2025-04-09T10:02:34\\",\\"BILL_ID\\":\\"47651640\\",\\"MEMBER_CUST_ID\\":-1,\\"CREATE_ORG_ID\\":21000000,\\"EXPIRE_DATE\\":\\"2099-12-31T23:59:59\\"}]}"}]}', NULL, NULL, NULL, 'cm', 'groupOrganize', NULL, '2025-04-15 16:54:07', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '607';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('607', '删除组织中的成员', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerOrgAndDeptBFImpl', 'delGroupMember', '{
	"paramDefinitions": [
		{
			"name": "deleteVO",
			"argName": "arg0",
			"type": "com.asiainfo.crm.cm.vo.SelectedCustDeptMemberVO"
		}
	]
}', NULL, NULL, '2025-04-15 16:55:13', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '607';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('607', 'DELETE_CUSTOMER_ORG_MEMBER', '607', '607', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '608';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('608', '查询个人客户partyId', 'get indiv customer party id', NULL, '/api', '/cm/customer/indiv/{custId}/party-id', 'GET', '查询个人客户partyId', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "long", "source": "PATH", "required": true, "description": "客户ID，用于查询个人客户信息", "displayName": "custId", "defaultValue": ""}]}', NULL, NULL, NULL, 'cm', 'groupOrganize', NULL, '2025-04-15 17:02:54', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '608';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('608', '查询个人客户partyId', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerOrgAndDeptBFImpl', 'queryIndivCust', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-15 17:04:09', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '608';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('608', 'GET_INDIV_CUSTOMER_PARTY_ID', '608', '608', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '609';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('609', '查询客户基本信息', 'query customer basic info', NULL, '/api', '/cm/customer/{custId}/2', 'GET', '查询客户基本信息。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "custId",
      "displayName": "custId",
      "source": "PATH",
      "path": "custId",
      "type": "long",
      "required": true,
      "defaultValue": "",
      "description": "客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作",
      "exampleValue": "23210517915222"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'groupOrganize', 'SETCustomer001', '2025-04-16 11:11:08', '2025-12-03 14:53:36', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '609';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('609', '查询客户基本信息', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryCustomerMaskByCustId', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-16 11:12:23', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '609';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('609', 'QUERY_CUSTOMER_BASIC_INFO', '609', '609', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '610';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('610', '查询客户信息', 'query customer info', NULL, '/api', '/cm/customer/{custId}/3', 'GET', '查询客户信息', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "PATH",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "客户ID"
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'groupOrganize', NULL, '2025-04-16 14:29:21', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '610';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('610', '查询客户信息', 'APPFRAME', 'com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICmInterfaceSV', 'queryCustotmerByCustId', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-16 14:33:16', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '610';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('610', 'QUERY_CUSTOMER_INFO', '610', '610', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '612';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('612', '360视图查询用户数据count', 'query 360view user count', NULL, '/api', '/cm/360view/user/count', 'GET', '360视图查询用户数据count', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "long",
			"required": true,
			"description": "客户ID"
		},{
			"name": "prodCatalogId",
			"displayName": "prodCatalogId",
			"source": "QUERY",
			"path": "prodCatalogId",
			"type": "String",
			"required": true,
			"description": "产品线ID"
		},{
			"name": "billId",
			"displayName": "billId",
			"source": "QUERY",
			"path": "billId",
			"type": "String",
			"description": "bill id"
		},{
			"name": "offerId",
			"displayName": "offerId",
			"source": "QUERY",
			"path": "offerId",
			"type": "long",
			"description": "套餐ID"
		}
	]
}', NULL, NULL, NULL, 'cm', 'groupOrganize', NULL, '2025-04-16 14:56:06', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '612';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('612', '360视图查询用户数据count', 'APPFRAME', 'com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICm2SoSV', 'query360AllUserListCount', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		},{
			"name": "prodCatalogId",
			"argName": "arg1",
			"type": "String"
		},{
			"name": "billId",
			"argName": "arg2",
			"type": "String"
		},{
			"name": "offerId",
			"argName": "arg3",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-04-16 14:57:10', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '612';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('612', 'QUERY_CUSTOMER_USER_COUNT', '612', '612', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '613';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('613', '查询成员用户数', 'query member user count', NULL, '/api', '/cm/composite/ins/member/count', 'GET', '查询成员用户数', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "offerInstanceId",
			"displayName": "offerInstanceId",
			"source": "QUERY",
			"path": "offerInstanceId",
			"type": "long",
			"required": true,
			"description": "offer实例ID"
		},{
			"name": "billId",
			"displayName": "billId",
			"source": "QUERY",
			"path": "billId",
			"type": "String",
			"description": "bill id"
		}
	]
}', NULL, NULL, NULL, 'cm', 'groupOrganize', NULL, '2025-04-16 15:14:32', NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '613';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('613', '查询成员用户数', 'APPFRAME', 'com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV', 'qryMemberUserListCount', '{
	"paramDefinitions": [
		{
			"name": "offerInstanceId",
			"argName": "arg0",
			"type": "long"
		},{
			"name": "billId",
			"argName": "arg1",
			"type": "String"
		}
	]
}', NULL, NULL, '2025-04-16 15:20:40', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '613';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('613', 'QUERY_MEMBER_USER_COUNT', '613', '613', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '635';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('635', '根据客户id查询客户在集团组织的deptId', 'queryCustOrganizeDeptIdByRelCustId', NULL, '/api', '/cm/customer/{relCustId}/org/deptId', 'GET', '根据关联客户ID查询客户组织部门ID。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "relCustId",
      "path": "relCustId",
      "type": "long",
      "source": "PATH",
      "required": true,
      "description": "关联客户ID，用于查询客户组织部门ID",
      "displayName": "relCustId",
      "exampleValue": "23210517915222"
    }
  ]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, '2025-05-26 14:56:48', '2025-12-03 10:59:00', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '635';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('635', '根据客户id查询客户在集团组织的deptId', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'queryCustOrganizeDeptIdByRelCustId', '{
	"paramDefinitions": [
		{
			"name": "relCustId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, '2025-05-26 14:58:39', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '635';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('635', 'QUERY_CUST_ORGANIZE_DEPTID', '635', '635', '1', 'METHOD', 'N', '2025-05-26 14:59:29', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '700';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('700', '根据部门名称查询客户下的部门', 'queryCustOrgByDept', NULL, '/api', '/cm/customer/{custId}/group/org', 'GET', NULL, NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"path": "custId",
			"argName": "arg0",
			"displayName": "custId",
			"name": "custId",
			"source": "PATH",
			"type": "long",
			"required": true
		},
		{
			"path": "deptName",
			"argName": "arg1",
			"displayName": "deptName",
			"name": "deptName",
			"source": "QUERY",
			"type": "java.lang.String",
			"required": false
		},
		{
			"path": "pageNum",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"argName": "arg2",
			"displayName": "pageNum",
			"name": "startNum",
			"source": "QUERY",
			"type": "int",
			"required": true
		},
		{
			"path": "pageSize",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"argName": "arg3",
			"displayName": "pageSize",
			"name": "endNum",
			"source": "QUERY",
			"type": "int",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETCmGroupOrgStruct002', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '700';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('700', '根据部门名称查询客户下的部门', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryCustOrgByDept', '{
	"paramDefinitions": [
		{
			"path": "custId",
			"argName": "arg0",
			"displayName": "custId",
			"name": "custId",
			"source": "PATH",
			"type": "long",
			"required": true
		},
		{
			"path": "deptName",
			"argName": "arg1",
			"displayName": "deptName",
			"name": "deptName",
			"source": "QUERY",
			"type": "java.lang.String",
			"required": false
		},
		{
			"path": "pageNum",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"argName": "arg2",
			"displayName": "pageNum",
			"name": "startNum",
			"source": "QUERY",
			"type": "int",
			"required": true
		},
		{
			"path": "pageSize",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"argName": "arg3",
			"displayName": "pageSize",
			"name": "endNum",
			"source": "QUERY",
			"type": "int",
			"required": true
		}
	]
}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '700';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('700', 'QUERYCUSTORGBYDEPT_700', '700', '700', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '701';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('701', '根据部门名称查询客户下的部门总数', 'queryCustOrgCountByDept', NULL, '/api', '/cm/customer/{custId}/group/org/count', 'GET', NULL, NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"path": "custId",
			"argName": "arg0",
			"displayName": "custId",
			"name": "custId",
			"source": "PATH",
			"type": "long",
			"required": true
		},
		{
			"path": "deptName",
			"argName": "arg1",
			"displayName": "deptName",
			"name": "deptName",
			"source": "QUERY",
			"type": "java.lang.String",
			"required": false
		}
	]
}', '', NULL, NULL, 'cm', 'customer', 'SETCmGroupOrgStruct002', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '701';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('701', '根据部门名称查询客户下的部门总数', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryCustOrgCountByDept', '{
	"paramDefinitions": [
		{
			"path": "custId",
			"argName": "arg0",
			"displayName": "custId",
			"name": "custId",
			"source": "PATH",
			"type": "long",
			"required": true
		},
		{
			"path": "deptName",
			"argName": "arg1",
			"displayName": "deptName",
			"name": "deptName",
			"source": "QUERY",
			"type": "java.lang.String",
			"required": false
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '701';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('701', 'QUERYCUSTORGBYDEPTCNT_701', '701', '701', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '702';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('702', '查询联系人信息', 'queryIndivCont', NULL, '/api', '/cm/customer/indivCont', 'GET', '查询个人联系人。该方法接收账单ID，设置中心信息，然后调用团队调用服务根据账单ID获取用户基本信息，如果用户是集团客户则抛出异常，否则返回客户ID、用户ID、品牌、区域ID和参与人ID
返回信息:
包含查询结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（客户ID，成功时存在）、"userId"（用户ID）、"barnd"（品牌）、"regionId"（区域ID）、"partyId"（参与人ID）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "billId", "path": "billId", "type": "java.lang.String", "source": "QUERY", "argName": "arg0", "required": true, "description": "账单ID，用于查询个人联系人信息", "displayName": "billId"}]}', '', NULL, NULL, 'cm', 'customer', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '702';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('702', '查询联系人信息', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'queryIndivCont', '{"paramDefinitions":[{"path":"billId","argName":"arg0","displayName":"billId","name":"billId","source":"QUERY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '702';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('702', 'QUERYINDIVCONT_702', '702', '702', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '703';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('703', 'queryCmxIndivCustomerValue', 'queryCmxIndivCustomerValue', NULL, '/api', '/cm/customer/{custId}/CmxIndivCustomer', 'GET', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"PATH","type":"long","required":true}]}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '703';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('703', 'queryCmxIndivCustomerValue', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryCmxIndivCustomerValue', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"PATH","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '703';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('703', 'QUERYCMXINDIVCUSTOMERVALUE_703', '703', '703', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '704';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('704', '查询默认客户id', 'getCustId', NULL, '/api', '/cm/customer/defaultId', 'GET', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"custType","argName":"arg0","displayName":"custType","name":"custType","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, 'cm', 'customer', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '704';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('704', '查询默认客户id', 'APPFRAME', 'com.asiainfo.crm.cm.common.service.interfaces.ICmCommonSV', 'getCustId', '{"paramDefinitions":[{"path":"custType","argName":"arg0","displayName":"custType","name":"custType","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '704';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('704', 'GETCUSTID_704', '704', '704', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '705';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('705', '保存集团成员', 'saveLnGroupMember', NULL, '/api', '/cm/customer/groupmember/ln', 'POST', '保存LN集团成员。该方法接收集团成员VO，包含个人客户信息、集团成员信息、扩展信息等，处理新旧数据合并，设置客户状态（网外成员设置为匿名潜在客户），判断成员是否已存在（根据账单ID、状态、成员类型），对于新增网外成员插入CPR订购工单，对于修改成员插入公共工单同步客户信息，保存客户信息、成员关系和扩展信息
返回信息:
包含保存结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，成功时返回国际化资源"CMS0076045"对应的文本，失败时包含错误信息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "infos", "path": "", "type": "com.asiainfo.crm.cm.vo.GroupMemberVo", "source": "BODY", "argName": "arg0", "required": true, "description": "集团成员VO，包含个人客户信息、集团成员信息、扩展信息的新旧数据，用于保存LN集团成员", "displayName": "infos"}]}', '', NULL, NULL, 'cm', 'customer', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '705';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('705', '保存集团成员', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl', 'saveLnGroupMember', '{
	"paramDefinitions": [
		{
			"path": "",
			"argName": "arg0",
			"displayName": "infos",
			"name": "infos",
			"source": "BODY",
			"type": "com.asiainfo.crm.cm.vo.GroupMemberVo",
			"required": true
		}
	]
}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '705';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('705', 'SAVELNGROUPMEMBER_705', '705', '705', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '706';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('706', '保存TN集团成员', 'savetelnorGroupMember', NULL, '/api', '/cm/customer/groupmember/tn', 'POST', '保存Telnor集团成员。该方法接收成员来源、成员参与人ID和集团成员VO，处理网内网外成员（网外成员分为4种：从CPR系统查询、从个人客户、从参与人、操作员输入），设置客户为匿名潜在客户，校验成员是否已存在，对于网内成员或选择客户作为成员则只插入角色表和成员关系表，对于网外成员需要保存客户信息、参与人信息、成员关系和扩展信息
返回信息:
包含保存结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，成功时为"success"，失败时包含错误信息）、"custId"（客户ID，成功时存在）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "memberFrom", "path": "memberFrom", "type": "java.lang.String", "source": "QUERY", "argName": "arg0", "required": true, "description": "成员来源，标识成员来源类型（\\"cpr\\"、\\"indiv\\"、\\"party\\"、\\"operator\\"），用于处理不同来源的成员", "displayName": "memberFrom"}, {"name": "memberPartyId", "path": "memberPartyId", "type": "long", "source": "QUERY", "argName": "arg1", "required": true, "description": "成员参与人ID，用于关联参与人信息，如果为-1则不使用", "displayName": "memberPartyId"}, {"name": "infos", "path": "", "type": "com.asiainfo.crm.cm.vo.GroupMemberVo", "source": "BODY", "argName": "arg2", "required": true, "description": "集团成员VO，包含个人客户信息、集团成员信息、扩展信息，用于保存Telnor集团成员", "displayName": "infos"}]}', '', NULL, NULL, 'cm', 'customer', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '706';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('706', '保存TN集团成员', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl', 'savetelnorGroupMember', '{
	"paramDefinitions": [
		{
			"path": "memberFrom",
			"argName": "arg0",
			"displayName": "memberFrom",
			"name": "memberFrom",
			"source": "QUERY",
			"type": "java.lang.String",
			"required": true
		},
		{
			"path": "memberPartyId",
			"argName": "arg1",
			"displayName": "memberPartyId",
			"name": "memberPartyId",
			"source": "QUERY",
			"type": "long",
			"required": true
		},
		{
			"path": "",
			"argName": "arg2",
			"displayName": "infos",
			"name": "infos",
			"source": "BODY",
			"type": "com.asiainfo.crm.cm.vo.GroupMemberVo",
			"required": true
		}
	]
}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '706';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('706', 'SAVETELNORGROUPMEMBER_706', '706', '706', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '707';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('707', '获取集团关键人等级', 'getCustKyePeopGrad', NULL, '/api', '/cm/customer/{custId}/keyPeopGrad', 'GET', '获取客户关键人员等级。该方法接收客户ID，查询客户信息，根据客户服务等级（LEVEL_INT_l1、LEVEL_INT_l2、LEVEL_INT_21、LEVEL_INT_22、LEVEL_INT_30）映射到对应的关键人员等级（LEVEL_3、LEVEL_4、LEVEL_5），默认返回LEVEL_1
返回信息:
包含关键人员等级和区域ID的Map，key包括"retVal"（关键人员等级，字符串形式）、"retGegionId"（区域ID）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "long", "source": "PATH", "argName": "arg0", "required": true, "description": "客户ID，用于查询客户信息并获取关键人员等级", "displayName": "custId"}]}', '', NULL, NULL, 'cm', 'customer', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '707';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('707', '获取集团关键人等级', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl', 'getCustKyePeopGrad', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"PATH","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '707';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('707', 'GETCUSTKYEPEOPGRAD_707', '707', '707', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '708';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('708', '通过billid查询客户简要信息', 'queryCustByBillId', NULL, '/api', '/cm/customer/simplebill', 'GET', '根据账单ID查询客户信息。该方法接收账单ID，设置中心信息，调用团队调用服务根据账单ID获取用户基本信息，返回品牌、用户ID、区域ID和客户ID
返回信息:
包含查询结果的Map，key包括"retVal"（参与人ID，此字段未使用）、"retBrand"（品牌）、"retUserId"（用户ID）、"regionId"（区域ID）、"retCustId"（客户ID）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "billId", "path": "billId", "type": "java.lang.String", "source": "QUERY", "argName": "arg0", "required": true, "description": "账单ID，用于查询用户基本信息", "displayName": "billId"}]}', '', NULL, NULL, 'cm', 'customer', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '708';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('708', '通过billid查询客户简要信息', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl', 'queryCustByBillId', '{"paramDefinitions":[{"path":"billId","argName":"arg0","displayName":"billId","name":"billId","source":"QUERY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '708';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('708', 'QUERYCUSTBYBILLID_708', '708', '708', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '709';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('709', '根据CustRelId查询集团客户', 'queryGroupMemberByCustRelId', NULL, '/api', '/cm/customer/groupMember/{custRelId}', 'GET', NULL, NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"path": "custRelId",
			"argName": "arg0",
			"displayName": "custRelId",
			"name": "custRelId",
			"source": "PATH",
			"type": "long",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETCmGroupMember001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '709';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('709', '根据CustRelId查询集团客户', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryGroupMemberByCustRelId', '{
	"paramDefinitions": [
		{
			"path": "custRelId",
			"argName": "arg0",
			"displayName": "custRelId",
			"name": "custRelId",
			"source": "PATH",
			"type": "long",
			"required": true
		}
	]
}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '709';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('709', 'QUERYGROUPMEMBERBYCUSTRELID_709', '709', '709', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '710';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('710', '获取个人客户状态', 'getRequestStatusAndEditWord', NULL, '/api', '/cm/customer/{custId}/invidiv/status', 'GET', '获取请求状态和编辑字段。该方法根据客户ID查询客户请求任务，判断客户是否可编辑（如果请求状态为处理中或已处理完成且已生成订购关系则不可编辑）。同时根据参与人角色类型（user或非user）获取对应的不可编辑字段列表（CM、CMX、CM_ADDR或USER专用字段）
返回信息:
包含请求状态和编辑字段信息的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"canEditFlag"（"true"表示可编辑，"false"表示不可编辑）、"unEditWordCM"（CM不可编辑字段列表）、"unEditWordCMX"（CMX不可编辑字段列表）、"unEditWordCMAddr"（CM_ADDR不可编辑字段列表）、"unEditWordForUser"（USER专用不可编辑字段列表）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "long", "source": "PATH", "argName": "arg0", "required": true, "description": "客户ID，用于查询客户请求任务信息", "displayName": "custId"}, {"name": "partyId", "path": "partyId", "type": "long", "source": "QUERY", "argName": "arg1", "required": true, "description": "参与人ID，用于判断参与人角色类型（user或非user）", "displayName": "partyId"}]}', '', NULL, NULL, 'cm', 'customer', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '710';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('710', '获取个人客户状态', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl', 'getRequestStatusAndEditWord', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"PATH","type":"long","required":true},{"path":"partyId","argName":"arg1","displayName":"partyId","name":"partyId","source":"QUERY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '710';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('710', 'GETREQUESTSTATUSANDEDITWORD_710', '710', '710', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '711';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('711', '获取ID', 'getNewSequence', NULL, '/api', '/cm/common/seq/{className}', 'GET', '获取新序列号。该方法根据类名获取对应的新序列号，通过反射获取类对象，然后调用通用服务获取该类的下一个序列号值。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "className",
      "path": "className",
      "type": "java.lang.String",
      "source": "PATH",
      "argName": "arg0",
      "required": true,
      "description": "类名，用于获取该类的序列号，必须是完整的类路径",
      "displayName": "className",
      "exampleValue": "com.asiainfo.crm.cm.inner.party.bo.BOCmPartyContactBean"
    }
  ]
}', '', NULL, NULL, 'cm', 'common', '', NULL, '2025-12-03 11:11:06', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '711';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('711', '获取ID', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CommonBFImpl', 'getNewSequence', '{"paramDefinitions":[{"path":"className","argName":"arg0","displayName":"className","name":"className","source":"PATH","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '711';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('711', 'GETNEWSEQUENCE_711', '711', '711', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '712';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('712', '查询集团客户地址', 'queryAddressInfo', NULL, '/api', '/cm/customer/{custId}/group/address', 'GET', '查询地址信息。该方法接收客户ID，查询客户的合法地址联系媒介，然后调用地址服务获取地址详细信息（邮编、城市、地址描述）
返回信息:
包含地址信息的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息）、"zipCode"（邮编）、"cityName"（城市名称）、"address"（地址描述）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "long", "source": "PATH", "argName": "arg0", "required": true, "description": "客户ID，用于查询客户的合法地址信息", "displayName": "custId"}]}', '', NULL, NULL, 'cm', 'customer', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '712';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('712', '查询集团客户地址', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl', 'queryAddressInfo', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"PATH","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '712';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('712', 'QUERYADDRESSINFO_712', '712', '712', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '713';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('713', '查询客户列表(分页)', 'queryCustomersXml', NULL, '/api', '/cm/customer/xml', 'POST', '根据XML条件查询客户。该方法接收查询条件MapList和分页参数，将条件转换为DataContainer，格式化条件（设置CUST_ID默认值、匹配类型），调用业务模型查询客户数据，然后为每个客户补充行业信息、法律地址、客户层级、客户经理信息，处理客户名称隐藏（first_name为"$$$$"时）和集团客户证件代码显示
返回信息:
客户值数组，包含符合查询条件的客户信息列表，每个客户包含行业、地址、层级、经理等补充信息', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "condition", "path": "condition", "type": "com.asiainfo.crm.cm.vo.MapList", "source": "BODY", "argName": "arg0", "required": true, "description": "查询条件MapList，包含查询客户的各种条件参数，用于查询客户列表", "displayName": "condition"}, {"name": "startNum", "path": "pageNum", "type": "int", "source": "QUERY", "argName": "arg1", "required": true, "description": "起始索引，用于分页查询", "displayName": "pageNum", "handlerClass": "com.aie.api.tool.PageTool:getStartNum"}, {"name": "endNum", "path": "pageSize", "type": "int", "source": "QUERY", "argName": "arg2", "required": true, "description": "结束索引，用于分页查询", "displayName": "pageSize", "handlerClass": "com.aie.api.tool.PageTool:getEndNum"}]}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETCustomer001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '713';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('713', '查询客户列表(分页)', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl', 'queryCustomersXml', '{
	"paramDefinitions": [
		{
			"path": "condition",
			"argName": "arg0",
			"displayName": "condition",
			"name": "condition",
			"source": "BODY",
			"type": "com.asiainfo.crm.cm.vo.MapList",
			"required": true
		},
		{
			"path": "pageNum",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"argName": "arg1",
			"displayName": "pageNum",
			"name": "startNum",
			"source": "QUERY",
			"type": "int",
			"required": true
		},
		{
			"path": "pageSize",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"argName": "arg2",
			"displayName": "pageSize",
			"name": "endNum",
			"source": "QUERY",
			"type": "int",
			"required": true
		}
	]
}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '713';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('713', 'QUERYCUSTOMERSXML_713', '713', '713', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '714';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('714', '查询客户列表(总数)', 'queryCustomerXmlCount', NULL, '/api', '/cm/customer/xml/count', 'POST', '根据XML条件查询客户数量。该方法接收查询条件MapList，将条件转换为DataContainer，格式化条件（设置CUST_ID默认值、匹配类型），调用客户服务查询符合条件的客户总数
返回信息:
符合条件的客户总数，int类型', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "condition", "path": "condition", "type": "com.asiainfo.crm.cm.vo.MapList", "source": "BODY", "argName": "arg0", "required": true, "description": "查询条件MapList，包含查询客户的各种条件参数，用于查询客户总数", "displayName": "condition"}]}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETCustomer001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '714';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('714', '查询客户列表(总数)', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl', 'queryCustomerXmlCount', '{"paramDefinitions":[{"path":"condition","argName":"arg0","displayName":"condition","name":"condition","source":"BODY","type":"com.asiainfo.crm.cm.vo.MapList","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '714';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('714', 'QUERYCUSTOMERXMLCOUNT_714', '714', '714', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '715';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('715', 'contentId查询', 'showContId', NULL, '/api', '/cm/customer/contId', 'GET', '显示联系人ID。该方法接收参与人ID，查询参与人的联系人ID
返回信息:
包含查询结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（联系人ID，成功时存在）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "partyId", "path": "partyId", "type": "long", "source": "QUERY", "argName": "arg0", "required": true, "description": "参与人ID，用于查询联系人的联系人ID", "displayName": "partyId"}]}', '', NULL, NULL, 'cm', 'customer', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '715';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('715', 'contentId查询', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl', 'showContId', '{"paramDefinitions":[{"path":"partyId","argName":"arg0","displayName":"partyId","name":"partyId","source":"QUERY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '715';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('715', 'SHOWCONTID_715', '715', '715', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '716';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('716', '按pary名查询party信息', 'queryMaskPartyByName', NULL, '/api', '/cm/party/byname', 'GET', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"partyName","argName":"arg0","displayName":"partyName","name":"partyName","source":"QUERY","type":"java.lang.String","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg1","displayName":"pageNum","name":"startIndex","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg2","displayName":"pageSize","name":"endIndex","source":"QUERY","type":"int","required":true}]}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'party', 'SETCmPartyInfo001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '716';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('716', '按pary名查询party信息', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmPartySV', 'queryMaskPartyByName', '{"paramDefinitions":[{"path":"partyName","argName":"arg0","displayName":"partyName","name":"partyName","source":"QUERY","type":"java.lang.String","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg1","displayName":"pageNum","name":"startIndex","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg2","displayName":"pageSize","name":"endIndex","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '716';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('716', 'QUERYMASKPARTYBYNAME_716', '716', '716', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '717';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('717', '按pary名查询party信息(总数)', 'queryMaskPartyByNameCount', NULL, '/api', '/cm/party/byname/count', 'GET', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"partyName","argName":"arg0","displayName":"partyName","name":"partyName","source":"QUERY","type":"java.lang.String","required":true}]}', '', NULL, NULL, 'cm', 'party', 'SETCmPartyInfo001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '717';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('717', '按pary名查询party信息(总数)', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmPartySV', 'queryMaskPartyByNameCount', '{"paramDefinitions":[{"path":"partyName","argName":"arg0","displayName":"partyName","name":"partyName","source":"QUERY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '717';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('717', 'QUERYMASKPARTYBYNAMECOUNT_717', '717', '717', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '718';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('718', '删除联系媒介信息', 'deleteContactContMedium', NULL, '/api', '/cm/customer/group/contactContMedium', 'DELETE', '删除联系人联系媒介。该方法接收联系关系ID和区域ID，查询联系媒介关系是否存在，如果存在则抛出异常，否则查询联系人信息获取参与人ID，删除联系媒介，如果参与人ID大于0则发送付款人地址到计费系统
返回信息:
包含删除结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retVal"（结果消息，成功时返回国际化资源"CMS0013241"对应的文本，失败时包含错误信息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "contRelaId", "path": "contRelaId", "type": "long", "source": "QUERY", "argName": "arg0", "required": true, "description": "联系关系ID，用于删除联系人联系媒介", "displayName": "contRelaId"}, {"name": "regionId", "path": "regionId", "type": "long", "source": "QUERY", "argName": "arg1", "required": true, "description": "区域ID，用于删除联系人联系媒介", "displayName": "regionId"}]}', '', NULL, NULL, 'cm', 'customer', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '718';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('718', '删除联系媒介信息', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl', 'deleteContactContMedium', '{"paramDefinitions":[{"path":"contRelaId","argName":"arg0","displayName":"contRelaId","name":"contRelaId","source":"QUERY","type":"long","required":true},{"path":"regionId","argName":"arg1","displayName":"regionId","name":"regionId","source":"QUERY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '718';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('718', 'DELETECONTACTCONTMEDIUM_718', '718', '718', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '719';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('719', '保存联系媒介信息', 'saveContactContMedium', NULL, '/api', '/cm/customer/group/contactContMedium', 'PUT', '保存联系人联系媒介。该方法接收联系人ID、参与人ID和联系媒介MapList，验证联系媒介数据（联系类型不能为空、联系信息不能为空、邮箱格式验证、电话号码格式验证、邮箱重复性验证），检查优先级重复，保存联系媒介关系，如果联系人ID有效则发送付款人地址到计费系统
返回信息:
包含保存结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "contId", "path": "contId", "type": "java.lang.String", "source": "BODY", "argName": "arg0", "required": true, "description": "联系人ID，用于保存联系人联系媒介", "displayName": "contId"}, {"name": "partyId", "path": "partyId", "type": "java.lang.String", "source": "BODY", "argName": "arg1", "required": true, "description": "参与人ID，用于保存联系人联系媒介", "displayName": "partyId"}, {"name": "contactContMedium", "path": "contactContMedium", "type": "com.asiainfo.crm.cm.vo.MapList", "source": "BODY", "argName": "arg2", "required": true, "description": "联系媒介MapList，包含联系媒介的信息列表，用于保存联系人联系媒介", "displayName": "contactContMedium"}]}', '', NULL, NULL, 'cm', 'customer', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '719';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('719', '保存联系媒介信息', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl', 'saveContactContMedium', '{"paramDefinitions":[{"path":"contId","argName":"arg0","displayName":"contId","name":"contId","source":"BODY","type":"java.lang.String","required":true},{"path":"partyId","argName":"arg1","displayName":"partyId","name":"partyId","source":"BODY","type":"java.lang.String","required":true},{"path":"contactContMedium","argName":"arg2","displayName":"contactContMedium","name":"contactContMedium","source":"BODY","type":"com.asiainfo.crm.cm.vo.MapList","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '719';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('719', 'SAVECONTACTCONTMEDIUM_719', '719', '719', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '720';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('720', '查询联系媒介信息(分页)', 'queryContactContMediumInfoByContIdAndUseTypeForPage', NULL, '/api', '/cm/customer/group/contactContMedium/cond/page', 'GET', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"contId","argName":"arg0","displayName":"contId","name":"contId","source":"QUERY","type":"long","required":true},{"path":"useType","argName":"arg1","displayName":"useType","name":"useType","source":"QUERY","type":"long","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg2","displayName":"pageNum","name":"start","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg3","displayName":"pageSize","name":"end","source":"QUERY","type":"int","required":true}]}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETCmContactContMediumInfo001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '720';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('720', '查询联系媒介信息(分页)', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryContactContMediumInfoByContIdAndUseTypeForPage', '{"paramDefinitions":[{"path":"contId","argName":"arg0","displayName":"contId","name":"contId","source":"QUERY","type":"long","required":true},{"path":"useType","argName":"arg1","displayName":"useType","name":"useType","source":"QUERY","type":"long","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg2","displayName":"pageNum","name":"start","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg3","displayName":"pageSize","name":"end","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '720';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('720', 'QUERYCONTACTCONTMEDIUMINFOBYCONTIDANDUSETYPEFORPAGE_720', '720', '720', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '721';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('721', '查询联系媒介信息(总数)', 'queryContactContMediumInfoCountByContIdAndUseType', NULL, '/api', '/cm/customer/group/contactContMedium/cond/count', 'GET', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"contId","argName":"arg0","displayName":"contId","name":"contId","source":"QUERY","type":"long","required":true},{"path":"useType","argName":"arg1","displayName":"useType","name":"useType","source":"QUERY","type":"long","required":true}]}', '', NULL, NULL, 'cm', 'customer', 'SETCmContactContMediumInfo001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '721';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('721', '查询联系媒介信息(总数)', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryContactContMediumInfoCountByContIdAndUseType', '{"paramDefinitions":[{"path":"contId","argName":"arg0","displayName":"contId","name":"contId","source":"QUERY","type":"long","required":true},{"path":"useType","argName":"arg1","displayName":"useType","name":"useType","source":"QUERY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '721';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('721', 'QUERYCONTACTCONTMEDIUMINFOCOUNTBYCONTIDANDUSETYPE_721', '721', '721', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '722';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('722', '验联系人是否已经存在', 'validateGroupContact', NULL, '/api', '/cm/customer/group/contact/validation', 'GET', '验证集团联系人。该方法接收参与人ID、客户ID和联系人类型，查询该客户和参与人下是否存在指定类型的集团联系人
返回信息:
包含验证结果的Map，key包括"retFlag"（"Y"表示存在集团联系人，"N"表示不存在）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "partyId", "path": "partyId", "type": "long", "source": "QUERY", "argName": "arg0", "required": true, "description": "参与人ID，用于验证集团联系人", "displayName": "partyId"}, {"name": "custId", "path": "custId", "type": "long", "source": "QUERY", "argName": "arg1", "required": true, "description": "客户ID，用于验证集团联系人", "displayName": "custId"}, {"name": "contType", "path": "contType", "type": "long", "source": "QUERY", "argName": "arg2", "required": true, "description": "联系人类型，用于验证指定类型的集团联系人", "displayName": "contType"}]}', '', NULL, NULL, 'cm', 'customer', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '722';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('722', '验联系人是否已经存在', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl', 'validateGroupContact', '{"paramDefinitions":[{"path":"partyId","argName":"arg0","displayName":"partyId","name":"partyId","source":"QUERY","type":"long","required":true},{"path":"custId","argName":"arg1","displayName":"custId","name":"custId","source":"QUERY","type":"long","required":true},{"path":"contType","argName":"arg2","displayName":"contType","name":"contType","source":"QUERY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '722';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('722', 'VALIDATEGROUPCONTACT_722', '722', '722', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '723';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('723', '保存DK联系信息', 'saveDkGroupContactInfo', NULL, '/api', '/cm/customer/group/contact/dk', 'PUT', '保存丹麦集团联系人信息。该方法接收联系人ID、集团成员Map、参与人联系Map和联系人Map，将Map转换为DataContainer，提取客户联系人ID、区域ID和优先级，调用集团合同服务保存丹麦集团联系人信息
返回信息:
包含保存结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "contId", "path": "contId", "type": "long", "source": "BODY", "argName": "arg0", "required": true, "description": "联系人ID，用于保存丹麦集团联系人信息", "displayName": "contId"}, {"name": "groupMember", "path": "groupMember", "type": "java.util.Map", "source": "BODY", "argName": "arg1", "required": true, "description": "集团成员Map，包含集团成员信息，用于保存丹麦集团联系人", "displayName": "groupMember"}, {"name": "partyContact", "path": "partyContact", "type": "java.util.Map", "source": "BODY", "argName": "arg2", "required": true, "description": "参与人联系Map，包含参与人联系信息，用于保存丹麦集团联系人", "displayName": "partyContact"}, {"name": "contact", "path": "contact", "type": "java.util.Map", "source": "BODY", "argName": "arg3", "required": true, "description": "联系人Map，包含联系人信息，用于保存丹麦集团联系人", "displayName": "contact"}]}', '', NULL, NULL, 'cm', 'customer', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '723';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('723', '保存DK联系信息', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl', 'saveDkGroupContactInfo', '{
	"paramDefinitions": [
		{
			"path": "contId",
			"argName": "arg0",
			"displayName": "contId",
			"name": "contId",
			"source": "BODY",
			"type": "long",
			"required": true
		},
		{
			"path": "groupMember",
			"argName": "arg1",
			"displayName": "groupMember",
			"name": "groupMember",
			"source": "BODY",
			"type": "java.util.Map",
			"required": true
		},
		{
			"path": "partyContact",
			"argName": "arg2",
			"displayName": "partyContact",
			"name": "partyContact",
			"source": "BODY",
			"type": "java.util.Map",
			"required": true
		},
		{
			"path": "contact",
			"argName": "arg3",
			"displayName": "contact",
			"name": "contact",
			"source": "BODY",
			"type": "java.util.Map",
			"required": true
		}
	]
}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '723';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('723', 'SAVEDKGROUPCONTACTINFO_723', '723', '723', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '724';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('724', '客管合同查询页面', 'getAgreementValueByCust', NULL, '/api', '/cm/customer/{custId}/cmpage/agreement', 'GET', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"PATH","type":"long","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'customer', 'SETAgrRoleUpTypeAll001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '724';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('724', '客管合同查询页面', 'APPFRAME', 'com.asiainfo.crm.agreement.teaminvoke.out.service.interfaces.IAgreementFSV', 'getAgreementValueByCust', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"PATH","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '724';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('724', 'GETAGREEMENTVALUEBYCUST_724', '724', '724', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '725';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('725', '保存联系信息', 'saveContact', NULL, '/api', '/cm/customer/group/contact', 'PUT', '保存联系人。该方法接收客户联系人ID、联系人ID、集团成员MapList、参与人MapList和参与人联系MapList，将MapList转换为DataContainerList，根据FLAG标志判断是保存丹麦集团联系人还是普通集团联系人，如果FLAG为"Y"则调用保存丹麦集团联系人方法，否则调用保存普通集团联系人方法
返回信息:
包含保存结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custContId", "path": "custContId", "type": "long", "source": "BODY", "argName": "arg0", "required": true, "description": "客户联系人ID，用于保存联系人", "displayName": "custContId"}, {"name": "contId", "path": "contId", "type": "long", "source": "BODY", "argName": "arg1", "required": true, "description": "联系人ID，用于保存联系人", "displayName": "contId"}, {"name": "groupMember", "path": "groupMember", "type": "com.asiainfo.crm.cm.vo.MapList", "source": "BODY", "argName": "arg2", "required": true, "description": "集团成员MapList，包含集团成员信息列表，用于保存联系人", "displayName": "groupMember"}, {"name": "party", "path": "party", "type": "com.asiainfo.crm.cm.vo.MapList", "source": "BODY", "argName": "arg3", "required": true, "description": "参与人MapList，包含参与人信息列表，用于保存联系人", "displayName": "party"}, {"name": "partyContact", "path": "partyContact", "type": "com.asiainfo.crm.cm.vo.MapList", "source": "BODY", "argName": "arg4", "required": false, "description": "参与人联系MapList，包含参与人联系信息列表，用于保存联系人", "displayName": "partyContact"}]}', '', NULL, NULL, 'cm', 'customer', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '725';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('725', '保存联系信息', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl', 'saveContact', '{"paramDefinitions":[{"path":"custContId","argName":"arg0","displayName":"custContId","name":"custContId","source":"BODY","type":"long","required":true},{"path":"contId","argName":"arg1","displayName":"contId","name":"contId","source":"BODY","type":"long","required":true},{"path":"groupMember","argName":"arg2","displayName":"groupMember","name":"groupMember","source":"BODY","type":"com.asiainfo.crm.cm.vo.MapList","required":true},{"path":"party","argName":"arg3","displayName":"party","name":"party","source":"BODY","type":"com.asiainfo.crm.cm.vo.MapList","required":true},{"path":"partyContact","argName":"arg4","displayName":"partyContact","name":"partyContact","source":"BODY","type":"com.asiainfo.crm.cm.vo.MapList","required":false}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '725';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('725', 'SAVECONTACT_725', '725', '725', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '726';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('726', '保存联系媒介关系', 'saveContactContMediumRel', NULL, '/api', '/cm/customer/group/contactContMediumRel', 'PUT', '保存联系人联系媒介关系。该方法接收客户联系人ID和联系媒介关系MapList，将MapList转换为DataContainer数组，为每个联系媒介关系创建或更新联系媒介关系Bean，检查关系是否已存在（避免重复），保存联系媒介关系
返回信息:
包含保存结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custContId", "path": "custContId", "type": "long", "source": "BODY", "argName": "arg0", "required": true, "description": "客户联系人ID，用于保存联系人联系媒介关系", "displayName": "custContId"}, {"name": "info", "path": "info", "type": "com.asiainfo.crm.cm.vo.MapList", "source": "BODY", "argName": "arg1", "required": true, "description": "联系媒介关系MapList，包含联系媒介关系信息列表，用于保存联系人联系媒介关系", "displayName": "info"}]}', '', NULL, NULL, 'cm', 'customer', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '726';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('726', '保存联系媒介关系', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.GroupCustomerBFImpl', 'saveContactContMediumRel', '{"paramDefinitions":[{"path":"custContId","argName":"arg0","displayName":"custContId","name":"custContId","source":"BODY","type":"long","required":true},{"path":"info","argName":"arg1","displayName":"info","name":"info","source":"BODY","type":"com.asiainfo.crm.cm.vo.MapList","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '726';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('726', 'SAVECONTACTCONTMEDIUMREL_726', '726', '726', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '727';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('727', '联系媒介信息查询', 'queryContactContMediumForPage', NULL, '/api', '/cm/customer/group/contactContMedium/page', 'GET', '联系媒介信息查询。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "path": "custContId",
      "argName": "arg0",
      "displayName": "custContId",
      "name": "custContId",
      "source": "QUERY",
      "type": "long",
      "required": true,
      "description": "客户联系媒介唯一ID",
      "exampleValue": "1100327312"
    },
    {
      "path": "pageNum",
      "handlerClass": "com.aie.api.tool.PageTool:getStartNum",
      "argName": "arg1",
      "displayName": "pageNum",
      "name": "start",
      "source": "QUERY",
      "type": "int",
      "required": true,
      "description": "页数",
      "exampleValue": "1"
    },
    {
      "path": "pageSize",
      "handlerClass": "com.aie.api.tool.PageTool:getEndNum",
      "argName": "arg2",
      "displayName": "pageSize",
      "name": "end",
      "source": "QUERY",
      "type": "int",
      "required": true,
      "description": "每页条数",
      "exampleValue": "10"
    }
  ]
}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'customer', 'SETCmContactContMedium001', NULL, '2025-12-02 15:42:56', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '727';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('727', '联系媒介信息查询', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryContactContMediumForPage', '{"paramDefinitions":[{"path":"custContId","argName":"arg0","displayName":"custContId","name":"custContId","source":"QUERY","type":"long","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg1","displayName":"pageNum","name":"start","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg2","displayName":"pageSize","name":"end","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '727';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('727', 'QUERYCONTACTCONTMEDIUMFORPAGE_727', '727', '727', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '728';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('728', '联系媒介信息查询总数', 'queryContactContMediumCount', NULL, '/api', '/cm/customer/group/contactContMedium/count', 'GET', '该方法用于查询指定客户联系ID下非地址类型的联系媒介数量。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "path": "custContId",
      "argName": "arg0",
      "displayName": "custContId",
      "name": "custContId",
      "source": "QUERY",
      "type": "long",
      "required": true,
      "description": "客户联系媒介ID",
      "exampleValue": "1100343312"
    }
  ]
}', '', NULL, NULL, 'cm', 'customer', 'SETCmContactContMedium001', NULL, '2025-12-03 16:26:42', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '728';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('728', '联系媒介信息查询总数', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryContactContMediumCount', '{"paramDefinitions":[{"path":"custContId","argName":"arg0","displayName":"custContId","name":"custContId","source":"QUERY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '728';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('728', 'QUERYCONTACTCONTMEDIUMCOUNT_728', '728', '728', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '729';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('729', '根据联系信息编号查询参与人联系信息', 'queryPartyContactById', NULL, '/api', '/cm/party/contact/{contId}', 'GET', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"contId","argName":"arg0","displayName":"contId","name":"contId","source":"PATH","type":"long","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'party', 'SETCmPartyInfo001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '729';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('729', '根据联系信息编号查询参与人联系信息', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmPartySV', 'queryPartyContactById', '{"paramDefinitions":[{"path":"contId","argName":"arg0","displayName":"contId","name":"contId","source":"PATH","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '729';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('729', 'QUERYPARTYCONTACTBYID_729', '729', '729', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '730';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('730', '根据联系id查询联系信息', 'queryCustConBycustContId', NULL, '/api', '/cm/party/groupContact/{custContId}', 'GET', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"custContId","argName":"arg0","displayName":"custContId","name":"custContId","source":"PATH","type":"long","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'party', 'SETCmGroupContact001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '730';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('730', '根据联系信息编号查询参与人联系信息', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmContactSV', 'queryCustConBycustContId', '{"paramDefinitions":[{"path":"custContId","argName":"arg0","displayName":"custContId","name":"custContId","source":"PATH","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '730';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('730', 'QUERYCUSTCONBYCUSTCONTID_730', '730', '730', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '731';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('731', '查询集团联系人信息(分页)', 'queryGroupPartyInfo', NULL, '/api', '/cm/party/group/partycontact/page', 'POST', '查询集团联系人信息。', NULL, NULL, NULL, '{"paramDefinitions":[{"path":"criteria","argName":"arg0","displayName":"criteria","name":"criteria","source":"BODY","type":"java.util.Map","required":true,"description":"查询条件键值对","exampleValue":"{\\"CUST_ID\\":\\"23210619756422\\",\\"PARTY_NAME\\":\\"\\"}"},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg1","displayName":"pageNum","name":"startNum","source":"QUERY","type":"int","required":true,"description":"页数","exampleValue":"3"},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg2","displayName":"pageSize","name":"endNum","source":"QUERY","type":"int","required":true,"description":"每页条数","exampleValue":"10"}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'party', 'SETCmGroupContact001', NULL, '2025-12-02 15:18:54', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '731';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('731', '查询集团联系人信息(分页)', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmContactSV', 'queryGroupPartyInfo', '{"paramDefinitions":[{"path":"criteria","argName":"arg0","displayName":"criteria","name":"criteria","source":"BODY","type":"java.util.Map","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg1","displayName":"pageNum","name":"startNum","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg2","displayName":"pageSize","name":"endNum","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '731';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('731', 'QUERYGROUPPARTYINFO_731', '731', '731', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '732';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('732', '查询集团联系人信息(总数)', 'queryGroupPartyInfoCount', NULL, '/api', '/cm/party/group/partycontact/count', 'POST', '根据客户ID、账单ID、联系人名称等条件统计集团联系人数量，对于子集团会继承根集团的可继承联系人一并统计。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "path": "criteria",
      "argName": "arg0",
      "displayName": "criteria",
      "name": "criteria",
      "source": "BODY",
      "type": "java.util.Map",
      "required": true,
      "description": "查询条件",
      "exampleValue": {"CUST_ID":"23210619756422"}
    }
  ]
}', '', NULL, NULL, 'cm', 'party', 'SETCmGroupContact001', NULL, '2025-12-03 14:39:05', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '732';

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '732';

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '733';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('733', '查询CmStaticData', 'getCodeNameByCodeTypeAndCodeValue', NULL, '/api', '/cm/common/cmStaticData', 'GET', '根据代码类型和代码值获取代码名称。该方法通过静态数据工具类查询指定代码类型和代码值对应的代码名称，如果查询结果为空则标识为需要返回。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "codeType",
      "path": "codeType",
      "type": "java.lang.String",
      "source": "QUERY",
      "argName": "arg0",
      "required": true,
      "description": "代码类型，用于查询静态数据的代码类型",
      "displayName": "codeType",
      "exampleValue": "360_QUERY_RULE"
    },
    {
      "name": "codeValue",
      "path": "codeValue",
      "type": "java.lang.String",
      "source": "QUERY",
      "argName": "arg1",
      "required": true,
      "description": "代码值，用于查询静态数据的代码值",
      "displayName": "codeValue",
      "exampleValue": "customerId"
    }
  ]
}', '', NULL, NULL, 'cm', 'common', '', NULL, '2025-12-03 16:28:56', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '733';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('733', '查询CmStaticData', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CommonBFImpl', 'getCodeNameByCodeTypeAndCodeValue', '{"paramDefinitions":[{"path":"codeType","argName":"arg0","displayName":"codeType","name":"codeType","source":"QUERY","type":"java.lang.String","required":true},{"path":"codeValue","argName":"arg1","displayName":"codeValue","name":"codeValue","source":"QUERY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '733';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('733', 'GETCODENAMEBYCODETYPEANDCODEVALUE_733', '733', '733', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '734';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('734', '从nets查询银行卡信息(分页)', 'queryBankCard', NULL, '/api', '/cm/account/bankCard/page', 'GET', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"acctId","argName":"arg0","displayName":"acctId","name":"acctId","source":"QUERY","type":"long","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg1","displayName":"pageNum","name":"start","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg2","displayName":"pageSize","name":"end","source":"QUERY","type":"int","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'account', 'SETCmPayChannel', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '734';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('734', '从nets查询银行卡信息(分页)', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmBillingAcctSV', 'queryBankCard', '{"paramDefinitions":[{"path":"acctId","argName":"arg0","displayName":"acctId","name":"acctId","source":"QUERY","type":"long","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg1","displayName":"pageNum","name":"start","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg2","displayName":"pageSize","name":"end","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '734';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('734', 'QUERYBANKCARD_734', '734', '734', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '735';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('735', '从nets查询银行卡信息(总数)', 'queryBankCardCount', NULL, '/api', '/cm/account/bankCard/count', 'GET', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"acctId","argName":"arg0","displayName":"acctId","name":"acctId","source":"QUERY","type":"long","required":true}]}', '', NULL, NULL, 'cm', 'account', 'SETCmPayChannel', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '735';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('735', '从nets查询银行卡信息(总数)', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmBillingAcctSV', 'queryBankCardCount', '{"paramDefinitions":[{"path":"acctId","argName":"arg0","displayName":"acctId","name":"acctId","source":"QUERY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '735';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('735', 'QUERYBANKCARDCOUNT_735', '735', '735', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '736';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('736', '查询nets交易信息', 'getTransactionId', NULL, '/api', '/cm/account/nets', 'GET', '获取交易ID并生成支付URL。该方法接收客户ID和URL，将客户ID追加到URL参数中，调用billing服务获取交易ID，然后根据商户ID和交易ID生成支付页面的完整URL
返回信息:
包含操作结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息或异常信息）和"retUrl"（生成的支付页面URL）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "long", "source": "QUERY", "argName": "arg0", "required": true, "description": "客户ID，用于生成支付URL参数", "displayName": "custId"}, {"name": "url", "path": "url", "type": "java.lang.String", "source": "QUERY", "argName": "arg1", "required": true, "description": "基础URL，用于生成支付URL", "displayName": "url"}]}', '', NULL, NULL, 'cm', 'account', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '736';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('736', '查询nets交易信息', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.AccountBFImpl', 'getTransactionId', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"QUERY","type":"long","required":true},{"path":"url","argName":"arg1","displayName":"url","name":"url","source":"QUERY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '736';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('736', 'GETTRANSACTIONID_736', '736', '736', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '737';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('737', '查询paraDetailValue', 'getParaDetailValue', NULL, '/api', '/cm/common/paraDetailValue', 'GET', '获取参数详情值。该方法根据区域ID、参数类型和参数代码查询参数详情值，通过BCE工具类获取参数配置信息。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "regionId",
      "path": "regionId",
      "type": "java.lang.String",
      "source": "QUERY",
      "argName": "arg0",
      "required": true,
      "description": "区域ID，用于查询参数配置的区域标识",
      "displayName": "regionId",
      "exampleValue": "X"
    },
    {
      "name": "paraType",
      "path": "paraType",
      "type": "java.lang.String",
      "source": "QUERY",
      "argName": "arg1",
      "required": true,
      "description": "参数类型，用于查询参数配置的参数类型",
      "displayName": "paraType",
      "exampleValue": "CM_BILLING_URL"
    },
    {
      "name": "paraCode",
      "path": "paraCode",
      "type": "java.lang.String",
      "source": "QUERY",
      "argName": "arg2",
      "required": true,
      "description": "参数代码，用于查询参数配置的参数代码",
      "displayName": "paraCode",
      "exampleValue": "PAYMENT"
    }
  ]
}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'common', '', NULL, '2025-12-02 15:49:26', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '737';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('737', '查询paraDetailValue', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CommonBFImpl', 'getParaDetailValue', '{"paramDefinitions":[{"path":"regionId","argName":"arg0","displayName":"regionId","name":"regionId","source":"QUERY","type":"java.lang.String","required":true},{"path":"paraType","argName":"arg1","displayName":"paraType","name":"paraType","source":"QUERY","type":"java.lang.String","required":true},{"path":"paraCode","argName":"arg2","displayName":"paraCode","name":"paraCode","source":"QUERY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '737';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('737', 'GETPARADETAILVALUE_737', '737', '737', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '738';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('738', 'queryAcctUserRel分页', 'queryAcctUserRel', NULL, '/api', '/cm/service/ICmDkCustomerSV/queryAcctUserRel', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"partyId","argName":"arg0","displayName":"partyId","name":"partyId","source":"BODY","type":"long","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg1","displayName":"pageNum","name":"start","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg2","displayName":"pageSize","name":"end","source":"QUERY","type":"int","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'service', 'SETCmPartyInfoDK001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '738';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('738', 'queryAcctUserRel分页', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV', 'queryAcctUserRel', '{"paramDefinitions":[{"path":"partyId","argName":"arg0","displayName":"partyId","name":"partyId","source":"BODY","type":"long","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg1","displayName":"pageNum","name":"start","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg2","displayName":"pageSize","name":"end","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '738';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('738', 'QUERYACCTUSERREL_738', '738', '738', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '739';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('739', 'queryAcctUserRel总数', 'queryAcctUserRelCount', NULL, '/api', '/cm/service/ICmDkCustomerSV/queryAcctUserRelCount', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"partyId","argName":"arg0","displayName":"partyId","name":"partyId","source":"BODY","type":"long","required":true}]}', '', NULL, NULL, 'cm', 'service', 'SETCmPartyInfoDK001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '739';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('739', 'queryAcctUserRel总数', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV', 'queryAcctUserRelCount', '{"paramDefinitions":[{"path":"partyId","argName":"arg0","displayName":"partyId","name":"partyId","source":"BODY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '739';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('739', 'QUERYACCTUSERRELCOUNT_739', '739', '739', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '740';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('740', 'getInsAccrelsByAcct', 'getInsAccrelsByAcct', NULL, '/api', '/cm/service/ICmDkCustomerSV/getInsAccrelsByAcct', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"acctId","argName":"arg0","displayName":"acctId","name":"acctId","source":"BODY","type":"long","required":true},{"path":"payerName","argName":"arg1","displayName":"payerName","name":"payerName","source":"BODY","type":"java.lang.String","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg2","displayName":"pageNum","name":"startIdx","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg3","displayName":"pageSize","name":"endIdx","source":"QUERY","type":"int","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'service', 'SETCmPartyInfoDK001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '740';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('740', 'getInsAccrelsByAcct', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV', 'getInsAccrelsByAcct', '{"paramDefinitions":[{"path":"acctId","argName":"arg0","displayName":"acctId","name":"acctId","source":"BODY","type":"long","required":true},{"path":"payerName","argName":"arg1","displayName":"payerName","name":"payerName","source":"BODY","type":"java.lang.String","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg2","displayName":"pageNum","name":"startIdx","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg3","displayName":"pageSize","name":"endIdx","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '740';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('740', 'GETINSACCRELSBYACCT_740', '740', '740', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '741';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('741', 'getInsAccrelsCountByAcct总数', 'getInsAccrelsCountByAcct', NULL, '/api', '/cm/service/ICmDkCustomerSV/getInsAccrelsCountByAcct', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"acctId","argName":"arg0","displayName":"acctId","name":"acctId","source":"BODY","type":"long","required":true},{"path":"payerName","argName":"arg1","displayName":"payerName","name":"payerName","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, 'cm', 'service', 'SETCmPartyInfoDK001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '741';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('741', 'getInsAccrelsCountByAcct总数', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV', 'getInsAccrelsCountByAcct', '{"paramDefinitions":[{"path":"acctId","argName":"arg0","displayName":"acctId","name":"acctId","source":"BODY","type":"long","required":true},{"path":"payerName","argName":"arg1","displayName":"payerName","name":"payerName","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '741';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('741', 'GETINSACCRELSCOUNTBYACCT_741', '741', '741', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '742';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('742', 'getStaticDataByCodeType', 'getStaticDataByCodeType', NULL, '/api', '/cm/common/staticData/codeType/{codeType}', 'GET', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"codeType","argName":"arg0","displayName":"codeType","name":"codeType","source":"PATH","type":"java.lang.String","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'common', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '742';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('742', 'getStaticDataByCodeType', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CommonBFImpl', 'getStaticDataByCodeType', '{"paramDefinitions":[{"path":"codeType","argName":"arg0","displayName":"codeType","name":"codeType","source":"PATH","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '742';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('742', 'GETSTATICDATABYCODETYPE_742', '742', '742', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '743';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('743', 'queryCustomerByCustId', 'queryCustomerByCustId', NULL, '/api', '/cm/service/ICmCustomerSV/queryCustomerByCustId', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"state","argName":"arg1","displayName":"state","name":"state","source":"BODY","type":"java.lang.String","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'service', 'SETCmPartyInfo001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '743';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('743', 'queryCustomerByCustId', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryCustomerByCustId', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"state","argName":"arg1","displayName":"state","name":"state","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '743';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('743', 'QUERYCUSTOMERBYCUSTID_743', '743', '743', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '744';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('744', 'queryUserNumbers', 'queryUserNumbers', NULL, '/api', '/cm/service/ICmDkCustomerSV/queryUserNumbers', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg1","displayName":"pageNum","name":"start","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg2","displayName":"pageSize","name":"end","source":"QUERY","type":"int","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'service', 'SETCmInsCmrel001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '744';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('744', 'queryUserNumbers', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV', 'queryUserNumbers', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg1","displayName":"pageNum","name":"start","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg2","displayName":"pageSize","name":"end","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '744';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('744', 'QUERYUSERNUMBERS_744', '744', '744', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '745';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('745', 'queryUserNumbersCount', 'queryUserNumbersCount', NULL, '/api', '/cm/service/ICmDkCustomerSV/queryUserNumbersCount', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true}]}', '', NULL, NULL, 'cm', 'service', 'SETCmInsCmrel001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '745';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('745', 'queryUserNumbersCount', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV', 'queryUserNumbersCount', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '745';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('745', 'QUERYUSERNUMBERSCOUNT_745', '745', '745', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '746';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('746', 'queryEmployeeView', 'queryEmployeeView', NULL, '/api', '/cm/service/ICmDkCustomerSV/queryEmployeeView', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'service', 'SETCmGroupMember001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '746';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('746', 'queryEmployeeView', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV', 'queryEmployeeView', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '746';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('746', 'QUERYEMPLOYEEVIEW_746', '746', '746', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '747';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('747', 'queryPersonViewAndLog', 'queryPersonViewAndLog', NULL, '/api', '/cm/service/ICmDkCustomerSV/queryPersonViewAndLog', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"partyId","argName":"arg0","displayName":"partyId","name":"partyId","source":"BODY","type":"long","required":true},{"path":"custId","argName":"arg1","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"onlyPayer","argName":"arg2","displayName":"onlyPayer","name":"onlyPayer","source":"BODY","type":"boolean","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'service', 'SETCustomer001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '747';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('747', 'queryPersonViewAndLog', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV', 'queryPersonViewAndLog', '{"paramDefinitions":[{"path":"partyId","argName":"arg0","displayName":"partyId","name":"partyId","source":"BODY","type":"long","required":true},{"path":"custId","argName":"arg1","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true},{"path":"onlyPayer","argName":"arg2","displayName":"onlyPayer","name":"onlyPayer","source":"BODY","type":"boolean","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '747';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('747', 'QUERYPERSONVIEWANDLOG_747', '747', '747', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '748';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('748', 'queryByCustIdForShow', 'queryByCustIdForShow', NULL, '/api', '/cm/service/ICmCustRequestTaskSV/queryByCustIdForShow', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', 'service', 'SETCmCustRequestTask001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '748';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('748', 'queryByCustIdForShow', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmCustRequestTaskSV', 'queryByCustIdForShow', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"long","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '748';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('748', 'QUERYBYCUSTIDFORSHOW_748', '748', '748', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '749';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('749', 'validateCustAddress', 'validateCustAddress', NULL, '/api', '/cm/service/CmIndivCustomerAction/validateCustAddress', 'POST', '校验客户地址。该方法接收客户ID和地址类型，查询客户联系媒介，如果地址类型为合法地址且存在地址信息，则返回成功标志
返回信息:
包含校验结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，失败时包含异常信息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "java.lang.String", "source": "BODY", "argName": "arg0", "required": true, "description": "客户ID，用于校验客户地址", "displayName": "custId"}, {"name": "addressType", "path": "addressType", "type": "java.lang.String", "source": "BODY", "argName": "arg1", "required": true, "description": "地址类型，用于指定要校验的地址类型", "displayName": "addressType"}]}', '', NULL, NULL, 'cm', 'service', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '749';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('749', 'validateCustAddress', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'validateCustAddress', '{"paramDefinitions":[{"path":"custId","argName":"arg0","displayName":"custId","name":"custId","source":"BODY","type":"java.lang.String","required":true},{"path":"addressType","argName":"arg1","displayName":"addressType","name":"addressType","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '749';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('749', 'VALIDATECUSTADDRESS_749', '749', '749', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '750';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('750', 'validateCustAndAddress', 'validateCustAndAddress', NULL, '/api', '/cm/service/CmIndivCustomerAction/validateCustAndAddress', 'POST', '校验客户和地址。该方法接收客户名称、初始客户ID和生日，查询客户的合法地址联系媒介，然后根据客户名称、生日和地址ID或地址详情查询客户信息，如果查询到的客户ID与初始客户ID不一致，则校验失败
返回信息:
包含校验结果的Map，key包括"retFlag"（"Y"表示校验通过，"N"表示校验不通过，即存在其他客户匹配）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custName", "path": "custName", "type": "java.lang.String", "source": "BODY", "argName": "arg0", "required": true, "description": "客户名称，用于校验客户和地址", "displayName": "custName"}, {"name": "initCustId", "path": "initCustId", "type": "java.lang.String", "source": "BODY", "argName": "arg1", "required": true, "description": "初始客户ID，用于校验客户和地址", "displayName": "initCustId"}, {"name": "birthday", "path": "birthday", "type": "java.lang.String", "source": "BODY", "argName": "arg2", "required": true, "description": "生日，用于校验客户和地址", "displayName": "birthday"}]}', '', NULL, NULL, 'cm', 'service', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '750';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('750', 'validateCustAndAddress', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'validateCustAndAddress', '{"paramDefinitions":[{"path":"custName","argName":"arg0","displayName":"custName","name":"custName","source":"BODY","type":"java.lang.String","required":true},{"path":"initCustId","argName":"arg1","displayName":"initCustId","name":"initCustId","source":"BODY","type":"java.lang.String","required":true},{"path":"birthday","argName":"arg2","displayName":"birthday","name":"birthday","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '750';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('750', 'VALIDATECUSTANDADDRESS_750', '750', '750', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '759';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('759', 'queryCustAcctRel', 'queryCustAcctRel', NULL, '/api', '/cm/customer/{relCustd}/account/cmCustAcctRel', 'POST', '查询客户账户关系信息。该方法接收多个查询条件参数（关联客户ID、账户ID、账户名称、分期标志、支付方式、周期类型、客户状态、账户服务ID、服务号码、PBS、EAN等）和分页参数，查询符合条件的客户账户关系列表，并更新账户的到期信息
返回信息:
包含查询结果的Map，key包括"values"（客户账户关系列表，每个元素为属性Map）和"total"（总记录数）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "relCustd", "path": "relCustd", "type": "long", "source": "PATH", "argName": "arg0", "required": true, "description": "关联客户ID，用于查询客户账户关系", "displayName": "relCustd"}, {"name": "acctId", "path": "acctId", "type": "long", "source": "BODY", "argName": "arg1", "required": false, "description": "账户ID，用于过滤查询结果", "displayName": "acctId"}, {"name": "acctName", "path": "acctName", "type": "java.lang.String", "source": "BODY", "argName": "arg2", "required": false, "description": "账户名称，用于过滤查询结果", "displayName": "acctName"}, {"name": "installmentFalg", "path": "installmentFalg", "type": "int", "source": "BODY", "argName": "arg3", "required": false, "description": "分期标志，用于过滤查询结果", "displayName": "installmentFalg"}, {"name": "paymethod", "path": "paymethod", "type": "int", "source": "BODY", "argName": "arg4", "required": false, "description": "支付方式，用于过滤查询结果", "displayName": "paymethod"}, {"name": "cycleType", "path": "cycleType", "type": "int", "source": "BODY", "argName": "arg5", "required": false, "description": "周期类型，用于过滤查询结果", "displayName": "cycleType"}, {"name": "custStatus", "path": "custStatus", "type": "java.lang.String", "source": "BODY", "argName": "arg6", "required": false, "description": "客户状态，用于过滤查询结果", "displayName": "custStatus"}, {"name": "acctServiceId", "path": "acctServiceId", "type": "java.lang.String", "source": "BODY", "argName": "arg7", "required": false, "description": "账户服务ID，用于过滤查询结果", "displayName": "acctServiceId"}, {"name": "serviceNumber", "path": "serviceNumber", "type": "java.lang.String", "source": "BODY", "argName": "arg8", "required": false, "description": "服务号码，用于过滤查询结果", "displayName": "serviceNumber"}, {"name": "pbs", "path": "pbs", "type": "java.lang.String", "source": "BODY", "argName": "arg9", "required": false, "description": "PBS参数，用于过滤查询结果", "displayName": "pbs"}, {"name": "ean", "path": "ean", "type": "java.lang.String", "source": "BODY", "argName": "arg10", "required": true, "description": "EAN参数，用于过滤查询结果", "displayName": "ean"}, {"name": "startIndex", "path": "pageNum", "type": "int", "source": "QUERY", "argName": "arg11", "required": true, "description": "分页起始索引", "displayName": "pageNum", "handlerClass": "com.aie.api.tool.PageTool:getStartNum"}, {"name": "endIndex", "path": "pageSize", "type": "int", "source": "QUERY", "argName": "arg12", "required": true, "description": "分页结束索引", "displayName": "pageSize", "handlerClass": "com.aie.api.tool.PageTool:getEndNum"}]}', '', NULL, NULL, 'cm', 'customer', 'SETQ360AccountInfo001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '759';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('759', 'queryCustAcctRel', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.AccountBFImpl', 'queryCustAcctRel', '{"paramDefinitions":[{"path":"relCustd","argName":"arg0","displayName":"relCustd","name":"relCustd","source":"PATH","type":"long","required":true},{"path":"acctId","argName":"arg1","displayName":"acctId","name":"acctId","source":"BODY","type":"long","required":false},{"path":"acctName","argName":"arg2","displayName":"acctName","name":"acctName","source":"BODY","type":"java.lang.String","required":false},{"path":"installmentFalg","argName":"arg3","displayName":"installmentFalg","name":"installmentFalg","source":"BODY","type":"int","required":false},{"path":"paymethod","argName":"arg4","displayName":"paymethod","name":"paymethod","source":"BODY","type":"int","required":false},{"path":"cycleType","argName":"arg5","displayName":"cycleType","name":"cycleType","source":"BODY","type":"int","required":false},{"path":"custStatus","argName":"arg6","displayName":"custStatus","name":"custStatus","source":"BODY","type":"java.lang.String","required":false},{"path":"acctServiceId","argName":"arg7","displayName":"acctServiceId","name":"acctServiceId","source":"BODY","type":"java.lang.String","required":false},{"path":"serviceNumber","argName":"arg8","displayName":"serviceNumber","name":"serviceNumber","source":"BODY","type":"java.lang.String","required":false},{"path":"pbs","argName":"arg9","displayName":"pbs","name":"pbs","source":"BODY","type":"java.lang.String","required":false},{"path":"ean","argName":"arg10","displayName":"ean","name":"ean","source":"BODY","type":"java.lang.String","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg11","displayName":"pageNum","name":"startIndex","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg12","displayName":"pageSize","name":"endIndex","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '759';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('759', 'QUERYCUSTACCTREL_759 ', '759', '759', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '760';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('760', 'queryCustAcctRelCountFor360', 'queryCustAcctRelCountFor360', NULL, '/api', '/cm/360view/ICmAccountSV/queryCustAcctRelCountFor360', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"relCustd","argName":"arg0","displayName":"relCustd","name":"relCustd","source":"BODY","type":"long","required":true},{"path":"acctId","argName":"arg1","displayName":"acctId","name":"acctId","source":"BODY","type":"long","required":true},{"path":"acctName","argName":"arg2","displayName":"acctName","name":"acctName","source":"BODY","type":"java.lang.String","required":true},{"path":"installmentFalg","argName":"arg3","displayName":"installmentFalg","name":"installmentFalg","source":"BODY","type":"int","required":true},{"path":"paymethod","argName":"arg4","displayName":"paymethod","name":"paymethod","source":"BODY","type":"int","required":true},{"path":"cycleType","argName":"arg5","displayName":"cycleType","name":"cycleType","source":"BODY","type":"int","required":true},{"path":"custStatus","argName":"arg6","displayName":"custStatus","name":"custStatus","source":"BODY","type":"java.lang.String","required":true},{"path":"acctServiceId","argName":"arg7","displayName":"acctServiceId","name":"acctServiceId","source":"BODY","type":"java.lang.String","required":true},{"path":"serviceNumber","argName":"arg8","displayName":"serviceNumber","name":"serviceNumber","source":"BODY","type":"java.lang.String","required":true},{"path":"pbs","argName":"arg9","displayName":"pbs","name":"pbs","source":"BODY","type":"java.lang.String","required":true},{"path":"ean","argName":"arg10","displayName":"ean","name":"ean","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, 'cm', '360view', 'SETQ360AccountInfo001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '760';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('760', 'queryCustAcctRelCountFor360', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmAccountSV', 'queryCustAcctRelCountFor360', '{"paramDefinitions":[{"path":"relCustd","argName":"arg0","displayName":"relCustd","name":"relCustd","source":"BODY","type":"long","required":true},{"path":"acctId","argName":"arg1","displayName":"acctId","name":"acctId","source":"BODY","type":"long","required":true},{"path":"acctName","argName":"arg2","displayName":"acctName","name":"acctName","source":"BODY","type":"java.lang.String","required":true},{"path":"installmentFalg","argName":"arg3","displayName":"installmentFalg","name":"installmentFalg","source":"BODY","type":"int","required":true},{"path":"paymethod","argName":"arg4","displayName":"paymethod","name":"paymethod","source":"BODY","type":"int","required":true},{"path":"cycleType","argName":"arg5","displayName":"cycleType","name":"cycleType","source":"BODY","type":"int","required":true},{"path":"custStatus","argName":"arg6","displayName":"custStatus","name":"custStatus","source":"BODY","type":"java.lang.String","required":true},{"path":"acctServiceId","argName":"arg7","displayName":"acctServiceId","name":"acctServiceId","source":"BODY","type":"java.lang.String","required":true},{"path":"serviceNumber","argName":"arg8","displayName":"serviceNumber","name":"serviceNumber","source":"BODY","type":"java.lang.String","required":true},{"path":"pbs","argName":"arg9","displayName":"pbs","name":"pbs","source":"BODY","type":"java.lang.String","required":true},{"path":"ean","argName":"arg10","displayName":"ean","name":"ean","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '760';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('760', 'QUERYCUSTACCTRELCOUNTFOR360_760', '760', '760', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '761';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('761', 'getAcctIdByInvoiceNumber', 'getAcctIdByInvoiceNumber', NULL, '/api', '/cm/360view/RbossSoAction/getAcctIdByInvoiceNumber', 'POST', '根据发票号码获取账户ID。该方法接收发票号码，调用订单查询服务根据发票号码查询银行账户ID。如果查询到账户ID则返回成功标志和账户ID，否则返回失败标志和账户ID为"0"
返回信息:
包含查询结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息或异常信息）和"acctId"（账户ID，字符串类型，查询不到时为"0"）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "invoice", "path": "invoice", "type": "java.lang.String", "source": "BODY", "argName": "arg0", "required": true, "description": "发票号码，用于查询该发票对应的账户ID", "displayName": "invoice"}]}', '', NULL, NULL, 'cm', '360view', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '761';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('761', 'getAcctIdByInvoiceNumber', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.RbossSoBFImpl', 'getAcctIdByInvoiceNumber', '{"paramDefinitions":[{"path":"invoice","argName":"arg0","displayName":"invoice","name":"invoice","source":"BODY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '761';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('761', 'GETACCTIDBYINVOICENUMBER_761', '761', '761', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '762';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('762', 'queryBanksByConditions', 'queryBanksByConditions', NULL, '/api', '/cm/360view/IOtherBaseSV/queryBanksByConditions', 'POST', NULL, NULL, NULL, NULL, '{"paramDefinitions":[{"path":"bankCodeType","argName":"arg0","displayName":"bankCodeType","name":"bankCodeType","source":"BODY","type":"java.lang.String","required":true},{"path":"bankName","argName":"arg1","displayName":"bankName","name":"bankName","source":"BODY","type":"java.lang.String","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg2","displayName":"pageNum","name":"startIndex","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg3","displayName":"pageSize","name":"endIndex","source":"QUERY","type":"int","required":true}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', '360view', 'SETBOBsBankFCm001', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '762';

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '762';

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '791';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('791', 'refreshSecOrgStaffOper', 'refreshSecOrgStaffOper', NULL, '/api', '/cm/360view/SecOperatorBF/refresh', 'POST', '刷新安全组织员工操作员列表。该方法接收组织ID、姓名、代码、账单ID和分页参数，如果所有查询条件都为空则返回null。如果组织ID为空，则根据账单ID、代码和姓名查询员工信息；如果组织ID不为空，则查询该组织下的所有员工信息。查询结果使用PageUtil进行分页处理
返回信息:
包含分页数据的SummaryVO对象，包含操作员列表和总数信息，如果所有查询条件都为空则返回null', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "organizeId", "path": "organizeId", "type": "java.lang.String", "source": "BODY", "argName": "arg0", "required": true, "description": "组织ID，用于查询该组织下的操作员，如果为空则根据其他条件查询", "displayName": "organizeId"}, {"name": "name", "path": "name", "type": "java.lang.String", "source": "BODY", "argName": "arg1", "required": true, "description": "姓名，用于过滤查询结果", "displayName": "name"}, {"name": "code", "path": "code", "type": "java.lang.String", "source": "BODY", "argName": "arg2", "required": true, "description": "代码，用于过滤查询结果", "displayName": "code"}, {"name": "billId", "path": "billId", "type": "java.lang.String", "source": "BODY", "argName": "arg3", "required": true, "description": "账单ID，用于过滤查询结果", "displayName": "billId"}, {"name": "startIndex", "path": "pageNum", "type": "int", "source": "QUERY", "argName": "arg4", "required": true, "description": "分页起始索引，前端开始为1，0及负值代表最小", "displayName": "pageNum", "handlerClass": "com.aie.api.tool.PageTool:getStartNum"}, {"name": "endIndex", "path": "pageSize", "type": "int", "source": "QUERY", "argName": "arg5", "required": true, "description": "分页结束索引，最大为length，0及负值代表最大", "displayName": "pageSize", "handlerClass": "com.aie.api.tool.PageTool:getEndNum"}]}', '', NULL, NULL, 'cm', '360view', 'SETSecOrgStaffOper002', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '791';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('791', 'refreshSecOrgStaffOper', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.SecOperatorBFImpl', 'refreshSecOrgStaffOper', '{"paramDefinitions":[{"path":"organizeId","argName":"arg0","displayName":"organizeId","name":"organizeId","source":"BODY","type":"java.lang.String","required":true},{"path":"name","argName":"arg1","displayName":"name","name":"name","source":"BODY","type":"java.lang.String","required":true},{"path":"code","argName":"arg2","displayName":"code","name":"code","source":"BODY","type":"java.lang.String","required":true},{"path":"billId","argName":"arg3","displayName":"billId","name":"billId","source":"BODY","type":"java.lang.String","required":true},{"path":"pageNum","handlerClass":"com.aie.api.tool.PageTool:getStartNum","argName":"arg4","displayName":"pageNum","name":"startIndex","source":"QUERY","type":"int","required":true},{"path":"pageSize","handlerClass":"com.aie.api.tool.PageTool:getEndNum","argName":"arg5","displayName":"pageSize","name":"endIndex","source":"QUERY","type":"int","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '791';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('791', 'REFRESHSECORGSTAFFOPER_791', '791', '791', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '796';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('796', 'getStaticDataByParent', 'getStaticDataByParent', NULL, '/api', '/cm/360view/CommonBF/getStaticDataByParent', 'GET', '根据父代码值获取静态数据。该方法通过静态数据工具类查询指定代码类型和父代码值下的所有静态数据，支持是否包含选择项的配置
返回信息:
静态数据值数组，包含所有符合条件的静态数据记录', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "isChoose", "path": "isChoose", "type": "boolean", "source": "QUERY", "argName": "arg0", "required": true, "description": "是否包含选择项，用于控制返回的静态数据是否包含选择项", "displayName": "isChoose"}, {"name": "codeType", "path": "codeType", "type": "java.lang.String", "source": "QUERY", "argName": "arg1", "required": true, "description": "代码类型，用于查询静态数据的代码类型", "displayName": "codeType"}, {"name": "parentCodeValue", "path": "parentCodeValue", "type": "java.lang.String", "source": "QUERY", "argName": "arg2", "required": true, "description": "父代码值，用于查询该父代码值下的所有子静态数据", "displayName": "parentCodeValue"}]}', '{"paramDefinitions":[{"required":false,"handlerClass":"com.aie.api.tool.DataContainerTool:getDcProperties"}]}', NULL, NULL, 'cm', '360view', '', NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '796';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('796', 'getStaticDataByParent', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CommonBFImpl', 'getStaticDataByParent', '{"paramDefinitions":[{"path":"isChoose","argName":"arg0","displayName":"isChoose","name":"isChoose","source":"QUERY","type":"boolean","required":true},{"path":"codeType","argName":"arg1","displayName":"codeType","name":"codeType","source":"QUERY","type":"java.lang.String","required":true},{"path":"parentCodeValue","argName":"arg2","displayName":"parentCodeValue","name":"parentCodeValue","source":"QUERY","type":"java.lang.String","required":true}]}', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '796';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('796', 'GETSTATICDATABYPARENT_796', '796', '796', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '800';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('800', '校验cpr', 'validateCPRNum', NULL, '/api', '/cm/customer/validateCPRNum', 'GET', '校验cpr', NULL, NULL, NULL, '{"paramDefinitions":[{"name":"needCheck","displayName":"needCheck","source":"QUERY","path":"needCheck","type":"String","required":false,"defaultValue":"","description":"是否需要检查标志，如果为YES则会对已存在的客户进行姓名和生日的匹配校验","exampleValue":""},{"name":"custId","displayName":"custId","source":"QUERY","path":"custId","type":"String","required":false,"defaultValue":"","description":"客户ID，用于标识要验证CPR的客户，如果needCheck为YES且客户存在，则进行姓名生日匹配校验","exampleValue":""},{"name":"cprNum","displayName":"cprNum","source":"QUERY","path":"cprNum","type":"String","required":true,"defaultValue":"","description":"CPR号码，即个人身份证号码，用于验证该号码是否在CRM系统或CPR系统中存在，并从CPR系统获取客户详细信息","exampleValue":""}]}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '800';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('800', 'validateCPRNum', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'validateCPRNum', '{
	"paramDefinitions": [
		{
			"name": "needCheck",
			"argName": "arg0",
			"type": "String"
		},
		{
			"name": "custId",
			"argName": "arg1",
			"type": "String"
		},
		{
			"name": "cprNum",
			"argName": "arg2",
			"type": "String"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '800';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('800', 'VAILD_CPRNUM', '800', '800', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '801';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('801', '获取证件号码', 'queryCustCertCodeByCustid', NULL, '/api', '/cm/customer/getCertCode', 'GET', '获取证件号码', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "获取证件号码",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '801';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('801', 'queryCustCertCodeByCustid', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'queryCustCertCodeByCustid', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '801';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('801', 'QUERY_CERTCODE_BY_CUSTID', '801', '801', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '802';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('802', '保存B2C客户', 'saveIndivCustomer', NULL, '/api', '/cm/customer/saveIndivCustomer', 'POST', '保存个人客户。该方法接收客户信息Map和操作类型（add/mod/del），将客户基本信息和附加信息转换为DataContainer，如果是修改操作则标记旧数据并设置变更映射。方法会处理客户姓名（如果为空则设置默认值）、客户类型（USER或客户）、VIP客户匿名标志、客户细分关系等，然后调用客户服务保存客户信息，并保存业务日志
返回信息:
包含保存结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，成功时返回国际化资源对应的文本，失败时返回异常信息）、"custId"（客户ID）、"partyId"（参与人ID）、"custType"（客户类型）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custInfo", "path": "custInfo", "type": "java.util.Map", "source": "BODY", "required": true, "description": "客户信息Map，包含\\"newData\\"（新数据，包含\\"baseInfo\\"和\\"addInfo\\"）和\\"oldData\\"（旧数据，包含\\"baseInfo\\"和\\"addInfo\\"）", "displayName": "custInfo", "defaultValue": "", "exampleValue": "{\\r\\n    \\"custId\\": \\"21210618399897\\",\\r\\n    \\"custType\\": \\"1\\",\\r\\n    \\"custStatus\\": \\"0\\",\\r\\n    \\"annoymousFlag\\": \\"0\\",\\r\\n    \\"realNameFlag\\": \\"0\\",\\r\\n    \\"indivCustType\\": \\"2\\",\\r\\n    \\"gender\\": \\"1\\",\\r\\n    \\"custLanguage\\": \\"1\\",\\r\\n    \\"custCertType\\": \\"8\\",\\r\\n    \\"partyId\\": \\"110006710568\\",\\r\\n    \\"birthday\\": \\"1978-10-10\\",\\r\\n    \\"lastName\\": \\"hhr\\",\\r\\n    \\"firstName\\": \\"hhl\\",\\r\\n    \\"addInfo\\": {\\r\\n        \\"pnr\\": \\"21742004\\",\\r\\n        \\"ext5\\": \\"入参是Map，参数可以直接加\\"\\r\\n    }\\r\\n}"}, {"name": "action", "path": "action", "type": "String", "source": "BODY", "required": true, "description": "操作类型，\\"add\\"表示新增，\\"mod\\"表示修改，\\"del\\"表示删除", "displayName": "action", "defaultValue": "", "exampleValue": "add 增加,mod 修改，del 删除"}]}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '802';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('802', 'saveIndivCustomer', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl', 'saveIndivCustomer', '{
	"paramDefinitions": [
		{
			"name": "custInfo",
			"argName": "arg0",
			"type": "java.util.Map"
		},
		{
			"name": "action",
			"argName": "arg1",
			"path": "action",
			"name": "action",
			"type": "String"
		}
	]
}
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '802';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('802', 'SAVE_B2C_CUSTOMER', '802', '802', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '803';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('803', '校验修改的cpr', 'validateModifyCPR', NULL, '/api', '/cm/customer/validateModifyCPR', 'POST', '验证修改CPR（个人身份证号码）。该方法接收客户证件代码、客户ID、输入的姓名、生日和保存场景等参数，调用个人客户服务的dealModifyCPR方法处理修改CPR的逻辑，标识需要送CPR（参数为YES）。如果处理返回的DataContainer不为空，则提取并返回姓名、生日、保护状态和匹配标志等信息
返回信息:
包含验证结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"firstName"（名字）、"lastName"（姓氏）、"birth"（生日）、"protected"（保护状态）、"matchFlag"（匹配标志）和"retMsg"（异常信息，仅在失败时存在）', NULL, NULL, NULL, '{"paramDefinitions":[{"name":"custCertCode","displayName":"custCertCode","source":"BODY","path":"custCertCode","type":"String","required":true,"defaultValue":"","description":"客户证件代码，即CPR号码，用于验证和修改个人身份证信息","exampleValue":""},{"name":"custId","displayName":"custId","source":"BODY","path":"custId","type":"String","required":true,"defaultValue":"","description":"客户ID，用于标识要修改CPR的客户","exampleValue":""},{"name":"inputFirstName","displayName":"inputFirstName","source":"BODY","path":"inputFirstName","type":"String","required":false,"defaultValue":"","description":"输入的姓，用于验证和更新客户姓名","exampleValue":""},{"name":"inputLastName","displayName":"inputLastName","source":"BODY","path":"inputLastName","type":"String","required":false,"defaultValue":"","description":"输入的名，用于验证和更新客户姓名","exampleValue":""},{"name":"inputBirthday","displayName":"inputBirthday","source":"BODY","path":"inputBirthday","type":"String","required":false,"defaultValue":"","description":"输入的生日，用于验证和更新客户生日信息","exampleValue":""},{"name":"saveScene","displayName":"saveScene","source":"BODY","path":"saveScene","type":"String","required":false,"defaultValue":"","description":"保存场景，用于标识保存操作的场景类型","exampleValue":""}]}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '803';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('803', 'validateModifyCPR', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'validateModifyCPR', '{
	"paramDefinitions": [
		{
			"name": "custCertCode",
			"argName": "arg0",
			"type": "String"
		},
		{
			"name": "custId",
			"argName": "arg1",
			"type": "String"
		},
		{
			"name": "inputFirstName",
			"argName": "arg2",
			"type": "String"
		},
		{
			"name": "inputLastName",
			"argName": "arg3",
			"type": "String"
		},
		{
			"name": "inputBirthday",
			"argName": "arg4",
			"type": "String"
		},
		{
			"name": "saveScene",
			"argName": "arg5",
			"type": "String"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '803';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('803', 'VALIDATE_MODIFY_CPR', '803', '803', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '804';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('804', '删除联系人', 'saveGroupContact', NULL, '/api', '/cm/customer/saveGroupContact', 'POST', '删除联系人', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "contactInfo",
			"displayName": "contactInfo",
			"source": "BODY",
			"path": "contactInfo",
			"type": "com.asiainfo.crm.cm.vo.MapList",
			"required": true,
			"defaultValue": "",
			"description": "contactInfo",
			"exampleValue": "{\\r\\n\\t\\"contactInfo\\": {\\"data\\":[\\r\\n\\t\\t{\\r\\n\\t\\t\\t\\"EFFECTIVE_DATE\\": \\"2025-04-23T17:26:44\\",\\r\\n\\t\\t\\t\\"REGION_ID\\": \\"2100\\",\\r\\n\\t\\t\\t\\"CUST_ID\\": 23210012156707,\\r\\n\\t\\t\\t\\"ORG_ID\\": 21000000,\\r\\n\\t\\t\\t\\"OP_ID\\": 100000032,\\r\\n\\t\\t\\t\\"STATE\\": \\"U\\",\\r\\n\\t\\t\\t\\"REMARKS\\": \\"Manually\\",\\r\\n\\t\\t\\t\\"CONT_ID\\": 110007841192,\\r\\n\\t\\t\\t\\"LAST_NAME\\": \\"ttt\\",\\r\\n\\t\\t\\t\\"FIRST_NAME\\": \\"ggg\\",\\r\\n\\t\\t\\t\\"PARTY_TYPE\\": 1,\\r\\n\\t\\t\\t\\"CUST_CONT_ID\\": 1100239512,\\r\\n\\t\\t\\t\\"MEMBER_DESC\\": \\"Own\\",\\r\\n\\t\\t\\t\\"PARTY_NAME\\": \\"ggg ttt\\",\\r\\n\\t\\t\\t\\"EXPIRE_DATE\\": \\"2099-12-31T23:59:59\\",\\r\\n\\t\\t\\t\\"DONE_DATE\\": \\"2025-04-23T17:26:44\\",\\r\\n\\t\\t\\t\\"CONT_TYPE_t_name\\": \\"Responsible for Economy/Administration\\",\\r\\n\\t\\t\\t\\"CONT_TYPE\\": 1,\\r\\n\\t\\t\\t\\"DONE_CODE\\": 111514570860,\\r\\n\\t\\t\\t\\"CERT_TYPE\\": -1,\\r\\n\\t\\t\\t\\"CONT_ADDRESS_t_name\\": null,\\r\\n\\t\\t\\t\\"CREATE_DATE\\": \\"2025-04-23T17:26:44\\",\\r\\n\\t\\t\\t\\"CONT_NAME\\": \\"ggg ttt\\",\\r\\n\\t\\t\\t\\"PARTY_ID\\": 110006720890,\\r\\n\\t\\t\\t\\"PRIORY_LEVEL_t_name\\": \\"Secondary\\",\\r\\n\\t\\t\\t\\"PRIORY_LEVEL\\": 2\\r\\n\\t\\t}\\r\\n\\t]},\\r\\n\\t\\"action\\": \\"del\\"\\r\\n}"
		},
		{
			"name": "action",
			"displayName": "action",
			"source": "BODY",
			"path": "action",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "action",
			"exampleValue": "add 增加，mod 修改, del 删除"
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '804';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('804', 'saveGroupContact', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'saveGroupContact', '{
	"paramDefinitions": [
		{
			"name": "contactInfo",
			"argName": "arg0",
			"path": "contactInfo",
			"name": "contactInfo",
			"type": "com.asiainfo.crm.cm.vo.MapList"
		},
		{
			"name": "action",
			"argName": "arg1",
			"path": "action",
			"name": "action",
			"type": "String"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '804';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('804', 'SAVE_GROUP_CONTACT', '804', '804', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '805';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('805', '删除联系媒介', 'deleteContactContMediumRela', NULL, '/api', '/cm/customer/deleteContactContMediumRela', 'DELETE', '删除联系媒介', NULL, NULL, NULL, '{"paramDefinitions":[{"name":"relaId","displayName":"relaId","source":"QUERY","path":"relaId","type":"long","required":true,"defaultValue":"","description":"联系地址和客户的关系id","exampleValue":""},{"name":"regionId","displayName":"regionId","source":"QUERY","path":"regionId","type":"long","required":true,"defaultValue":"","description":"区域编号","exampleValue":""}]}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '805';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('805', 'deleteContactContMediumRela', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'deleteContactContMediumRela', '{
	"paramDefinitions": [
		{
			"name": "relaId",
			"argName": "arg0",
			"type": "long"
		},{
			"name": "regionId",
			"argName": "arg1",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '805';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('805', 'DELETE_CONTACT_REL', '805', '805', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '806';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('806', 'party信息查询', 'queryPartyView', NULL, '/api', '/cm/service/ICmDkCustomerSV/queryPartyView', 'GET', '根据参与人ID查询参与人视图信息（包括基本信息、客户ID、法律地址等），并根据角色类型和操作类型决定是否生成客户ID的超链接，同时对证件号码进行脱敏处理。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "partyId",
      "displayName": "partyId",
      "source": "QUERY",
      "path": "partyId",
      "type": "long",
      "required": true,
      "defaultValue": "",
      "description": "实体唯一标识，既可代表组织（B2B场景），也可代表个人（B2C场景），用于建立实体级关联关系",
      "exampleValue": "110008313090"
    },
    {
      "name": "partyType",
      "displayName": "partyType",
      "source": "QUERY",
      "path": "partyType",
      "type": "int",
      "required": false,
      "defaultValue": "",
      "description": "实体类型",
      "exampleValue": "1"
    },
    {
      "name": "operType",
      "displayName": "operType",
      "source": "QUERY",
      "path": "operType",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "操作类型",
      "exampleValue": ""
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'party', 'SETCmPartyInfoDK001', NULL, '2025-12-03 14:47:44', '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '806';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('806', 'queryPartyView', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV', 'queryPartyView', '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"argName": "arg0",
			"type": "long"
		},{
			"name": "partyType",
			"argName": "arg1",
			"type": "int"
		},{
			"name": "operType",
			"argName": "arg2",
			"type": "String"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '806';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('806', 'QUERY_PARTY_VIEW', '806', '806', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '807';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('807', 'party b2b信息查询', 'queryOrgViewAndLog', NULL, '/api', '/cm/service/ICmDkCustomerSV/queryOrgViewAndLog', 'GET', 'party b2b信息查询', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "custId",
			"exampleValue": ""
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'party', 'SETCustomer001', NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '807';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('807', 'queryOrgViewAndLog', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV', 'queryOrgViewAndLog', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '807';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('807', 'QUERY_PARTY_B2B_VIEW', '807', '807', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '808';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('808', 'party 角色查询', 'queryPartyRoles', NULL, '/api', '/cm/service/ICmPartyRoleSV/queryPartyRoles', 'POST', 'party 角色查询', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"displayName": "partyId",
			"source": "BODY",
			"path": "partyId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "partyId",
			"exampleValue": ""
		},{
			"name": "partyType",
			"displayName": "partyType",
			"source": "BODY",
			"path": "partyType",
			"type": "int",
			"required": false,
			"defaultValue": "",
			"description": "partyType",
			"exampleValue": ""
		}
		,{
			"name": "pageNum",
			"displayName": "pageNum",
			"source": "BODY",
			"path": "pageNum",
			"type": "int",
			"required": true,
			"defaultValue": "",
			"description": "pageNum",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"exampleValue": ""
		}
		,{
			"name": "pageSize",
			"displayName": "pageSize",
			"source": "BODY",
			"path": "pageSize",
			"type": "int",
			"required": true,
			"defaultValue": "",
			"description": "pageSize",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"exampleValue": ""
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'party', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '808';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('808', 'queryPartyRoles', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmPartyRoleSV', 'queryPartyRoles', '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"argName": "arg0",
			"type": "long"
		}	,	{
			"name": "partyType",
			"argName": "arg1",
			"type": "int"
		}	,	{
			"name": "pageNum",
			"argName": "arg2",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"type": "int"
		}	,	{
			"name": "pageSize",
			"argName": "arg3",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"type": "int"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '808';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('808', 'QUERY_PARTY_ROLE', '808', '808', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '809';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('809', 'checkHasOtherRolesWithoutPayer', 'checkHasOtherRolesWithoutPayer', NULL, '/api', '/cm/service/CmLnAccountAction/checkHasOtherRolesWithoutPayer', 'GET', '检查是否有除付款人外的其他角色。该方法接收参与人ID，查询该参与人的所有角色，判断角色类型组合：如果只有付款人角色（5）或只有用户角色（2），或只有用户和付款人两种角色，则允许编辑；如果有客户角色（1）或其他角色组合，则不允许编辑
返回信息:
包含检查结果的Map，key包括"hasFlag"（"Y"表示不允许编辑，"N"表示允许编辑）、"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（失败时的错误消息）、"roleScene"（角色场景，"5"表示纯付款人，"2"表示纯用户或用户+付款人）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "partyId", "path": "partyId", "type": "long", "source": "QUERY", "required": true, "description": "参与人ID，用于检查该参与人是否有除付款人外的其他角色", "displayName": "partyId", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'party', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '809';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('809', 'checkHasOtherRolesWithoutPayer', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.PartyBFImpl', 'checkHasOtherRolesWithoutPayer', '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"argName": "arg0",
			"type": "long"
		}	
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '809';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('809', 'CHECK_WITHOUT_PAYER', '809', '809', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '810';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('810', 'queryCmxIndivCustValueAndLog', 'queryCmxIndivCustValueAndLog', NULL, '/api', '/cm/service/ICmCustomerSV/queryCmxIndivCustValueAndLog', 'GET', 'queryCmxIndivCustValueAndLog', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "custId",
			"exampleValue": ""
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '810';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('810', 'queryCmxIndivCustValueAndLog', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryCmxIndivCustValueAndLog', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}	
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '810';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('810', 'QUERY_INDIV_CMX', '810', '810', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '811';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('811', 'queryCustContacts', 'queryCustContacts', NULL, '/api', '/cm/service/CmIndivAction/queryCustContacts', 'GET', '查询客户联系人。该方法根据客户ID查询客户联系人信息，如果联系人存在且未过期，则返回监护人姓名和更新日期
返回信息:
包含查询结果的Map，key包括"retFlag"（"Y"表示查询成功且有有效联系人，"N"表示查询失败或无有效联系人）、"LEGAL_GUARDIAN"（监护人姓名，仅当有有效联系人时存在）、"GUARDIAN_UPDATE_DATE"（监护人更新日期，仅当有有效联系人时存在）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "long", "source": "QUERY", "required": true, "description": "客户ID，用于查询该客户的联系人信息", "displayName": "custId", "defaultValue": "", "exampleValue": "23210020054636"}]}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, '2025-12-01 17:57:30', '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '811';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('811', 'queryCustContacts', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl', 'queryCustContacts', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}	
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '811';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('811', 'QUERY_CUST_CONTACT', '811', '811', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '812';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('812', 'deleteIndivCustomer', 'deleteIndivCustomer', NULL, '/api', '/cm/service/CmIndivAction/deleteIndivCustomer', 'DELETE', '删除个人客户。该方法根据客户ID删除客户信息，如果客户在群组中则执行出群、解散群或转让群操作
返回信息:
包含删除结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，失败时包含异常信息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "long", "source": "QUERY", "required": true, "description": "客户ID，用于删除客户信息", "displayName": "custId", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '812';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('812', 'deleteIndivCustomer', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl', 'deleteIndivCustomer', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}	
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '812';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('812', 'DELETE_INDIV_CUSTOMER', '812', '812', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '814';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('814', 'queryByCustId', 'queryByCustId', NULL, '/api', '/cm/customer/queryByCustId', 'GET', 'queryByCustId', NULL, NULL, NULL, '{
    "paramDefinitions": [
        {
            "name": "custId",
            "displayName": "custId",
            "source": "QUERY",
            "path": "custId",
            "type": "long",
            "required": true,
            "defaultValue": "",
            "description": "custId",
            "exampleValue": ""
        }
    ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '814';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('814', 'queryByCustId', 'APPFRAME', 'com.asiainfo.crm.cm.dk.service.interfaces.ICmCustRequestTaskSV', 'queryByCustId', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '814';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('814', 'QUERY_BY_CUSTID', '814', '814', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '815';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('815', 'queryPOAList', 'queryPOAList', NULL, '/api', '/cm/customer/queryPOAList', 'GET', 'queryPOAList', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "custId",
			"exampleValue": ""
		},
		{
			"name": "pageNum",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},
		{
			"name": "pageSize",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETPOA001', NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '815';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('815', 'queryPOAList', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryPOAList', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"type": "String",
			"argName": "arg0"
		},
		{
			"name": "start",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"argName": "arg1"
		},
		{
			"name": "end",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"argName": "arg2"
		}
	]
}
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '815';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('815', 'QUERY_POA_LIST', '815', '815', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '816';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('816', 'queryPOAListCount', 'queryPOAListCount', NULL, '/api', '/cm/customer/countPOAList', 'GET', 'queryPOAListCount', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "custId",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '816';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('816', 'queryPOAListCount', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV', 'queryPOAListCount', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"type": "String",
			"argName": "arg0"
		}
	]
}
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '816';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('816', 'COUNT_POA_LIST', '816', '816', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '817';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('817', 'queryPayerByPartyId', 'queryPayerByPartyId', NULL, '/api', '/cm/customer/queryPayerByPartyId', 'GET', 'queryPayerByPartyId', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"displayName": "partyId",
			"source": "QUERY",
			"path": "partyId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "partyId",
			"exampleValue": ""
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'party', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '817';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('817', 'queryPayerByPartyId', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmPartySV', 'queryPayerByPartyId', '{
	"paramDefinitions": [
		{
			"name": "partyId",
			"type": "long",
			"argName": "arg0"
		}
	]
}
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '817';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('817', 'QUERY_PAYER_BY_PARTYID', '817', '817', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '818';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('818', 'queryDuplicateCustCount', 'queryDuplicateCustCount', NULL, '/api', '/cm/service/ICmIndivCustomerSV/queryDuplicateCustCount', 'GET', 'queryDuplicateCustCount', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "cprIds",
			"displayName": "cprIds",
			"source": "QUERY",
			"path": "cprIds",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "cprIds",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '818';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('818', 'queryDuplicateCustCount', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmIndivCustomerSV', 'queryDuplicateCustCount', '{
	"paramDefinitions": [
		{
			"name": "cprIds",
			"type": "String",
			"argName": "arg0"
		}
	]
}
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '818';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('818', 'COUNT_DUPLICATE_CUST', '818', '818', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '819';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('819', 'queryDuplicateCust', 'queryDuplicateCust', NULL, '/api', '/cm/service/ICmIndivCustomerSV/queryDuplicateCust', 'GET', 'queryDuplicateCust', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "cprIds",
			"displayName": "cprIds",
			"source": "QUERY",
			"path": "cprIds",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "cprIds",
			"exampleValue": ""
		},
		{
			"name": "pageNum",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},
		{
			"name": "pageSize",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETCustomer001', NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '819';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('819', 'queryDuplicateCust', 'APPFRAME', 'com.asiainfo.crm.cm.service.interfaces.ICmIndivCustomerSV', 'queryDuplicateCust', '{
	"paramDefinitions": [
		{
			"name": "cprIds",
			"type": "String",
			"argName": "arg0"
		},
		{
			"name": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"argName": "arg1"
		},
		{
			"name": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"argName": "arg2"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '819';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('819', 'QUERY_DUPLICATE_CUST', '819', '819', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '820';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('820', 'queryDuplicateCprIds', 'queryDuplicateCprIds', NULL, '/api', '/cm/service/CmIndivAction/queryDuplicateCprIds', 'GET', '查询重复CPR ID。该方法根据客户ID查询客户扩展信息，获取重复的CPR ID列表
返回信息:
包含查询结果的Map，key包括"cprIds"（重复的CPR ID字符串，多个ID用逗号分隔）、"retFlag"（"N"表示查询失败，仅当发生异常时存在）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "long", "source": "QUERY", "required": true, "description": "客户ID，用于查询该客户的重复CPR ID", "displayName": "custId", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '820';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('820', 'queryDuplicateCprIds', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl', 'queryDuplicateCprIds', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"type": "long",
			"argName": "arg0"
		}
	]
}
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '820';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('820', 'QUERY_DUPLICATE_CPRID', '820', '820', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '821';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('821', 'dealCustomer', 'dealCustomer', NULL, '/api', '/cm/customer/modifyIndivCust', 'PUT', '处理客户业务。该方法接收客户信息Map、BCE框架ID和业务ID，将客户基本信息和附加信息转换为DataContainer，如果存在旧数据则标记为旧状态并设置变更映射，然后调用客户BCE处理服务进行业务处理
返回信息:
BCE业务处理返回数据，包含业务处理的结果信息', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custInfo", "path": "custInfo", "type": "java.util.Map", "source": "BODY", "required": true, "description": "客户信息Map，包含\\"newData\\"（新数据，包含\\"custInfo\\"和\\"addInfo\\"）和\\"oldData\\"（旧数据，包含\\"custInfo\\"和\\"addInfo\\"）", "displayName": "custInfo", "defaultValue": "", "exampleValue": ""}, {"name": "bceFrameId", "path": "bceFrameId", "type": "long", "source": "QUERY", "required": true, "description": "BCE框架ID，用于业务处理", "displayName": "bceFrameId", "defaultValue": "", "exampleValue": ""}, {"name": "businessId", "path": "businessId", "type": "String", "source": "QUERY", "required": true, "description": "业务ID，用于标识业务操作类型", "displayName": "businessId", "defaultValue": "", "exampleValue": ""}]}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '821';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('821', 'dealCustomer', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl', 'dealCustomer', '{
	"paramDefinitions": [
		{
			"name": "custInfo",
			"argName": "arg0",
			"type": "java.util.Map"
		},
		{
			"name": "bceFrameId",
			"argName": "arg1",
			"type": "long"
		},
		{
			"name": "businessId",
			"argName": "arg2",
			"type": "String"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '821';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('821', 'MODIFY_INDIV_CUST', '821', '821', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '822';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('822', 'getHierarchyStatus', 'getHierarchyStatus', NULL, '/api', '/cm/service/CmCustomerAction/getHierarchyStatus', 'GET', 'getHierarchyStatus,没有对应方法', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "QUERY",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "custId",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, '2025-12-02 16:18:55', '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '822';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('822', 'getHierarchyStatus', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'getHierarchyStatus', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '822';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('822', 'GET_HIERARCHY_STATUS', '822', '822', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '823';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('823', 'queryGroupOrgNode', 'queryGroupOrgNode', NULL, '/api', '/cm/service/CmCustomerAction/checkGroupOrgNode', 'GET', 'queryGroupOrgNode', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "Id",
			"displayName": "Id",
			"source": "QUERY",
			"path": "Id",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "Id",
			"exampleValue": ""
		},
		{
			"name": "parentId",
			"displayName": "parentId",
			"source": "QUERY",
			"path": "parentId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "parentId",
			"exampleValue": ""
		},
		{
			"name": "type",
			"displayName": "type",
			"source": "QUERY",
			"path": "type",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "type",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '823';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('823', 'queryGroupOrgNode', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'queryGroupOrgNode', '{
	"paramDefinitions": [
		{
			"name": "Id",
			"argName": "arg0",
			"type": "long"
		},{
			"name": "parentId",
			"argName": "arg1",
			"type": "long"
		},{
			"name": "type",
			"argName": "arg2",
			"type": "String"
		}
	]
}
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '823';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('823', 'QUERY_GROUP_ORG_NODE', '823', '823', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '824';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('824', 'addOffLineMemberByCpr', 'addOffLineMemberByCpr', NULL, '/api', '/cm/service/CmIndivCustomerAction/addOffLineMemberByCpr', 'GET', '根据CPR添加离线成员。该方法根据CPR号码查询参与人信息，如果参与人存在则判断是否为客户、付款人或联系人，并返回相应的信息。如果参与人不存在，则调用CPR接口验证CPR号码，获取客户信息（姓名、生日、地址等），判断是否受保护、是否移民或消失，然后保存地址信息和客户联系媒介信息
返回信息:
包含添加结果的Map，key包括"retFlag"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，失败时包含异常信息）、"firstName"（名字）、"lastName"（姓氏）、"birth"（生日）、"isProtected"（"Y"表示受保护，"N"表示不受保护）、"memberFrom"（成员来源，"cpr"表示来自CPR，"indiv"表示来自个人客户，"party"表示来自参与人）、"partyId"（参与人ID）、"custId"（客户ID）、"addressId"（地址ID，仅当从CPR创建时存在）、"flag"（"Y"表示客户移民或消失，仅当发生异常时存在）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "cprNum", "path": "cprNum", "type": "String", "source": "QUERY", "required": false, "description": "CPR号码，用于查询参与人信息或调用CPR接口验证", "displayName": "cprNum", "defaultValue": "", "exampleValue": ""}, {"name": "custId", "path": "custId", "type": "String", "source": "QUERY", "required": true, "description": "客户ID，用于保存客户联系媒介信息", "displayName": "custId", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '824';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('824', 'addOffLineMemberByCpr', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustInvdivBFImpl', 'addOffLineMemberByCpr', '{
	"paramDefinitions": [
		{
			"name": "cprNum",
			"argName": "arg0",
			"type": "String"
		},{
			"name": "custId",
			"argName": "arg1",
			"type": "String"
		}
	]
}
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '824';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('824', 'ADD_OFF_MEMBER', '824', '824', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '825';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('825', 'queryCustAcctRels', 'queryCustAcctRels', NULL, '/api', '/cm/service/ICmAccountSV/queryCustAcctRels', 'POST', 'queryCustAcctRels', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "acctId",
			"displayName": "acctId",
			"source": "BODY",
			"path": "acctId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "acctId",
			"exampleValue": ""
		},
		{
			"name": "custId",
			"displayName": "custId",
			"source": "BODY",
			"path": "custId",
			"type": "long",
			"required": true,
			"defaultValue": "",
			"description": "custId",
			"exampleValue": ""
		},
		{
			"name": "beanClass",
			"displayName": "beanClass",
			"source": "BODY",
			"path": "beanClass",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "beanClass",
			"exampleValue": ""
		},
		{
			"name": "pageNum",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},
		{
			"name": "pageSize",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": true
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '825';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('825', 'queryCustAcctRels', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'queryCustAcctRels', '{
	"paramDefinitions": [
		{
			"name": "acctId",
			"argName": "arg0",
			"type": "long"
		},
		{
			"name": "custId",
			"argName": "arg1",
			"type": "long"
		},
		{
			"name": "beanClass",
			"argName": "arg2",
			"type": "String"
		},
		{
			"name": "pageNum",
			"argName": "arg3",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum"
		},
		{
			"name": "pageSize",
			"argName": "arg4",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum"
		}
	]
}
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '825';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('825', 'QUERY_CUST_ACCT_RELS', '825', '825', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '826';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('826', 'getParamValue', 'getParamValue', NULL, '/api', '/cm/service/ICmCommonSV/getParamValue', 'POST', 'getParamValue', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "paramCode",
			"displayName": "paramCode",
			"source": "BODY",
			"path": "paramCode",
			"type": "String",
			"required": true,
			"defaultValue": "",
			"description": "paramCode",
			"exampleValue": ""
		},
		{
			"name": "defaultValue",
			"displayName": "defaultValue",
			"source": "BODY",
			"path": "defaultValue",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "defaultValue",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '826';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('826', 'getParamValue', 'APPFRAME', 'com.asiainfo.crm.cm.common.service.interfaces.ICmCommonSV', 'getParamValue', '{
	"paramDefinitions": [
		{
			"name": "paramCode",
			"argName": "arg0",
			"type": "String"
		},
		{
			"name": "defaultValue",
			"argName": "arg1",
			"type": "String"
		}
	]
}
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '826';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('826', 'GET_PARAM_VALUE', '826', '826', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '827';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('827', 'queryB2BCustomers', 'queryB2BCustomers', NULL, '/api', '/cm/service/ICustomerSearchSV/queryB2BCustomers', 'POST', '根据多个条件查询并返回企业客户信息的分页列表。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "customer_type",
      "displayName": "customer_type",
      "source": "BODY",
      "path": "customer_type",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户类型",
      "exampleValue": "3"
    },
    {
      "name": "customer_state",
      "displayName": "customer_state",
      "source": "BODY",
      "path": "customer_state",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户状态",
      "exampleValue": "U"
    },
    {
      "name": "customer_status",
      "displayName": "customer_status",
      "source": "BODY",
      "path": "customer_status",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户状态",
      "exampleValue": "1"
    },
    {
      "name": "customer_certificate_id",
      "displayName": "customer_certificate_id",
      "source": "BODY",
      "path": "customer_certificate_id",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户证件ID",
      "exampleValue": "0101380141"
    },
    {
      "name": "customer_id",
      "displayName": "customer_id",
      "source": "BODY",
      "path": "customer_id",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户ID",
      "exampleValue": "23210517915222",
      "validationRules": {
        "regex": "^$|^\\\\d{14}$"
      }
    },
    {
      "name": "old_customer_id",
      "displayName": "old_customer_id",
      "source": "BODY",
      "path": "old_customer_id",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "旧客户ID",
      "exampleValue": "23210517915221",
      "validationRules": {
        "regex": "^$|^\\\\d{14}$"
      }
    },
    {
      "name": "icc_id",
      "displayName": "icc_id",
      "source": "BODY",
      "path": "icc_id",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "ICC卡ID",
      "exampleValue": "8945020110111000072",
      "validationRules": {
        "regex": "^$|^\\\\d+$"
      }
    },
    {
      "name": "customer_name",
      "displayName": "customer_name",
      "source": "BODY",
      "path": "customer_name",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户名称",
      "exampleValue": "Stephhone"
    },
    {
      "name": "short_name",
      "displayName": "short_name",
      "source": "BODY",
      "path": "short_name",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "简称",
      "exampleValue": "Step"
    },
    {
      "name": "subscriber_number",
      "displayName": "subscriber_number",
      "source": "BODY",
      "path": "subscriber_number",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "用户号码",
      "exampleValue": "34982019"
    },
    {
      "name": "account_id",
      "displayName": "account_id",
      "source": "BODY",
      "path": "account_id",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "账户ID",
      "exampleValue": "32100119385351",
      "validationRules": {
        "regex": "^$|^\\\\d+$"
      }
    },
    {
      "name": "major_account_number",
      "displayName": "major_account_number",
      "source": "BODY",
      "path": "major_account_number",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "主账户号码",
      "exampleValue": "57483920"
    },
    {
      "name": "address_type",
      "displayName": "address_type",
      "source": "BODY",
      "path": "address_type",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "地址类型",
      "exampleValue": "-1"
    },
    {
      "name": "address_id",
      "displayName": "address_id",
      "source": "BODY",
      "path": "address_id",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "地址ID",
      "exampleValue": ""
    },
    {
      "name": "contract_number",
      "displayName": "contract_number",
      "source": "BODY",
      "path": "contract_number",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "合同编号",
      "exampleValue": ""
    },
    {
      "name": "imsi_number",
      "displayName": "imsi_number",
      "source": "BODY",
      "path": "imsi_number",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "IMSI号码",
      "exampleValue": "238028814101277",
      "validationRules": {
        "regex": "^$|^\\\\d+$"
      }
    },
    {
      "name": "account_manager",
      "displayName": "account_manager",
      "source": "BODY",
      "path": "account_manager",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户经理",
      "exampleValue": ""
    },
    {
      "name": "cust_mana_group",
      "displayName": "cust_mana_group",
      "source": "BODY",
      "path": "cust_mana_group",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户管理组",
      "exampleValue": ""
    },
    {
      "name": "segment",
      "displayName": "segment",
      "source": "BODY",
      "path": "segment",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户细分",
      "exampleValue": "SA"
    },
    {
      "name": "category",
      "displayName": "category",
      "source": "BODY",
      "path": "category",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户类别",
      "exampleValue": ""
    },
    {
      "name": "kob_number",
      "displayName": "kob_number",
      "source": "BODY",
      "path": "kob_number",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "KOB编号",
      "exampleValue": "KOB232312233"
    },
    {
      "name": "cvr_number",
      "displayName": "cvr_number",
      "source": "BODY",
      "path": "cvr_number",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "CVR编号",
      "exampleValue": "323121231"
    },
    {
      "name": "contact_phone_number",
      "displayName": "contact_phone_number",
      "source": "BODY",
      "path": "contact_phone_number",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "联系电话",
      "exampleValue": "43232121"
    },
    {
      "name": "ipAddress",
      "displayName": "ipAddress",
      "source": "BODY",
      "path": "ipAddress",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "IP地址",
      "exampleValue": ""
    },
    {
      "name": "cpeNumber",
      "displayName": "cpeNumber",
      "source": "BODY",
      "path": "cpeNumber",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "CPE编号",
      "exampleValue": ""
    },
    {
      "name": "eanNumber",
      "displayName": "eanNumber",
      "source": "BODY",
      "path": "eanNumber",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "EAN编号",
      "exampleValue": ""
    },
    {
      "name": "PBSNumber",
      "displayName": "PBSNumber",
      "source": "BODY",
      "path": "PBSNumber",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "PBS编号",
      "exampleValue": ""
    },
    {
      "name": "billingAddress",
      "displayName": "billingAddress",
      "source": "BODY",
      "path": "billingAddress",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "账单地址",
      "exampleValue": ""
    },
    {
      "name": "invoiceNumber",
      "displayName": "invoiceNumber",
      "source": "BODY",
      "path": "invoiceNumber",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "发票号码",
      "exampleValue": ""
    },
    {
      "name": "emailAddress",
      "displayName": "emailAddress",
      "source": "BODY",
      "path": "emailAddress",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "电子邮箱",
      "exampleValue": ""
    },
    {
      "name": "ticketID",
      "displayName": "ticketID",
      "source": "BODY",
      "path": "ticketID",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "工单ID",
      "exampleValue": "",
      "validationRules": {
        "regex": "^$|^\\\\d{14}[Xx]\\\\d{6}$"
      }
    },
    {
      "name": "orderID",
      "displayName": "orderID",
      "source": "BODY",
      "path": "orderID",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "订单ID",
      "exampleValue": "",
      "validationRules": {
        "regex": "^$|^\\\\d{14}$"
      }
    },
    {
      "name": "opCode",
      "displayName": "opCode",
      "source": "BODY",
      "path": "opCode",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "操作码",
      "exampleValue": ""
    },
    {
      "name": "oldB2BAccountId",
      "displayName": "oldB2BAccountId",
      "source": "BODY",
      "path": "oldB2BAccountId",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "旧B2B账户ID",
      "exampleValue": ""
    },
    {
      "name": "circuitB2BNumber",
      "displayName": "circuitB2BNumber",
      "source": "BODY",
      "path": "circuitB2BNumber",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "B2B电路编号",
      "exampleValue": ""
    },
    {
      "name": "opennetCustId",
      "displayName": "opennetCustId",
      "source": "BODY",
      "path": "opennetCustId",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "OpenNet客户ID",
      "exampleValue": ""
    },
    {
      "name": "pageNum",
      "displayName": "pageNum",
      "source": "QUERY",
      "path": "pageNum",
      "type": "int",
      "handlerClass": "com.aie.api.tool.PageTool:getStartNum",
      "required": true
    },
    {
      "name": "pageSize",
      "displayName": "pageSize",
      "source": "QUERY",
      "path": "pageSize",
      "type": "int",
      "handlerClass": "com.aie.api.tool.PageTool:getEndNum",
      "required": true
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETB2BCustomerInfo001', NULL, '2025-12-04 10:43:22', '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '827';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('827', 'queryB2BCustomers', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.B2bCustomerAdvanceSearchBFImpl', 'queryB2BCustomers', '{
	"paramDefinitions": [
		{
			"name": "customer_type",
			"argName": "arg0",
			"type": "String"
		},
		{
			"name": "customer_state",
			"argName": "arg1",
			"type": "String"
		},
		{
			"name": "customer_status",
			"argName": "arg2",
			"type": "String"
		},
		{
			"name": "customer_certificate_id",
			"argName": "arg3",
			"type": "String"
		},
		{
			"name": "customer_id",
			"argName": "arg4",
			"type": "String",
			"validationRules": {
				"regex": "^$|^\\\\d{14}$"
			}
		},
		{
			"name": "old_customer_id",
			"argName": "arg5",
			"type": "String",
			"validationRules": {
				"regex": "^$|^\\\\d{14}$"
			}
		},
		{
			"name": "icc_id",
			"argName": "arg6",
			"type": "String",
			"validationRules": {
				"regex": "^$|^\\\\d+$"
			}
		},
		{
			"name": "customer_name",
			"argName": "arg7",
			"type": "String"
		},
		{
			"name": "short_name",
			"argName": "arg8",
			"type": "String"
		},
		{
			"name": "subscriber_number",
			"argName": "arg9",
			"type": "String"
		},
		{
			"name": "account_id",
			"argName": "arg10",
			"type": "String",
			"validationRules": {
				"regex": "^$|^\\\\d+$"
			}
		},
		{
			"name": "major_account_number",
			"argName": "arg11",
			"type": "String"
		},
		{
			"name": "address_type",
			"argName": "arg12",
			"type": "String"
		},
		{
			"name": "address_id",
			"argName": "arg13",
			"type": "String"
		},
		{
			"name": "contract_number",
			"argName": "arg14",
			"type": "String"
		},
		{
			"name": "imsi_number",
			"argName": "arg15",
			"type": "String",
			"validationRules": {
				"regex": "^$|^\\\\d+$"
			}
		},
		{
			"name": "account_manager",
			"argName": "arg16",
			"type": "String"
		},
		{
			"name": "cust_mana_group",
			"argName": "arg17",
			"type": "String"
		},
		{
			"name": "segment",
			"argName": "arg18",
			"type": "String"
		},
		{
			"name": "category",
			"argName": "arg19",
			"type": "String"
		},
		{
			"name": "kob_number",
			"argName": "arg20",
			"type": "String"
		},
		{
			"name": "cvr_number",
			"argName": "arg21",
			"type": "String"
		},
		{
			"name": "contact_phone_number",
			"argName": "arg22",
			"type": "String"
		},
		{
			"name": "ipAddress",
			"argName": "arg23",
			"type": "String"
		},
		{
			"name": "cpeNumber",
			"argName": "arg24",
			"type": "String"
		},
		{
			"name": "eanNumber",
			"argName": "arg25",
			"type": "String"
		},
		{
			"name": "PBSNumber",
			"argName": "arg26",
			"type": "String"
		},
		{
			"name": "billingAddress",
			"argName": "arg27",
			"type": "String"
		},
		{
			"name": "invoiceNumber",
			"argName": "arg28",
			"type": "String"
		},
		{
			"name": "emailAddress",
			"argName": "arg29",
			"type": "String"
		},
		{
			"name": "ticketID",
			"argName": "arg30",
			"type": "String",
			"validationRules": {
				"regex": "^$|^\\\\d{14}[Xx]\\\\d{6}$"
			}
		},
		{
			"name": "orderID",
			"argName": "arg31",
			"type": "String",
			"validationRules": {
				"regex": "^$|^\\\\d{14}$"
			}
		},
		{
			"name": "opCode",
			"argName": "arg32",
			"type": "String"
		},
		{
			"name": "oldB2BAccountId",
			"argName": "arg33",
			"type": "String"
		},
		{
			"name": "circuitB2BNumber",
			"argName": "arg34",
			"type": "String"
		},
		{
			"name": "opennetCustId",
			"argName": "arg35",
			"type": "String"
		},
		{
			"name": "pageNum",
			"argName": "arg36",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum"
		},
		{
			"name": "pageSize",
			"argName": "arg37",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '827';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('827', 'QUERY_B2B_CUSTOMERS', '827', '827', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '828';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('828', 'countB2BCustomers', 'countB2BCustomers', NULL, '/api', '/cm/service/ICustomerSearchSV/countB2BCustomers', 'POST', '根据多个查询条件查询符合条件的客户数量。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "customer_type",
      "displayName": "customer_type",
      "source": "BODY",
      "path": "customer_type",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户类型",
      "exampleValue": "3"
    },
    {
      "name": "customer_state",
      "displayName": "customer_state",
      "source": "BODY",
      "path": "customer_state",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户状态",
      "exampleValue": "U"
    },
    {
      "name": "customer_status",
      "displayName": "customer_status",
      "source": "BODY",
      "path": "customer_status",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户状态",
      "exampleValue": "1"
    },
    {
      "name": "customer_certificate_id",
      "displayName": "customer_certificate_id",
      "source": "BODY",
      "path": "customer_certificate_id",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户证件ID",
      "exampleValue": "0001650941"
    },
    {
      "name": "customer_id",
      "displayName": "customer_id",
      "source": "BODY",
      "path": "customer_id",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户ID",
      "exampleValue": "23210517915222",
      "validationRules": {
        "regex": "^$|^\\\\d{14}$"
      }
    },
    {
      "name": "old_customer_id",
      "displayName": "old_customer_id",
      "source": "BODY",
      "path": "old_customer_id",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "旧客户ID",
      "exampleValue": "23210517915221",
      "validationRules": {
        "regex": "^$|^\\\\d{14}$"
      }
    },
    {
      "name": "icc_id",
      "displayName": "icc_id",
      "source": "BODY",
      "path": "icc_id",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "ICC卡ID",
      "exampleValue": "8945020110111000403",
      "validationRules": {
        "regex": "^$|^\\\\d+$"
      }
    },
    {
      "name": "customer_name",
      "displayName": "customer_name",
      "source": "BODY",
      "path": "customer_name",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户名称",
      "exampleValue": "Stephone"
    },
    {
      "name": "short_name",
      "displayName": "short_name",
      "source": "BODY",
      "path": "short_name",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "简称",
      "exampleValue": "Step"
    },
    {
      "name": "subscriber_number",
      "displayName": "subscriber_number",
      "source": "BODY",
      "path": "subscriber_number",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "用户号码",
      "exampleValue": "43902901"
    },
    {
      "name": "account_id",
      "displayName": "account_id",
      "source": "BODY",
      "path": "account_id",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "账户ID",
      "exampleValue": "32100119385351",
      "validationRules": {
        "regex": "^$|^\\\\d+$"
      }
    },
    {
      "name": "major_account_number",
      "displayName": "major_account_number",
      "source": "BODY",
      "path": "major_account_number",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "主账户号码",
      "exampleValue": ""
    },
    {
      "name": "address_type",
      "displayName": "address_type",
      "source": "BODY",
      "path": "address_type",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "地址类型",
      "exampleValue": ""
    },
    {
      "name": "address_id",
      "displayName": "address_id",
      "source": "BODY",
      "path": "address_id",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "地址ID",
      "exampleValue": "233123"
    },
    {
      "name": "contract_number",
      "displayName": "contract_number",
      "source": "BODY",
      "path": "contract_number",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "合同编号",
      "exampleValue": "2323241"
    },
    {
      "name": "imsi_number",
      "displayName": "imsi_number",
      "source": "BODY",
      "path": "imsi_number",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "IMSI号码",
      "exampleValue": "238028814101277",
      "validationRules": {
        "regex": "^$|^\\\\d+$"
      }
    },
    {
      "name": "account_manager",
      "displayName": "account_manager",
      "source": "BODY",
      "path": "account_manager",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户经理",
      "exampleValue": ""
    },
    {
      "name": "cust_mana_group",
      "displayName": "cust_mana_group",
      "source": "BODY",
      "path": "cust_mana_group",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户管理组",
      "exampleValue": ""
    },
    {
      "name": "segment",
      "displayName": "segment",
      "source": "BODY",
      "path": "segment",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户细分",
      "exampleValue": "SA"
    },
    {
      "name": "category",
      "displayName": "category",
      "source": "BODY",
      "path": "category",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户类别",
      "exampleValue": "-1"
    },
    {
      "name": "kob_number",
      "displayName": "kob_number",
      "source": "BODY",
      "path": "kob_number",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "KOB编号",
      "exampleValue": "KOB23210517915222"
    },
    {
      "name": "cvr_number",
      "displayName": "cvr_number",
      "source": "BODY",
      "path": "cvr_number",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "CVR编号",
      "exampleValue": ""
    },
    {
      "name": "contact_phone_number",
      "displayName": "contact_phone_number",
      "source": "BODY",
      "path": "contact_phone_number",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "联系电话",
      "exampleValue": "33423121"
    },
    {
      "name": "ipAddress",
      "displayName": "ipAddress",
      "source": "BODY",
      "path": "ipAddress",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "IP地址",
      "exampleValue": ""
    },
    {
      "name": "cpeNumber",
      "displayName": "cpeNumber",
      "source": "BODY",
      "path": "cpeNumber",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "CPE编号",
      "exampleValue": ""
    },
    {
      "name": "eanNumber",
      "displayName": "eanNumber",
      "source": "BODY",
      "path": "eanNumber",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "EAN编号",
      "exampleValue": ""
    },
    {
      "name": "PBSNumber",
      "displayName": "PBSNumber",
      "source": "BODY",
      "path": "PBSNumber",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "PBS编号",
      "exampleValue": ""
    },
    {
      "name": "billingAddress",
      "displayName": "billingAddress",
      "source": "BODY",
      "path": "billingAddress",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "账单地址",
      "exampleValue": ""
    },
    {
      "name": "invoiceNumber",
      "displayName": "invoiceNumber",
      "source": "BODY",
      "path": "invoiceNumber",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "发票号码",
      "exampleValue": ""
    },
    {
      "name": "emailAddress",
      "displayName": "emailAddress",
      "source": "BODY",
      "path": "emailAddress",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "电子邮箱",
      "exampleValue": "333@123.COM"
    },
    {
      "name": "ticketID",
      "displayName": "ticketID",
      "source": "BODY",
      "path": "ticketID",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "工单ID",
      "exampleValue": "",
      "validationRules": {
        "regex": "^$|^\\\\d{14}[Xx]\\\\d{6}$"
      }
    },
    {
      "name": "orderID",
      "displayName": "orderID",
      "source": "BODY",
      "path": "orderID",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "订单ID",
      "exampleValue": "32100263471304",
      "validationRules": {
        "regex": "^$|^\\\\d{14}$"
      }
    },
    {
      "name": "opCode",
      "displayName": "opCode",
      "source": "BODY",
      "path": "opCode",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "操作码",
      "exampleValue": "443325"
    },
    {
      "name": "oldB2BAccountId",
      "displayName": "oldB2BAccountId",
      "source": "BODY",
      "path": "oldB2BAccountId",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "旧B2B账户ID",
      "exampleValue": "32100119385356"
    },
    {
      "name": "circuitB2BNumber",
      "displayName": "circuitB2BNumber",
      "source": "BODY",
      "path": "circuitB2BNumber",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "B2B电路编号",
      "exampleValue": ""
    },
    {
      "name": "opennetCustId",
      "displayName": "opennetCustId",
      "source": "BODY",
      "path": "opennetCustId",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "OpenNet客户ID",
      "exampleValue": ""
    }
  ]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, '2025-12-04 10:40:58', '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '828';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('828', 'countB2BCustomers', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.B2bCustomerAdvanceSearchBFImpl', 'countB2BCustomers', '{
	"paramDefinitions": [
		{
			"name": "customer_type",
			"argName": "arg0",
			"type": "String"
		},
		{
			"name": "customer_state",
			"argName": "arg1",
			"type": "String"
		},
		{
			"name": "customer_status",
			"argName": "arg2",
			"type": "String"
		},
		{
			"name": "customer_certificate_id",
			"argName": "arg3",
			"type": "String"
		},
		{
			"name": "customer_id",
			"argName": "arg4",
			"type": "String",
			"validationRules": {
				"regex": "^$|^\\\\d{14}$"
			}
		},
		{
			"name": "old_customer_id",
			"argName": "arg5",
			"type": "String",
			"validationRules": {
				"regex": "^$|^\\\\d{14}$"
			}
		},
		{
			"name": "icc_id",
			"argName": "arg6",
			"type": "String",
			"validationRules": {
				"regex": "^$|^\\\\d+$"
			}
		},
		{
			"name": "customer_name",
			"argName": "arg7",
			"type": "String"
		},
		{
			"name": "short_name",
			"argName": "arg8",
			"type": "String"
		},
		{
			"name": "subscriber_number",
			"argName": "arg9",
			"type": "String"
		},
		{
			"name": "account_id",
			"argName": "arg10",
			"type": "String",
			"validationRules": {
				"regex": "^$|^\\\\d+$"
			}
		},
		{
			"name": "major_account_number",
			"argName": "arg11",
			"type": "String"
		},
		{
			"name": "address_type",
			"argName": "arg12",
			"type": "String"
		},
		{
			"name": "address_id",
			"argName": "arg13",
			"type": "String"
		},
		{
			"name": "contract_number",
			"argName": "arg14",
			"type": "String"
		},
		{
			"name": "imsi_number",
			"argName": "arg15",
			"type": "String",
			"validationRules": {
				"regex": "^$|^\\\\d+$"
			}
		},
		{
			"name": "account_manager",
			"argName": "arg16",
			"type": "String"
		},
		{
			"name": "cust_mana_group",
			"argName": "arg17",
			"type": "String"
		},
		{
			"name": "segment",
			"argName": "arg18",
			"type": "String"
		},
		{
			"name": "category",
			"argName": "arg19",
			"type": "String"
		},
		{
			"name": "kob_number",
			"argName": "arg20",
			"type": "String"
		},
		{
			"name": "cvr_number",
			"argName": "arg21",
			"type": "String"
		},
		{
			"name": "contact_phone_number",
			"argName": "arg22",
			"type": "String"
		},
		{
			"name": "ipAddress",
			"argName": "arg23",
			"type": "String"
		},
		{
			"name": "cpeNumber",
			"argName": "arg24",
			"type": "String"
		},
		{
			"name": "eanNumber",
			"argName": "arg25",
			"type": "String"
		},
		{
			"name": "PBSNumber",
			"argName": "arg26",
			"type": "String"
		},
		{
			"name": "billingAddress",
			"argName": "arg27",
			"type": "String"
		},
		{
			"name": "invoiceNumber",
			"argName": "arg28",
			"type": "String"
		},
		{
			"name": "emailAddress",
			"argName": "arg29",
			"type": "String"
		},
		{
			"name": "ticketID",
			"argName": "arg30",
			"type": "String",
			"validationRules": {
				"regex": "^$|^\\\\d{14}[Xx]\\\\d{6}$"
			}
		},
		{
			"name": "orderID",
			"argName": "arg31",
			"type": "String",
			"validationRules": {
				"regex": "^$|^\\\\d{14}$"
			}
		},
		{
			"name": "opCode",
			"argName": "arg32",
			"type": "String"
		},
		{
			"name": "oldB2BAccountId",
			"argName": "arg33",
			"type": "String"
		},
		{
			"name": "circuitB2BNumber",
			"argName": "arg34",
			"type": "String"
		},
		{
			"name": "opennetCustId",
			"argName": "arg35",
			"type": "String"
		}
	]
}
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '828';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('828', 'COUNT_B2B_CUSTOMERS', '828', '828', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '835';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('835', 'statisticCustData', 'statisticCustData', NULL, '/api', '/cm/service/FrameCommonAction/statisticCustData', 'POST', '统计客户数据。该方法根据客户类型获取对应的视图配置，然后调用远程服务统计客户相关的数据，包括待处理订单数、商机数、个人案例数、企业案例数和活动数。统计结果以格式化后的数字字符串形式返回
返回信息:
包含统计结果的Map，key包括"ret_code"（"success"表示成功，"failure"表示失败）、"ret_msg"（失败时的错误消息）、"OrderQuery"（待处理订单数）、"Opportunity"（商机数）、"CaseIndiHistory"（个人案例数）、"CaseCorpHistory"（企业案例数）、"Compaign"（活动数）', NULL, NULL, NULL, '{"paramDefinitions":[{"name":"custId","path":"custId","type":"String","source":"BODY","required":false,"description":"客户ID，用于统计该客户的相关数据","displayName":"custId","defaultValue":"","exampleValue":""},{"name":"serviceNumber","path":"serviceNumber","type":"String","source":"BODY","required":false,"description":"","displayName":"服务号码，用于统计活动数据","defaultValue":"","exampleValue":""},{"name":"custType","path":"custType","type":"String","source":"BODY","required":false,"description":"客户类型，用于获取对应的视图配置","displayName":"custType","defaultValue":"","exampleValue":""}]}', NULL, NULL, NULL, 'cm', 'order', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '835';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('835', 'statisticCustData', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CommonBFImpl', 'statisticCustData', '{
    "paramDefinitions": [
        {
            "name": "custId",
            "argName": "arg0",
            "type": "String"
        },
        {
            "name": "serviceNumber",
            "argName": "arg1",
            "type": "String"
        },
        {
            "name": "custType",
            "argName": "arg2",
            "type": "String"
        }
    ]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '835';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('835', 'CHECK_PERMISSION', '835', '835', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '836';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('836', 'getCustImageHtml', 'getCustImageHtml', NULL, '/api', '/cm/service/FrameCommonAction/getCustImageHtml', 'POST', '获取客户图片HTML。该方法接收客户ID、真实客户类型、文件路径、文件名和上下文路径，根据客户类型和性别生成客户头像的HTML img标签，如果图片加载失败则显示默认头像（个人客户根据性别显示不同头像，集团客户显示集团头像）
返回信息:
包含HTML代码的Map，key包括"retCode"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，失败时包含错误信息）、"htmlCode"（客户头像的HTML代码）', NULL, NULL, NULL, '{"paramDefinitions":[{"name":"custId","path":"custId","type":"long","source":"BODY","required":false,"description":"客户ID，用于查询客户信息和生成客户头像HTML","displayName":"custId","defaultValue":"","exampleValue":""},{"name":"custType","path":"custType","type":"int","source":"BODY","required":false,"description":"真实客户类型，用于确定客户头像类型,1表示个人客户,3表示集团客户","displayName":"custType","defaultValue":"","exampleValue":""},{"name":"filePath","path":"filePath","type":"int","source":"BODY","required":false,"description":"文件路径，用于生成图片URL","displayName":"filePath","defaultValue":"","exampleValue":""},{"name":"fileName","path":"fileName","type":"String","source":"BODY","required":false,"description":"文件名，用于生成图片URL","displayName":"fileName","defaultValue":"","exampleValue":""},{"name":"context","path":"context","type":"String","source":"BODY","required":false,"description":"上下文路径，用于生成完整的图片URL","displayName":"context","defaultValue":"","exampleValue":""}]}', NULL, NULL, NULL, 'cm', 'order', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '836';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('836', 'getCustImageHtml', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'getCustImageHtml', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		},
		{
			"name": "custType",
			"argName": "arg1",
			"type": "int"
		},
		{
			"name": "filePath",
			"argName": "arg2",
			"type": "int"
		},
		{
			"name": "fileName",
			"argName": "arg3",
			"type": "String"
		},
		{
			"name": "context",
			"argName": "arg4",
			"type": "String"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '836';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('836', 'GET_CUST_IMAGE_HTML', '836', '836', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '838';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('838', 'QueryCustInfoItem', 'QueryCustInfoItem', NULL, '/api', '/cm/service/IOf2CustInfoItemSV/QueryCustInfoItem', 'POST', 'QueryCustInfoItem', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "ownSys",
			"displayName": "ownSys",
			"source": "BODY",
			"path": "ownSys",
			"type": "int",
			"required": false,
			"defaultValue": "",
			"description": "系统标识",
			"exampleValue": "1"
		},
		{
			"name": "itemType",
			"displayName": "itemType",
			"source": "BODY",
			"path": "itemType",
			"type": "int",
			"required": false,
			"defaultValue": "",
			"description": "项目类型",
			"exampleValue": "2"
		},
		{
			"name": "fieldName",
			"displayName": "fieldName",
			"source": "BODY",
			"path": "fieldName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "字段名称",
			"exampleValue": "username"
		},
		{
			"name": "labelName",
			"displayName": "labelName",
			"source": "BODY",
			"path": "labelName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "标签名称",
			"exampleValue": "用户名"
		},
		{
			"name": "isVisible",
			"displayName": "isVisible",
			"source": "BODY",
			"path": "isVisible",
			"type": "int",
			"required": false,
			"defaultValue": "",
			"description": "是否可见",
			"exampleValue": "1"
		},
		{
			"name": "pageNum",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": true
		},
		{
			"name": "pageSize",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum"
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '838';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('838', 'QueryCustInfoItem', 'APPFRAME', 'com.ai.oneframe.cust.service.interfaces.IOf2CustInfoItemSV', 'QueryCustInfoItem', '{
	"paramDefinitions": [
		{
			"name": "ownSys",
			"argName": "arg0",
			"type": "int"
		},
		{
			"name": "itemType",
			"argName": "arg1",
			"type": "int"
		},
		{
			"name": "fieldName",
			"argName": "arg2",
			"type": "String"
		},
		{
			"name": "labelName",
			"argName": "arg3",
			"type": "String"
		},
		{
			"name": "isVisible",
			"argName": "arg4",
			"type": "int"
		},
		{
			"name": "pageNum",
			"argName": "arg5",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum"
		},
		{
			"name": "pageSize",
			"argName": "arg6",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '838';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('838', 'QUERY_CUST_INFO_ITEM', '838', '838', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '839';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('839', 'QueryCustInfoItemCount', 'QueryCustInfoItemCount', NULL, '/api', '/cm/service/IOf2CustInfoItemSV/QueryCustInfoItemCount', 'POST', 'QueryCustInfoItem', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "ownSys",
			"displayName": "ownSys",
			"source": "BODY",
			"path": "ownSys",
			"type": "int",
			"required": false,
			"defaultValue": "",
			"description": "系统标识",
			"exampleValue": "1"
		},
		{
			"name": "itemType",
			"displayName": "itemType",
			"source": "BODY",
			"path": "itemType",
			"type": "int",
			"required": false,
			"defaultValue": "",
			"description": "项目类型",
			"exampleValue": "2"
		},
		{
			"name": "fieldName",
			"displayName": "fieldName",
			"source": "BODY",
			"path": "fieldName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "字段名称",
			"exampleValue": "username"
		},
		{
			"name": "labelName",
			"displayName": "labelName",
			"source": "BODY",
			"path": "labelName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "标签名称",
			"exampleValue": "用户名"
		},
		{
			"name": "isVisible",
			"displayName": "isVisible",
			"source": "BODY",
			"path": "isVisible",
			"type": "int",
			"required": false,
			"defaultValue": "",
			"description": "是否可见",
			"exampleValue": "1"
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '839';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('839', 'QueryCustInfoItemCount', 'APPFRAME', 'com.ai.oneframe.cust.service.interfaces.IOf2CustInfoItemSV', 'QueryCustInfoItemCount', '{
	"paramDefinitions": [
		{
			"name": "ownSys",
			"argName": "arg0",
			"type": "int"
		},
		{
			"name": "itemType",
			"argName": "arg1",
			"type": "int"
		},
		{
			"name": "fieldName",
			"argName": "arg2",
			"type": "String"
		},
		{
			"name": "labelName",
			"argName": "arg3",
			"type": "String"
		},
		{
			"name": "isVisible",
			"argName": "arg4",
			"type": "int"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '839';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('839', 'QUERY_CUST_INFO_ITEM_COUNT', '839', '839', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '840';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('840', 'queryVcCustItem', 'queryVcCustItem', NULL, '/api', '/cm/service/IOf2VcCustItemSV/queryVcCustItem', 'POST', 'queryVcCustItem', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "visualId",
			"displayName": "visualId",
			"source": "BODY",
			"path": "visualId",
			"type": "long",
			"required": false,
			"defaultValue": "",
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "ownSys",
			"displayName": "ownSys",
			"source": "BODY",
			"path": "ownSys",
			"type": "int",
			"required": false,
			"defaultValue": "",
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "itemType",
			"displayName": "itemType",
			"source": "BODY",
			"path": "itemType",
			"type": "int",
			"required": false,
			"defaultValue": "",
			"description": "",
			"exampleValue": ""
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', 'customer', 'SETVcCustItem001', NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '840';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('840', 'queryVcCustItem', 'APPFRAME', 'com.ai.oneframe.view.service.interfaces.IOf2VcCustItemSV', 'queryVcCustItem', '{
	"paramDefinitions": [
		{
			"name": "visualId",
			"argName": "arg0",
			"type": "long"
		},
		{
			"name": "ownSys",
			"argName": "arg1",
			"type": "int"
		},
		{
			"name": "itemType",
			"argName": "arg2",
			"type": "int"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '840';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('840', 'QUERY_VC_CUST_ITEM', '840', '840', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '841';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('841', 'queryVcCustItemCount', 'queryVcCustItemCount', NULL, '/api', '/cm/service/IOf2VcCustItemSV/queryVcCustItemCount', 'POST', 'queryVcCustItemCount', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "visualId",
			"displayName": "visualId",
			"source": "BODY",
			"path": "visualId",
			"type": "long",
			"required": false,
			"defaultValue": "",
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "ownSys",
			"displayName": "ownSys",
			"source": "BODY",
			"path": "ownSys",
			"type": "int",
			"required": false,
			"defaultValue": "",
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "itemType",
			"displayName": "itemType",
			"source": "BODY",
			"path": "itemType",
			"type": "int",
			"required": false,
			"defaultValue": "",
			"description": "",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '841';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('841', 'queryVcCustItemCount', 'APPFRAME', 'com.ai.oneframe.view.service.interfaces.IOf2VcCustItemSV', 'queryVcCustItemCount', '{
	"paramDefinitions": [
		{
			"name": "visualId",
			"argName": "arg0",
			"type": "long"
		},
		{
			"name": "ownSys",
			"argName": "arg1",
			"type": "int"
		},
		{
			"name": "itemType",
			"argName": "arg2",
			"type": "int"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '841';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('841', 'QUERY_VC_CUST_ITEM_COUNT', '841', '841', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '843';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('843', 'getCustType', 'getCustType', NULL, '/api', '/cm/service/CmCommonUtil/getCustType', 'GET', '获取客户类型。该方法根据客户ID查询客户类型，如果客户ID小于等于0则抛出业务异常，通过SN工具类获取客户类型
返回信息:
客户类型整数值，如果查询失败则抛出业务异常', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custId", "path": "custId", "type": "long", "source": "QUERY", "required": true, "description": "客户ID，用于查询该客户的客户类型", "displayName": "custId", "defaultValue": "", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', 'customer', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '843';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('843', 'getCustType', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.Cust360ViewBFImpl', 'getCustType', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"argName": "arg0",
			"type": "long"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '843';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('843', 'GET_CUST_TYPE', '843', '843', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '846';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('846', 'saveVcCustItemInfo', 'saveVcCustItemInfo', NULL, '/api', '/cm/service/CustItemBFImpl/saveVcCustItemInfo', 'POST', '保存视图客户项信息。该方法接收客户类型、所属系统和项目代码列表，获取当前用户ID和最大排序号，然后将项目代码列表按逗号分割，为每个项目代码创建视图客户项Bean（设置可见性、排序号等），最后批量保存这些客户项信息
返回信息:
包含保存结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，失败时包含国际化资源"OFS2000384"对应的文本和异常信息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custType", "path": "custType", "type": "int", "source": "BODY", "required": true, "description": "客户类型，用于标识客户项所属的客户类型", "displayName": "custType", "exampleValue": ""}, {"name": "ownSys", "path": "ownSys", "type": "int", "source": "BODY", "required": true, "description": "所属系统，用于标识客户项所属的系统", "displayName": "ownSys", "exampleValue": ""}, {"name": "itemCodes", "path": "itemCodes", "type": "String", "source": "BODY", "required": true, "description": "项目代码列表，多个代码用逗号分隔，用于创建多个客户项", "displayName": "itemCodes", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', '360view', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '846';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('846', 'saveVcCustItemInfo', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustItemBFImpl', 'saveVcCustItemInfo', '{
	"paramDefinitions": [
		{
			"name": "custType",
			"type": "int",
			"argName": "arg0"
		},
		{
			"name": "ownSys",
			"type": "int",
			"argName": "arg1"
		},
		{
			"name": "itemCodes",
			"type": "String",
			"argName": "arg2"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '846';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('846', 'SAVE_VC_CUST_ITEM_INFO', '846', '846', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '847';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('847', 'deleteVcCustItemInfo', 'deleteVcCustItemInfo', NULL, '/api', '/cm/service/CustItemBFImpl/deleteVcCustItemInfo', 'POST', '删除视图客户项信息。该方法接收客户类型、所属系统和项目代码列表，获取当前用户ID，删除指定的视图客户项，然后重新获取剩余的客户项并重新排序（从1开始），最后批量保存更新后的排序号
返回信息:
包含删除结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，失败时包含国际化资源"OFS2000385"对应的文本和异常信息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "custType", "path": "custType", "type": "int", "source": "BODY", "required": true, "description": "客户类型，用于标识要删除的客户项所属的客户类型", "displayName": "custType", "exampleValue": ""}, {"name": "ownSys", "path": "ownSys", "type": "int", "source": "BODY", "required": true, "description": "所属系统，用于标识要删除的客户项所属的系统", "displayName": "ownSys", "exampleValue": ""}, {"name": "itemCodes", "path": "itemCodes", "type": "String", "source": "BODY", "required": true, "description": "项目代码列表，多个代码用逗号分隔，用于删除多个客户项", "displayName": "itemCodes", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', '360view', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '847';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('847', 'deleteVcCustItemInfo', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustItemBFImpl', 'deleteVcCustItemInfo', '{
	"paramDefinitions": [
		{
			"name": "custType",
			"type": "int",
			"argName": "arg0"
		},
		{
			"name": "ownSys",
			"type": "int",
			"argName": "arg1"
		},
		{
			"name": "itemCodes",
			"type": "String",
			"argName": "arg2"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '847';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('847', 'DELETE_VC_CUST_ITEM_INFO', '847', '847', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '848';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('848', 'moveVcCustItemData', 'moveVcCustItemData', NULL, '/api', '/cm/service/CustItemBFImpl/moveVcCustItemData', 'POST', '移动视图客户项数据。该方法接收项目代码、客户类型、所属系统、操作标志和排序号，获取当前用户ID，然后调用视图客户项服务移动客户项数据（用于调整客户项的顺序）
返回信息:
包含移动结果的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（结果消息，失败时包含国际化资源"OFS2000387"对应的文本和异常信息）', NULL, NULL, NULL, '{"paramDefinitions": [{"name": "itemCode", "path": "itemCode", "type": "String", "source": "BODY", "required": true, "description": "项目代码，用于标识要移动的客户项", "displayName": "itemCode", "exampleValue": ""}, {"name": "custType", "path": "custType", "type": "int", "source": "BODY", "required": true, "description": "客户类型，用于标识客户项所属的客户类型", "displayName": "custType", "exampleValue": ""}, {"name": "ownSys", "path": "ownSys", "type": "int", "source": "BODY", "required": true, "description": "所属系统，用于标识客户项所属的系统", "displayName": "ownSys", "exampleValue": ""}, {"name": "opFlag", "path": "opFlag", "type": "String", "source": "BODY", "required": false, "description": "操作标志，用于指定移动操作的类型（如向上移动、向下移动等）", "displayName": "opFlag", "exampleValue": ""}, {"name": "sortNo", "path": "sortNo", "type": "int", "source": "BODY", "required": false, "description": "排序号，用于指定移动后的目标排序位置", "displayName": "sortNo", "exampleValue": ""}]}', NULL, NULL, NULL, 'cm', '360view', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '848';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('848', 'moveVcCustItemData', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.CustItemBFImpl', 'moveVcCustItemData', '{
	"paramDefinitions": [
		{
			"name": "itemCode",
			"type": "String",
			"argName": "arg0"
		},
		{
			"name": "custType",
			"type": "int",
			"argName": "arg1"
		},
		{
			"name": "ownSys",
			"type": "int",
			"argName": "arg2"
		},
		{
			"name": "opFlag",
			"type": "String",
			"argName": "arg3"
		},
		{
			"name": "sortNo",
			"type": "int",
			"argName": "arg4"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '848';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('848', 'MOVE_VC_CUST_ITEM_INFO', '848', '848', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '849';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('849', 'queryUserSplitAccount', 'queryUserSplitAccount', NULL, '/api', '/cm/acct/ICrmFSV/queryUserSplitAccount', 'POST', 'queryUserSplitAccount', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "BODY",
			"path": "custId",
			"type": "long",
			"required": false,
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "serviceNumber",
			"displayName": "serviceNumber",
			"source": "BODY",
			"path": "serviceNumber",
			"type": "String",
			"required": false,
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "defaultAcctId",
			"displayName": "defaultAcctId",
			"source": "BODY",
			"path": "defaultAcctId",
			"type": "long",
			"required": false,
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "splitAcctId",
			"displayName": "splitAcctId",
			"source": "BODY",
			"path": "splitAcctId",
			"type": "long",
			"required": false,
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "splitRuleId",
			"displayName": "splitRuleId",
			"source": "BODY",
			"path": "splitRuleId",
			"type": "long",
			"required": false,
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "itemIdName",
			"displayName": "itemIdName",
			"source": "BODY",
			"path": "itemIdName",
			"type": "String",
			"required": false,
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "pageNum",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": false
		},
		{
			"name": "pageSize",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": false
		}
	]
}', NULL, NULL, NULL, 'cm', '360view', 'SETAcctContactInfo001', NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '849';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('849', 'queryUserSplitAccount', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.AccountBFImpl', 'queryUserSplitAccount', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"type": "long",
			"argName": "arg0"
		},
		{
			"name": "serviceNumber",
			"type": "String",
			"argName": "arg1"
		},
		{
			"name": "defaultAcctId",
			"type": "long",
			"argName": "arg2"
		},
		{
			"name": "splitAcctId",
			"type": "long",
			"argName": "arg3"
		},
		{
			"name": "splitRuleId",
			"type": "long",
			"argName": "arg4"
		},
		{
			"name": "itemIdName",
			"type": "String",
			"argName": "arg5"
		},
		{
			"name": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"argName": "arg6"
		},
		{
			"name": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"argName": "arg7"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '849';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('849', 'QUERY_USER_SPLIT_ACCOUNT', '849', '849', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '850';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('850', 'queryUserSplitAccountLength', 'queryUserSplitAccountLength', NULL, '/api', '/cm/acct/ICrmFSV/queryUserSplitAccountLength', 'POST', 'queryUserSplitAccountLength', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custId",
			"displayName": "custId",
			"source": "BODY",
			"path": "custId",
			"type": "long",
			"required": false,
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "serviceNumber",
			"displayName": "serviceNumber",
			"source": "BODY",
			"path": "serviceNumber",
			"type": "String",
			"required": false,
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "defaultAcctId",
			"displayName": "defaultAcctId",
			"source": "BODY",
			"path": "defaultAcctId",
			"type": "long",
			"required": false,
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "splitAcctId",
			"displayName": "splitAcctId",
			"source": "BODY",
			"path": "splitAcctId",
			"type": "long",
			"required": false,
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "splitRuleId",
			"displayName": "splitRuleId",
			"source": "BODY",
			"path": "splitRuleId",
			"type": "long",
			"required": false,
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "itemIdName",
			"displayName": "itemIdName",
			"source": "BODY",
			"path": "itemIdName",
			"type": "String",
			"required": false,
			"description": "",
			"exampleValue": ""
		}
	]
}', NULL, NULL, NULL, 'cm', '360view', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '850';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('850', 'queryUserSplitAccountLength', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.AccountBFImpl', 'queryUserSplitAccountLength', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"type": "long",
			"argName": "arg0"
		},
		{
			"name": "serviceNumber",
			"type": "String",
			"argName": "arg1"
		},
		{
			"name": "defaultAcctId",
			"type": "long",
			"argName": "arg2"
		},
		{
			"name": "splitAcctId",
			"type": "long",
			"argName": "arg3"
		},
		{
			"name": "splitRuleId",
			"type": "long",
			"argName": "arg4"
		},
		{
			"name": "itemIdName",
			"type": "String",
			"argName": "arg5"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '850';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('850', 'QUERY_USER_SPLIT_ACCOUNT_LENGTH', '850', '850', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '851';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('851', 'queryPayerAccountByAgr', 'queryPayerAccountByAgr', NULL, '/api', '/cm/acct/ICrmFSV/queryPayerAccountByAgr', 'POST', 'queryPayerAccountByAgr', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "agreementId",
			"displayName": "agreementId",
			"source": "BODY",
			"path": "agreementId",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "custType",
			"displayName": "custType",
			"source": "BODY",
			"path": "custType",
			"type": "int",
			"required": false,
			"defaultValue": "",
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "custId",
			"displayName": "custId",
			"source": "BODY",
			"path": "custId",
			"type": "long",
			"required": false,
			"defaultValue": "",
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "firstName",
			"displayName": "firstName",
			"source": "BODY",
			"path": "firstName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "LastName",
			"displayName": "LastName",
			"source": "BODY",
			"path": "LastName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "cpr",
			"displayName": "cpr",
			"source": "BODY",
			"path": "cpr",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "birthDay",
			"displayName": "birthDay",
			"source": "BODY",
			"path": "birthDay",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "addressId",
			"displayName": "addressId",
			"source": "BODY",
			"path": "addressId",
			"type": "long",
			"required": false,
			"defaultValue": "",
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "companyName",
			"displayName": "companyName",
			"source": "BODY",
			"path": "companyName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "kob",
			"displayName": "kob",
			"source": "BODY",
			"path": "kob",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "cvr",
			"displayName": "cvr",
			"source": "BODY",
			"path": "cvr",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "accountId",
			"displayName": "accountId",
			"source": "BODY",
			"path": "accountId",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "isIotOffer",
			"displayName": "isIotOffer",
			"source": "BODY",
			"path": "isIotOffer",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "",
			"exampleValue": ""
		},
		{
			"name": "pageNum",
			"displayName": "pageNum",
			"source": "QUERY",
			"path": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"required": false
		},
		{
			"name": "pageSize",
			"displayName": "pageSize",
			"source": "QUERY",
			"path": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"required": false
		}
	]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', '360view', 'SETAcctContactInfo001', NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '851';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('851', 'queryPayerAccountByAgr', 'APPFRAME', 'com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV', 'queryPayerAccountByAgr', '{
	"paramDefinitions": [
		{
			"name": "agreementId",
			"type": "String",
			"argName": "arg0"
		},
		{
			"name": "custType",
			"type": "int",
			"argName": "arg1"
		},
		{
			"name": "custId",
			"type": "long",
			"argName": "arg2"
		},
		{
			"name": "firstName",
			"type": "String",
			"argName": "arg3"
		},
		{
			"name": "LastName",
			"type": "String",
			"argName": "arg4"
		},
		{
			"name": "cpr",
			"type": "String",
			"argName": "arg5"
		},
		{
			"name": "birthDay",
			"type": "String",
			"argName": "arg6"
		},
		{
			"name": "addressId",
			"type": "long",
			"argName": "arg7"
		},
		{
			"name": "companyName",
			"type": "String",
			"argName": "arg8"
		},
		{
			"name": "kob",
			"type": "String",
			"argName": "arg9"
		},
		{
			"name": "cvr",
			"type": "String",
			"argName": "arg10"
		},
		{
			"name": "accountId",
			"type": "String",
			"argName": "arg11"
		},
		{
			"name": "isIotOffer",
			"type": "String",
			"argName": "arg12"
		},
		{
			"name": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"argName": "arg13"
		},
		{
			"name": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"argName": "arg14"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '851';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('851', 'QUERY_PAYER_ACCOUNT_BY_AGR', '851', '851', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '852';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('852', 'queryPayerAccountByAgrCount', 'queryPayerAccountByAgrCount', NULL, '/api', '/cm/acct/ICrmFSV/queryPayerAccountByAgrCount', 'POST', '根据合同ID（agreementId）和客户信息（客户类型、客户ID、姓名、CPR、生日、地址、公司名、KOB、CVR等）查询与合同关联的付款账户数量。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "agreementId",
      "displayName": "agreementId",
      "source": "BODY",
      "path": "agreementId",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "合同唯一标识，用于合同与订单关联及业务流程控制",
      "exampleValue": "3102815583"
    },
    {
      "name": "custType",
      "displayName": "custType",
      "source": "BODY",
      "path": "custType",
      "type": "int",
      "required": false,
      "defaultValue": "",
      "description": "客户类型",
      "exampleValue": "1"
    },
    {
      "name": "custId",
      "displayName": "custId",
      "source": "BODY",
      "path": "custId",
      "type": "long",
      "required": false,
      "defaultValue": "",
      "description": "客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作",
      "exampleValue": "23210517915222"
    },
    {
      "name": "firstName",
      "displayName": "firstName",
      "source": "BODY",
      "path": "firstName",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "名字",
      "exampleValue": "John"
    },
    {
      "name": "LastName",
      "displayName": "LastName",
      "source": "BODY",
      "path": "LastName",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "姓氏",
      "exampleValue": "Smith"
    },
    {
      "name": "cpr",
      "displayName": "cpr",
      "source": "BODY",
      "path": "cpr",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "个人身份证号",
      "exampleValue": "312312"
    },
    {
      "name": "birthDay",
      "displayName": "birthDay",
      "source": "BODY",
      "path": "birthDay",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "生日",
      "exampleValue": "1980-01-15"
    },
    {
      "name": "addressId",
      "displayName": "addressId",
      "source": "BODY",
      "path": "addressId",
      "type": "long",
      "required": false,
      "defaultValue": "",
      "description": "地址ID",
      "exampleValue": "23243423"
    },
    {
      "name": "companyName",
      "displayName": "companyName",
      "source": "BODY",
      "path": "companyName",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "公司名称",
      "exampleValue": "ABC Corporation"
    },
    {
      "name": "kob",
      "displayName": "kob",
      "source": "BODY",
      "path": "kob",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "KOB（集团编号）",
      "exampleValue": "K123456"
    },
    {
      "name": "cvr",
      "displayName": "cvr",
      "source": "BODY",
      "path": "cvr",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "CVR（税务登记号/税号）",
      "exampleValue": "12345678"
    },
    {
      "name": "accountId",
      "displayName": "accountId",
      "source": "BODY",
      "path": "accountId",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "账户唯一标识，用于账户编辑、查看及用户关联等账户级操作",
      "exampleValue": "32100119385351"
    },
    {
      "name": "isIotOffer",
      "displayName": "isIotOffer",
      "source": "BODY",
      "path": "isIotOffer",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "是否为IoT套餐标识",
      "exampleValue": "Y"
    }
  ]
}', NULL, NULL, NULL, 'cm', '360view', NULL, NULL, '2025-12-05 09:46:33', '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '852';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('852', 'queryPayerAccountByAgrCount', 'APPFRAME', 'com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV', 'queryPayerAccountByAgrCount', '{
	"paramDefinitions": [
		{
			"name": "agreementId",
			"type": "String",
			"argName": "arg0"
		},
		{
			"name": "custType",
			"type": "int",
			"argName": "arg1"
		},
		{
			"name": "custId",
			"type": "long",
			"argName": "arg2"
		},
		{
			"name": "firstName",
			"type": "String",
			"argName": "arg3"
		},
		{
			"name": "LastName",
			"type": "String",
			"argName": "arg4"
		},
		{
			"name": "cpr",
			"type": "String",
			"argName": "arg5"
		},
		{
			"name": "birthDay",
			"type": "String",
			"argName": "arg6"
		},
		{
			"name": "addressId",
			"type": "long",
			"argName": "arg7"
		},
		{
			"name": "companyName",
			"type": "String",
			"argName": "arg8"
		},
		{
			"name": "kob",
			"type": "String",
			"argName": "arg9"
		},
		{
			"name": "cvr",
			"type": "String",
			"argName": "arg10"
		},
		{
			"name": "accountId",
			"type": "String",
			"argName": "arg11"
		},
		{
			"name": "isIotOffer",
			"type": "String",
			"argName": "arg12"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '852';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('852', 'QUERY_PAYER_ACCOUNT_BY_AGR_COUNT', '852', '852', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '853';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('853', 'queryPayerAccountByDts', 'queryPayerAccountByDts', NULL, '/api', '/cm/acct/ICrmFSV/queryPayerAccountByDts', 'POST', '根据客户类型、客户ID、姓名、CPR、生日、地址、公司名、KOB、CVR等条件查询付款账户列表，支持按账户ID精确过滤和分页查询。', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "custType",
      "displayName": "custType",
      "source": "BODY",
      "path": "custType",
      "type": "int",
      "required": false,
      "defaultValue": "",
      "description": "客户类型",
      "exampleValue": "1"
    },
    {
      "name": "custId",
      "displayName": "custId",
      "source": "BODY",
      "path": "custId",
      "type": "long",
      "required": false,
      "defaultValue": "",
      "description": "客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作",
      "exampleValue": "23210517915222"
    },
    {
      "name": "firstName",
      "displayName": "firstName",
      "source": "BODY",
      "path": "firstName",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "个人客户的名字",
      "exampleValue": "John"
    },
    {
      "name": "LastName",
      "displayName": "LastName",
      "source": "BODY",
      "path": "LastName",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "个人客户的姓氏",
      "exampleValue": "Smith"
    },
    {
      "name": "cpr",
      "displayName": "cpr",
      "source": "BODY",
      "path": "cpr",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "个人客户的身份证号码",
      "exampleValue": "1234567890"
    },
    {
      "name": "birthDay",
      "displayName": "birthDay",
      "source": "BODY",
      "path": "birthDay",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户生日",
      "exampleValue": "1980-01-15"
    },
    {
      "name": "addressId",
      "displayName": "addressId",
      "source": "BODY",
      "path": "addressId",
      "type": "long",
      "required": false,
      "defaultValue": "",
      "description": "客户地址标识",
      "exampleValue": "423212"
    },
    {
      "name": "companyName",
      "displayName": "companyName",
      "source": "BODY",
      "path": "companyName",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "集团客户的公司名称",
      "exampleValue": "ABC Corporation"
    },
    {
      "name": "kob",
      "displayName": "kob",
      "source": "BODY",
      "path": "kob",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "集团客户的KOB编号",
      "exampleValue": "K123456"
    },
    {
      "name": "cvr",
      "displayName": "cvr",
      "source": "BODY",
      "path": "cvr",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "客户的税务登记号",
      "exampleValue": "12345678"
    },
    {
      "name": "accountId",
      "displayName": "accountId",
      "source": "BODY",
      "path": "accountId",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "账户唯一标识，用于账户编辑、查看及用户关联等账户级操作",
      "exampleValue": "32100119385351"
    },
    {
      "name": "isIotOffer",
      "displayName": "isIotOffer",
      "source": "BODY",
      "path": "isIotOffer",
      "type": "String",
      "required": false,
      "defaultValue": "",
      "description": "是否为IoT套餐标识,\'Y\'=是IoT套餐，其他=否",
      "exampleValue": "Y"
    },
    {
      "name": "pageSize",
      "displayName": "pageSize",
      "source": "QUERY",
      "path": "pageSize",
      "type": "int",
      "handlerClass": "com.aie.api.tool.PageTool:getEndNum",
      "required": false,
      "defaultValue": "",
      "description": "每页条数",
      "exampleValue": "10"
    },
    {
      "name": "pageNum",
      "displayName": "pageNum",
      "source": "QUERY",
      "path": "pageNum",
      "type": "int",
      "handlerClass": "com.aie.api.tool.PageTool:getStartNum",
      "required": false,
      "defaultValue": "",
      "description": "页数",
      "exampleValue": "4"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', '360view', 'SETAcctContactInfo001', NULL, '2025-12-05 09:38:12', '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '853';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('853', 'queryPayerAccountByDts', 'APPFRAME', 'com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV', 'queryPayerAccountByDts', '{
	"paramDefinitions": [
		{
			"name": "custType",
			"type": "int",
			"argName": "arg0"
		},
		{
			"name": "custId",
			"type": "long",
			"argName": "arg1"
		},
		{
			"name": "firstName",
			"type": "String",
			"argName": "arg2"
		},
		{
			"name": "LastName",
			"type": "String",
			"argName": "arg3"
		},
		{
			"name": "cpr",
			"type": "String",
			"argName": "arg4"
		},
		{
			"name": "birthDay",
			"type": "String",
			"argName": "arg5"
		},
		{
			"name": "addressId",
			"type": "long",
			"argName": "arg6"
		},
		{
			"name": "companyName",
			"type": "String",
			"argName": "arg7"
		},
		{
			"name": "kob",
			"type": "String",
			"argName": "arg8"
		},
		{
			"name": "cvr",
			"type": "String",
			"argName": "arg9"
		},
		{
			"name": "accountId",
			"type": "String",
			"argName": "arg10"
		},
		{
			"name": "isIotOffer",
			"type": "String",
			"argName": "arg11"
		},
		{
			"name": "pageSize",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"argName": "arg12"
		},
		{
			"name": "pageNum",
			"type": "int",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"argName": "arg13"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '853';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('853', 'QUERY_PAYER_ACCOUNT_BY_DTS', '853', '853', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '854';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('854', 'queryPayerAccountByDtsCount', 'queryPayerAccountByDtsCount', NULL, '/api', '/cm/acct/ICrmFSV/queryPayerAccountByDtsCount', 'POST', '根据客户类型、客户ID、姓名、CPR、生日、地址、公司名、KOB、CVR等条件查询付款账户的数量。', NULL, NULL, NULL, '{
	"paramDefinitions": [
		{
			"name": "custType",
			"displayName": "custType",
			"source": "BODY",
			"path": "custType",
			"type": "int",
			"required": false,
			"defaultValue": "",
			"description": "客户类型",
			"exampleValue": "1"
		},
		{
			"name": "custId",
			"displayName": "custId",
			"source": "BODY",
			"path": "custId",
			"type": "long",
			"required": false,
			"defaultValue": "",
			"description": "客户唯一标识，用于客户详情查询、客户关联关系映射等核心客户操作",
			"exampleValue": "23210517915222"
		},
		{
			"name": "firstName",
			"displayName": "firstName",
			"source": "BODY",
			"path": "firstName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "名字（个人客户）",
			"exampleValue": "John"
		},
		{
			"name": "LastName",
			"displayName": "LastName",
			"source": "BODY",
			"path": "LastName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "姓氏（个人客户）",
			"exampleValue": "Smith"
		},
		{
			"name": "cpr",
			"displayName": "cpr",
			"source": "BODY",
			"path": "cpr",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "个人身份证号",
			"exampleValue": "1234567890"
		},
		{
			"name": "birthDay",
			"displayName": "birthDay",
			"source": "BODY",
			"path": "birthDay",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "生日",
			"exampleValue": "1980-01-15"
		},
		{
			"name": "addressId",
			"displayName": "addressId",
			"source": "BODY",
			"path": "addressId",
			"type": "long",
			"required": false,
			"defaultValue": "",
			"description": "地址ID",
			"exampleValue": "1231212"
		},
		{
			"name": "companyName",
			"displayName": "companyName",
			"source": "BODY",
			"path": "companyName",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "公司名称（集团客户）",
			"exampleValue": "ABC Corporation"
		},
		{
			"name": "kob",
			"displayName": "kob",
			"source": "BODY",
			"path": "kob",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": " KOB（集团编号）",
			"exampleValue": "K123456"
		},
		{
			"name": "cvr",
			"displayName": "cvr",
			"source": "BODY",
			"path": "cvr",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "CVR（税务登记号/税号）",
			"exampleValue": "4432312"
		},
		{
			"name": "accountId",
			"displayName": "accountId",
			"source": "BODY",
			"path": "accountId",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "账户ID（可选，提供时仅返回匹配的账户）",
			"exampleValue": "32100119385351"
		},
		{
			"name": "isIotOffer",
			"displayName": "isIotOffer",
			"source": "BODY",
			"path": "isIotOffer",
			"type": "String",
			"required": false,
			"defaultValue": "",
			"description": "是否为IoT套餐标识（\'Y\'=是，其他=否，影响查询的实例标识过滤）",
			"exampleValue": "Y"
		}
	]
}', '', NULL, NULL, 'cm', '360view', NULL, NULL, '2025-12-04 17:25:58', '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '854';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('854', 'queryPayerAccountByDtsCount', 'APPFRAME', 'com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV', 'queryPayerAccountByDtsCount', '{
	"paramDefinitions": [
		{
			"name": "custType",
			"type": "int",
			"argName": "arg0"
		},
		{
			"name": "custId",
			"type": "long",
			"argName": "arg1"
		},
		{
			"name": "firstName",
			"type": "String",
			"argName": "arg2"
		},
		{
			"name": "LastName",
			"type": "String",
			"argName": "arg3"
		},
		{
			"name": "cpr",
			"type": "String",
			"argName": "arg4"
		},
		{
			"name": "birthDay",
			"type": "String",
			"argName": "arg5"
		},
		{
			"name": "addressId",
			"type": "long",
			"argName": "arg6"
		},
		{
			"name": "companyName",
			"type": "String",
			"argName": "arg7"
		},
		{
			"name": "kob",
			"type": "String",
			"argName": "arg8"
		},
		{
			"name": "cvr",
			"type": "String",
			"argName": "arg9"
		},
		{
			"name": "accountId",
			"type": "String",
			"argName": "arg10"
		},
		{
			"name": "isIotOffer",
			"type": "String",
			"argName": "arg11"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '854';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('854', 'QUERY_PAYER_ACCOUNT_BY_DTS_COUNT', '854', '854', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '856';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('856', 'getSkinAndMenuStyle', 'getSkinAndMenuStyle', NULL, '/api', '/cm/service/PartyBFImpl/getSkinAndMenuStyle', 'GET', '获取皮肤和菜单样式。该方法查询当前用户的视觉配置信息，返回皮肤颜色和菜单样式，如果用户未配置则返回默认值（"0,1"）
返回信息:
包含皮肤和菜单样式的Map，key包括"retVal"（"Y"表示成功，"N"表示失败）、"retMsg"（皮肤颜色和菜单样式，格式为"皮肤颜色,菜单样式"，默认值为"0,1"，失败时包含错误信息）', NULL, NULL, NULL, '{
	"paramDefinitions": []
}', NULL, NULL, NULL, 'cm', '360view', NULL, NULL, NULL, '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '856';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('856', 'getSkinAndMenuStyle', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.PartyBFImpl', 'getSkinAndMenuStyle', '{
	"paramDefinitions": []
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '856';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('856', 'GET_SKIN_AND_MENU_STYLE', '856', '856', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '857';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('857', 'queryCustAcctRelFor360New', 'queryCustAcctRelFor360New', NULL, '/api', '/cm/service/Cust360ViewBFImpl/queryCustAcctRelFor360New', 'POST', '查询客户账户关系（360视图新版本）。该方法接收多个查询条件（关联客户ID、账户ID、账户名称、分期标志、支付方式、周期类型、客户状态、账户服务ID、服务号码、PBS、EAN等）和分页参数，调用账户服务查询客户账户关系列表。同时根据用户ID查询实例账户关系，如果账户ID匹配则将账户关系标记为"Split Account"
返回信息:
客户账户关系值数组，包含符合查询条件的账户关系列表，每个元素代表一个账户关系记录，如果账户是拆分账户则ext4字段为"Split Account"', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "relCustd",
      "path": "relCustd",
      "type": "long",
      "source": "BODY",
      "argName": "arg0",
      "required": true,
      "description": "关联客户ID，用于查询客户账户关系",
      "displayName": "relCustd",
      "exampleValue": "23210517915222"
    },
    {
      "name": "acctId",
      "path": "acctId",
      "type": "long",
      "source": "BODY",
      "argName": "arg1",
      "required": true,
      "description": "账户ID，用于过滤查询条件",
      "displayName": "acctId",
      "exampleValue": "32100119385351"
    },
    {
      "name": "acctName",
      "path": "acctName",
      "type": "java.lang.String",
      "source": "BODY",
      "argName": "arg2",
      "required": true,
      "description": "账户名称，用于过滤查询条件",
      "displayName": "acctName",
      "exampleValue": "YUFEI-TEST02"
    },
    {
      "name": "installmentFalg",
      "path": "installmentFalg",
      "type": "int",
      "source": "BODY",
      "argName": "arg3",
      "required": true,
      "description": "分期标志，用于过滤查询条件",
      "displayName": "installmentFalg",
      "exampleValue": ""
    },
    {
      "name": "paymethod",
      "path": "paymethod",
      "type": "int",
      "source": "BODY",
      "argName": "arg4",
      "required": true,
      "description": "支付方式，用于过滤查询条件",
      "displayName": "paymethod",
      "exampleValue": "3"
    },
    {
      "name": "cycleType",
      "path": "cycleType",
      "type": "int",
      "source": "BODY",
      "argName": "arg5",
      "required": true,
      "description": "周期类型，用于过滤查询条件",
      "displayName": "cycleType",
      "exampleValue": "1"
    },
    {
      "name": "custStatus",
      "path": "custStatus",
      "type": "java.lang.String",
      "source": "BODY",
      "argName": "arg6",
      "required": true,
      "description": "客户状态，用于过滤查询条件",
      "displayName": "custStatus",
      "exampleValue": "1"
    },
    {
      "name": "acctServiceId",
      "path": "acctServiceId",
      "type": "java.lang.String",
      "source": "BODY",
      "argName": "arg7",
      "required": true,
      "description": "账户服务ID，用于过滤查询条件",
      "displayName": "acctServiceId",
      "exampleValue": ""
    },
    {
      "name": "serviceNumber",
      "path": "serviceNumber",
      "type": "java.lang.String",
      "source": "BODY",
      "argName": "arg8",
      "required": true,
      "description": "服务号码，用于过滤查询条件",
      "displayName": "serviceNumber",
      "exampleValue": "54542322"
    },
    {
      "name": "pbs",
      "path": "pbs",
      "type": "java.lang.String",
      "source": "BODY",
      "argName": "arg9",
      "required": true,
      "description": "PBS标识，用于过滤查询条件",
      "displayName": "pbs",
      "exampleValue": ""
    },
    {
      "name": "ean",
      "path": "ean",
      "type": "java.lang.String",
      "source": "BODY",
      "argName": "arg10",
      "required": true,
      "description": "EAN标识，用于过滤查询条件",
      "displayName": "ean",
      "exampleValue": ""
    },
    {
      "name": "start",
      "path": "pageNum",
      "type": "int",
      "source": "QUERY",
      "argName": "arg11",
      "required": true,
      "description": "起始索引，用于分页查询",
      "displayName": "pageNum",
      "handlerClass": "com.aie.api.tool.PageTool:getStartNum",
      "exampleValue": "1"
    },
    {
      "name": "end",
      "path": "pageSize",
      "type": "int",
      "source": "QUERY",
      "argName": "arg12",
      "required": true,
      "description": "结束索引，用于分页查询",
      "displayName": "pageSize",
      "handlerClass": "com.aie.api.tool.PageTool:getEndNum",
      "exampleValue": "10"
    },
    {
      "name": "userId",
      "path": "userId",
      "type": "long",
      "source": "BODY",
      "argName": "arg13",
      "required": true,
      "description": "用户ID，用于查询实例账户关系，判断账户是否为拆分账户",
      "displayName": "userId",
      "exampleValue": "42100100000015"
    }
  ]
}', '{
	"paramDefinitions": [
		{
			"handlerClass": "com.aie.api.tool.DataContainerTool:getDcProperties"
		}
	]
}', NULL, NULL, 'cm', '360view', NULL, NULL, '2025-12-04 15:39:31', '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '857';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('857', 'queryCustAcctRelFor360New', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.Cust360ViewBFImpl', 'queryCustAcctRelFor360New', '{
	"paramDefinitions": [
		{
			"path": "relCustd",
			"argName": "arg0",
			"displayName": "relCustd",
			"name": "relCustd",
			"source": "BODY",
			"type": "long",
			"required": true
		},
		{
			"path": "acctId",
			"argName": "arg1",
			"displayName": "acctId",
			"name": "acctId",
			"source": "BODY",
			"type": "long",
			"required": true
		},
		{
			"path": "acctName",
			"argName": "arg2",
			"displayName": "acctName",
			"name": "acctName",
			"source": "BODY",
			"type": "java.lang.String",
			"required": true
		},
		{
			"path": "installmentFalg",
			"argName": "arg3",
			"displayName": "installmentFalg",
			"name": "installmentFalg",
			"source": "BODY",
			"type": "int",
			"required": true
		},
		{
			"path": "paymethod",
			"argName": "arg4",
			"displayName": "paymethod",
			"name": "paymethod",
			"source": "BODY",
			"type": "int",
			"required": true
		},
		{
			"path": "cycleType",
			"argName": "arg5",
			"displayName": "cycleType",
			"name": "cycleType",
			"source": "BODY",
			"type": "int",
			"required": true
		},
		{
			"path": "custStatus",
			"argName": "arg6",
			"displayName": "custStatus",
			"name": "custStatus",
			"source": "BODY",
			"type": "java.lang.String",
			"required": true
		},
		{
			"path": "acctServiceId",
			"argName": "arg7",
			"displayName": "acctServiceId",
			"name": "acctServiceId",
			"source": "BODY",
			"type": "java.lang.String",
			"required": true
		},
		{
			"path": "serviceNumber",
			"argName": "arg8",
			"displayName": "serviceNumber",
			"name": "serviceNumber",
			"source": "BODY",
			"type": "java.lang.String",
			"required": true
		},
		{
			"path": "pbs",
			"argName": "arg9",
			"displayName": "pbs",
			"name": "pbs",
			"source": "BODY",
			"type": "java.lang.String",
			"required": true
		},
		{
			"path": "ean",
			"argName": "arg10",
			"displayName": "ean",
			"name": "ean",
			"source": "BODY",
			"type": "java.lang.String",
			"required": true
		},
		{
			"path": "pageNum",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum",
			"argName": "arg11",
			"displayName": "pageNum",
			"name": "start",
			"source": "QUERY",
			"type": "int",
			"required": true
		},
		{
			"path": "pageSize",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum",
			"argName": "arg12",
			"displayName": "pageSize",
			"name": "end",
			"source": "QUERY",
			"type": "int",
			"required": true
		},
		{
			"path": "userId",
			"argName": "arg13",
			"displayName": "userId",
			"name": "userId",
			"source": "BODY",
			"type": "long",
			"required": true
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '857';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('857', 'QUERY_CUST_ACCT_REL_FOR_360NEW', '857', '857', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '858';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('858', '获取legal person', 'getLegalPerson', NULL, '/api', '/cm/b2b/legal-person', 'GET', '获取法人。该方法接收CPR号码，首先查询CRM系统中是否存在该CPR对应的客户，如果存在则返回客户名称（首字母大写）。如果不存在，则调用CPR接口验证CPR号码，从CPR系统获取客户名称并返回
返回信息:
法人名称字符串，如果CPR在CPR系统中不存在则返回null', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "cprNum",
      "path": "cprNum",
      "type": "String",
      "source": "QUERY",
      "required": true,
      "description": "CPR号码，用于查询法人信息",
      "displayName": "cprNum",
      "exampleValue": "0101380141"
    }
  ]
}', NULL, NULL, NULL, 'cm', 'customer', NULL, '2025-07-25 16:07:56', '2025-12-04 15:01:08', NULL, NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '858';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('858', 'getLegalPerson', 'SPRING_BEAN', 'com.asiainfo.crm.cm.bf.impl.CustomerBFImpl', 'getLegalPerson', '{
	"paramDefinitions": [
		{
			"name": "cprNum",
			"argName": "arg0",
			"type": "String"
		}
	]
}', NULL, NULL, '2025-07-25 16:09:13', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '858';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('858', 'GET_LEGAL_PERSON', '858', '858', '1', 'METHOD', 'N', '2025-07-25 16:09:33', NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '877';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('877', 'acctInfoBybillAndCust', 'acctInfoBybillAndCust', NULL, '/api', '/cm/service/query/acctInfoBybillAndCust', 'POST', '根据客户ID和账单ID查询账户详情。该方法接收客户ID、区域ID、账单ID、支付方式、保险标志、协议ID、账户名称、账户ID和分页参数，查询符合条件的账户详情列表和总数
返回信息:
包含查询结果的Map，key包括"TOTAL"（总记录数）和"ACCT_LIST"（账户详情列表，每个元素为账户属性Map）', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "custId",
      "path": "custId",
      "type": "long",
      "source": "BODY",
      "required": false,
      "description": "客户ID，用于查询该客户的账户详情",
      "displayName": "custId",
      "defaultValue": "",
      "exampleValue": "23210517915222"
    },
    {
      "name": "regionId",
      "path": "regionId",
      "type": "String",
      "source": "BODY",
      "required": false,
      "description": "区域ID，用于过滤查询结果",
      "displayName": "regionId",
      "defaultValue": "",
      "exampleValue": "2100"
    },
    {
      "name": "billId",
      "path": "billId",
      "type": "String",
      "source": "BODY",
      "required": false,
      "description": "账单ID，用于过滤查询结果",
      "displayName": "billId",
      "defaultValue": "",
      "exampleValue": "12367543"
    },
    {
      "name": "payMethod",
      "path": "payMethod",
      "type": "String",
      "source": "BODY",
      "required": false,
      "description": "支付方式，用于过滤查询结果",
      "displayName": "payMethod",
      "defaultValue": "",
      "exampleValue": "3"
    },
    {
      "name": "insFlag",
      "path": "insFlag",
      "type": "int",
      "source": "BODY",
      "required": false,
      "description": "保险标志，用于过滤查询结果",
      "displayName": "insFlag",
      "defaultValue": "",
      "exampleValue": "-1"
    },
    {
      "name": "agrId",
      "path": "agrId",
      "type": "String",
      "source": "BODY",
      "required": false,
      "description": "协议ID，用于过滤查询结果",
      "displayName": "agrId",
      "defaultValue": "",
      "exampleValue": "-1"
    },
    {
      "name": "acctName",
      "path": "acctName",
      "type": "String",
      "source": "BODY",
      "required": false,
      "description": "账户名称，用于过滤查询结果",
      "displayName": "acctName",
      "defaultValue": "",
      "exampleValue": "AutotesterAccount"
    },
    {
      "name": "acctId",
      "path": "acctId",
      "type": "long",
      "source": "BODY",
      "required": false,
      "description": "账户ID，用于过滤查询结果",
      "displayName": "acctId",
      "defaultValue": "",
      "exampleValue": "32100110014863"
    },
    {
      "name": "start",
      "path": "pageNum",
      "type": "int",
      "source": "QUERY",
      "required": true,
      "description": "分页起始位置",
      "displayName": "pageNum",
      "handlerClass": "com.aie.api.tool.PageTool:getStartNum",
      "exampleValue": "1"
    },
    {
      "name": "end",
      "path": "pageSize",
      "type": "int",
      "source": "QUERY",
      "required": true,
      "description": "分页结束位置",
      "displayName": "pageSize",
      "handlerClass": "com.aie.api.tool.PageTool:getEndNum",
      "exampleValue": "10"
    }
  ]
}', NULL, NULL, NULL, 'cm', '360view', 'SETQCmAcctPayMentNew001', NULL, '2025-12-04 14:58:49', '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '877';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('877', 'acctInfoBybillAndCust', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.AccountBFImpl', 'queryAcctDtsByCustIdAndBillId', '{
	"paramDefinitions": [
		{
			"name": "custId",
			"type": "long",
			"argName": "arg0"
		},
		{
			"name": "regionId",
			"type": "java.lang.String",
			"argName": "arg1"
		},
		{
			"name": "billId",
			"type": "java.lang.String",
			"argName": "arg2"
		},
		{
			"name": "payMethod",
			"type": "java.lang.String",
			"argName": "arg3"
		},
		{
			"name": "insFlag",
			"type": "int",
			"argName": "arg4"
		},
		{
			"name": "agrId",
			"type": "java.lang.String",
			"argName": "arg5"
		},
		{
			"name": "acctName",
			"type": "java.lang.String",
			"argName": "arg6"
		},
		{
			"name": "acctId",
			"type": "long",
			"argName": "arg7"
		},
		{
			"name": "start",
			"type": "int",
			"argName": "arg8",
			"handlerClass": "com.aie.api.tool.PageTool:getStartNum"
		},
		{
			"name": "end",
			"type": "int",
			"argName": "arg9",
			"handlerClass": "com.aie.api.tool.PageTool:getEndNum"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '877';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('877', 'ACCT_INFO_BY_BILL_AND_CUST_877', '877', '877', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_config
DELETE FROM base.`sys_api_config` WHERE sys_id = '887';
INSERT INTO base.`sys_api_config` (`sys_id`, `name`, `display`, `base_url`, `pre_path`, `api_path`, `http_method`, `description`, `timeout`, `content_type`, `version`, `input_json_schema`, `output_json_schema`, `status`, `api_type`, `module_name`, `tags`, `meta_object`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`, `mcp_enabled`) VALUES('887', 'queryCust', 'queryCust', NULL, '/api', '/cm/service/queryCust', 'POST', '查询客户。该方法接收查询类型和查询值，根据查询类型进行不同处理：类型"1"表示根据账单ID（实际为电话号码）查询，调用getCustInfoByBillId方法；类型"0"表示根据邮箱查询，调用CM2CS服务查询客户。如果查询到客户信息，则返回客户ID和客户名称，否则返回无数据消息
返回信息:
包含查询结果的Map，key包括"rsltVal"（"Y"表示成功，"N"表示失败）、"customerId"（客户ID，成功时存在）、"customerName"（客户名称，成功时存在）、"rsltMsg"（结果消息，失败时包含错误信息或无数据消息）', NULL, NULL, NULL, '{
  "paramDefinitions": [
    {
      "name": "queryType",
      "path": "queryType",
      "type": "String",
      "source": "BODY",
      "required": false,
      "description": "查询类型，\\"1\\"表示根据账单ID查询，\\"0\\"表示根据邮箱查询",
      "displayName": "queryType",
      "defaultValue": "",
      "exampleValue": "1"
    },
    {
      "name": "queryValue",
      "path": "queryValue",
      "type": "String",
      "source": "BODY",
      "required": false,
      "description": "查询值，根据查询类型不同，可以是账单ID（电话号码）或邮箱地址",
      "displayName": "queryValue",
      "defaultValue": "",
      "exampleValue": "34235456"
    }
  ]
}', NULL, NULL, NULL, 'cm', 'pushC', NULL, NULL, '2025-12-04 14:54:50', '', NULL, NULL, 'Y', NULL, 'N');

-- Table: sys_api_service_binding
DELETE FROM base.`sys_api_service_binding` WHERE sys_id = '887';
INSERT INTO base.`sys_api_service_binding` (`sys_id`, `service_name`, `service_type`, `bean_name`, `method_name`, `input_json_schema`, `output_json_schema`, `script_content`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('887', 'queryCust', 'JAVA', 'com.asiainfo.crm.cm.bf.impl.PushCCustBFImpl', 'queryCustomer', '{
	"paramDefinitions": [
		{
			"name": "queryType",
			"type": "String",
			"argName": "arg0"
		},
		{
			"name": "queryValue",
			"type": "String",
			"argName": "arg1"
		}
	]
}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

-- Table: sys_api_service_execute
DELETE FROM base.`sys_api_service_execute` WHERE sys_id = '887';
INSERT INTO base.`sys_api_service_execute` (`sys_id`, `code`, `api_config_id`, `api_service_id`, `execute_order`, `step_type`, `is_async`, `sys_created_on`, `sys_updated_on`, `sys_created_by`, `sys_updated_by`, `sys_mod_count`, `active`, `tenant`) VALUES('887', 'QUERY_CUSTOMER_887', '887', '887', '1', 'METHOD', 'N', NULL, NULL, NULL, NULL, NULL, 'Y', NULL);

