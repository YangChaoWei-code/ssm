package com.ccms.service.impl;

import com.ccms.dao.AreaDao;
import com.ccms.pojo.SysArea;
import com.ccms.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("areaService")
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class AreaServiceImpl implements AreaService {

    @Autowired
    AreaDao areaDao;
    @Override
    public List<SysArea> getAreaList(SysArea area) {
        List list = null;
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("area", area);
        list = areaDao.selectAreaList(params);
        return list;
    }
}
