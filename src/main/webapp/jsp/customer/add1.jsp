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
                <td><input class="easyui-textbox"  type="text" name="name" placeholder="客户名称" data-options="required:true,validType:['name','minLength[2]']" style="width:300px;height: 40px;"/></td>
            </tr>
            <tr>
                <td>电话</td>
                <td>手机</td>
            </tr>
            <tr>
                <td><input class="easyui-textbox"  type="text" name="tel"  placeholder="电话"   data-options="required:true,validType:'tel'" style="width:300px;height: 40px;"/></td>
                <td><input class="easyui-textbox" type="text" name="phone"  placeholder="手机"  data-options="required:true,validType:'phone'"  style="width:300px;height: 40px;"/></td>
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
                    <select id="transactionStatus" name="transactionStatus" class="easyui-combobox"  style="width:300px;height: 40px;">
                        <option value="-1">请选择成交状态</option>
                        <option>已成交</option>
                        <option>未成交</option>
                    </select>
                </td>
                <td>
                    <input id="nextContectTime" style="width:300px;height: 40px;" class="easyui-datebox" name="nextContectTime"
                           data-options="prompt:'请选择下次联系时间',editable:false,required:'true',disabled:true,validType:'equaldDate[\'#createTime\']'">
                </td>
            </tr>
            <tr>
                <td>日期时间</td>
                <td colspan="2">备注</td>
            </tr>
            <tr>
                <td>
                    <input id="createTime" style="width:300px;height: 40px;" class="easyui-datebox" name="createTime"
                           data-options="prompt:'请选择创建日期',editable:false,required:'true',onSelect:onSelect">
                </td>
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
       /* var dataString = $('#form1').serialize();*/

            $('#form1').form('submit',{
                url:'manage/customer/addCustomer',
                onSubmit:function(){
                    event.preventDefault();
                    //做验证
                    var isValid = $(this).form('validate');
                    console.log(isValid);
                    if (isValid) {
                        if ($("[name=customerLevel]").val() == "-1") {
                            $.messager.alert("警告", "请选择客户级别");
                            $.messager.progress('close');
                            return false;
                        }
                        if ($("[name=customerSource]").val() == "-1") {
                            $.messager.alert("警告", "请选择客户来源");
                            $.messager.progress('close');
                            return false;
                        }
                        if ($("[name=customerIndustry]").val() == "-1") {
                            $.messager.alert("警告", "请选择客户行业");
                            $.messager.progress('close');
                            return false;
                        }
                        if ($("[name=transactionStatus]").val() == "-1") {
                            $.messager.alert("警告", "请选择成交状态");
                            $.messager.progress('close');
                            return false;
                        }
                }
                    //验证成功，开始提交
                    return $("#form1").form('validate');
                    },
                //提交成功以后的操作
                success: function(data){
                    console.log(data);
                    if(data==-1){
                        $.messager.alert("提示", "新建失败，请重新操作！");
                    }else{
                        $.messager.show("提示","添加成功");
                        window.close();

                        var id=data;
                        //跳转到list页面，显示单条
                        window.opener.location.href = window.opener.location.href+'?id='+id;
                    }
                    //$.messager.progress('close');	// hide progress bar while submit successfully
                }
            });
    })

       /* $.post(
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
                    /!*alert(id);*!/
                    //跳转到list页面，显示单条
                    window.opener.location.href = window.opener.location.href+'?id='+id;

                }
            },
            "json"
        );*/

    function onSelect(date) {  //开始日期选择时触发
        $('#nextContectTime').datebox('enable');	//启用结束日期控件
        $('#nextContectTime').datebox('reset')		//重置结束日期的值
    };


    //表单验证
    $.extend($.fn.validatebox.defaults.rules, {
        equaldDate: {
            validator: function (value, param) {

                var d1 = $(param[0]).datetimebox('getValue');  //获取开始时间
                return value >= d1;  //有效范围为大于开始时间的日期
            },
            message: '下次联系日期不能早于创建日期!'
        },

        isNumber: {
                validator: function (value, param) {
                    return /^-?\d+\.?\d*$/.test(value);
                },
                message: '请输入正确的数字!'
            },
            unique:{
                validator:function(value){
                    //验证payerCode唯一性
                    var flage;
                    function getAjaxReturn(){
                        $.ajax({
                            async:false,//设置同步(有返回值以后，才会进行下面的操作)
                            url:"manage/taxpayer.do",
                            data:{"payerCode":value,"action":"get"},
                            type:"post",
                            success:function(data){
                                //如果重复，返回的是false
                                flage=data.isRepeat;
                                //从外部获取flage值
                            },
                            dataType:"json"
                        });
                        return flage;
                    }
                    return getAjaxReturn();//获得ajax返回值
                },
                message:"编号重复"
            } ,
            minLength:{
                validator:function(value,param){
                    return value.length>=param[0];
                },
                message:"最少输入位{0}字符"
            },
            CHS: {
                validator: function (value, param) {
                    return /^[\u0391-\uFFE5]+$/.test(value);
                },
                message: '请输入汉字'
            },
            tel : {
                validator : function(value) {
                    var reg = /^[0-9]{3,4}(\-{1})[0-9]{7,8}/;
                    return value.length == 12 || value.length == 13 && reg.test(value);},
                message : "请正确填写您的座机电话."
            },
            phone : {
                validator : function(value) {
                    var reg = /^(((13[0-9]{1})|(14[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
                    return value.length == 11 && reg.test(value);},
                message : "请正确填写您的手机号码."
            },
            name : {// 验证姓名，可以是中文或英文
                validator : function(value) {
                    return /^[\u0391-\uFFE5]+$/i.test(value) | /^\w+[\w\s]+\w+$/i.test(value);
                },
                message : '请输入姓名'
            },
            idCode:{
                validator:function(value,param){
                    return /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(value);
                },
                message: '请输入正确的身份证号'
            }


        }
    );

</script>
</html>
