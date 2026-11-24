package com.asiainfo.crm.cm.vo;
import com.fasterxml.jackson.annotation.JsonAlias;

import lombok.Data;

@Data
public class ModifyB2BCustomerVO {
     @JsonAlias("NEW_DATA")
     private CmB2BCustomerVO newData;// 新数据
     @JsonAlias("OLD_DATA")
     private CmB2BCustomerVO oldData;// 老数据
}
