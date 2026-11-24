package com.asiainfo.crm.cm.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ai.appframe2.service.ServiceFactory;
import com.aie.api.vo.ResultVoBuilder;
import com.asiainfo.crm.so.teaminvoke.in.service.interfaces.ISec2CrmSV;

@RestController
@RequestMapping("/sec")
public class SecEntityController {

    @RequestMapping(value = "/check/entity/permission", method = RequestMethod.GET)
    @ResponseBody
    public ResultVoBuilder<Boolean> checkEntityPermission(@RequestParam("opId") Long opId,
            @RequestParam("entId") Long entId,
            @RequestParam("privId") Long privId) throws Exception {
        ResultVoBuilder<Boolean> result = new ResultVoBuilder<Boolean>();
        try {
            ISec2CrmSV service = (ISec2CrmSV) ServiceFactory.getService(ISec2CrmSV.class);
            boolean flag = service.checkEntityPermission(opId, entId, privId);
            result.data(flag);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result;
    }
}
