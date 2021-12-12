package com.ccms.service.impl;

import com.ccms.dao.UnitInfoDao;
import com.ccms.pojo.Pager;
import com.ccms.pojo.ProParamInfo;
import com.ccms.pojo.ProUnitinfo;
import com.ccms.service.UnitInfoService;
import com.ccms.tools.UUIDGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("unitInfoService")
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class UnitInfoServiceImpl implements UnitInfoService {
    @Autowired
    UnitInfoDao unitInfoDao;

    @Override
    public List<ProUnitinfo> getUnitList(String areaId) {
        return unitInfoDao.getUnitList(areaId);
    }

    @Override
    public List<ProUnitinfo> queryUnitInfoList_Table(Map<String, Object> params, Pager pager) {
        int recordCount = unitInfoDao.count(params).size();
        pager.setRowCount(recordCount);
        if (recordCount > 0) {
            params.put("pager", pager);
        }
        return unitInfoDao.selectByPage(params);
    }

    @Override
    public Integer count(Map<String, Object> params) {
        return unitInfoDao.count(params).size();
    }

    @Override
    public List<ProParamInfo> getUnitTypeList(String areaId) {
        return unitInfoDao.getUnitTypeList(areaId);
    }

    @Override
    public String isExistOutCode(ProUnitinfo info) {
        String result;
        if (info.getId() == null) {
            info.setId("");
        }
        String outside_code = info.getOutside_code();
        String id = info.getId();
        String areaId = info.getAreaId();
        int existOutCode = unitInfoDao.unitValidOutCode(outside_code, id, areaId);
        if (existOutCode > 0) {
            result = "exitOutCode";
        } else {
            result = "no";
        }
        return result;
    }

    @Override
    public int addUnit(ProUnitinfo info) {
        String uid = UUIDGenerator.getUUID();
        info.setId(uid);
        return unitInfoDao.addUnit(info);
    }

    @Override
    public int upUnit(ProUnitinfo info) {
        return unitInfoDao.upUnitById(info);
    }

    @Override
    public int delUnit(String ids) {
        try {
            unitInfoDao.delUnit(ids);
            unitInfoDao.delUnitUser(ids);
            return 1;
        } catch (Exception e) {
            return 0;
        }
    }

    @Override
    public List<ProUnitinfo> queryUnitInfoList(String nameOrCode, String unitTypeId, String unitGradeId, String areaId) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("nameOrCode", nameOrCode);
        params.put("unitTypeId", unitTypeId);
        params.put("unitGradeId", unitGradeId);
        params.put("areaId", areaId);
        List<ProUnitinfo> list =unitInfoDao.getInfo(params);
        return list;
    }
}
