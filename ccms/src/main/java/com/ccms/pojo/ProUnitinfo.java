package com.ccms.pojo;

public class ProUnitinfo {
    private String id;

    private String name;

    private String unitTypeId;

    private String unitGradeId;

    private String outside_code;

    private String delState;

    private String areaId;
    //类型名称,等级名称
    private String unitType;
    private String unitGrade;
    /**
     * @return String unitType
     */
    public String getUnitType() {
        return unitType;
    }

    /**
     * @param unitType the unitType to set
     */
    public void setUnitType(String unitType) {
        this.unitType = unitType;
    }

    /**
     * @return String unitGrade
     */
    public String getUnitGrade() {
        return unitGrade;
    }

    /**
     * @param unitGrade the unitGrade to set
     */
    public void setUnitGrade(String unitGrade) {
        this.unitGrade = unitGrade;
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

    public void setUnitTypeId(String unitTypeId) {
        this.unitTypeId = unitTypeId;
    }

    public String getUnitTypeId() {
        return unitTypeId;
    }

    public void setUnitGradeId(String unitGradeId) {
        this.unitGradeId = unitGradeId;
    }

    public String getUnitGradeId() {
        return unitGradeId;
    }

    public void setOutside_code(String outside_code) {
        this.outside_code = outside_code;
    }

    public String getOutside_code() {
        return outside_code;
    }

    public void setDelState(String delState) {
        this.delState = delState;
    }

    public String getDelState() {
        return delState;
    }

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

}
