package com.ccms.service;

import com.ccms.pojo.SysArea;
import com.ccms.tools.Tree;

import java.util.List;

public interface SchoolService {
    // 获取院校树
    public List<Tree> getSchoolTree();

    // 根据id获取院校
    public SysArea getSingleDate(String areaNumber);

    // 修改
    public int upSchool(SysArea area);

    // 添加
    public int addSchool(SysArea area);

    // 删除
    public int delSchool(String ids);
}
