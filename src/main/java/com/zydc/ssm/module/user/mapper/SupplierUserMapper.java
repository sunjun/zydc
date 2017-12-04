package com.zydc.ssm.module.user.mapper;

public interface SupplierUserMapper {
    int deleteByPrimaryKey(String supplierUserName);

    int insert(com.zydc.ssm.module.user.pojo.SupplierUser record);

    int insertSelective(com.zydc.ssm.module.user.pojo.SupplierUser record);

    com.zydc.ssm.module.user.pojo.SupplierUser selectByPrimaryKey(String supplierUserName);

    int updateByPrimaryKeySelective(com.zydc.ssm.module.user.pojo.SupplierUser record);

    int updateByPrimaryKey(com.zydc.ssm.module.user.pojo.SupplierUser record);
}