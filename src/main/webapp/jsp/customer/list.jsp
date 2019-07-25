<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%						//获得协议
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Title</title>
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
	<style>
		.container{
			width: 90%;
			height: 500px;
			border:1px solid grey;
			position: relative;
			margin: 20px auto;
		}
		.header{
			width: 100%;
			height: 80px;
			background: white;
			position: absolute;
			left: 0;
			z-index: 1;
		}
		.header img{
			transform: scale(1.5);
		}

		.left{
			width: 15%;
			/*background: rgb(45,48,55);*/
			position: absolute;
			left: 0;
			height: 100%;

		}
		.right{
			width: 85%;
			background:rgb(245,246,249);
			position: absolute;
			right: 0;
			top:20px;
			height: 100%;
			padding-top: 80px;
		}
		.right h4{

		}

		.header_left{
			float: left;
			width: 15%;
			height: 100%;
			text-align: center;
			margin-top: 24px;
		}

		.header_right{
			float: left;
			width: 85%;
			height: 100%;
			margin-top: -10px;
		}

		.header_right li{
			list-style: none;
			float: left;
			margin-left: 40px;
			margin-top: 20px;
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

		#sm{
			background: rgb(69,78,87)!important;
		}
		#sm li:nth-of-type(8){
			background: rgb(69,78,87);
			color:white ;
		}
        #addBtn{
            margin-left: 300px;
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
        #tx1{
            margin-top: -15px;
            margin-left: 20px;
            font-size: smaller;
            color: #5f5f5f;
        }
        #tx2{
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
<div class="container">
	<div class="header">
		<div class="header_left">
			<img src="img/logo.png">
		</div>
		<div class="header_right">
			<ul>
				<li><a href="">办公</a></li>
				<li><a href="">客户管理</a></li>
				<li><a href="">商业智能</a></li>
				<li><a href="">项目管理</a></li>
			</ul>
		</div>
	</div>
	<div class="left">
		<div style="margin:20px 0;">
			<a href="javascript:;" class="easyui-linkbutton" onclick="toggle()">Toggle</a>
		</div>
		<div id="sm" class="easyui-sidemenu" data-options="data:data"></div>

	</div>
	<div class="right">
        <div id="xs">
            <span id="tx">客户管理 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</span>
            <input id="ss" class="easyui-searchbox" data-options="prompt:'请输入客户名称/手机/电话'" style="width:300px"></input>
			<a href="javascript:void(0);" id="addBtn" class="easyui-linkbutton">新建客户</a>
            <select name="more" id="more" class="easyui-combobox" style="width:65px">
                <option value="-1">更多</option>
                <option value="1">哈哈</option>
                <option value="1">嘿嘿</option>
                <option value="1">呼呼</option>
            </select>
        </div>
        <div>&emsp;&emsp;</div>
        <div id="xx">
            <div id="kong">&emsp;&emsp;</div>
            	<span id="tx1">已选中x项&emsp;&emsp;|</span>
                <span id="tx2">&emsp;转移&emsp;&emsp;导出选中&emsp;&emsp;放入公海&emsp;&emsp;删除&emsp;&emsp;锁定&emsp;&emsp;解锁&emsp;&emsp;添加团队成员&emsp;&emsp;移除全队成员</span>
        </div>
        <div>
            <table id="dg"></table>
        </div>
	</div>

</div>
<div id="topWindow"></div>
</body>

<script type="text/javascript">

    $('#ss').searchbox({
        searcher:function(value,name){
            alert(value + "," + name)
        },
        prompt:'请输入客户名称/手机/电话'
    });

	var data = [{
		text: '',
		iconCls: 'fa fa-wpforms',
		state: 'open',
		children: [{
			text: '快速访问 >'
		},{
			text: '仪表盘'
		},{
			text: '代办事项'
		},{
			text: '线索'
		},{
			text: '客户',content:"客户"
		},{
			text: '联系人'
		},{
			text: '公海'
		},{
			text: '商机'
		},{
			text: '合同'
		},{
			text: '回款'
		},{
			text: '产品'
		}]
	}];


	/*分页查询*/
    function loadData(){
        $("#dg").datagrid({
            url:"customer/listCustomerByPage",
            toolbar:"#tb",//设置工具条
            striped:true,//将行的展示条纹化
            nowrap:false,//设置内容过多时是否换行，false是换行，true是不换行
            loadMsg:"正在加载，请稍等.....",//设置加载数据时的提示信息
            pagination:true,//设置显示分页工具条
            rownumbers:true,//设置是否显示行号
            singleSelect:true,//设置是否只能选中一行
            pageNumber:1,//设置起始页码
            pageSize:5,//设置每页展示的条数
            pageList:[5,10,15],//设置每页展示展示的条数的下拉列表
            columns:[[
                //字段名。标题名。宽
                {field:"ck",checkbox:"true"},//加复选框
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
            ]]

        });
    };
    loadData();

    //跳转到添加页面
	//添加按钮
	$("#addBtn").on("click",function(e){
		window.open(
			'add1.jsp', '新建客户', 'height=600, width=750, top=100, left=400, toolbar=no, menubar=no, scrollbars=yes, resizable=no, location=no, status=no'
		);
	})

</script>
</html>