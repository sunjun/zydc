package com.zydc.ssm.module.user.mapper;

import com.zydc.ssm.module.user.pojo.Session;

public interface SessionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Session record);

    int insertSelective(Session record);

    Session selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Session record);

    int updateByPrimaryKey(Session record);
}