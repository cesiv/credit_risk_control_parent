package com.hanzhou.www.service.sys.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanzhou.www.dao.sys.RoleDao;
import com.hanzhou.www.model.sys.Role;
import com.hanzhou.www.service.sys.SysRoleService;

@Service("sysRoleService")
public class SysRoleServiceImpl implements SysRoleService{
	
	private static final Logger LOGGER = LoggerFactory.getLogger(SysRoleServiceImpl.class);
	
	@Autowired
	private RoleDao roleDao;

	/* 
	 * 根据用户id获取角色列表
	 * @see com.hanzhou.service.SysRoleService#getListByUserId(java.lang.String)
	 */
	@Override
	public List<Role> getListByUserId(String userId) {
		return roleDao.getListByUserId(userId);
	}

}
