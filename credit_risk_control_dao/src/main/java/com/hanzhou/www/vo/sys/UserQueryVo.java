package com.hanzhou.www.vo.sys;

import com.hanzhou.www.BasePage;

public class UserQueryVo extends BasePage{
	
    private String nickName;

    private String name;
    
    private Boolean locked;

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getLocked() {
		return locked;
	}

	public void setLocked(Boolean locked) {
		this.locked = locked;
	}

}
