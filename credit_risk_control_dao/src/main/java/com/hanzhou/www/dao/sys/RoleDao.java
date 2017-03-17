package com.hanzhou.www.dao.sys;

import java.sql.SQLException;
import java.util.List;

import com.hanzhou.www.model.sys.Role;

public interface RoleDao {
    int deleteByPrimaryKey(String id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    List<Role> getListByUserId(String userId);

	List<Role> queryRole(Role role) throws SQLException;

	void addRole(Role role);

}