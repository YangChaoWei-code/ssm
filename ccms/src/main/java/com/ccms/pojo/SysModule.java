package com.ccms.pojo;
/**
 * 模板
 */
import java.util.ArrayList;
import java.util.List;

public class SysModule {
    /**模板编码*/
    private String moduleCode;
    /**模板名称*/
    private String moduleName;
    /**模板路径*/
    private String modulePath;
    /**父级模板编号*/
    private String parentCode;
    /**是否为叶子节点*/
    private int isLeaf;
    /**同级排序编号*/
    private int sortNumber;


    private List<SysModule> children = new ArrayList<SysModule>();
    /**父节点name*/
    private String parentModuleName;
    /**
     * @return String parentModuleName
     */
    public String getParentModuleName() {
        return parentModuleName;
    }
    /**
     * @param parentModuleName the parentModuleName to set
     */
    public void setParentModuleName(String parentModuleName) {
        this.parentModuleName = parentModuleName;
    }
    /**
     * @return String 的 moduleCode
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
    /**
     * @return String 的 moduleName
     */
    public String getModuleName() {
        return moduleName;
    }
    /**
     * @param moduleName the moduleName to set
     */
    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }
    /**
     * @return String 的 modulePath
     */
    public String getModulePath() {
        return modulePath;
    }
    /**
     * @param modulePath the modulePath to set
     */
    public void setModulePath(String modulePath) {
        this.modulePath = modulePath;
    }
    /**
     * @return String 的 parentCode
     */
    public String getParentCode() {
        return parentCode;
    }
    /**
     * @param parentCode the parentCode to set
     */
    public void setParentCode(String parentCode) {
        this.parentCode = parentCode;
    }
    /**
     * @return int 的 isLeaf
     */
    public int getIsLeaf() {
        return isLeaf;
    }
    /**
     * @param isLeaf the isLeaf to set
     */
    public void setIsLeaf(int isLeaf) {
        this.isLeaf = isLeaf;
    }
    /**
     * @return int 的 sortNumber
     */
    public int getSortNumber() {
        return sortNumber;
    }
    /**
     * @param sortNumber the sortNumber to set
     */
    public void setSortNumber(int sortNumber) {
        this.sortNumber = sortNumber;
    }
    /**
     * @return List<Module> children
     */
    public List<SysModule> getChildren() {
        return children;
    }
    /**
     * @param children the children to set
     */
    public void setChildren(List<SysModule> children) {
        this.children = children;
    }

}
