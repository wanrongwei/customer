package com.ai.appframe2.complex.cache.impl;

import java.util.HashMap;
import java.util.concurrent.TimeUnit;

//import com.ai.appframe2.complex.cache.CacheConfig;
import com.ai.appframe2.complex.cache.ICache;
import com.ai.appframe2.complex.cache.ISplitTableCache;
import com.ai.appframe2.complex.tab.split.TenantIDFactory;
import com.ai.appframe2.complex.xml.XMLHelper;
import com.ai.appframe2.complex.xml.cfg.caches.Caches;
import com.ai.appframe2.util.locale.AppframeLocaleFactory;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;

public class CacheFactory {
	
	public static final String SCHEDULER_VAR = "SCHEDULER_VAR";
	
	public static final LoadingCache<Class<? extends ICache>, Object> INSTANCE = CacheBuilder.newBuilder()
			.maximumSize(1000L)
			.expireAfterAccess(5, TimeUnit.MINUTES)
			.build(new CacheLoader<Class<? extends ICache>, Object>() {

				@Override
				public Object load(Class<? extends ICache> key) throws Exception {
					return key.getConstructor().newInstance();
				}
				
			});
	
	public static Object get(Class<? extends ICache> clazz, Object key) throws Exception {
		ICache cacheInstance = (ICache) INSTANCE.get(clazz);
		if (cacheInstance == null) {
			throw new Exception(AppframeLocaleFactory.getResource("com.ai.appframe2.complex.cache.no_cache", new String[] { clazz.getName() }));
		}
		if (cacheInstance instanceof ISplitTableCache) {
			String newKey = TenantIDFactory.getTenant() + "_" + key;
			return cacheInstance.getObject(newKey);
		} 
		return cacheInstance.getObject(key);
	}
	
	public static boolean containsKey(Class<? extends ICache> clazz, Object key) throws Exception { 
		ICache cacheInstance = (ICache) INSTANCE.get(clazz);
		if (cacheInstance == null) {
			throw new Exception(AppframeLocaleFactory.getResource("com.ai.appframe2.complex.cache.no_cache", new String[] { clazz.getName() }));
		}
		if (cacheInstance instanceof ISplitTableCache) {
			String newKey = TenantIDFactory.getTenant() + "_" + key;
			return cacheInstance.containsKey(newKey);
		} 
		return cacheInstance.containsKey(key);
	}
	
	public static HashMap getAll(Class<? extends ICache> clazz) throws Exception { 
		ICache cacheInstance = (ICache)INSTANCE.get(clazz);
		if (cacheInstance == null) {
			throw new Exception(AppframeLocaleFactory.getResource("com.ai.appframe2.complex.cache.no_cache", new String[] { clazz.getName() }));
		}
		return cacheInstance.getAll();
	}
	
	public static HashMap _getCacheInstances() {
		return new HashMap<>(INSTANCE.asMap());
	}
	static {
		try {
//			Caches caches = XMLHelper.getInstance().getCaches();
//			CacheConfig.init(caches);

//			Quartz objQuartz = caches.getQuartz();
//			Property[] property = objQuartz.getPropertys();
//			Properties properties = new Properties();
//
//			for(int i = 0; i < property.length; ++i) {
//				properties.put(property[i].getName(), property[i].getValue());
//			}
//
//			if (log.isDebugEnabled()) {
//				log.debug(AppframeLocaleFactory.getResource("com.ai.appframe2.complex.cache.prop_quartz", new String[]{properties.toString()}));
//			}
//			SchedulerFactory objSchedulerFactory = new StdSchedulerFactory(properties);
//			Scheduler objScheduler = objSchedulerFactory.getScheduler();
//
//			for(int i = 0; i < objCache.length; ++i) {
//				if (objCache[i].getPropertys() != null && objCache[i].getPropertys().length != 0 && objCache[i].getPropertys()[0].getName().equalsIgnoreCase("cronExpression")) {
//					JobDetail job = new JobDetail("CronJob" + i, "CronJobGrp" + i, CronJob.class);
//					Trigger trigger = new CronTrigger("CronTrigger" + i, "CronTriggerGrp" + i, objCache[i].getPropertys()[0].getValue());
//					job.getJobDataMap().put("SCHEDULER_VAR", INSTANCE.get(Class.forName(objCache[i].getId())));
//					objScheduler.scheduleJob(job, trigger);
//					if (log.isDebugEnabled()) {
//						log.debug(AppframeLocaleFactory.getResource("com.ai.appframe2.complex.cache.refresh_expression", new String[]{objCache[i].getId(), objCache[i].getPropertys()[0].getValue()}));
//					}
//				}
//			}

//			objScheduler.start();
		} catch (Throwable var22) {
//			log.error("Failed to load data:", var22);
			throw new RuntimeException(var22);
		}

	}
}
