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
	background-color: 	FF33FF;
     }
#button3{
margin: auto;

}
  </style>

  </head>
  
 
  <body>
  <div id="div1"> <div id="add"><button id="button2" ><font  color="white">新建联系人</font></button></div> </div>
  <button id="button1"><font color="white">删除选中行</font></button>
  <button id="button3" ><font color="white">查看所有</font></button>
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
			url:"manage/bussiness/buinessInfofo",
			checkOnSelect:false,
			idField:"name",
			pagination:true,
			sortName:"name",
			
			frozenColumns:[[
				{field:"id",checkbox:true,width:30},
				{field:"customerName",title:"客户名",width:160},	
			]],
			columns:[[
				{field:"name",title:"商机名",width:120},
				{field:"status",title:"商机状态组",width:100},
				{field:"stage",title:"商机阶段",width:100},
				{field:"money",title:"商机金额",width:100},
				{field:"preDate",title:"预计成交日期",width:180},
				{field:"beizhu",title:"备注",width:150},
				{field:"createName",title:"创建人",width:100},
				{field:"updateTime",title:"更新时间",width:100},
				{field:"createTime",title:"创建时间",width:150},
				{field:"customerAttribute",title:"客户属性",width:100},
				{field:"operation",title:"操作",width:120,formatter:function(value,row,index){ 
		  			return "<a href='javascript:void(0)' onclick='return see("+index+")'>查看</a>"+
		  			" <a href='javascript:void(0)' onclick='return modify("+index+")'>修改</a>";
  				}}
			]]
			/* loadFilter:function(data){
				return {total : data.data.totalRows,rows:data.data.result}
			} */		
		})	
		
		 
	})
	
	$("#button3").on("click",function(){
	
	  window.location.href="manage/bussiness/lll"
})
	
	
	 $("#button2").on("click",function(){
		
		window.open("jsp/bussiness/add_buiness.jsp","添加页面","height=500, width=800")
   //   window.location.href="text/add_buiness.jsp" 
		
	}) 
	//删除按钮
	$("#button1").on("click",function(){
		
		//返回选中多行
        var selRow = $('#businessList').datagrid('getSelections')
        //判断是否选中行
        if (selRow.length==0) {
            $.messager.alert("提示", "请选择要删除的行！", "info");
            return;
        }else{    
            var temID="";
            //批量获取选中行的评估模板ID
            for (i = 0; i < selRow.length;i++) {
                if (temID =="") {
                    temID = selRow[i].id;
                } else {
                    temID = selRow[i].id + "," + temID;
                }               
            }
                      
            $.messager.confirm('提示', '是否删除选中数据?', function (r) {

                if (!r) {
                    return;
                }
                //提交
                
                $.ajax({
                    type: "GET",
                    async: false,
                    url: "manage/bussiness/delete" ,
                    data: {iid: temID},
                    success: function (result) {
                        if (result.length!= 0) {
                           alert("删除成功")
                            window.location.reload(); 
                      
                         
                        } else {
                            $.messager.alert("提示", "删除失败，请重新操作！", "info");
                            return;
                        }
                    }
                });
            });

        }
		
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
