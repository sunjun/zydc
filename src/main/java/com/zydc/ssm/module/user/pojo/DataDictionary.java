package com.zydc.ssm.module.user.pojo;

public class DataDictionary extends DataDictionaryKey {
    private String dictionaryRemark;

    private Integer contentOrder;

    public String getDictionaryRemark() {
        return dictionaryRemark;
    }

    public void setDictionaryRemark(String dictionaryRemark) {
        this.dictionaryRemark = dictionaryRemark == null ? null : dictionaryRemark.trim();
    }

    public Integer getContentOrder() {
        return contentOrder;
    }

    public void setContentOrder(Integer contentOrder) {
        this.contentOrder = contentOrder;
    }
}