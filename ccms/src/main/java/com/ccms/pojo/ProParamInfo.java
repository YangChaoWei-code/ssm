package com.ccms.pojo;

public class ProParamInfo {
    private String id;

    private String name;

    private String parent_id;

    private String type;

    private String outside_code;

    private int sortNum;

    private String parent_name;

    private String areaId;

    /**
     * @return String areaId
     */
    public String getAreaId() {
        return areaId;
    }

    /**
     * @param areaId the areaId to set
     */
    public void setAreaId(String areaId) {
        this.areaId = areaId;
    }

    /**
     * @return String parent_name
     */
    public String getParent_name() {
        return parent_name;
    }

    /**
     * @param parent_name the parent_name to set
     */
    public void setParent_name(String parent_name) {
        this.parent_name = parent_name;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setParent_id(String parent_id) {
        this.parent_id = parent_id;
    }

    public String getParent_id() {
        return parent_id;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setOutside_code(String outside_code) {
        this.outside_code = outside_code;
    }

    public String getOutside_code() {
        return outside_code;
    }

    public void setSortNum(int sortNum) {
        this.sortNum = sortNum;
    }

    public int getSortNum() {
        return sortNum;
    }
}
