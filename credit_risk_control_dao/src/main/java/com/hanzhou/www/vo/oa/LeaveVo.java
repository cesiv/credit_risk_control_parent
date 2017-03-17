package com.hanzhou.www.vo.oa;

import java.util.HashMap;
import java.util.Map;

public class LeaveVo {

    private String keys;
    private String values;
    private String types;

    public String getKeys() {
        return keys;
    }

    public void setKeys(String keys) {
        this.keys = keys;
    }

    public String getValues() {
        return values;
    }

    public void setValues(String values) {
        this.values = values;
    }

    public String getTypes() {
        return types;
    }

    public void setTypes(String types) {
        this.types = types;
    }

    public Map<String, Object> getVariableMap() {
        Map<String, Object> vars = new HashMap<String, Object>();
        return vars;
    }

}
