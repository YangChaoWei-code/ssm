package com.ccms.pojo;
/**
 * 角色模板
 */
public class SysRoleModule {
    private String rmid;
    /**角色编号*/
    private String roleCode;
    /**模板编号*/
    private String moduleCode;
    /**
     * @return String rmid
     */
    public String getRmid() {
        return rmid;
    }
    /**
     * @param rmid the rmid to set
     */
    public void setRmid(String rmid) {
        this.rmid = rmid;
    }
    /**
     * @return String roleCode
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
     * @return String moduleCode
     */
    public String getModuleCode() {
        return moduleCode;
    }
    /**
     * @param moduleCode the moduleCode to set
     */
    public void setModuleCode(String moduleCode) {
        this.moduleCode = moduleCode;
    }

}
