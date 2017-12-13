package com.zydc.ssm.module.user.pojo;

public class DictionaryName {
    private Integer dictionaryNameId;

    private String dictionaryName;

    public Integer getDictionaryNameId() {
        return dictionaryNameId;
    }

    public void setDictionaryNameId(Integer dictionaryNameId) {
        this.dictionaryNameId = dictionaryNameId;
    }

    public String getDictionaryName() {
        return dictionaryName;
    }

    public void setDictionaryName(String dictionaryName) {
        this.dictionaryName = dictionaryName == null ? null : dictionaryName.trim();
    }
}