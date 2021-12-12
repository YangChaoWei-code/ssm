package com.ccms.pojo;

public class SysUser {
    private String userCode;

    private String name;

    private String psw;

    private String operatorId;

    private String operatorTime;

    private int delState;

    private String unitId;

    private String userType;

    private String unitName;
    private String operator;
    private String roleCodes;

    private String areaId;

    private String areaType;

    private String areaName;

    private String roleNames;
    private String province;
    private String city;
    private String county;

    /**
     * @return String province
     */
    public String getProvince() {
        return province;
    }

    /**
     * @param province
     *            the province to set
     */
    public void setProvince(String province) {
        this.province = province;
    }

    /**
     * @return String city
     */
    public String getCity() {
        return city;
    }

    /**
     * @param city
     *            the city to set
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * @return String county
     */
    public String getCounty() {
        return county;
    }

    /**
     * @param county
     *            the county to set
     */
    public void setCounty(String county) {
        this.county = county;
    }

    /**
     * @return String roleNames
     */
    public String getRoleNames() {
        return roleNames;
    }

    /**
     * @param roleNames
     *            the roleNames to set
     */
    public void setRoleNames(String roleNames) {
        this.roleNames = roleNames;
    }

    /**
     * @return String roleCodes
     */
    public String getRoleCodes() {
        return roleCodes;
    }

    /**
     * @param roleCodes
     *            the roleCodes to set
     */
    public void setRoleCodes(String roleCodes) {
        this.roleCodes = roleCodes;
    }

    /**
     * @return String operator
     */
    public String getOperator() {
        return operator;
    }

    /**
     * @param operator
     *            the operator to set
     */
    public void setOperator(String operator) {
        this.operator = operator;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setPsw(String psw) {
        this.psw = psw;
    }

    public String getPsw() {
        return psw;
    }

    public void setOperatorId(String operatorId) {
        this.operatorId = operatorId;
    }

    public String getOperatorId() {
        return operatorId;
    }

    public void setOperatorTime(String operatorTime) {
        this.operatorTime = operatorTime;
    }

    public String getOperatorTime() {
        return operatorTime;
    }

    public void setDelState(int delState) {
        this.delState = delState;
    }

    public int getDelState() {
        return delState;
    }

    public void setUnitId(String unitId) {
        this.unitId = unitId;
    }

    public String getUnitId() {
        return unitId;
    }

    /**
     * @return String userType
     */
    public String getUserType() {
        return userType;
    }

    /**
     * @param userType
     *            the userType to set
     */
    public void setUserType(String userType) {
        this.userType = userType;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setAreaId(String areaId) {
        this.areaId = areaId;
    }

    public String getAreaId() {
        return areaId;
    }

    public void setAreaType(String areaType) {
        this.areaType = areaType;
    }

    public String getAreaType() {
        return areaType;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getAreaName() {
        return areaName;
    }
}
