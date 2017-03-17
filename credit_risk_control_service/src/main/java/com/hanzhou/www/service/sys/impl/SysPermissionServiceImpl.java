package com.hanzhou.www.service.sys.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanzhou.www.dao.sys.PermissionDao;
import com.hanzhou.www.model.sys.Permission;
import com.hanzhou.www.service.sys.SysPermissionService;

@Service("sysPermissionService")
public class SysPermissionServiceImpl implements SysPermissionService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(SysPermissionServiceImpl.class);
	
	@Autowired
	private PermissionDao permissionDao;

	@Override
	public List<Permission> getListByRoleId(String roleId) {
		return permissionDao.getListByRoleId(roleId);
	}

	@Override
	public List<Permission> getMenusByLevel(Integer level) {
		return permissionDao.getMenusByLevel(level);
	}

	@Override
	public List<Permission> getListByRefId(String refId) {
		return permissionDao.getListByRefId(refId);
	}



}
