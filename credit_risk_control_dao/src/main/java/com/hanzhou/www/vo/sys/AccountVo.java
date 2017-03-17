package com.hanzhou.www.vo.sys;

import com.hanzhou.www.model.sys.User;

public class AccountVo extends User {
	
	private String oldPassword;

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	
	

}
