package com.zydc.ssm.module.user.service.impl;

import com.zydc.ssm.module.user.mapper.DictionaryNameMapper;
import com.zydc.ssm.module.user.mapper.SupplierUserMapper;
import com.zydc.ssm.module.user.pojo.DictionaryName;
import com.zydc.ssm.module.user.pojo.SupplierUser;
import com.zydc.ssm.module.user.service.SupplierUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class SupplierUserServiceImpl implements SupplierUserService {
	@Resource
	private SupplierUserMapper supplierUserMapper;
    private DictionaryNameMapper dictionaryNameMapper;

	@Override
    public SupplierUser getByName(String name) {
		return supplierUserMapper.selectByPrimaryKey(name);
	}


	@Override
	public int insert(SupplierUser user) {
		return supplierUserMapper.insert(user);
	}

	@Override
	public DictionaryName getAttachmentTitle(int id) {
	    return  dictionaryNameMapper.selectByPrimaryKey(id);
	}
}
