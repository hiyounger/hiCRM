<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html >
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>添加联系人</title>
    <link rel="stylesheet" href="static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
    <script type="text/javascript" src="static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
    <script src="static/easyui/easyui-lang-zh_CN.js"></script>
    <style>
        #d1{
            font-size: x-large;
            margin-left: 150px;
        }
        #d2{
            font-size: large;
            margin-left: 160px;
        }
        #d11{
            height: 40px;
        }
        #d4{
            width: 100%;
            height: 30px;
        }
        #d41{
            float: right;
            width: 30%;
            height: 30px;
        }
    </style>
</head>
<body>
<div id="d0">
    <div id="d1">新建联系人</div>
    <div id="d11"></div>
    <div id="d2"> <img src="static/easyui/themes/black/images/slider_handle.png" />&ensp;基本信息</div>
</div>
<br />
<div id="d3">
    <form id="form1">
    <table width="80%" align="center">
        <tr class="tt">
            <td>是否关键决策人</td>
            <td>姓名</td>
        </tr>
        <tr>
            <td>
                <select name="isKeyMaker" class="easyui-combobox"  style="width:300px;height: 40px;">
                    <option value="">请选择</option>
                    <option value="是">是</option>
                    <option value="否">否</option>
                </select>
            </td>
            <td><input id="name" class="easyui-textbox"  type="text" name="name" style="width:300px;height: 40px;"/></td>
        </tr>
        <tr>
            <td>客户名称</td>
            <td>手机</td>
        </tr>
        <tr>
            <td><input class="easyui-textbox"  type="text" name="customerName" style="width:300px;height: 40px;"/></td>
            <td><input class="easyui-textbox" type="text" name="telephone" style="width:300px;height: 40px;"/></td>
        </tr>
        <tr>
            <td>电话</td>
            <td>电子邮箱</td>
        </tr>
        <tr>
            <td><input class="easyui-textbox" type="text" name="phone" style="width:300px;height: 40px;"/></td>
            <td><input class="easyui-textbox" type="text" name="email" style="width:300px;height: 40px;"/></td>
        </tr>
        <tr>
            <td>职务</td>
            <td>地址</td>
        </tr>
        <tr>
            <td><input class="easyui-textbox" type="text" name="job" style="width:300px;height: 40px;"/></td>
            <td><input class="easyui-textbox" type="text" name="address" style="width:300px;height: 40px;"/></td>
        </tr>
        <tr>
            <td>下次联系时间</td>
            <td>性别</td>
        </tr>
        <tr>
            <td><input type="text"  class="easyui-datetimebox" name="nextContactTime" data-options="prompt:'请选择日期'" style="width:300px;height: 40px;"></td>
            <td>
                <select class="easyui-combobox" name="sex" style="width:300px;height: 40px;">
                    <option value="">请选择</option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2">备注</td>
        </tr>
        <tr>
            <td colspan="2"><input class="easyui-textbox" name="remarks" data-options="multiline:true"style="width:95%;height:50px"></td>
        </tr>
    </table>
    </form>
    <div id="d4">
        <div id="d41"><button onclick="addData()">保存</button>&ensp;<button>取消</button></div>
    </div>

</div>

</body>
<script>
    function addData() {
        //使用ajax提交
        $.get(
            "manage/Contacts/add",
            $("#form1").serialize(),
            function(data) {
                if(data){
                    alert("添加成功");
                   window.close();
                   var name=$("#name").val();
                   window.opener.loadData("manage/Contacts/listone?name="+name);
                }else{
                    alert("添加失败");
                }
            },'json')
    }
</script>
</html>
