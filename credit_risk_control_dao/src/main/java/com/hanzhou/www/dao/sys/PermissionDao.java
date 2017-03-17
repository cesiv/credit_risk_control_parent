package com.hanzhou.www.dao.sys;

import java.util.List;

import com.hanzhou.www.model.sys.Permission;

public interface PermissionDao {
    int deleteByPrimaryKey(String id);

    int insert(Permission record);

    int insertSelective(Permission record);

    Permission selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Permission record);

    int updateByPrimaryKey(Permission record);
    
    List<Permission> getListByRoleId(String roleId);
    
    /**
     * 获取菜单栏
     * @return
     */
    List<Permission> getMenusByLevel(Integer level);
    
    /**
     * 获取非一级菜单
     * @return
     */
    List<Permission> getListByRefId(String refId);    
}