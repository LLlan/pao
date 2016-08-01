package com.didi.didims.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Function implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 按钮id
     */
    private Long id;

    /**
     * 名称
     */
    private String name;

    /**
     * 唯一标志
     */
    private String code;

    /**
     * 排序
     */
    private int sort;

    /**
     * didi_menu_function_rec 主键
     */
    private Long menuFunctionId;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return this.id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCode() {
        return this.code;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public int getSort() {
        return this.sort;
    }

    /**
     * 返回MAP形式封装的参数
     */
    public Map<String, Object> toParam() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", id);
        map.put("name", name);
        map.put("code", code);
        map.put("sort", sort);
        return map;
    }

    @Override
    public String toString() {
        return "Function:[" + "id=" + id + "," + "name=" + name + "," + "code=" + code + "," + "sort=" + sort + "]";
    }

    public Long getMenuFunctionId() {
        return menuFunctionId;
    }

    public void setMenuFunctionId(Long menuFunctionId) {
        this.menuFunctionId = menuFunctionId;
    }
}