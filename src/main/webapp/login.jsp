<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/25
  Time: 9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <base href="<%=basePath%>">
    <title>用户登录</title>
    <link rel="stylesheet" type="text/css" href="static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
    <script type="text/javascript" src="static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
    <style type="text/css">

        #left{
            background-color: lightcyan;
            width: 70%;
            height: 600px;
            float: left;
            background-image: url(static/img/login.png);
            background-position: 100%;

        }
        #right{
            width: 29%;
            height: 600px;
            float: left;
        }
        #warn{
            height: 40px;
            margin: auto;
            color: red;
            visibility: hidden;
        }
        #submit{
            display: inline-block;
            width: 100%;
            background-color:#00AAEE ;
            cursor: pointer;
            border-radius:15px;
            color: white;
            border: 10px white solid;
            height: 60px;
            text-align: center;
            line-height:40px;
        }
        #table{
            margin: auto;
            margin-top: 20px;
            width: 300px;
        }
        #submit:hover{
            background-color:#55AAEE ;
        }
        #copyright{
            font-size:0.1em;
            margin-top: 200px;
            text-align: center;
            color: #DDDBDC;
        }

    </style>
</head>
<body style="margin: 0px;">
<div id="left"></div>
<div id="right">
    <h1 align="center" style="font-family: '微软雅黑'; font-size: 1em;margin-top: 80px;">悟空CRM系统</h1>
    <form id="form">
        <table id="table" height="150px" >
            <tr><td><span id="warn" >请输入正确的用户名和密码</span></td></tr>
            <tr ><td height="50px"><input  id="username" type="text" name="username" /> </td></tr>
            <tr><td height="50px"><input id="password" type="password" name="password" /> </td></tr>
            <tr><td height="50px"><div id="submit">登录</div></td></tr>
        </table>
    </form>

    <p id="copyright">&emsp;&emsp;悟空网, Copyright © 2014 - 2019, 粤ICP备14024044号, All Rights Reserved</p>

</div>
<script>
    $('#username').textbox({
        iconCls:'icon-man',
        iconAlign:'left',
        height:40,
        width:300,
        prompt:'请输入用户名'
    })

    $('#password').textbox({
        iconCls:'icon-lock',
        iconAlign:'left',
        height:40,
        width:300,
        prompt:'请输入密码'
    })

    function keyDown(e) {
        if(e.keyCode==13){
            $("#submit").trigger("click");

        }
    }
    document.onkeydown = keyDown;

    $('#submit').on('click',function(){
        $("#submit").text("正在登录...");
       if(!($("#username").val().trim()&&$("#password").val().trim())){
           $("#warn").css("visibility","display");
       }

       $.post("login",{"username":$("#username").val(),"password":$("#password").val()},function(data){
         if(!data){
              alert("登陆失败！");
             $("#submit").text("登录");
          } else{
              location.href="jsp/user/index.jsp";
          }
       },"json")
    })
</script>
</body>
</html>
