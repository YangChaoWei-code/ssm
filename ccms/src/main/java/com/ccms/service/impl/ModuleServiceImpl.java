package com.ccms.service.impl;

import com.ccms.dao.ModuleDao;
import com.ccms.pojo.SysModule;
import com.ccms.service.ModuleService;
import com.ccms.tools.Tree;
import com.ccms.tools.UUIDGenerator;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("moduleService")
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class ModuleServiceImpl implements ModuleService {
    @Autowired
    ModuleDao moduleDao;

    @Override
    public List<Tree> getProtocolTree() {
        List<String> attributesList = new ArrayList<String>();
        attributesList.add("isLeaf");
        // 获取功能模块的所有父节点
        List<SysModule> parentModuleLst = moduleDao.getParentTree();
        List<Tree> parentTreesLst = new ArrayList<Tree>();
        // 将List<SysModule>类型转换成List<Tree>
        for (SysModule module : parentModuleLst) {
            Tree rootTreeData = new Tree();
            rootTreeData.setId(module.getModuleCode());
            rootTreeData.setName(module.getModuleName());
            rootTreeData.setOpen(true);
            rootTreeData.setChecked(false);
            rootTreeData.setParent(false);
            rootTreeData.setNocheck(false);
            JSONObject attributesJO = new JSONObject();
            attributesJO.put("isLeaf", module.getIsLeaf());
            rootTreeData.setAttributes(attributesJO.toString());
            parentTreesLst.add(rootTreeData);
        }
        if (parentTreesLst != null) {
            // 遍历List<Tree>类型对象parentTreesLst
            for (Tree parentData : parentTreesLst) {
                // 获取当前父节点模块编号
                String moduleCode = parentData.getId();
                // 根据当前父节点模块编号,获取其所包含的功能模块
                List<SysModule> list = moduleDao.getTreeList(moduleCode);
                List<Tree> treeList = new ArrayList<Tree>();
                // 将List<SysModule>类型转换成List<Tree>
                for (SysModule sysModule : list) {
                    Tree tempTreeData = new Tree();
                    tempTreeData.setId(sysModule.getModuleCode());
                    tempTreeData.setName(sysModule.getModuleName());
                    tempTreeData.setOpen(true);
                    tempTreeData.setChecked(false);
                    tempTreeData.setParent(false);
                    tempTreeData.setNocheck(false);
                    JSONObject attributesJO = new JSONObject();
                    attributesJO.put("isLeaf", sysModule.getIsLeaf());
                    tempTreeData.setAttributes(attributesJO.toString());
                    List childList = new ArrayList<Tree>();
                    childList = getChildTreeById(sysModule.getModuleCode());
                    tempTreeData.setChildren(childList);
                    treeList.add(tempTreeData);
                }
                parentData.setChildren(treeList);
            }
        }
        return parentTreesLst;
    }

    // 根据父节点CodeId获取子节点数据列表
    private List getChildTreeById(String codeId) {
        List<Tree> treeList = new ArrayList<Tree>();
        List<SysModule> list = moduleDao.getTreeList(codeId);
        for (SysModule sysModule : list) {
            Tree tempTreeData = new Tree();
            tempTreeData.setId(sysModule.getModuleCode());
            tempTreeData.setName(sysModule.getModuleName());
            tempTreeData.setOpen(true);
            tempTreeData.setChecked(false);
            tempTreeData.setParent(false);
            tempTreeData.setNocheck(false);
            JSONObject attributesJO = new JSONObject();
            attributesJO.put("isLeaf", sysModule.getIsLeaf());
            tempTreeData.setAttributes(attributesJO.toString());
            List childList = new ArrayList<Tree>();
            childList = getChildTreeById(sysModule.getModuleCode());
            tempTreeData.setChildren(childList);
            treeList.add(tempTreeData);
        }
        return treeList;
    }

    @Override
    public SysModule getSingleDate(String moduleCode) {
        return moduleDao.getSingleDataById(moduleCode);
    }

    @Override
    public String isExistName(String moduleName, String moduleCode) {
        String result;
        int i = moduleDao.existSameModuleName(moduleName, moduleCode);
        if (i > 0) {
            result = "exit";
        } else {
            result = "no";
        }
        return result;
    }

    @Override
    public int upModule(SysModule module) {
        return moduleDao.updateModule(module);
    }

    @Override
    public int addModule(SysModule module) {
        String moduleCode = UUIDGenerator.getUUID();
        module.setModuleCode(moduleCode);
        return moduleDao.insertModule(module);
    }

    @Override
    public int delModule(String ids) {
        return moduleDao.deleteModule(ids);
    }

    @Override
    public int delModuleRole(String ids) {
        return moduleDao.delRoleModule(ids);
    }

}
