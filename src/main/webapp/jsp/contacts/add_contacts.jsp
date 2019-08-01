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
                <select id="isKeyMaker" name="isKeyMaker" class="easyui-combobox"  style="width:300px;height: 40px;">
                    <option value="否">请选择(默认否)</option>
                    <option value="是">是</option>
                </select>
            </td>
            <td><input id="name" class="easyui-textbox" data-options="required:true,validType:'CHS'"  type="text" name="name" style="width:300px;height: 40px;"/></td>
        </tr>
        <tr>
            <td>客户名称</td>
            <td>手机</td>
        </tr>
        <tr>
            <td><input class="easyui-textbox" data-options="required:true,validType:'CHS'"  type="text" name="customerName" style="width:300px;height: 40px;"/></td>
            <td><input class="easyui-textbox" data-options="validType:'mobile'" type="text" name="telephone" style="width:300px;height: 40px;"/></td>
        </tr>
        <tr>
            <td>电话</td>
            <td>电子邮箱</td>
        </tr>
        <tr>
            <td><input class="easyui-textbox" data-options="validType:'phone'" type="text" name="phone" style="width:300px;height: 40px;"/></td>
            <td><input class="easyui-textbox" data-options="validType:'email'" type="text" name="email" style="width:300px;height: 40px;"/></td>
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
                <select id="sex" class="easyui-combobox" name="sex" style="width:300px;height: 40px;">
                    <option value="男">请选择性别(默认男)</option>
                    <option value="女">女</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>备注</td>
        </tr>
        <tr>
            <td ><input class="easyui-textbox" name="remarks" data-options="multiline:true"style="width:300px;height:60px"></td>
        </tr>
    </table>
    </form>
    <div id="d4">
        <div id="d41"><button onclick="addData()">保存</button>&ensp;<button onclick="reset()">重置</button></div>
    </div>

</div>

</body>
<script>
    //重置表单的方法
    function reset(){
      $("#form1").form('clear');
        $("#isKeyMaker").combobox('select', '否');
        $("#sex").combobox('select', '男');
    }
    function addData() {
        var name=$("#name").val();

        //get和post是异步的，无法限制，需要原生的ajax请求

                    //使用easyui提交

                    $('#form1').form('submit', {
                        url: "manage/Contacts/add",
                        type: "POST",//方法类型
                        dataType: "json",//预期服务器返回的数据类型
                        onSubmit: function () {
                            return $(this).form('enableValidation').form('validate');
                        },
                        success: function (data) {

                          var map=eval('(' + data+ ')');
                            if (map.success) {
                                    alert("添加成功");
                                    window.close();
                                    window.opener.loadData("manage/Contacts/listone?id=" + map.id);
                                } else {
                                    alert("添加失败");
                                }

                            }

                    });

    }

    //扩展easyui 的表单验证
    $.extend($.fn.validatebox.defaults.rules,{
        //验证汉字
        CHS:{
            validator:function(value){
                return   /^[\u0391-\uFFE5]+$/.test($.trim(value));
            },
            message:'请输入汉字 '
        },

        //验证手机号
        mobile:{
            validator: function(value){
                return   /^1[0-9]{10}$/i.test($.trim(value));
            },
            message:  '手机号码不正确 '
        },
        //验证电话
       phone:{
            validator: function(value){
                return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
            },
            message:  '电话号码不正确，请使用下面格式:xxx-xxxxxxxx '
        },
        //验证身份证号
        idcard:{
            validator: function(value){
                return   /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value);
            },
            message:  '身份证号码格式不正确 '
        }

    })
</script>
</html>
