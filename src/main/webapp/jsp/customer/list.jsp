<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%						//获得协议
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>Title</title>
	<link rel="stylesheet" type="text/css" href="static/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
	<script type="text/javascript" src="static/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="static/easyui/easyui-lang-zh_CN.js"></script>
	<style>


		.header img{
			transform: scale(1.5);
		}

		.right{
			background:rgb(245,246,249);
			padding-top: 20px;
		}

		.header_right li{
			list-style: none;
			float: left;
		}

		.header_right li a{
			text-decoration: none;
			color: black;

		}
		.header_right li a:hover{
			color: blue;
		}
		#sm li{
			color:rgb(163,158,151) ;
			background:rgb(45,48,55);
		}

		#sm li:nth-of-type(8){
			background: rgb(69,78,87);
			color:white ;
		}
		#addBtn{
			margin-left: 420px;
		}

		#tx{
			margin-left: 20px;
			font-size: medium;
		}
		#more{
			font-size: small;
			margin-left: 2px;
		}
		#ss{
			margin: auto;
		}
		.tx1{
			margin-top: -15px;
			margin-left: 20px;
			font-size: smaller;
			color: #5f5f5f;
		}

		#xx{

			background-color: white;
			width: 100%;
			height: 40px;
		}
		#xx span{
			margin-top: 20px;
		}
		#kong{
			height: 7px;
			width: 100%;
		}
	</style>
</head>
<body>
<div class="right">
	<div id="xs">
            <span id="tx">客户管理 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</span>
		<input id="ss" class="easyui-searchbox" data-options="searcher:search,prompt:'请输入姓名/手机号/电话'"  style="width:300px"></input>
		<a href="javascript:void(0);" id="addBtn" onclick="openWindow()" class="easyui-linkbutton">新建客户</a>
		<select name="more" id="more" class="easyui-combobox" style="width:65px">
			<option value="-1">更多</option>
			<option>哈哈</option>
			<option>嘿嘿</option>
			<option>呼呼</option>
		</select>
	</div>
	<div>&emsp;&emsp;</div>
	<div id="xx">
		<div id="kong">&emsp;&emsp;</div>
		<span class="tx1">已选中</span>
		<span class="tx1" id="num">

			</span>
		<span class="tx1">项&emsp;&emsp;|</span>
		<span class="tx1">&emsp;转移&emsp;&emsp;导出选中&emsp;&emsp;放入公海&emsp;&emsp;</span>
		<span class="tx1" onclick="deletedata()">删除</span>
		<span class="tx1">&emsp;&emsp;锁定&emsp;&emsp;解锁&emsp;&emsp;添加团队成员&emsp;&emsp;移除全队成员</span>
	</div>
	<div>
		<table id="dg"></table>
	</div>
</div>
</body>

<script type="text/javascript">

	//给搜索框建立点击事件
	function search() {
		var word=$("#ss").val();
		loadData(0,"manage/customer/listCustomerByWord?word="+word);
	}

	//给选中条数赋值
	var num=0;

	//给第一次分页查询id赋值
	var id=0;
	//获取请求头的参数id，通过id查询，id=0分页查询，id！=0单条查询
	if('${param.id}'){
		id='${param.id}';
	}

	/*分页查询*/
	function loadData(id,url){
		$("#dg").datagrid({
			url:url,
			toolbar:"#tb",//设置工具条
			striped:true,//将行的展示条纹化
			nowrap:false,//设置内容过多时是否换行，false是换行，true是不换行
			loadMsg:"正在加载，请稍等.....",//设置加载数据时的提示信息
			pagination:true,//设置显示分页工具条
			rownumbers:true,//设置是否显示行号
			/*singleSelect:true,//设置是否只能选中一行*/
			pageNumber:1,//设置起始页码
			pageSize:5,//设置每页展示的条数
			pageList:[5,10,15],//设置每页展示展示的条数的下拉列表

			singleSelect: false, //允许选择多行
			selectOnCheck: true,//true勾选会选择行，false勾选不选择行, 1.3以后有此选项。重点在这里
			checkOnSelect: true, //true选择行勾选，false选择行不勾选, 1.3以后有此选项

			columns:[[
				//字段名。标题名。宽
				{field:"id",checkbox:"true"},//加复选框
				{field:"name",title:"客户名称"},
				{field:"transactionStatus",title:"成交状态"},
				{field:"tel",title:"电话"},//taxOrganId
				{field:"phone",title:"手机"},//industryId
				{field:"nextContectTime",title:"下次联系时间"},
				{field:"creator",title:"创建人"},
				{field:"updateTime",title:"更新时间"},
				{field:"createTime",title:"创建时间"},
				{field:"leader",title:"负责人"},
				{field:"remarks",title:"备注"},
				{field:"customerLevel",title:"客户级别"},
				{field:"customerSource",title:"客户来源"},
				{field:"customerIndustry",title:"客户行业"},
				{field:"deleteStatus",title:"状态"}
			]],onCheck:function(rowIndex,rowData){//选中一行行数加一
				/*num=num+1;
				$("#num").text(num)*/
				$("#num").text($('#dg').datagrid('getChecked').length)
			},onUncheck:function () {//取消选中一行行数减一
				/*	num=num-1;
                    $("#num").text(num)*/

				$("#num").text($('#dg').datagrid('getChecked').length)
			},queryParams:{//传参
				"id":id
			},onCheckAll:function(){
				$("#num").text($('#dg').datagrid('getChecked').length)
			},onUncheckAll:function(){
				$("#num").text($('#dg').datagrid('getChecked').length)
			}

		});

		var pager=$('#dg').datagrid().datagrid('getPager');// get the pager of datagrid
		pager.pagination({
			displayMsg:'显示 {from} 到 {to}  共{total}记录 ',onBeforeRefresh:function(){
				loadData(0,"manage/customer/listCustomerByPage");
				return true;
			},showPageList:true,links:2,beforePageText:'第',afterPageText:'页'
		});

	}
	loadData(id,"manage/customer/listCustomerByPage");

	//$("#num").text(num)//获取到最后选中行数的数量
	$("#num").text($('#dg').datagrid('getChecked').length)

	//跳转到添加页面
	function openWindow(){
		window.open(
				'jsp/customer/add1.jsp', '新建客户', 'height=600, width=750, top=100, left=400, toolbar=no, menubar=no, scrollbars=yes, resizable=false'
		);
	}


	//批量删除
	function deletedata() {
		//返回选中多行
		var selRow = $('#dg').datagrid('getSelections')
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
				/*alert(temID);*/
				//提交
				$.ajax({
					type: "POST",
					async: false,
					url: "manage/customer/delCustomer?id=" + temID,
					data: temID,
					success: function (result) {
						if (result) {

							$.messager.alert("提示", "恭喜您，信息删除成功！", "info");
							loadData(0);
							// num=0
							// $("#num").text(num)
							$("#num").text($('#dg').datagrid('getChecked').length)
						} else {
							$.messager.alert("提示", "删除失败，请重新操作！", "info");

						}
					}
				});
			});

		}
	};



</script>
</html>