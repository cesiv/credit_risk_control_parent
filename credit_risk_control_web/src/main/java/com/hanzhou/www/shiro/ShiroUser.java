package com.hanzhou.www.shiro;

import java.io.Serializable;

import com.google.common.base.Objects;

public class ShiroUser implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;

    private String depId;

    private String nickName;

    private String name;
    
    private Boolean sex;

    private String email;

    private String phone;

    private String mobile;

    private String address;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDepId() {
		return depId;
	}

	public void setDepId(String depId) {
		this.depId = depId;
	}

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

	public Boolean getSex() {
		return sex;
	}

	public void setSex(Boolean sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public ShiroUser(String id, String depId, String nickName, String name, Boolean sex, String email, String phone,
			String mobile, String address) {
		super();
		this.id = id;
		this.depId = depId;
		this.nickName = nickName;
		this.name = name;
		this.sex = sex;
		this.email = email;
		this.phone = phone;
		this.mobile = mobile;
		this.address = address;
	}	
    
	@Override
	public String toString() {
		return nickName;
	}
	
	@Override
	public int hashCode() {
		return Objects.hashCode(nickName);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ShiroUser user = (ShiroUser) obj;
		if (nickName == null) {
			if (user.nickName != null)
				return false;
		} else if (!nickName.equals(user.nickName))
			return false;
		return true;
	}		
}
