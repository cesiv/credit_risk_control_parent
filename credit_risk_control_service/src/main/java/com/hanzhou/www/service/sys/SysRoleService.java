package com.hanzhou.www.service.sys;

import java.util.List;

import com.hanzhou.www.model.sys.Role;

public interface SysRoleService {
	
	public List<Role> getListByUserId(String userId);

}
