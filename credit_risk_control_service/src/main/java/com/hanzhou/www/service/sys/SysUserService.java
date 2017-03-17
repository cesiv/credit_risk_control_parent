package com.hanzhou.www.service.sys;

import com.github.pagehelper.PageInfo;
import com.hanzhou.www.model.sys.User;
import com.hanzhou.www.vo.sys.UserQueryVo;
import com.hanzhou.www.vo.sys.UserVo;

public interface SysUserService {
	
	public User getByUserName(String userName);
	
	public User getByUserId(String userId);
	
	public int updateByPrimaryKey(User user);
	
	public PageInfo<User> getListByCriteria(UserQueryVo criteria);
	
	public int addUser(UserVo user)throws Exception;
	
	public int modifyUser(UserVo user)throws Exception;
	
}
