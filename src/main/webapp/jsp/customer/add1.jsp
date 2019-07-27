<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html >
<% request.getScheme();%>
<%
       String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>添加客户</title>
    <link rel="stylesheet" href="static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
    <script type="text/javascript" src="static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
    <script src="static/easyui/easyui-lang-zh_CN.js"></script>
    <style>
        #d1{
            font-size: large;
            margin-left: 50px;
        }
        #d2{
            font-size: medium;
            margin-left: 60px;
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
        #a{
            color: #00bbee;
            font-weight: bolder;
        }
        #d3{
            width: 100%;
            height: 10px;
        }
    </style>
</head>
<body>

<div id="d0">
    <form id="form1">
        <table width="80%" align="center">
            <tr>
                <div id="d1">新建客户</div>
                <div id="d11"></div>
                <div id="d2"> <span id="a">|&emsp;</span>基本信息</div>
                <div id="d3"></div>
            </tr>


            <tr class="tt">
                <td>客户级别</td>
                <td>客户名称</td>
            </tr>
            <tr>
                <td>
                    <select name="customerLevel" class="easyui-combobox"  style="width:300px;height: 40px;">
                        <option value="-1">请选择客户级别</option>
                        <option>青铜</option>
                        <option>白银</option>
                        <option>黄金</option>
                        <option>钻石</option>
                    </select>
                </td>
                <td><input class="easyui-textbox"  type="text" name="name" placeholder="客户名称" style="width:300px;height: 40px;"/></td>
            </tr>
            <tr>
                <td>电话</td>
                <td>手机</td>
            </tr>
            <tr>
                <td><input class="easyui-textbox"  type="text" name="tel"  placeholder="电话" style="width:300px;height: 40px;"/></td>
                <td><input class="easyui-textbox" type="text" name="phone"  placeholder="手机" style="width:300px;height: 40px;"/></td>
            </tr>
            <tr>
                <td>客户来源</td>
                <td>客户行业</td>
            </tr>
            <tr>
                <td>
                    <select class="easyui-combobox" name="customerSource" style="width:300px;height: 40px;">
                        <option value="-1">请选择客户来源</option>
                        <option>上门推销</option>
                        <option>多媒体</option>
                        <option>广告</option>
                        <option>会展</option>
                    </select>
                </td>
                <td>
                    <select class="easyui-combobox" name="customerIndustry" style="width:300px;height: 40px;">
                        <option value="-1">请选择客户行业</option>
                        <option>房地产</option>
                        <option>汽车</option>
                        <option>电商</option>
                        <option>实体</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>成交状态</td>
                <td>下次联系时间</td>
            </tr>
            <tr>
                <td>
                    <select name="transactionStatus" class="easyui-combobox"  style="width:300px;height: 40px;">
                        <option value="-1">请选择成交状态</option>
                        <option>已成交</option>
                        <option>未成交</option>
                    </select>
                </td>
                <td><input class="easyui-datebox"   name="nextContectTime" placeholder="下次联系时间" style="width:300px;height: 40px;"/></td>
            </tr>
            <tr>
                <td>日期时间</td>
                <td colspan="2">备注</td>
            </tr>
            <tr>
                <td><input class="easyui-datebox"   name="createTime" placeholder="日期时间" style="width:300px;height: 40px;"/></td>
                <td colspan="2"><input class="easyui-textbox" name="remarks" data-options="multiline:true" style="width:300px;height:50px"></td>
            </tr>
        </table>
    </form>
    <div id="d4">
        <div id="d41">
            <button id="submit">保存</button>&ensp;
            <button id="reset">取消</button>
        </div>
    </div>

</div>

</body>
<script>

    //为重置按钮设置点击事件
    $("#reset").on("click",function(){
        $("#form1").form('clear');
        $(".easyui-combobox").combobox('setValue','-1')
    })


    $("#submit").on("click",function(){
        var dataString = $('#form1').serialize();

        $.post(
            "manage/customer/addCustomer",
            dataString,
            function(data){
                if(data==-1){
                    $.messager.alert("提示", "新建失败，请重新操作！", "info");
                }
                else {
                    //添加成功
                    window.close();
                    var id=data;
                    alert(id);
                    //跳转到list页面，显示单条
                    window.opener.location.href = window.opener.location.href+'?id='+id;

                }
            },
            "json"
        );

    })
</script>
</html>
