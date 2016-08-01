package com.didi.didims.pojo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 树形菜单
 * 
 * @author liaochente
 * 
 */
public class Tree {

    /**
     * 当前节点ID
     */
    private String id;

    /**
     * 显示名称
     */
    private String text;

    /**
     * 类型folder or item
     */
    private String type;

    /**
     * 节点拥有属性集
     */
    private Map<Object, Object> additionalParameters = new HashMap<Object, Object>();

    /**
     * 把子节点加载到属性集
     * 
     * @param list
     */
    public void addChildren(List<Tree> list) {
        additionalParameters.put("children", list);
    }

    public String getId() {
        return id;
    }

    public String getText() {
        if ("item".equals(type)) {
            text = "<i class='hid_node' v='" + id + "'></i>" + text;
        }
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Map<Object, Object> getAdditionalParameters() {
        return additionalParameters;
    }

    public void setAdditionalParameters(Map<Object, Object> additionalParameters) {
        this.additionalParameters = additionalParameters;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
