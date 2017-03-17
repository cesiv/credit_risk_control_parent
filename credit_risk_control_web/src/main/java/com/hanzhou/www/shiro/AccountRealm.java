package com.hanzhou.www.shiro;

import com.hanzhou.www.model.sys.Permission;
import com.hanzhou.www.model.sys.Role;
import com.hanzhou.www.model.sys.User;
import com.hanzhou.www.service.sys.SysPermissionService;
import com.hanzhou.www.service.sys.SysRoleService;
import com.hanzhou.www.service.sys.SysUserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;



public class AccountRealm extends AuthorizingRealm {
	
	@Autowired
	protected SysUserService sysUserService;
	@Autowired
	protected SysRoleService sysRoleService;
	@Autowired
	protected SysPermissionService sysPermissionService;	
	
	/**
	 * 认证回调函数,登录时调用
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		User user = null;
		//获取用户信息实体
		user = sysUserService.getByUserName(token.getUsername());
     	if (user == null){
     		throw new UnknownAccountException();
     	} 
        if(Boolean.TRUE.equals(user.getLocked())) {
            throw new LockedAccountException();
        }
        ShiroUser shiroUser = new ShiroUser(user.getId(),user.getDepId(),user.getNickName(),user.getName(),user.getSex(),user.getEmail(),user.getPhone(),user.getMobile(),user.getAddress());
		return new SimpleAuthenticationInfo(shiroUser,
				user.getPassword().toCharArray(),getName());
	}
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		ShiroUser shiroUser = (ShiroUser) principals.getPrimaryPrincipal();
		List<Role> roleList = sysRoleService.getListByUserId(shiroUser.getId());
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		List<String> roles = new ArrayList<String>();
		List<String> permissions = new ArrayList<String>();
		if(roleList != null && roleList.size()>0){
			for (Role role : roleList) {
				roles.add(role.getRoleName());
				List<Permission> permissionList = sysPermissionService.getListByRoleId(role.getRoleKy());
				if(permissionList != null && permissionList.size()>0){
					for(Permission permission :permissionList){
						permissions.add(permission.getPermissionDesc());
					}
				}
			}			
		}
		//基于Role的权限信息
		info.addRoles(roles);
		//基于Permission的权限信息
		info.addStringPermissions(permissions);
		return info;
	}

	@Override
	public String getAuthenticationCacheKey(PrincipalCollection principals){
		ShiroUser sysUser = (ShiroUser) principals.getPrimaryPrincipal();
		return sysUser.getNickName();

	}

	@Override
	public String getAuthorizationCacheKey(PrincipalCollection principals){
		ShiroUser sysUser = (ShiroUser) principals.getPrimaryPrincipal();
		return sysUser.getNickName()+".author";

	}
}
