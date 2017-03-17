package com.hanzhou.www.dao.sys;

import com.hanzhou.www.model.sys.UserRole;

public interface UserRoleDao {
    int deleteByPrimaryKey(String id);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);
}