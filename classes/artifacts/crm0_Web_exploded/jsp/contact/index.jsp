<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%						//获得协议
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>" />
    <title>Title</title>
    <link rel="stylesheet" href="../../static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../static/easyui/themes/icon.css">
    <script type="text/javascript" src="../../static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../../static/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../static/easyui/easyui-lang-zh_CN.js"></script>
    <style>



        .right{
            background:rgb(245,246,249);
            height: 100%;
        }

        .right .right_top{
            height: 80px;
        }

        .right .right_top h4{
            display: inline-block;
            float: left;
            margin-top: 25px;


        }
        .searchbox{
            margin: 20px auto;
            margin-left: 35%;
        }

        .right .right_top button{
            float: right;
            width: 80px;
            height: 30px;
            margin-top: 25px;
            margin-right: 20px;
            color: white;
            background: #00bbee;
            border: none;
            cursor: pointer;
        }
        .right .right_top button:hover{
            background: #dd2bdd;
        }



        .header_right .active a{
            color: #00bbee;
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

        #sm li:nth-of-type(8){
            background: rgb(69,78,87);
            color:white ;
        }

        iframe{
            border: none;
            width: 300px;
            /*display: none;*/

        }

        #dlg{
            width:700px;
            height:500px;
        }
    </style>
</head>
<body>
<!--    <div class="container">-->
<div id="dlg" href="jsp/contact/add.jsp" class="easyui-dialog" title="新建合同"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">

</div>
<%--        <div  src="add.jsp" id="dlg" class="easyui-dialog" title="Basic Dialog" data-options="iconCls:'icon-save'" style="width:400px;height:200px;padding:10px">--%>

<%--        </div>--%>
<!--        <div class="header">-->
<!--            <div class="header_left">-->
<!--                <img src="static/img/logo.png">-->
<!--            </div>-->
<!--            <div class="header_right">-->
<!--                <ul>-->
<!--                    <li><a href="">办公</a></li>-->
<!--                    <li class="active"><a href="">客户管理</a></li>-->
<!--                    <li><a href="">商业智能</a></li>-->
<!--                    <li><a href="">项目管理</a></li>-->
<!--                </ul>-->
<!--            </div>-->
<!--        </div>-->
<!--        <div class="left">-->
<!--            <div style="margin:20px 0;">-->
<!--                <a href="javascript:;" class="easyui-linkbutton" onclick="toggle()">Toggle</a>-->
<!--            </div>-->
<!--            <div id="sm" class="easyui-sidemenu" data-options="data:data"></div>-->

<!--        </div>-->
        <div class="right">
            <div class="right_top">
                <h4>合同管理</h4>
                <input class="easyui-searchbox" name="condition" data-options="prompt:'请输入合同名称'"  style="padding-top: 15px"/>

                <button id="add" class="easyui-linkbutton" onclick="$('#dlg').dialog('open')">添加</button>
            </div>

            <table id="dg"></table>


        </div>

<!--    </div>-->

</body>
<script type="text/javascript">
    $(function () {
loadData();
var param=null;
 var isSingle=false;
$(".searchbox-button").click(function () {
    alert($(".easyui-searchbox").val());
    param=$(".easyui-searchbox").val();
    loadData(param,isSingle);
    //$.removeCookie('isSingle');
});
$("#dlg").dialog({
    onClose:function(){
//alert(123456);
        // if($.cookie('isSingle')!=null){
        //     isSingle=true;
        // };
        isSingle=true;
        alert(isSingle);
        loadData(param,isSingle);
        isSingle=false;
    }
});






    });

    //分页方法
    function loadData(param,isSingle){
        $('#dg').datagrid({
            url:'manage/contract/listByPage',
            queryParams:{
                contactName:param,
                isSingle:isSingle
            },
            toolbar:"#tb",
            striped:true,
            pagination:true,
            singleSelect:true,
            rownumbers:true,
            pageNumber:1,
            pageSize:5,
            pageList:[5,10,15],
            resizable:true,
            columns:[[
                {field:'ck',checkbox:"true"},
                {field:'number',title:'合同编号'},
                {field:'contactname',title:'合同名称'},
                {field:'customername',title:'客户名称'},
                {field:'businessname',title:'商机名称'},
                {field:'ordertime',title:'下单时间',formatter:function (value,row,index) {
                        return new Date(value).getFullYear()+"-"+
                            new Date(value).getMonth()+"-"+
                            new Date(value).getDate();
                    }},
                {field:'contractamount',title:'合同金额'},
                {field:'startingtimecontract',title:'合同开始时间',formatter:function (value,row,index) {
                        return new Date(value).getFullYear()+"-"+
                            new Date(value).getMonth()+"-"+
                            new Date(value).getDate();
                    }},
                {field:'endtimecontract',title:'合同结束时间',formatter:function (value,row,index) {
                        return new Date(value).getFullYear()+"-"+
                            new Date(value).getMonth()+"-"+
                            new Date(value).getDate();
                    }},
                {field:'customercontractor',title:'客户签约人'},
                {field:'companycontractor',title:'公司签约人'},
                {field:'remarks',title:'备注'},
                {field:'founder',title:'创建人'},
                {field:'updatetime',title:'更新时间',formatter:function (value,row,index) {
                        return new Date(value).getFullYear()+"-"+
                            new Date(value).getMonth()+"-"+
                            new Date(value).getDate();
                    }},
                {field:'creationtime',title:'创建时间',formatter:function (value,row,index) {
                        return new Date(value).getFullYear()+"-"+
                            new Date(value).getMonth()+"-"+
                            new Date(value).getDate();
                    }},
                {field:'personincharge',title:' 负责人'}
            ]]
        });
    }

</script>
</html>