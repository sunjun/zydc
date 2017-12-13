package com.zydc.ssm.module.user.pojo;

public class DataDictionaryKey {
    private String dictionaryContent;

    private Integer dictionaryNameId;

    public String getDictionaryContent() {
        return dictionaryContent;
    }

    public void setDictionaryContent(String dictionaryContent) {
        this.dictionaryContent = dictionaryContent == null ? null : dictionaryContent.trim();
    }

    public Integer getDictionaryNameId() {
        return dictionaryNameId;
    }

    public void setDictionaryNameId(Integer dictionaryNameId) {
        this.dictionaryNameId = dictionaryNameId;
    }
}