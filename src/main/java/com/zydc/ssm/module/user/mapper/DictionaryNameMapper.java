package com.zydc.ssm.module.user.mapper;

import com.zydc.ssm.module.user.pojo.DictionaryName;

public interface DictionaryNameMapper {
    int deleteByPrimaryKey(Integer dictionaryNameId);

    int insert(DictionaryName record);

    int insertSelective(DictionaryName record);

    DictionaryName selectByPrimaryKey(Integer dictionaryNameId);

    int updateByPrimaryKeySelective(DictionaryName record);

    int updateByPrimaryKey(DictionaryName record);
}