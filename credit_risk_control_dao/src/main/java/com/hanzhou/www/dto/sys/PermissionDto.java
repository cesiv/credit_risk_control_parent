package com.hanzhou.www.dto.sys;

import java.util.List;

import com.hanzhou.www.model.sys.Permission;

public class PermissionDto extends Permission{
	
	private String _parentId;
 
	private List<PermissionDto> subPermissions;

	public List<PermissionDto> getSubPermissions() {
		return subPermissions;
	}

	public void setSubPermissions(List<PermissionDto> subPermissions) {
		this.subPermissions = subPermissions;
	}

	public String get_parentId() {
		return getRefId();
	}

	public void set_parentId(String _parentId) {
		this._parentId = _parentId;
	}
	
}