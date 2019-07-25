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
    		<div style="height: 2px;"></div>
			<div style="margin-left: 400px">
			<input class="easyui-validatebox" type="text" id="payerCode" name="payerCode" placeholder="请输入线索名称/电话" style="width:166px;height:35px;line-height:35px;"/>
			<%--纳税人名称: <input class="easyui-textbox" type="text" id="payerName" name="payerName" style="width:166px;height:35px;line-height:35px;"/>--%>
			</div>
			<div style="margin-left:800px; float: right">
			<a href="javascript:void(0);" id="searchBtn" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">查询</a>
			<a href="javascript:void(0);" id="setBtn" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
			<%--<a id="addLeads" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加线索人</a>--%>
				<button id="addLeads" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加线索人</button>
			</div>
				<table id="dg" style="width:100%;"></table>
	             <div id="tb" style="padding:0 30px;">

	        <%--<a href="javascript:void(0);" id="addBtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加纳税人</a>--%>
	      </div>
    	</div>
    	<script type="text/javascript">
    		//加载数据
    		function loadData() {
    			$("#dg").datagrid({
					url:"manage/leads/list.do",
					// queryParams:{"id":id},
					// toolbar:'#tb',
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
							{field:'mobil',title:'手机'},
							{field:'updateTime',title:'更新时间'},
							{field:'createTime',title:'创建时间'},
							{field:'blame',title:'负责人'},
							{field:'address',title:'地址'},
							{field:'nextContacttime',title:'下次联系时间'},
							{field:'createPerson',title:'创建人'},
							{field:'leadsOrgin',title:'线索来源'},
							{field:'customerLevel',title:'客户级别'},
							{field:'removeState',title:'操作',formatter: function(value,row,index){
								return "<a href='javascript:updateTaxpayer(\""+row.payerCode+"\");'>修改</a>&emsp;"+
								"<a href='javascript:deleteTaxpayer(\""+row.payerCode+"\");'>删除</a>&emsp;"+
								"<a>任务录入</a>"
								}
							}
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
				// alert(selectRows[0]);
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
						url: '/lead/delUser.action?fuserids='+fuserids,
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
			//查询全部数据并绑定

			function query(){
			}

			$("#addLeads").on("click",function(){
				openTopWindow({
					width:900,
					height:600,
					title:"添加线索人",
					url:"lead/addleads.action/addleads.jsp"
				})


			})
    	/*	function updateTaxpayer(payerCode){
    			openTopWindow({
     				width:900,
     				height:600,
     				title:"修改纳税人",
     				url:"manage/addTaxpayer.jsp?payerCode="+payerCode
     			})
    		}
    		*/
    		/*function deleteTaxpayer(payerCode){
    			$.messager.confirm("警告","是否要删除编号为:"+payerCode+"的记录？",function(r){
    				alert(r)
    				if(r){
    					$.get("manage/taxpayer.do",
    							{'payerCode':payerCode,'action':'remove'},
    							function(data){
    								if(data.success){
    									$.messager.show({
        									title:'提示',
        									msg:'删除成功',
        									timeout:5000,
        									showType:'slide'
        								});
        								$("#dg").datagrid("reload");
    								}else{
    									$.messager.alert("警告","删除失败","error");
    								}
    								
    							},'json')
    				}
    			})
    			
    		}*/
    		/**
    		打开窗口
    		*/
    		/* function openTopWindow(options){
                 options = !options ? {} :options;
                 options.width = !options.width ? 500 : options.width;
                 options.height = !options.height ? 400 : options.height;
                 options.url = !options.url ? "404.html" : options.url;
                 options.title = !options.title ? "" : options.title;

                 parent.$("#topWindow").window({
                     title : options.title,
                     width: options.width,
                     height: options.height,
                     content : "<iframe scrolling='yes' frameborder='0' border='0' height='100%' width='100%' src='"+options.url+"'></iframe>",
                     modal:true,
                     resizable:false,
                     onClose:function(){
		                    loadData(); 
		                  },

                     collapsible:false
                 });
             }
    		 */
    		 $(function(){
     			loadData();
         		//当点击查询时 模糊查询通过识别号和名称
         		$("#searchBtn").on("click",function(){
         			$("#dg").datagrid({
    					url:"manage/taxpayer.do",
    					queryParams:{action:"selLike",
    						payerCode:$("input[name=payerCode]").val().trim(),
    						payerName:$("input[name=payerName]").val().trim()
    						},
    					toolbar:'#tb',
    					pagination:true,//将显示分页到底部
    					singleSelect:true,//只允许选中一行
    					rownumbers:true,
    					striped:true,
    					columns:[[
    							{field:'payerCode',title:'纳税人识别号'},
    							{field:'payerName',title:'纳税人名称'},
    							{field:'organName',title:'所属税务机关'},
    							{field:'industryName',title:'所属行业'},
    							{field:'legalPerson',title:'法人代表'},
    							{field:'legalIdCard',title:'法人身份证号'},
    							{field:'finaceName',title:'主管财务'},
    							{field:'finaceIdCard',title:'财务身份证号'},
    							{field:'taxerName',title:'办税人员'},
    							{field:'recordDate',title:'录入日期'},
    							{field:'removeState',title:'操作',formatter: function(value,row,index){
    								return "<a href='javascript:updateTaxpayer(\""+row.payerCode+"\");'>修改</a>&emsp;"+
    								"<a href='javascript:deleteTaxpayer(\""+row.payerCode+"\");'>删除</a>&emsp;"+
    								"<a>任务录入</a>"
    								}
    							}	
    					    ]]
    					
    				})
    			
         			
         		})
         		
         		
         		/*$("#setBtn").on("click",function(){
         			$("#payerCode").textbox('setValue','');
         			$("#payerName").textbox('setValue','');
         			loadData();
         		})*/
         		
         		/*$("#addBtn").on("click",function(){
         			openTopWindow({
         				width:900,
         				height:600,
         				title:"添加纳税人",
         				url:"manage/addTaxpayer.jsp"
         			})
         		})*/
     		})
    	</script>
	</body>
</html>