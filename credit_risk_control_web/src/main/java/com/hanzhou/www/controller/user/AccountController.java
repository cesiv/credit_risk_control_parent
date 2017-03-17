package com.hanzhou.www.controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanzhou.www.Md5Util32;
import com.hanzhou.www.dto.BaseResult;
import com.hanzhou.www.model.sys.Permission;
import com.hanzhou.www.model.sys.User;
import com.hanzhou.www.service.sys.SysPermissionService;
import com.hanzhou.www.service.sys.SysUserService;
import com.hanzhou.www.shiro.ShiroUser;
import com.hanzhou.www.vo.sys.AccountVo;

@Controller
public class AccountController {

	private static final Logger LOGGER = LoggerFactory.getLogger(AccountController.class);

	@Autowired
	private SysPermissionService sysPermissionService;

	@Autowired
	private SysUserService sysUserService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showLoginForm(HttpServletRequest req, Model model) {
		String exceptionClassName = (String) req.getAttribute("shiroLoginFailure");
		String error = null;
		Subject currentUser = SecurityUtils.getSubject();
		if (currentUser.isAuthenticated()) {
			return "redirect:/";
		}
		if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
			error = "用户名/密码错误";
		} else if (IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
			error = "用户名/密码错误";
		} else if (LockedAccountException.class.getName().equals(exceptionClassName)) {
			error = "账户被锁定";
		} else if (exceptionClassName != null) {
			error = "其他错误：" + exceptionClassName;
		}
		model.addAttribute("error", error);
		return "/system/sys/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest req,AccountVo vo) {
		try {
			UsernamePasswordToken token = new UsernamePasswordToken();
			token.setUsername(vo.getNickName());
			token.setPassword(Md5Util32.md5(vo.getPassword()).toCharArray());
			SecurityUtils.getSubject().login(token);
			ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
			// 获取一级菜单栏
			List<Permission> firstMenus = sysPermissionService.getMenusByLevel(0);
			// 获取二级菜单栏
			List<Permission> secondMenus = sysPermissionService.getMenusByLevel(1);
			HttpSession session = req.getSession(false);
			if (session != null) {
				session.setAttribute("firstMenu", firstMenus);
				session.setAttribute("secondMenu", secondMenus);
				session.setAttribute("user", user);
			}			
			return "redirect:/";
		} catch (UnknownAccountException uae) {
			LOGGER.error("weblogin UnknownAccount: " + uae.toString());
		} catch (IncorrectCredentialsException ice) {
			LOGGER.error("weblogin IncorrectCredentials: " + ice.toString());
		} catch (Exception e) {
			LOGGER.error("weblogin error: ", e);
		}
		return "redirect:/login";
	}

	@RequestMapping(value = "/")
	public String home(HttpServletRequest req, Model model) {
		return "/system/sys/index";
	}

	@RequestMapping(value = "/modifyPwd", method = RequestMethod.POST)
	@ResponseBody
	public BaseResult modifyPwd(AccountVo vo) {
		BaseResult result = new BaseResult();
		ShiroUser shiroUser = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		User user = sysUserService.getByUserId(shiroUser.getId());
		if (Md5Util32.md5(vo.getOldPassword()).equals(user.getPassword().toString())) {
			user.setPassword(Md5Util32.md5(vo.getPassword()));
			int updateNum = sysUserService.updateByPrimaryKey(user);
			if (updateNum == 1) {
				result.setSuccess(true);
				result.setMsg("修改密码成功！");
			} else {
				result.setSuccess(false);
				result.setErrorMsg("修改密码失败!");
			}
		} else {
			result.setSuccess(false);
			result.setErrorMsg("输入原密码不正确!");
		}
		return result;
	}

	@RequestMapping(value = "/logout")
	public String mobilelogout() {
		SecurityUtils.getSubject().logout();
		return "redirect:/login";
	}

}
