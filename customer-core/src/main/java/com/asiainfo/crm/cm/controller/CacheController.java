package com.asiainfo.crm.cm.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ai.appframe2.complex.cache.CacheFactory;
import com.aie.api.vo.ResultVoBuilder;

@RestController
@RequestMapping("/cache")
public class CacheController {

    @RequestMapping(value = "refreshAll", method = RequestMethod.GET)
    @ResponseBody
    public ResultVoBuilder refreshAll(@RequestParam("cacheId") String cacheId)
            throws Exception {
        ResultVoBuilder result = new ResultVoBuilder();
        try {
            //CacheFactory.refreshALL(cacheId);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "refresh", method = RequestMethod.GET)
    @ResponseBody
    public ResultVoBuilder refresh(@RequestParam("cacheId") String cacheId)
            throws Exception {
        ResultVoBuilder result = new ResultVoBuilder();
        try {
            //CacheFactory.refresh(cacheId);
            result.success();
        } catch (Exception e) {
            result.error();
            result.message(e.getMessage());
        }
        return result;
    }

}
