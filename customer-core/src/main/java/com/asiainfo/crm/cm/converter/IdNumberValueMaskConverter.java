package com.asiainfo.crm.cm.converter;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.ai.appframe2.common.DataType;
import com.aie.api.transfer.converter.ValueMaskConverter;
import com.aie.api.transfer.process.MaskTransferContext;
import com.asiainfo.crm.cm.common.CmConstants;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class IdNumberValueMaskConverter implements ValueMaskConverter {

	@Override
	public String converter(MaskTransferContext context, Object source) {
		if (context == null || context.getMaskPojo() == null) {
			return null;
		}
		if (context.getMaskPojo() instanceof Map<?, ?> dc) {
			try{
				Object certType = dc.get("CERT_TYPE");
				if((null != certType) && (source != null) && ((source instanceof String))){
					int custCertType = DataType.getAsInt(certType);
					String custCertCode = DataType.getAsString(source);
					if(custCertType == CmConstants.CertificateType.CPR){
						int valueLength = custCertCode.length();
						if(valueLength > 6){
							return StringUtils.rightPad(custCertCode.substring(0, 6), valueLength, '*');
						}else{
							return custCertCode;
						}
					} else {
						return custCertCode.startsWith("K") ? "" : custCertCode;
					}
				}
			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}
		}
		return null;
	}

}
