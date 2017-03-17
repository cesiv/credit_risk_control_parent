package com.hanzhou.www.controller.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.hanzhou.www.EasyUiPage;
import com.hanzhou.www.Md5Util32;
import com.hanzhou.www.dto.BaseResult;
import com.hanzhou.www.dto.sys.UserDto;
import com.hanzhou.www.model.sys.Role;
import com.hanzhou.www.model.sys.User;
import com.hanzhou.www.service.sys.SysRoleService;
import com.hanzhou.www.service.sys.SysUserService;
import com.hanzhou.www.vo.sys.UserQueryVo;
import com.hanzhou.www.vo.sys.UserVo;


@Controller
@RequestMapping("/user")
public class SysUserController {

	private static final Logger LOGGER = LoggerFactory.getLogger(SysUserController.class);

	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysRoleService sysRoleService;	
	
    /**
     * 跳转到用户列表
     * @return
     */
    @RequiresPermissions("user:toList")
	@RequestMapping(value = "/toList", method = RequestMethod.GET)
	public String toList() {
		return "/system/sys/user/userList";
	}
	
    /**
     * 用户列表
     * @param queryVo
     * @return
     */
    @RequiresPermissions("user:list")
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public EasyUiPage list(UserQueryVo queryVo) {
		PageInfo<User> page = sysUserService.getListByCriteria(queryVo);
		return new EasyUiPage(page.getSize(),page.getList());
	}
	
	/**
	 * 传递到添加页面
	 */
    @RequiresPermissions("user:toAdd")
	@RequestMapping("/toAdd")
	public String toAdd(HttpServletRequest request,Map<String,Object> model) {
		model.put("sysUser",new UserVo());
		return "/system/sys/user/sysUseradd";
	}
	
	/**
	 * 添加用户
	 */
    @RequiresPermissions("user:addUser")
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	@ResponseBody
	public BaseResult addUser(@ModelAttribute("sysUser") UserVo userVo){
		BaseResult result = new BaseResult();
		result.setSuccess(true);
		try {
			sysUserService.addUser(userVo);
		} catch (Exception e) {			
			LOGGER.info(e.getMessage());
			result.setSuccess(false);
			result.setMsg(e.getMessage());
		}
		return result;
	}
	
	/**
	 * 传递到添加页面
	 */
    @RequiresPermissions("user:toModify")
	@RequestMapping("/toModify")
	public String toModify(HttpServletRequest request,String userId,Map<String,Object> model) {
		User  user = sysUserService.getByUserId(userId);
		List<Role> roleList = sysRoleService.getListByUserId(userId);
		UserDto dto = new UserDto();
		BeanUtils.copyProperties(user, dto);
		if(roleList != null && roleList.size()>0){
			dto.setRoleId(roleList.get(0).getRoleKy());	
		}
		model.put("sysUser", dto);
		model.put("tabid", request.getParameter("tabid"));
		return "/system/sys/user/sysUsermodify";
	}
	
	/**
	 * 添加用户
	 */
    @RequiresPermissions("user:modifyUser")
	@RequestMapping(value = "/modifyUser", method = RequestMethod.POST)
	@ResponseBody
	public BaseResult modifyUser(@ModelAttribute("sysUser") UserVo userVo){
		BaseResult result = new BaseResult();
		result.setSuccess(true);
		try {
			sysUserService.modifyUser(userVo);
		} catch (Exception e) {			
			LOGGER.info(e.getMessage());
			result.setSuccess(false);
			result.setMsg(e.getMessage());
		}
		return result;
	}
    
    
    /**
     * 重置密码
     * @param userVo
     * @return
     */
    @RequiresPermissions("user:resetPassword")
	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	@ResponseBody
	public BaseResult resetPassword(@ModelAttribute("sysUser") UserVo userVo) {
		BaseResult result = new BaseResult();
		result.setSuccess(true);
		try {
			User user = sysUserService.getByUserId(userVo.getId());
			user.setPassword(Md5Util32.md5(userVo.getPassword()));
			sysUserService.updateByPrimaryKey(user);
		} catch (Exception e) {			
			LOGGER.info(e.getMessage());
			result.setSuccess(false);
			result.setMsg(e.getMessage());
		}
		return result;
	}
	
	
	
}
