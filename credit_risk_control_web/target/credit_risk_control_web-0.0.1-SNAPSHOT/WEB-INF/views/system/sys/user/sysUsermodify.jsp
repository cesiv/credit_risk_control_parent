﻿<%@include file="/WEB-INF/views/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>聚胜财富 - 上海聚胜投资管理有限公司</title>
</head>
<body>
<div>
	<form:form id="form" modelAttribute="sysUser" action="${apppath }/user/update.do" method="post" style="align:center">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>登陆ID</td>
	    			<td>
	    				<input name="nickName" value="${sysUser.nickName }" readonly="readonly"/>
	    				<input name="id" value="${sysUser.id }" readonly="readonly" type="hidden"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>姓名</td>
	    			<td><input name="name" class="easyui-validatebox"  type="text" value="${sysUser.name }" data-options="required:true" /></td>
	    		</tr>
	    		<tr>
	    			<td>手机</td>
	    			<td><input name="mobile" value="${sysUser.mobile }" class="easyui-validatebox" data-options="required:true"/></td>
	    		</tr>
	    		<tr>
	    			<td>电话</td>
	    			<td><input name="phone" value="${sysUser.phone }" class="easyui-validatebox" data-options="required:true"/></td>
	    		</tr>
	    		<tr>
	    			<td>邮箱</td>
	    			<td><input name="email" value="${sysUser.email }" class="easyui-validatebox" data-options="required:true,validType:'email'" /></td>
	    		</tr>
	    		<tr>
	    			<td>地址</td>
	    			<td><input name="address" value="${sysUser.address }" class="easyui-validatebox" data-options="required:true"/></td>
	    		</tr>
	    		<tr>
	    			<td>用户角色</td>
	    			<td>
	    				<select value="${sysUser.roleId }" id="role_ky" class="easyui-combobox" style="width: 150px;"
	    				name="roleId" data-options="valueField:'roleKy',textField:'roleName',url:'${apppath }/role/roleSelect.do?roleKy=${sysUser.roleId }'" /> 
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>状态</td>
	    			<td>
	    				<input type="radio" name="locked" value="0" <c:if test="${sysUser.locked == false }">checked</c:if> ><span>正常</span>
	    				<input type="radio" name="locked" value="1" <c:if test="${sysUser.locked == true }">checked</c:if> ><span>禁用</span>
	    			</td>
	    		</tr>
			</table>
		</form:form>
		<div style="text-align:center;">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submit()">保存</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="resetPassword()">重置密码</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeWindow()">取消</a>
	    </div>
</div>
<script type="text/javascript">
	function closeWindow(){
		$("#window").window("close");
	}
	function submit(){
		$.ajax({
			url:"${apppath}/user/modifyUser",
			type:"POST",
			data:$("#form").serialize(),  
			success:function(result){
				var result = eval(result);
				if(result.success==true){
					$.messager.alert("提示信息","修改成功！","info");
					$("#window").window("close");
					$("#form").form("clear");
					$("#userList").datagrid("reload");
				}
			}
		});
	}
	
	function resetPassword(){
		$.ajax({
			url:"${apppath}/user/resetPassword",
			type:"POST",
			data:$("#form").serialize(),  
			success:function(result){
				var result = eval(result);
				if(result.success==true){
					$.messager.alert("提示信息","密码重置成功！","info");
					$("#window").window("close");
					$("#form").form("clear");
					$("#userList").datagrid("reload");
				}
			}
		});
	}
</script>
</body>
</html>