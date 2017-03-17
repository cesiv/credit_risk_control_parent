package com.hanzhou.www.service.sys.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.utils.reflect.BeanMapper;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hanzhou.www.Md5Util32;
import com.hanzhou.www.UuidGenerator;
import com.hanzhou.www.dao.sys.UserDao;
import com.hanzhou.www.model.sys.User;
import com.hanzhou.www.service.sys.SysUserService;
import com.hanzhou.www.vo.sys.UserQueryVo;
import com.hanzhou.www.vo.sys.UserVo;

@Service("sysUserService")
@Transactional
public class SysUserServiceImpl implements SysUserService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(SysUserServiceImpl.class);

	@Autowired
	private UserDao userDao;

	/* 
	 * 根据用户登录名获取用户信息
	 * @see com.hanzhou.service.SysUserService#getByUserName(java.lang.String)
	 */
	@Override
	@Transactional(readOnly=true)
	public User getByUserName(String userName) {
		return userDao.getByUserName(userName);
	}

	/* 根据用户id获取用户详情
	 * @see com.hanzhou.www.service.sys.SysUserService#getByUserId(java.lang.String)
	 */
	@Override
	@Transactional(readOnly=true)
	public User getByUserId(String userId) {
		return userDao.selectByPrimaryKey(userId);
	}
	
	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	public int updateByPrimaryKey(User user){
		return userDao.updateByPrimaryKey(user);
	}

	@Override
	@Transactional(readOnly=true)
	public PageInfo<User> getListByCriteria(UserQueryVo criteria) {
		PageHelper.orderBy("create_time DESC");
		PageHelper.startPage(criteria.getPage(), criteria.getRows());	
		List<User> userList = userDao.getListByCriteria(criteria);
		PageInfo<User>  pageInfo = new PageInfo<User>(userList);
		return pageInfo;
	}

	@Override
	public int addUser(UserVo userVo) throws Exception {
		//判断nickName是否重复
		User existingUser = userDao.getByUserName(userVo.getNickName());
		if(existingUser != null){
			throw new Exception("repeating nickName");
		}
		User user = BeanMapper.map(userVo, User.class);
		user.setId(UuidGenerator.generateor());
		user.setPassword(Md5Util32.md5("123456"));
		user.setCreateTime(new Date());
		user.setLocked(false);
		user.setDelFlag(false);
		return userDao.insertSelective(user);
		//添加角色 TODO
	}

	@Override
	public int modifyUser(UserVo userVo)throws Exception {
		//更新用户
		User user = userDao.selectByPrimaryKey(userVo.getId());
		BeanUtils.copyProperties(userVo, user);
		return userDao.updateByPrimaryKey(user);
		//更新用户角色 TODO
	}
	
	

}
