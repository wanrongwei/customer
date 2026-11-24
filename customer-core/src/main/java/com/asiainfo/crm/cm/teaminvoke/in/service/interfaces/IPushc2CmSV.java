package com.asiainfo.crm.cm.teaminvoke.in.service.interfaces;

import com.ai.oneframe.msg.ivalues.IBORemindValue;
import com.asiainfo.push.inter.service.ivalues.CustomerInteractionInfo;
import com.asiainfo.push.inter.service.ivalues.Event;
import com.asiainfo.push.inter.service.ivalues.StructParamEvent;
import com.asiainfo.push.inter.service.ivalues.TaskStrategy;

import java.rmi.RemoteException;
import java.util.Map;

public interface IPushc2CmSV {
    public long triggerEvent(Event event) throws Exception ;


    public long triggerStructParamEvent(StructParamEvent event) throws Exception;

    public long pushSms(String notificationCode, String port, String targetAddress, Map<String, String> paramMap, String templateCode, long customerId, long opId, TaskStrategy strategy, CustomerInteractionInfo ciInfo) throws Exception, RemoteException;

    public void batchCreateSrRemind(IBORemindValue[] remindValues) throws Exception, RemoteException;

    public String getEventSwitch(String eventCode) throws Exception;
}
