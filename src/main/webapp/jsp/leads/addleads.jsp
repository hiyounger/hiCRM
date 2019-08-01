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
        #d1 {
            font-size: x-large;
            margin-left: 150px;
        }

        #d2 {
            font-size: large;
            margin-left: 160px;
        }

        #d11 {
            height: 40px;
        }


    </style>
</head>
<body>
<div id="d0">
    <div id="d1">新建线索</div>
    <div id="d2">基本信息</div>
</div>
<br/>
<div id="d3">
    <form id="form1">
        <table width="70%" align="center">

            <tr>
                <td>线索来源3</td>
                <td>线索名称</td>
            </tr>
            <tr>
                <td><input class="easyui-textbox" type="text" name="leadsOrgin" style="width:300px;height: 40px;"/></td>
                <td>
                    <input class="easyui-textbox" type="text" name="leadsName"
                           data-options="required:true,invalidMessage:'线索名称已存在！'"
                           validType="remote['manage/leads/getLeadsName.action', 'leadsName']"
                           style="width:300px;height: 40px;"/>
                </td>
            </tr>
            <tr>
                <td>客户行业</td>
                <td>客户级别</td>
            </tr>
            <tr>
                <td><input class="easyui-textbox" type="text" name="customerIndustry"
                           style="width:300px;height: 40px;"/></td>
                <td><input class="easyui-validatebox" type="number" name="customerLevel"
                           style="width:300px;height: 40px;"/></td>
            </tr>
            <tr>
                <td>电话</td>
                <td>日期时间</td>
            </tr>
            <tr>
                <td><input class="easyui-textbox" validType='mobileNum' name="mobil" data-options="required:true"
                           style="width:300px;height: 40px;"/></td>
                <%-- <td><input class="easyui-datebox"  name="createTime" style="width:300px;height: 40px;"/></td>--%>

                <%-------------==================================--%>
                <td>
                    <input id="startdate" style="width:300px;height: 40px;" class="easyui-datebox" name="createTime"
                           data-options="prompt:'请选择开始日期',editable:false,required:'true',onSelect:onSelect">
                </td>

            </tr>
            <tr>
                <td>手机</td>
                <td>部门</td>
            </tr>
            <tr>
                <td><input class="easyui-textbox" validType='phoneNum' name="telephone" data-options="required:true"
                           style="width:300px;height: 40px;"/></td>
                <td><input type="text" class="easyui-textbox" name="department" style="width:300px;height: 40px;"></td>

            </tr>

            <tr>
                <td>地址</td>
                <td>下次联系时间</td>
            </tr>
            <tr>
                <td><input class="easyui-textbox" type="text" name="address" style="width:300px;height: 40px;"/></td>
                <%--               <input class="easyui-datebox"  name="nextContactTime"  style="width:300px;height: 40px;"/>--%>
                <%--++++++++++++++++++++++++++++++++++++--%>
                <td><input id="enddate" style="width:300px;height: 40px;" class="easyui-datebox" name="nextContactTime"
                           data-options="prompt:'下次联系时间',editable:false,required:'true',disabled:true,validType:'equaldDate[\'#startdate\']'">
                </td>
            </tr>

            <tr>
                <td colspan="2">备注</td>
            </tr>

            <tr>
                <td colspan="2"><input class="easyui-textbox" name="remark" data-options="multiline:true"
                                       style="width:620px;height:50px"></td>
            </tr>


        </table>

    </form>
    <div id="d4">
        <button onclick="save()"
                style="margin-left: 500px;background-color:deepskyblue;color:white;width:70px;height:40px;border-radius: 10%">
            保存
        </button>
        <button onclick="reset()"
                style="background-color:deepskyblue ;color: white;width: 70px;height:40px;border-radius: 10%"
                type="reset" value="取消">取消
        </button>

    </div>

</div>

</body>
<script>
  /*清空form表单*/
    function reset() {

        $("#form1").form('clear');
    }
  /*添加线索*/
    function save() {
        $('#form1').form('submit', {
            url: "manage/leads/addleadsSingle.action",
            onSubmit: function () {
                //表单验证
                return $(this).form('enableValidation').form('validate');
            },
            success: function (data) {
                if (data) {
                    // alert(data)
                    var id = data;
                    window.close();
                    window.opener.loadData("manage/leads/list.do?id=" + id);
                }

            }

        })


    }

/*验证手机号码*/
    $(function () {
        $.extend($.fn.validatebox.defaults.rules, {
            phoneNum: { //验证手机号
                validator: function (value, param) {
                    return /^1[3-8]+\d{9}$/.test(value);
                },
                message: '请输入正确的手机号码。'
            },

            mobileNum: { //既验证手机号，又验证座机号
                validator: function (value, param) {
                    return /(^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)|(^((\d3)|(\d{3}\-))?(1[358]\d{9})$)/.test(value);
                },
                message: '请输入正确的电话号码。'
            }
        })


    })

    function onSelect(date) {  //开始日期选择时触发
        $('#enddate').datebox('enable');	//启用结束日期控件
        $('#enddate').datebox('reset')		//重置结束日期的值
    };
    $.extend($.fn.validatebox.defaults.rules, {
        equaldDate: {
            validator: function (value, param) {
                // alert("valued===============" + value);
                // alert("parsfdasfddsa" + param)
                var d1 = $(param[0]).datetimebox('getValue');  //获取开始时间
                return value >= d1;  //有效范围为大于开始时间的日期
            },
            message: '下次联系日期不能早于开始日期!'
        }
    })


</script>
</html>
