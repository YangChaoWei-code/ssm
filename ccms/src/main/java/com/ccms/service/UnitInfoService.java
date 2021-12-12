package com.ccms.service;

import com.ccms.pojo.Pager;
import com.ccms.pojo.ProParamInfo;
import com.ccms.pojo.ProUnitinfo;

import java.util.List;
import java.util.Map;

public interface UnitInfoService {
    // 获取单位信息
    public List<ProUnitinfo> getUnitList(String areaId);

    // 分页显示单位列表
    public List<ProUnitinfo> queryUnitInfoList_Table(Map<String, Object> params, Pager pager);

    // 获取满足条件的单位总数
    Integer count(Map<String, Object> params);

    // 根据区域编号AreaId获取单位类别
    public List<ProParamInfo> getUnitTypeList(String areaId);

    // 查询是否存在外部编码
    public String isExistOutCode(ProUnitinfo info);

    // 添加
    public int addUnit(ProUnitinfo info);

    // 根据id修改unit
    public int upUnit(ProUnitinfo info);

    // 删除
    public int delUnit(String ids);

    // 查询所有两定单位信息
    public List<ProUnitinfo> queryUnitInfoList(String nameOrCode, String unitTypeId, String unitGradeId, String areaId);

}
