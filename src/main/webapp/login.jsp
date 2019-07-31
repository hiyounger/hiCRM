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
    <script type="text/javascript" src="static/js/validator.js"></script>
    <style type="text/css">

        #left{
            background-color: lightcyan;
            width: 70%;
            height: 625px;
            float: left;
            border: none;
            /*background-image: url(static/img/login.png);*/
            /*background-position: center;*/

        }
        #left .bgImg{
            width: 100%;
            height: 100%;
            border: none;
        }
        #right{
            width: 30%;
            height: 625px;
            float: left;
            /*background: linear-gradient(to bottom, #50baff, #b4ddfd);*/
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
            /*border: 10px #00AAEE  solid;*/
            height: 40px;
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
            font-size:0.4em;
            /*margin-top: 200px;*/
            text-align: center;
            color: #807e7f;
            /*background: red;*/
            position: absolute;
            bottom: 0;
            height: 20px;
            left: 30%;
        }
        td {
            padding-bottom: 24px;
        }


    </style>
</head>
<body style="margin: 0px;background: #b4ddff;">
<div id="left">
    <img class="bgImg" src="static/img/login.png" ></img>
</div>
<div id="right">
    <h1 align="center" style="font-family: '微软雅黑';margin-top:190px; font-size: 1em;margin-top: 80px;">悟空CRM系统</h1>
    <form id="form" method="post" onsubmit='prevent(this)'>
        <table id="table" height="150px" >
            <tr><td><span id="warn"  style="visibility: hidden">请输入正确的用户名和密码</span></td></tr>
            <tr ><td height="50px"><input id="phone" type="text" name='phone'/> </td></tr>
            <tr><td height="50px"><input id="password" type="password" name="password"  /> </td></tr>
            <tr><td height="50px"><div id="submit">登录</div></td></tr>
        </table>
        <input style="display: none" type="submit" id="fake_submit">
    </form>


</div>
<p id="copyright">&emsp;&emsp;悟空网, Copyright © 2014 - 2019, 粤ICP备14024044号, All Rights Reserved</p>

<script>
    var t=1;
    var timer1=null;

   $("#right").hover(function () {
       timer1=setInterval(function () {
           t++;
           //document.title=t;
           $(this).css({"background":"linear-gradient(to right,"+"rgb(223,22,"+t+")"+",white)"});
       },100);

   },function () {
       $(this).css({"background":""});
   });


    $('#phone').textbox({
        iconCls:'icon-man',
        iconAlign:'left',
        height:40,
        width:300,
        prompt:'请输入用户名(手机号)'
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

    function validate_phone(field,alerttxt)
    {
        with (field)
        {
            if (/^(13|15|18)\d{9}$/i.test($('#phone').val()))
            {
                $("#warn").css("visibility","hidden");
                return true
            }else{
                $("#warn").css("visibility","visible");
                $("#warn").text(alerttxt);
                return false
            }

        }
    }

    function validate_password(field,alerttxt)
    {
  //出现了闭包问题 局部变量不能在if体内部访问 解决办法 可以设置全局变量value或者不使用局部变量value
        //var value=$('input[type=password]').val();
        with (field)
        {
            var reg1=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
            if (reg1.test($('input[type=password]').val()))
            {
                $("#warn").css("visibility","hidden");
                return true
            }else{
                $("#warn").css("visibility","visible");
                $("#warn").text(alerttxt);
                return false
            }

        }
    }
    function validate_form(thisform)
    {
        with (thisform)
        {
            if (validate_phone(phone,"请输入正确的手机号")&&validate_password(password,"请输入正确的密码（6-16位字母或数字）")){
                return true;
            }else{
                return false;
            }

        }
    }
    function prevent(subject){
        event.preventDefault()
        return validate_form(subject)
    }

    $('#submit').on('click',function(){
       var isCorrect= validate_form($('#form'))
        if(!isCorrect){
            return;
        }
       /*if(!($("#phone").val().trim()&&$("#password").val().trim())){
           $("#warn").css("visibility","display");
       }*/

       $.post("login",$("#form").serialize(),function(data){
         if(data){
              location.href="jsp/user/index.jsp";
          }else{
             $("#warn").css("visibility","visible");
             $("#warn").text("用户名或密码错误");
         }
           $("#submit").text("登录");
       },"json")
    })

    window.setTimeout (function(){ $('#phone')[0].focus();},0 );

</script>
</body>
</html>
