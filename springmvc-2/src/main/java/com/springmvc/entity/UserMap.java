package com.springmvc.entity;

import java.util.Map;

public class UserMap {
    private Map<String, User> uMap;

    public Map<String, User> getuMap() {
        return uMap;
    }

    public void setuMap(Map<String, User> uMap) {
        this.uMap = uMap;
    }
}
