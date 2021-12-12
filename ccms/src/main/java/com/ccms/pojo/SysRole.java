package com.ccms.pojo;
/**
 * 角色
 */
public class SysRole {
    /**角色编号*/
    private String roleCode;
    /**角色名称*/
    private String roleName;
    /**区域id*/
    private String areaID;
    /**
     * @return String 的 roleCode
     */
    public String getRoleCode() {
        return roleCode;
    }
    /**
     * @param roleCode the roleCode to set
     */
    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }
    /**
     * @return String 的 roleName
     */
    public String getRoleName() {
        return roleName;
    }
    /**
     * @param roleName the roleName to set
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
    /**
     * @return String areaID
     */
    public String getAreaID() {
        return areaID;
    }
    /**
     * @param areaID the areaID to set
     */
    public void setAreaID(String areaID) {
        this.areaID = areaID;
    }
}
