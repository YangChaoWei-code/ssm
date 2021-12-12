package com.ccms.dao;

import com.ccms.dao.provider.UnitInfoDynaSqlProvider;
import com.ccms.pojo.ProParamInfo;
import com.ccms.pojo.ProUnitinfo;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface UnitInfoDao {
    // 获取单位信息
    @Select("select * from pro_unitinfo where delState = '1' and areaId = #{areaId} order by outside_code desc")
    public List<ProUnitinfo> getUnitList(@Param("areaId") String areaId);

    // 分页显示单位列表
    @SelectProvider(type = UnitInfoDynaSqlProvider.class, method = "selectWithParam")
    List<ProUnitinfo> selectByPage(Map<String, Object> params);

    // 根据条件查询总数
    @SelectProvider(type = UnitInfoDynaSqlProvider.class, method = "count")
    List<ProUnitinfo> count(Map<String, Object> params);

    // 获取单位类别
    @Select("select * from pro_paraminfo where type='02' and areaId = #{areaId}  order by sortNum asc")
    List<ProParamInfo> getUnitTypeList(@Param("areaId") String areaId);

    // 验证单位外部编码
    @Select("select count(*) from pro_unitinfo where outside_code = #{outside_code} and id <> #{id} and areaId = #{areaId} and delState=1")
    public int unitValidOutCode(@Param("outside_code") String outside_code, @Param("id") String id,
                                @Param("areaId") String areaId);

    // 添加
    @Insert("insert into pro_unitinfo(id,name,unitTypeId,unitGradeId,outside_code,delState,areaId) "
            + "values(#{id},#{name},#{unitTypeId},#{unitGradeId},#{outside_code},1,#{areaId})")
    public int addUnit(ProUnitinfo info);

    // 根据id修改单位
    @Update("update pro_unitinfo set name = #{name},unitTypeId=#{unitTypeId},"
            + "unitGradeId=#{unitGradeId},outside_code=#{outside_code} where id=#{id} and delstate = 1")
    public int upUnitById(ProUnitinfo info);

    // 删除单位
    @Update("update pro_unitinfo set delState ='2' where id in (${ids}) ")
    public int delUnit(@Param("ids") String ids);

    @Update("update sys_user set delState ='2' where unitId in (${ids})")
    public int delUnitUser(@Param("ids") String ids);

    // 查询单位信息
    @SelectProvider(type = UnitInfoDynaSqlProvider.class, method = "getInfo")
    List<ProUnitinfo> getInfo(Map<String, Object> params);
}
