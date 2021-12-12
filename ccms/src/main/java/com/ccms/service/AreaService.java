package com.ccms.service;

import com.ccms.pojo.SysArea;

import java.util.List;

public interface AreaService {
    /**
     * 获取所有列表
     * @param areaType  区域等级
     */
    public List<SysArea> getAreaList(SysArea area);
}
