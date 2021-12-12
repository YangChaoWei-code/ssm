package com.ccms.dao;

import com.ccms.dao.provider.AreaDynaSqlProvider;
import com.ccms.pojo.SysArea;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;
import java.util.Map;

public interface AreaDao {
    @SelectProvider(type = AreaDynaSqlProvider.class, method = "selectWithParam")
    public List<SysArea> selectAreaList(Map<String, Object> params);
}
