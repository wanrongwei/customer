package com.ai.appframe2.complex.cache.impl;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.bo.DataContainerFactory;
import com.ai.appframe2.complex.cache.CacheFactory;
import com.ai.common.util.StaticDataUtil;
import com.ailk.common.cache.MultilingualJavaI18nResourceCacheImpl;
import com.asiainfo.crm.cm.common.cache.CmIndustryCacheImpl;
//import com.ai.appframe2.complex.cache.adapter.LocalDateTimeTypeAdapter;
//import com.ai.appframe2.complex.cache.util.GsonTypeUtils;
//import com.ai.appframe2.complex.cache.util.RedisUtils;
import com.ai.common.bo.BOBsParaDetailBean;
import com.ai.common.cache.BsParaDetailCacheImpl;
import com.ai.common.ivalues.IBOBsParaDetailValue;
import com.ai.common.util.TimeUtil;
import com.aie.test.BaseTest;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

class CacheFactoryTest extends BaseTest {
//
//    @Test
//    void get() throws Exception{
//        StaticDataUtil.getStaticData("CACHE_READY_CODE");
//        RedisUtils.set("CACHE_READY_CODE^"+ MultilingualJavaI18nResourceCacheImpl.class.getName(),"0");
////        String paraCode="001";
////        String paraType="CS_CT_SMS_PORT";
////        String   cacheKey = "X_" + paraCode + "_" + paraType;;
////        Object obj =  com.ai.appframe2.complex.cache.CacheFactory.get(BsParaDetailCacheImpl.class, cacheKey);
////
////        IBOBsParaDetailValue value = (IBOBsParaDetailValue) com.ai.appframe2.complex.cache.CacheFactory.get(BsParaDetailCacheImpl.class, cacheKey);
////        Assertions.assertNotNull(value);
//
//    }
//
//    @Autowired
//    private StringRedisTemplate redisTemplate;
//    @Test
//    void contextLoads() {
//        System.out.println(RedisUtils.get("key--test--1"));
////        Object stringRedisTemplate=SpringContextUtil.getBean( "org.springframework.data.redis.core.StringRedisTemplate");
//        if (redisTemplate!= null) {
//            System.out.println(redisTemplate.opsForValue().get("key--test--1"));
//            System.out.println(redisTemplate.opsForValue().get("key--test--2"));;
//
//            String value2 = redisTemplate.opsForValue().get("key--test--2");
//        }
//    }
//    @Test
//    public void testTranseData() throws Exception{
//
//        Object object = CacheFactory.get(CmIndustryCacheImpl.class, 1);
//        String paraCode="001";
//        String paraType="CS_CT_SMS_PORT";
//        String   cacheKey = "X_" + paraCode + "_" + paraType;;
//
//        Object obj=RedisUtils.hGet("CACHE_VALUE_CODE^"+BsParaDetailCacheImpl.class.getName(),cacheKey);
//        System.out.println(obj);
//        Object values = GsonTypeUtils.deserializeWithType(obj.toString());
//        Gson gson = new GsonBuilder().setDateFormat(TimeUtil.YYYY_MM_DD_HH_MM_SS).
//                registerTypeAdapter(LocalDateTime.class, new LocalDateTimeTypeAdapter()).create();
//        BOBsParaDetailBean bean = (BOBsParaDetailBean) DataContainerFactory.createDataContainerInstance(BOBsParaDetailBean.class, null);
//        DataContainer objects=gson.fromJson(obj.toString(), DataContainer.class);
//        DataContainerFactory.transfer(objects, bean);
//         Assertions.assertNotNull(objects);
//    }
//    @Test
//    public void testGsonTypeUtils() throws Exception{
//        List<IBOBsParaDetailValue> list = new ArrayList<>();
//        IBOBsParaDetailValue bean = new BOBsParaDetailBean();
//        bean.setParaCode("1");
//        bean.setPara1("2");
//        bean.setParaType("X");
//        bean.setParaName("test");
//        list.add(bean);
//
//        String json1 = GsonTypeUtils.serializeWithType(list);
//        List<IBOBsParaDetailValue> restoredList = GsonTypeUtils.deserializeWithType(json1);
//
//        // 示例2: Map<String, BOBsParaDetailBean>
//        Map<String, IBOBsParaDetailValue> map = new HashMap<>();
//        map.put("111",bean);
//        String json2 = GsonTypeUtils.serializeWithType(map);
//        Map<String, IBOBsParaDetailValue> restoredMap = GsonTypeUtils.deserializeWithType(json2);
//
//        // 示例3: Map<String, List<BOBsParaDetailBean>>
//        Map<String, List<IBOBsParaDetailValue>> complexMap = new HashMap<>();
//        complexMap.put("222",list);
//        String json3 = GsonTypeUtils.serializeWithType(complexMap);
//        Map<String, List<BOBsParaDetailBean>> restoredComplexMap = GsonTypeUtils.deserializeWithType(json3);
//        System.out.println(1);
//
//    }
}