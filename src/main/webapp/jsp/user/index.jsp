<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/24
  Time: 21:42
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
    <link rel="stylesheet" href="static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
    <script type="text/javascript" src="static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="static/easyui/easyui-lang-zh_CN.js"></script>
    <style>
        .container {
            width: 90%;
            height: 500px;
            border: 1px solid grey;
            position: relative;
            margin: 20px auto;
        }

        .header {
            width: 100%;
            height: 80px;
            background: white;
            position: absolute;
            left: 0;
            z-index: 1;
        }

        .header img {
            transform: scale(1.5);
        }

        .left {
            margin-top: 80px;
            width: 15%;
            /*background: rgb(45,48,55);*/
            position: absolute;
            left: 0;
            height: 100%;
        }

        .right {
            width: 85%;
            background: rgb(245, 246, 249);
            position: absolute;
            right: 0;
            height: 100%;
            padding-top: 80px;
        }

        .right h4 {
            background: grey;
        }

        .header_left {
            float: left;
            width: 15%;
            height: 100%;
            text-align: center;
            margin-top: 24px;
        }

        .header_right {
            float: left;
            width: 85%;
            height: 100%;
            margin-top: -10px;
        }

        .header_right li {
            list-style: none;
            float: left;
            margin-left: 40px;
            margin-top: 20px;
        }

        .header_right li a {
            text-decoration: none;
            color: black;
        }

        .header_right li a:hover {
            color: blue;
        }

        #sm li {
            color: rgb(163, 158, 151);
            background: rgb(45, 48, 55);
        }

        #sm {
            background: rgb(69, 78, 87)!important;
        }

        #sm li:nth-of-type(8) {
            background: rgb(69, 78, 87);
            color: white;
        }

        body{
            font-family: "微软雅黑";
        }
        .button{
            width: 70px;
            height: 30px;
            border: solid gainsboro 1px;
            border-radius: 4px;
            text-align: center;
            line-height: 30px;
            display: inline-block;
            cursor: pointer;
        }
        #basic{
            border-left: solid yellowgreen 5px;
            margin-left: 10px;
            margin-top: 30px;
        }
        table{
            margin-left: 30px;
            margin-top: 10px;
            height: 300px;

        }
        .second{
            margin-top: 10px;
        }
        .star{
            color: red;
        }
        .easyui-textbox{
            width: 200px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <div class="header_left">
            <img src="static/img/logo.png">
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

        <div id="sm" class="easyui-sidemenu" ></div>

    </div>
    <div class="right">
        <iframe id="iframe" src="jsp/user/user.jsp" style="width: 100%;height: 100%;"></iframe>

    </div>

</div>



<div id="win" class="easyui-window" title="新建员工"  maximizable=false closed=true resizable=false style="width:600px;height:500px;padding:5px;">
    <div id="basic">&nbsp;&nbsp;基本信息</div>

    <form id="form">
        <table width="500px" >
            <tr >
                <td>
                    <div><span class="star">*</span>手机号（登录名）</div>
                    <div class="second" ><input name="phone" class="easyui-textbox" type="text"/></div>
                </td>
                <td >
                    <div><span class="star">*</span>登录密码</div>
                    <div class="second"><input name="password" class="easyui-textbox" type="text"/></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div><span class="star">*</span>姓名</div>
                    <div class="second"><input name="username" class="easyui-textbox" type="text"/></div>
                </td>
                <td>
                    <div>性别</div>
                    <div class="second">
                        <select  class="easyui-combobox" name="sex" style="width:200px;">
                            <option value="aa" selected>男</option>
                            <option>女</option>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div>邮箱</div>
                    <div><input class="easyui-textbox" name="email" type="text"/></div>
                </td>
                <td>
                    <div><span class="star">*</span>部门</div>
                    <div class="second"><select class="easyui-combobox" name="department" style="width:200px;">
                        <option value="aa" selected>开发部</option>
                        <option>测试部</option>
                        <option>研发部</option>
                        <option>吃瓜不</option>
                    </select></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div>岗位</div>
                    <div><input name="position" class="easyui-textbox"type="text"/></div>

                </td>
                <td>
                    <div>直属上级</div>
                    <div class="second">
                        <select  class="easyui-combobox" name="supervisor" style="width:200px;">
                            <option value="aa" selected>李刚</option>
                            <option>刘达</option>
                            <option>马克</option>
                        </select>
                    </div>
                </td>
            </tr>
            <input type="reset" name="reset" style="display: none;" />

        </table>

        <div>
            <div class="button" id="save" style="margin-left: 400px;">保存</div>
            <div class="button" id="cancel">取消</div>
        </div>

    </form>

</div>
<script type="text/javascript">


   $("#sm").sidemenu({
       data : [{
           state: 'open',
           children: [{
               text: '线索',
               url:'jsp/leads/listTaxPayer.jsp'
           },{
               text: '客户',
               url:'jsp/customer/list.jsp'
           },{
               text: '联系人',
               url:'jsp/contacts/list_contacts.jsp'
           },{
               text: '商机',
               url:'jsp/bussiness/list_business.jsp'
           },{
               text: '合同',
               url:'jsp/contact/index.jsp'
           },{
               text: '产品',
               url:'jsp/product/listProduct.jsp'
           },{
               text: '用户',
               url:'jsp/user/user.jsp'
           }]
       }],onSelect:function (item) {
          $("#iframe").attr('src',item.url+'');
       }
   })



   $(".button").on('mouseover',function(){
       $(this).css("background-color","#95B8E7")
       $(this).css("color","white")
   }).on('mouseleave',function(){
       $(this).css("background-color","white")
       $(this).css("color","black")
   })
   $("#save").on("click",function(){
       $.ajax({
           'url':'system/user/insert',
           'type':'get',
           'async':false,
           'data':$('#form').serialize(),
           'dataType':'json',
           'success':function(data){
               if(data>0){
                   $("#iframe").attr('src','jsp/user/user.jsp?id='+data);
                   $("#win").window('close');
               }
           }
       })

   })
   $("#cancel").on('click',function(){
       $("#form").form('clear');
       $(".easyui-combobox").combobox('setValue','aa')
   })


</script>


</body>
</html>