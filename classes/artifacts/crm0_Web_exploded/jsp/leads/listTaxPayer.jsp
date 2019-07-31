<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+ request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>纳税人管理</title>
	<link href="static/css/base.css" rel="stylesheet">
	<link rel="stylesheet" href="static/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
	<link rel="stylesheet" href="static/css/taxpayer.css">
	<script type="text/javascript" src="static/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
	<script src="static/easyui/easyui-lang-zh_CN.js"></script>
</head>

<body>
<div class="container">
	<%--<div style="height: 2px;"></div>--%>
	<div style="margin-left: 550px">
		<input class="easyui-validatebox" type="text" name="leadsNamePhone"  placeholder="请输入线索名称/电话" style="width:166px;height:36px;line-height:35px;border-radius: 7px;"/>

		<a style="background-color:deepskyblue;  color: white; width: 70px;height: 36px;border-radius: 7px;font-family: 微软雅黑" id="leadsBtn" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">查询</a>
		<button style="left: 450px;background-color:deepskyblue; color: white; width: 70px;height: 36px;border-radius: 7px;font-family: 微软雅黑" iconCls="icon-reload">重置</button>
		<button style="background-color:deepskyblue; color: white; width: 90px;height: 36px;border-radius: 7px;font-family: 微软雅黑" id="addLeads" onclick="addLeads()">新建线索</button>
	</div>
	<table id="dg" style="width:100%;"></table>
	<div id="tb" style="padding:0 30px;">


	</div>
</div>
<script type="text/javascript">
	//加载数据
	function loadData(url) {
		$("#dg").datagrid({
			url:url,
			singleSelect:false,
			checkOnSelect:true,
			pagination:true,//是否在底部显示分页栏
			ownumbers:true,//显示行号
			striped:true,//将数据条纹化（即奇偶行使用不同背景色）

			toolbar:[{
				id:'delUser',
				text:'删除',
				iconCls:'icon-remove',
				handler:function(){
					del();
				}

			}],
			frozenColumns:[[
				{field:'fuserid',checkbox:true},
				{field:'leadsName',title:'线索名称'}
			]],
			columns:[[
				{field:'id',title:'编号'},
				{field:'telephone',title:'手机'},
				{field:'updateTime',title:'更新时间'},
				{field:'createTime',title:'创建时间'},
				{field:'blame',title:'负责人'},
				{field:'address',title:'地址'},
				{field:'nextContactTime',title:'下次联系时间'},
				{field:'createPerson',title:'创建人'},
				{field:'leadsOrgin',title:'线索来源'},
				{field:'customerLevel',title:'客户级别'},

			]]

		})
	}

	/**
	 *  实现批量删除
	 * */
	function del(){
		//获取选中行
		var selectRows = $('#dg').datagrid('getChecked');
		alert("一共有条数"+selectRows.length)
		if (selectRows.length==0) {
			alert('请选择要删除的用户');
			return;
		}
		var selectRows = $('#dg').datagrid('getChecked');
		// alert("yi共有条数"+selectRows.length);

		if(selectRows.length == 0){
			alert('请选择要删除的用户');
			return;
		}
		var fuserids=[];
		for (var i = 0; i < selectRows.length; i++) {

			//fuserids+=selectRows[i].id+",";
			fuserids += selectRows[i].id + ",";//把fuserid(字符串类型)以“,”拼接
			// alert("编号"+fuserids);
		}

		//去掉最后一个空格
		fuserids = fuserids.substr(0, fuserids.length - 1);//去掉最后一个“,”
		alert(fuserids);
		if (confirm('确定删除吗？')) {
			// for (var i = 0; i <fuserids.length ; i++) {
			$.ajax({
				method: 'post',
				url: '/manage/leads/delUser.action?fuserids='+fuserids,
				type: 'json',
				success:function(data){
					if (data){
						loadData()
					}else {
						return false;
					}
				}
			})
			// }
		}
	}
	function addLeads(){
		window.open(
				'manage/leads/addleads.page',
				'添加线索页面',
				'height=600, width=800, top=100, left=350, toolbar=no, menubar=no, scrollbars=yes, resizable=no, location=no, status=no'
		)


	}
	/**
	 打开窗口
	 */

	$(function(){
		loadData("manage/leads/list.do");

		//当点击查询时 模糊查询通过识别号和名称
       $("#leadsBtn").on("click",function(){
          var fuzzyQuery = $("input[name=leadsNamePhone]").val();
     	   $.post(
          		  loadData("manage/leads/fuzzyQuery.action?fuzzyQuery="+fuzzyQuery),
				  function(data,status){
          		  if (data) {
          		  	alert(status)
					 }
				  }


		  )




   })



	})
</script>
</body>
</html>