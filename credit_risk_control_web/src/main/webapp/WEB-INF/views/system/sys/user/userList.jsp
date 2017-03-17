﻿<%@include file="/WEB-INF/views/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<title>聚胜财富 - 上海聚胜投资管理有限公司</title>
	<%@ include file="../../../common/include/util.jsp" %>

<script type="text/javascript">
	$(function(){
		$("#${tabid} #userList").datagrid({
			title:"用户列表",
			width:"100%",
			singleSelect:true,
			fitColumns:true,
			url:'../user/list',
			method: 'POST',
			columns:[[
				{title:"id",field:"id",hidden:true},
				{title:"登陆ID",field:"nickName",width:$(this).width() * 0.1,align:"left"},
				{title:"姓名",field:"name",width:$(this).width() * 0.1,align:"left"},
				{title:"手机",field:"mobile",width:$(this).width() * 0.1,align:"left"},
				{title:"邮箱",field:"email",width:$(this).width() * 0.1,align:"left"},
				{title:"地址",field:"address",width:$(this).width() * 0.1,align:"left"},
				{title:"注册时间",field:"createTime",width:$(this).width() * 0.15,align:"left",
					formatter:function(value,rows){
						return new Date(parseInt(rows.createTime)).toLocaleString().substr(0,20);     
					}
				},
				{title:"状态",field:"locked",width:$(this).width() * 0.05,align:"left",
					formatter:function(value,rows){
						if(rows.locked=="0"){
							return "正常";
						}else{
							return "禁用";
						}
				}},
			]],
			pagination:true,
			rownumbers:true,
			toolbar:"#tb"
		});
	});
	
	function searchForm(){
		var o = {};
		 $.each($("#queryForm").form().serializeArray(), function(index) {
				if (o[this['name']]) {
					o[this['name']] = o[this['name']] + "," + this['value'];
				} else {
					o[this['name']] = this['value'];
				}
			});
		 $("#${tabid} #userList").datagrid('load', o);
	}
	function edit(){
		var dg = $("#${tabid} #userList");
		var row  = dg.datagrid("getSelected");
		if(row == null || row ==undefined){
			$.messager.alert("提示","请选择需要编辑的行！");
			return;
		}
		$("#window").window({
			title:"用户修改",
 			href:"../user/toModify?userId="+row.id+"&tabid=${tabid}"
		});
		$("#window").window("open");
	}
	function add(){
		$("#window").window({
			title:"用户添加",
			href:"../user/toAdd?tabid=${tabid}"
		});
		$("#window").window("open");
	}
	function closeWindow(){
		$("#window").window("close");
	}
</script>

</head>
<body style="width:100%;height:100%">
<div id="${tabid }" style="width:99.9%;height:99%;">
	<table id="userList" style="width:99.9%;height:99%;"></table>
	
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">添加</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="edit()">编辑</a>
		</div>
		<div>
			<form id="queryForm">
			姓名: <input class="easyui-textbox" name="name" style="width:150px">
			登陆ID: <input class="easyui-textbox" name="nickName" style="width:150px">
			状态: 
			<select name="locked" style="width:100px">
				<option value="">全部</option>
				<option value="1">禁用</option>
				<option value="0">可用</option>
			</select>
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="searchForm()">查询</a>
			</form>
		</div>
	</div>
	<div id="window" class="easyui-window"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:false,maximizable:false" style="width:300px;height:350px;padding:10px;">
	</div>
</div>
</body>
</html>
