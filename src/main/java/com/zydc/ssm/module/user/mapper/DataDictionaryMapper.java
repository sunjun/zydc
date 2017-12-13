package com.zydc.ssm.module.user.mapper;

import com.zydc.ssm.module.user.pojo.DataDictionary;
import com.zydc.ssm.module.user.pojo.DataDictionaryKey;

public interface DataDictionaryMapper {
    int deleteByPrimaryKey(DataDictionaryKey key);

    int insert(DataDictionary record);

    int insertSelective(DataDictionary record);

    DataDictionary selectByPrimaryKey(DataDictionaryKey key);

    int updateByPrimaryKeySelective(DataDictionary record);

    int updateByPrimaryKey(DataDictionary record);
}