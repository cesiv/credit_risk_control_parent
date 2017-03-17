package com.hanzhou.www.dto.sys;

import com.hanzhou.www.model.sys.User;

public class UserDto extends User {
	
	private String roleId;

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}	
}
