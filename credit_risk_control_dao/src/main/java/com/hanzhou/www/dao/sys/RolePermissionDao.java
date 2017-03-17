package com.hanzhou.www.dao.sys;

import com.hanzhou.www.model.sys.RolePermission;

public interface RolePermissionDao {
    int insert(RolePermission record);

    int insertSelective(RolePermission record);
}