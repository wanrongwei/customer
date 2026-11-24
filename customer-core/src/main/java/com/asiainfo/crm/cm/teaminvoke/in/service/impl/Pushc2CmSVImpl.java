package com.asiainfo.crm.cm.teaminvoke.in.service.impl;

import com.ai.appframe2.service.ServiceFactory;
import com.ai.oneframe.msg.ivalues.IBORemindValue;
import com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.IPushc2CmSV;
import com.asiainfo.push.inter.service.interfaces.IPushFSV;
import com.asiainfo.push.inter.service.ivalues.CustomerInteractionInfo;
import com.asiainfo.push.inter.service.ivalues.Event;
import com.asiainfo.push.inter.service.ivalues.StructParamEvent;
import com.asiainfo.push.inter.service.ivalues.TaskStrategy;

import java.rmi.RemoteException;
import java.util.Map;

public class Pushc2CmSVImpl implements IPushc2CmSV {
    private IPushFSV getPushService() {
        return (IPushFSV) ServiceFactory.getService(IPushFSV.class);
    }
    public long triggerEvent(Event event) throws Exception {
        return getPushService().triggerEvent(event);
    }

    public long triggerStructParamEvent(StructParamEvent event) throws Exception {
        return getPushService().triggerStructParamEvent(event);
    }

    public long pushSms(String notificationCode, String port, String targetAddress, Map<String, String> paramMap, String templateCode, long customerId, long opId, TaskStrategy strategy, CustomerInteractionInfo ciInfo) throws Exception, RemoteException {
        return getPushService().pushSms(notificationCode, port, targetAddress, paramMap, templateCode, customerId, opId, strategy, ciInfo);
    }

    public void batchCreateSrRemind(IBORemindValue[] remindValues) throws Exception, RemoteException {
        getPushService().batchCreateSrRemind(remindValues);
    }
    public String getEventSwitch(String eventCode) throws Exception {
        return getPushService().getEventSwitch(eventCode);
    }

}
