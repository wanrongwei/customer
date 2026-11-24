package com.asiainfo.crm.cm.common.util;

import com.ai.appframe2.complex.xml.XMLHelper;
import com.ai.appframe2.complex.xml.cfg.caches.Cache;
import com.ai.appframe2.complex.xml.cfg.caches.Caches;
import com.aie.test.BaseTest;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;

public class RedisServiceTest extends BaseTest {

//
//    @Test
//    public void testSetAndGet() {
//        // 创建一个 Jedis 客户端实例并连接到远程 Redis 服务器
//        Jedis jedis = new Jedis("10.1.248.210", 48300);
//        jedis.auth("Telenor@Crm");
//        // 在这里你可以执行 Redis 命令
//        String pong = jedis.ping();
//        System.out.println("PONG: " + pong);
//        //Jedis写入数据
//        jedis.set("name-111111", "zhangsan");
//        Assertions.assertNotNull(jedis.get("name-111111"));
//        //Jedis删除数据
//        jedis.del("name-111111");
//        Assertions.assertNull(jedis.get("name-111111"));
//        // 关闭 Jedis 客户端
//        jedis.close();
//    }


    @Test
    public void testGuavaUtils() throws Exception{
        Map<String, String> map = new HashMap<>();
        Caches caches = XMLHelper.getInstance().getCaches();
        Cache[] objCache = caches.getCaches();
        //从objCache中选出key=Cache.getId中对应的Cache.getAccelerate值
        for (Cache cache : objCache) {
            map.put(cache.getId(),cache.getAccelerate());
        }
//        GuavaUtils.CacheAccelerate.putAll(map);
//       String vale= GuavaUtils.CacheAccelerate.get("com.ai.oneframe.workbench.cache.DeskThemeColCacheImpl");
//       System.out.println(vale);
//        String vale2= GuavaUtils.CacheAccelerate.get("com.ai.oneframe.workbench.cache.DeskThemeColCacheImpl11");
//        System.out.println(vale2);
//        String vale3= GuavaUtils.CacheAccelerate.get("com.ai.oneframe.workbench.cache.DeskThemeColCacheImpl11");

    }


}
