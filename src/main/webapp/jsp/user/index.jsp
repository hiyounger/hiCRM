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

</body>
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
               url:'jsp/contract/list_contract.jsp'
           },{
               text: '产品',
               url:'jsp/product/listProduct.jsp'
           },{
               text: '产品',
               url:'jsp/product/listProduct.jsp'
           },{
               text: '产品',
               url:'jsp/product/listProduct.jsp'
           },{
               text: '产品',
               url:'jsp/product/listProduct.jsp'
           },{
               text: '产品',
               url:'jsp/product/listProduct.jsp'
           },{
               text: '产品',
               url:'jsp/product/listProduct.jsp'
           }]
       }],onSelect:function (item) {
          $("#iframe").attr('src',item.url+'');
       }
   })

</script>
</html>