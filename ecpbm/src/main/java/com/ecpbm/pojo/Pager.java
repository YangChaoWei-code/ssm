package com.ecpbm.pojo;

public class Pager {
    private int curPage; // 待显示页
    private int perPageRows; // 每页显示的记录数
    private int rowCount; // 记录总数
    private int pageCount; // 总页数


    public int getCurPage() {
        return curPage;
    }

    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }

    public int getPerPageRows() {
        return perPageRows;
    }

    public void setPerPageRows(int perPageRows) {
        this.perPageRows = perPageRows;
    }

    public int getRowCount() {
        return rowCount;
    }

    public void setRowCount(int rowCount) {
        this.rowCount = rowCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    // 根据rowCount和perPageRows计算总页数
    public int getPageCount() {
        return (rowCount + perPageRows - 1) / perPageRows;
    }

    // 分页显示时，获取当前页的第一条记录的索引
    public int getFirstLimitParam() {
        return (this.curPage - 1) * this.perPageRows;
    }
}
