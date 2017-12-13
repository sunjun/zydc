package com.zydc.ssm.module.user.service;

import com.zydc.ssm.module.user.pojo.DataDictionary;
import com.zydc.ssm.module.user.pojo.DictionaryName;
import com.zydc.ssm.module.user.pojo.SupplierUser;
public interface SupplierUserService {
    SupplierUser getByName(String name);
    int insert(SupplierUser user);
    DictionaryName getAttachmentTitle(int id);
}
