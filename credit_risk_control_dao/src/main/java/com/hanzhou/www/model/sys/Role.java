package com.hanzhou.www.model.sys;

import java.io.Serializable;
import java.util.Date;

public class Role implements Serializable{

	private static final long serialVersionUID = 1L;

	private String roleKy;//角色主键

    private String roleName;//角色名称

    private String roleDesc;//角色描述

    private Date createTime;//角色创建
    
    private String roleCode;//角色编码
    
    private String status;//角色状态
    
    private String id;

  
    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoleKy() {
		return roleKy;
	}

	public void setRoleKy(String roleKy) {
		this.roleKy = roleKy;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}