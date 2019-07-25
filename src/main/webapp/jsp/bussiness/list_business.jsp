<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'list.jsp' starting page</title>
    
	<link rel="stylesheet" type="text/css" href="static/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">

	<script type="text/javascript" src="static/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
  <style>

  #add{
   float:right;
   }
  #div1{
  height: 30px;
   }
    button {
	background-color: blue;
     }

  </style>

  </head>
  
 
  <body>
  <div id="div1"> <div id="add"><button><font  color="white">新建联系人</font></button></div> </div>
 <table id="businessList"></table>
  </body>
  
  <script type="text/javascript">
  $("#search").on("click",function(event){
  	var searchBy=$("#searchBy").val();
  	var searchText=$("#searchText").val();
  	$("#businessList").datagrid("load",{
  		"searchBy":$("#searchBy").val(),
  		"searchText":$("#searchText").val()
  	})
  })
  $("#reset").on("click",function(event){
  		$("#searchBy").val("-1");
 	 	$("#searchText").val("");
  })
  
 	/**
	打开窗口
	*/
	 function openTopWindow(options){
         options = !options ? {} :options;
         options.width = !options.width ? 500 : options.width;
         options.height = !options.height ? 400 : options.height;
         options.url = !options.url ? "404.html" : options.url;
         options.title = !options.title ? "" : options.title;

         parent.$("#topWindow").window({
             title : options.title,
             width: options.width,
             height: options.height,
             content : "<iframe scrolling='no' frameborder='0' border='0' height='100%' width='100%' src='"+options.url+"'></iframe>",
             modal:true,
             resizable:false,
             collapsible:false
         });
     }
  

   function add(url){
        	parent.parent.openTopWindow({
    				width:900,
    				height:600,
    				title:"添加商机",
    				"url": url,
    				 close:function(){
    					$("#businessList").datagrid("reload");
    				} 
    			});
        } 
  
  	$(function(){
  		//分页展示客户列表
		$("#businessList").datagrid({
			url:"buinessInfo",
			fitColumns:true,
			checkOnSelect:false,
			idField:"name",
			pagination:true,
			sortName:"name",
			columns:[[
				{field:"选择",checkbox:true},
				{field:"id",hidden:true},
				{field:"customerName",title:"客户名",width:12},
				{field:"name",title:"商机名",width:12},
				{field:"status",title:"商机状态组",width:10},
				{field:"stage",title:"商机阶段",width:10},
				{field:"money",title:"商机金额",width:10},
				{field:"preDate",title:"预计成交日期",width:5},
				{field:"beizhu",title:"备注",width:5},
				{field:"createName",title:"创建人",width:10},
				{field:"updateTime",title:"更新时间",width:10},
				{field:"createTime",title:"创建时间",width:5},
				{field:"customerAttribute",title:"客户属性",width:10},
				{field:"operation",title:"操作",width:20,formatter:function(value,row,index){ 
		  			return "<a href='javascript:void(0)' onclick='return see("+index+")'>查看</a>"+
		  			" <a href='javascript:void(0)' onclick='return modify("+index+")'>修改</a>";
  				}}
			]]
			/* loadFilter:function(data){
				return {total : data.data.totalRows,rows:data.data.result}
			} */		
		})	
		
		 
	})
	
	
	
	$("button").on("click",function(){
		
     window.location.href="text/add_buiness.jsp"
		
	})
	function see(index){
		$("#businessList").datagrid("selectRow",index);
		var row=$("#businessList").datagrid("getSelected");
		parent.parent.openTopWindow({
    				width:900,
    				height:600,
    				title:"查看商机",
    				"url": "manage/business/BusinessAction_see.action?busi.businessid="+row.id,
    				close:function(){
    					$("#businessList").datagrid("reload");
    				}
    			});
	}
	function modify(index){
		$("#businessList").datagrid("selectRow",index);
		var row=$("#businessList").datagrid("getSelected");
		parent.parent.openTopWindow({
    				width:900,
    				height:600,
    				title:"修改商机",
    				"url": "manage/business/BusinessAction_edit.action?busi.businessid="+row.id,
    				close:function(){
    					$("#businessList").datagrid("reload");
    				}
    			});
	}
	
	

	
	
	
	
	
  </script>
</html>
