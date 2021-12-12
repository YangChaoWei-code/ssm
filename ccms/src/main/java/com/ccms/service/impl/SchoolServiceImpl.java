package com.ccms.service.impl;

import com.ccms.dao.SchoolDao;
import com.ccms.pojo.SysArea;
import com.ccms.service.SchoolService;
import com.ccms.tools.Tree;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


@Service("schoolService")
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class SchoolServiceImpl implements SchoolService {

    @Autowired
    SchoolDao schoolDao;

    @Override
    public List<Tree> getSchoolTree() {
        List<String> attributesList = new ArrayList<String>();
        attributesList.add("isLeaf");
        Tree rootTree = new Tree();
        rootTree.setId(null);
        rootTree.setName("院校配置");
        rootTree.setOpen(true);
        rootTree.setAttributes("{\"isLeaf\":\"0\"}");
        // 获取院校/区域的所有父节点
        List<SysArea> parentAreaLst = schoolDao.getParentArea();
        List<Tree> parentTreesLst = new ArrayList<Tree>();
        // 将List<SysArea>类型转换成List<Tree>
        for (SysArea area : parentAreaLst) {
            Tree rootTreeData = new Tree();
            rootTreeData.setId(area.getAreaNumber());
            rootTreeData.setName(area.getName());
            rootTreeData.setOpen(true);
            rootTreeData.setChecked(false);
            rootTreeData.setParent(false);
            rootTreeData.setNocheck(false);
            JSONObject attributesJO = new JSONObject();
            attributesJO.put("isLeaf", area.getIsLeaf());
            rootTreeData.setAttributes(attributesJO.toString());
            parentTreesLst.add(rootTreeData);
        }
        if (parentTreesLst != null) {
            // 遍历List<Tree>类型对象parentTreesLst
            for (Tree parentData : parentTreesLst) {
                // 获取当前父节点区域编号
                String areaNumber = parentData.getId();
                // 根据当前父节点区域编号,获取其所包含的区域信息
                List<SysArea> list = schoolDao.getChildArea(areaNumber);
                List<Tree> treeList = new ArrayList<Tree>();
                // 将List<SysArea>类型转换成List<Tree>
                for (SysArea sysArea : list) {
                    Tree tempTreeData = new Tree();
                    tempTreeData.setId(sysArea.getAreaNumber());
                    tempTreeData.setName(sysArea.getName());
                    tempTreeData.setOpen(true);
                    tempTreeData.setChecked(false);
                    tempTreeData.setParent(false);
                    tempTreeData.setNocheck(false);
                    JSONObject attributesJO = new JSONObject();
                    attributesJO.put("isLeaf", sysArea.getIsLeaf());
                    tempTreeData.setAttributes(attributesJO.toString());
                    List childList = new ArrayList<Tree>();
                    childList = getChildTreeById(sysArea.getAreaNumber());
                    tempTreeData.setChildren(childList);
                    treeList.add(tempTreeData);
                }
                parentData.setChildren(treeList);
            }
        }
        rootTree.setChildren(parentTreesLst);
        List<Tree> resultTree = new ArrayList<Tree>();
        resultTree.add(rootTree);
        return resultTree;
    }

    // 根据父节点CodeId获取子节点数据列表
    private List getChildTreeById(String areaNumber) {
        List<Tree> treeList = new ArrayList<Tree>();
        List<SysArea> list = schoolDao.getChildArea(areaNumber);
        for (SysArea sysArea : list) {
            Tree tempTreeData = new Tree();
            tempTreeData.setId(sysArea.getAreaNumber());
            tempTreeData.setName(sysArea.getName());
            tempTreeData.setOpen(true);
            tempTreeData.setChecked(false);
            tempTreeData.setParent(false);
            tempTreeData.setNocheck(false);
            JSONObject attributesJO = new JSONObject();
            attributesJO.put("isLeaf", sysArea.getIsLeaf());
            tempTreeData.setAttributes(attributesJO.toString());
            List childList = new ArrayList<Tree>();
            childList = getChildTreeById(sysArea.getAreaNumber());
            tempTreeData.setChildren(childList);
            treeList.add(tempTreeData);
        }
        return treeList;
    }

    @Override
    public SysArea getSingleDate(String areaNumber) {
        return schoolDao.getSingleData(areaNumber);
    }

    @Override
    public int upSchool(SysArea area) {
        return schoolDao.updateSchool(area);
    }

    @Override
    public int addSchool(SysArea area) {
        return schoolDao.insertSchool(area);
    }

    @Override
    public int delSchool(String ids) {
        return schoolDao.deleteSchool(ids);
    }
}
