package com.hanzhou.www.controller.user;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springside.modules.utils.mapper.BeanMapper;

import com.hanzhou.www.EasyUiPage;
import com.hanzhou.www.dto.sys.PermissionDto;
import com.hanzhou.www.model.sys.Permission;
import com.hanzhou.www.service.sys.SysPermissionService;


@Controller
@RequestMapping("/permission")
public class SysPermissionController {

	private static final Logger LOGGER = LoggerFactory.getLogger(SysPermissionController.class);

	@Autowired
	private SysPermissionService sysPermissionService;
	
	
	@RequestMapping(value = "/toList", method = RequestMethod.GET)
	public String toList(){
		return "system/sys/menuList";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public EasyUiPage list() {
		List<PermissionDto> dtoList = new ArrayList<PermissionDto>();
		List<Permission> menuPermissions = sysPermissionService.getMenusByLevel(0);
		if(menuPermissions !=null && !menuPermissions.isEmpty()){
			List<Permission> subPermissions = null;
			PermissionDto dto = null;
			for(Permission permission:menuPermissions){
				dto = BeanMapper.map(permission, PermissionDto.class);
				dtoList.add(dto);
				subPermissions  = sysPermissionService.getListByRefId(permission.getId());
				if(subPermissions != null && !subPermissions.isEmpty()){
					dtoList.addAll(BeanMapper.mapList(subPermissions, Permission.class, PermissionDto.class));	
				}
			}
		}
		return new EasyUiPage(dtoList.size(),dtoList);
	}

	
	
	
}
