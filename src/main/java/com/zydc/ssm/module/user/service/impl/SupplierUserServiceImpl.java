package com.zydc.ssm.module.user.service.impl;

import com.zydc.ssm.module.user.mapper.SupplierUserMapper;
import com.zydc.ssm.module.user.pojo.SupplierUser;
import com.zydc.ssm.module.user.service.SupplierUserService;
import com.zydc.ssm.module.user.service.SysUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class SupplierUserServiceImpl implements SupplierUserService {
	@Resource
	private SupplierUserMapper supplierUserMapper;

	@Override
    public SupplierUser getByName(String name) {
		return supplierUserMapper.selectByPrimaryKey(name);
	}
}
