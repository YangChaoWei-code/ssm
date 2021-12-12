package com.ccms.pojo;

public class SysArea {
    private String areaNumber;
    private String name;
    private String type;
    private String parentId;
    private String isLeaf;
    private String sortNum;
    private String delState;
    private String parentName;

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    /**
     * @return String areaNumber
     */
    public String getAreaNumber() {
        return areaNumber;
    }

    /**
     * @param areaNumber
     *            the areaNumber to set
     */
    public void setAreaNumber(String areaNumber) {
        this.areaNumber = areaNumber;
    }

    /**
     * @return String name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     *            the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return String type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type
     *            the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * @return String parentId
     */
    public String getParentId() {
        return parentId;
    }

    /**
     * @param parentId
     *            the parentId to set
     */
    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    /**
     * @return String isLeaf
     */
    public String getIsLeaf() {
        return isLeaf;
    }

    /**
     * @param isLeaf
     *            the isLeaf to set
     */
    public void setIsLeaf(String isLeaf) {
        this.isLeaf = isLeaf;
    }

    /**
     * @return String sortNum
     */
    public String getSortNum() {
        return sortNum;
    }

    /**
     * @param sortNum
     *            the sortNum to set
     */
    public void setSortNum(String sortNum) {
        this.sortNum = sortNum;
    }

    /**
     * @return String delState
     */
    public String getDelState() {
        return delState;
    }

    /**
     * @param delState
     *            the delState to set
     */
    public void setDelState(String delState) {
        this.delState = delState;
    }

}
