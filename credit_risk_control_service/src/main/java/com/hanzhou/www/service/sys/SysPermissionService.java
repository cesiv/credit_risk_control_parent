package com.hanzhou.www.service.sys;

import java.util.List;

import com.hanzhou.www.model.sys.Permission;

public interface SysPermissionService {
	
	public List<Permission> getListByRoleId(String roleId);
	
	public List<Permission> getMenusByLevel(Integer level);
	
	public List<Permission> getListByRefId(String refId);

}
