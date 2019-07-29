<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/25
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <base href="<%=basePath%>">
    <title>员工与部门</title>
    <link rel="stylesheet" type="text/css" href="static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
    <script type="text/javascript" src="static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
    <style>
        body{
            padding: 10px;
            background-color: #F5F6F9;
        }
        #top{
            margin-top: 20px;
            margin-left: 20px;
            font-family: "微软雅黑";

        }
        #toolbar{
            background-color: white;
            height: 50px;
            width:100% ;
        }
        #margin-top{
            height: 10px;
        }
        .button{
            display: inline-block;
            color: white;
            font-family: "微软雅黑";
            width: 130px;
            height: 30px;
            cursor: pointer;
            border-radius: 3px;
            line-height: 30px;
            text-align: center;
            font-size: 0.7em;
        }
    </style>

</head>
<body>

<div id="cotainer">
    <p id="top">员工与部门管理</p>




    <div id="toolbar">
        <div id="margin-top"></div>&emsp;
        <input id="search" class="easyui-searchbox" data-options="prompt:'请输入员工名称',searcher:doSearch" ></input>
        <span style="font-family: '微软雅黑'; font-size: 0.7em;margin-left: 50px;" >状态</span>

        <select  id="status" class="easyui-combobox" name="dept" style="width:200px;">

            <option value="-1">请选择</option>
            <option value="1">正常</option>
            <option value="2">离职</option>
            <option value="3">退休</option>
            <option value="4">休假</option>
        </select>
<shiro:hasRole name="system">
    &emsp; &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<div id="new" class="button"  style="background-color: #3E84E9;">新建员工</div>&emsp;
    <div id="remove" class="button" style="background-color: darkgrey" >删除员工</div>&emsp;
    <div id="refresh" class="button" onclick="loadData(0,-1,'')" style="background-color:  #3E84E9;" >刷新页面</div>
</shiro:hasRole>


    </div>

    <div id="pp" style="border:1px solid #ccc"></div>
</div>

<script>
    function doSearch(value){
        loadData(0,$('#status').val(),value)
    }

    var no=false;
    var userId=0;
    var checked;
    if('${param.id}'){
        userId= '${param.id}'
    }




function loadData(id,status,name){
    $('#pp').datagrid({
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
        url:'system/user/list',
        columns:[[
            {field:'ck',checkbox:'true'},
            {field:'name',title:'姓名',width:100},
            {field:'phone',title:'手机号（登录名）',width:140},
            {field:'sex',title:'性别',width:60},
            {field:'email',title:'邮箱',width:240},
            {field:'department',title:'部门',width:120},
            {field:'position',title:'岗位',width:120},
            {field:'supervisor',title:'直属上级',width:120},
            {field:'role',title:'角色',width:146}
        ]],pagination:true,queryParams:{
            "id":id,"status":status,"name":name
        },onCheck:function(){
            if($('#pp').datagrid('getChecked').length>0){
                $("#remove").css("background-color","#3E84E9")
            }else{
                $("#remove").css("background-color","darkgrey")
            }
        },onUncheck:function(){
            if($('#pp').datagrid('getChecked').length>0){
                $("#remove").css("background-color","#3E84E9")
            }else{
                $("#remove").css("background-color","darkgrey")
            }
        },onCheckAll:function(){
            if($('#pp').datagrid('getChecked').length>0){
                $("#remove").css("background-color","#3E84E9")
            }else{
                $("#remove").css("background-color","darkgrey")
            }
        },onUncheckAll:function(){
            if($('#pp').datagrid('getChecked').length>0){
                $("#remove").css("background-color","#3E84E9")
            }else{
                $("#remove").css("background-color","darkgrey")
            }
        },onLoadSuccess:function(data){
            if (data.total == 0) {
                no=true

                //添加一个新数据行，第一列的值为你需要的提示信息，然后将其他列合并到第一列来，注意修改colspan参数为你columns配置的总列数
                //隐藏分页导航条，这个需要熟悉datagrid的html结构，直接用jquery操作DOM对象，easyui datagrid没有提供相关方法隐藏导航条
                $(this).closest('div.datagrid-wrap').find('div.datagrid-pager').hide();
                $(this).datagrid('appendRow', { name: '<div style="text-align:center;color:red">没有相关记录！</div>' }).datagrid('mergeCells', { index: 0, field: 'name', colspan:8 })
                $("input[type='checkbox']")[0].style.display='none'
                $("input[name='ck']")[0].style.display='none'
                $("input[name='ck']").on('click',function () {
                    $('#pp').datagrid('unselectAll');
                })
            }
            //如果通过调用reload方法重新加载数据有数据时显示出分页导航容器
            else $(this).closest('div.datagrid-wrap').find('div.datagrid-pager').show();
        }
    });
    var pager=$('#pp').datagrid().datagrid('getPager');// get the pager of datagrid
    pager.pagination({
        displayMsg:'共{total}条   从 {from}条   到   {to}条 ',onBeforeRefresh:function(){
            loadData(0,-1,'');
            $("#remove").css("background-color","darkgrey")
            return true;
        },showPageList:true,links:2,beforePageText:'前往',afterPageText:'页'
    });
    $("#remove").css("background-color","darkgrey")
}



    loadData(userId,-1,"")
    $("#new").on('click',function () {
        parent.$('#win').window('open');
    })
    $("#remove").on('click',function () {
        checked=$('#pp').datagrid('getChecked');
        if(checked.length==0||no){
            return;
        }
        $.messager.defaults.cancel='取消';
        $.messager.defaults.ok='确定'
        $.messager .confirm('确认', '您确定要删除这'+checked.length+'位用户?', function(r){
            if (r){
                var idArray=new Array()
                $.each(checked,function (i,val) {
                    idArray[i]=val.id
                })
                console.info(checked)
                console.info(idArray)
                $.ajax({
                    url:'system/user/deleteByIds',
                    type:'POST',
                    data:{'ids':JSON.stringify(idArray)},
                    async:true,
                    dataType:'json',
                    success:function(data){
                        if(data>0){
                            $.messager.show({
                                msg:'删除成功',
                                timeout:1000,
                                showType:'null',
                                style:{
                                    right:'',
                                    top:150
                                }
                                ,height:'100',
                                width:'200'
                            });

                            loadData(0,-1,'');
                        }
                    }
                })

            }
        });
    })

</script>
</body>
</html>
