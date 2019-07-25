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
        #new{
            display: inline-block;
            background-color: #3E84E9;
            color: white;
            font-family: "微软雅黑";
            width: 90px;
            height: 30px;
            cursor: pointer;
            border-radius: 3px;
            line-height: 30px;
            text-align: center;
            font-size: 0.7em;
            margin-left: 280px;
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

        <select  id="cc" class="easyui-combobox" name="dept" style="width:200px;">

            <option value="aa">请选择</option>
            <option>bitem2</option>
            <option>bitem3</option>
            <option>ditem4</option>
            <option>eitem5</option>
        </select>
<shiro:hasRole name="system">
    <div id="new">新建员工</div>
</shiro:hasRole>


    </div>

    <script>
        function doSearch(value){
            alert('You input: ' + value);
        }
    </script>





    <div class="easyui-pagination" style="border:1px solid #ccc" data-options="
		total: 114,
		buttons: [{
			iconCls:'icon-add',
			handler:function(){alert('add')}
		},'-',{
			iconCls:'icon-save',
			handler:function(){alert('save')}
		}]">
    </div>
</div>
</body>
</html>
