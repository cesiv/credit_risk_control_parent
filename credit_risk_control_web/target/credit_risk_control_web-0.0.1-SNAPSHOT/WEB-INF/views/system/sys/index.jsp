<%@ include file="/WEB-INF/views/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>聚胜财富 - 聚胜财富信息数据管理中心</title>
<%@ include file="/WEB-INF/views/common/include/util.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${apppath }/resources/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${apppath }/resources/css/work.css" />
</head>
<body>
	<div class="easyui-layout" id="main" fit="true">
		<div data-options="region:'north'"
			style="BACKGROUND: #41506E; height: 100px; padding: 1px; overflow: hidden;">
			<div class="top-wrap">
				<a class="logo" href="http://jushengcaifu.com" target="_Blank"><img
					src="${apppath }/resources/images/work-logo.png" /></a>
				<div class="info">
					<p>
						用户姓名：<span>${sessionScope.user.nickName}</span>
					</p>
					<p class="change-wrap">
						<a class="change" href="javascript:;"
							onclick="updateUserPasswordBtn()">修改密码</a> <span>|</span><a
							class="exit" href="javascript:;" onclick="loginout()">退出登录</a>
					</p>
				</div>
			</div>
			<div id="updateUserPasswordDialog" class="easyui-dialog" title="修改密码"
				data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#updateUserPassword'"
				style="width: 340px; height: 200px; padding: 5px;">
				<form id="updateUserPasswordForm">
					<table align="center">
						<tr>
							<td align="right">请输入原密码:</td>
							<td><input id="oldPassword" name="oldPassword"
								class="easyui-textbox" data-options="required:true"
								type="password" /></td>
						</tr>
						<tr>
							<td align="right">新密码:</td>
							<td><input id="password" class="easyui-textbox"
								name="password" data-options="required:true" type="password" />
							</td>
						</tr>
						<tr>
							<td align="right">请再次输入密码:</td>
							<td><input id="spassword" class="easyui-textbox"
								data-options="required:true" type="password" /></td>
						</tr>
					</table>
				</form>
				<div id="updateUserPassword">
					<a href="javascript:void(0)" class="easyui-linkbutton"
						iconCls="icon-add" onclick="updateUserPassword()">修改</a>
				</div>
			</div>
		</div>
		<div data-options="region:'south',split:true,disabled:true"
			style="height: 25px;">
			<div style="color: #0E2D5F; padding-top: 2px" align="center">
				Copyright Reserved © 聚胜财富</div>
		</div>
		<div data-options="region:'west',split:true" title="导航菜单"
			style="width: 150px;">
			<ul class="easyui-tree">
				<c:forEach items="${sessionScope.firstMenu}" var="menu1">
					<li data-options="state:'closed'"><shiro:hasPermission
							name="${menu1.permissionDesc}">
							<span>${menu1.permissionName}</span>
						</shiro:hasPermission>
						<ul>
							<c:forEach items="${sessionScope.secondMenu}" var="menu2">
								<c:if test="${menu1.id eq menu2.parentId }">
									<li><shiro:hasPermission name="${menu2.permissionDesc}">
											<a href="javascript:void(0);"
												onclick="javascript:addTab('${menu2.permissionName}','${menu2.permissionUrl}')">${menu2.permissionName}</a>
										</shiro:hasPermission></li>
								</c:if>
							</c:forEach>
						</ul></li>
				</c:forEach>
			</ul>
		</div>
		<div data-options="region:'center',iconCls:'icon-ok'">
			<div id="main-center" class="easyui-tabs" fit="true" border="false">
				<div title="首页">
					<!-- <iframe src="../index.jsp" frameborder="0" height="100%"
					width="100%" name="mainframe"> </iframe> -->
					<div class="home-wrap">
						<h1>欢迎访问聚胜财富管理系统</h1>
						<p class="welcome">welcome to visit</p>
						<div class="show-wrap">
							<ul>
								<li><img src="${apppath }/resources/images/work-img1.jpg" /></li>
								<li><img src="${apppath }/resources/images/work-img2.jpg" /></li>
								<li><img src="${apppath }/resources/images/work-img3.jpg" /></li>
								<li><img src="${apppath }/resources/images/work-img4.jpg" /></li>
								<li><img src="${apppath }/resources/images/work-img5.jpg" /></li>
							</ul>
						</div>
						<p class="intro">高品质、专业互联网P2P金融平台</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function addTab(title, href) {
			var tt = $("#main-center");
			if (tt.tabs("exists", title)) {
				tt.tabs("select", title);
				//再次点击时，页面内容重新加载
				//var currTab = $('#main-center').tabs('getTab', title);
				//var iframe = $(currTab.panel('options').content);
				//var content = '<iframe scrolling="no" frameborder="0"  src="'+href+'" style="width:100%;height:100%;"></iframe>';  
				//var src = iframe.attr('src');
				//$('#main-center').tabs('update', { tab: currTab, options: { content:content }});
			} else {
				var content;
				if (href) {
					content = '<iframe scrolling="no" frameborder="0"  src="'
							+ href
							+ '" style="width:100%;height:100%;"></iframe>';
				} else {
					content = '建设中';
				}
				tt.tabs('add', {
					title : title,
					closable : true,
					content : content
				});
			}
		}

		function loginout() {
			window.location.href = "${apppath}/logout";
		}

		function updateUserPasswordBtn() {
			$("#updateUserPasswordDialog").dialog("open");
		}

		function updateUserPassword() {
			var validate = $("#updateUserPasswordForm").form("validate");
			if (!validate) {
				return false;
			}
			var oldPassword = $("#oldPassword").val();
			var password = $("#password").val();
			var spassword = $("#spassword").val();
			if (password != spassword) {
				$.messager.alert("提示信息", "两次密码不一样！");
				return false;
			}
			if (oldPassword == spassword && oldPassword == password) {
				$.messager.alert("提示信息", "原密码不能跟新密码一样！");
				return false;
			}
			$.ajax({
				url : "${apppath}/modifyPwd",
				type : "POST",
				data : $("#updateUserPasswordForm").serialize(),
				success : function(result) {
					if (result.success) {
						$.messager.alert("提示信息", result.msg, "", function() {
							window.location.href = "../user/exit.do";
						});
					} else {
						$.messager.alert("提示信息", result.errorMsg);
					}
					;
				}
			});
		}
	</script>
</body>
</html>