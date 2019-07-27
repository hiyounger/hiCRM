<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%						//获得协议
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>

<html>
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>" />
    <title>Basic Form - jQuery EasyUI Demo</title>
    <link rel="stylesheet" href="../../static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../static/easyui/themes/icon.css">
    <script type="text/javascript" src="../../static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../../static/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../static/easyui/easyui-lang-zh_CN.js"></script>

    <style>
        h5{
            font-size: 12px;
        }
        h5 span{
            background: blue;
            display: inline-block;
            width: 4px;
            margin-right: 8px;
            height: 12px;
        }
        td div{
            margin-bottom: 4px;
        }
    </style>
</head>
<body>
<%--<h4>新建合同</h4>--%>

<div style="margin:20px 0;"></div>
<div class="easyui-panel" title="<h5><span> </span>基本信息</h5>" style="width:800px">
    <div style="padding:10px 60px 20px 60px">
        <form id="ff" method="post">
            <table cellpadding="5">
                <tr>
                    <td>
                        <div>合同编号</div>
                        <input class="easyui-textbox" type="text" name="number" data-options="required:true,validType:'number'" ></input>
                    </td>
                    <td>
                        <div>合同名称</div>
                        <input class="easyui-textbox" type="text" name="contactname" data-options="required:true"></input>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div>客户名称</div>
                        <input class="easyui-textbox" type="text" name="customername" data-options="required:true" placeholder="+添加"></input>
                    </td>
                    <td>
                        <div>商机名称</div>
                        <input class="easyui-textbox" type="text" name="businessname"></input>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div>下单时间</div>
                        <input class="easyui-textbox" type="date" name="ordertime"></input>
                    </td>
                    <td>
                        <div>合同金额</div>
                        <input class="easyui-textbox" type="text" name="contractamount"></input>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div>合同开始时间</div>
                        <input class="easyui-textbox" type="date" name="startingtimecontract"></input>
                    </td>
                    <td>
                        <div>合同结束时间</div>
                        <input class="easyui-textbox" type="date" name="endtimecontract"></input>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div>客户签约人</div>
                        <input class="easyui-textbox" type="text" name="customercontractor" ></input>
                    </td>
                    <td>
                        <div>公司签约人</div>
                        <input class="easyui-textbox" type="text" name="companycontractor"></input>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div>备注</div>
                        <input class="easyui-textbox" type="text" name="remarks"></input>
                    </td>
                    <td></td>
                </tr>
            </table>
        </form>
        <div style="text-align:center;padding:5px">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
        </div>
    </div>
</div>
<script>
    function submitForm(){
        //ajax提交
        alert("点击");
        var data1=$("ff").serialize();
        console.log(data1);
        // $.ajax({
        //     type:"post",
        //     url:"manage/contracts/add",
        //     dataType:"json",
        //     contentType:"application/json;charset=UTF-8",
        //     data:data1,
        //     async:false,
        //     success:function (data) {
        //         alert(data);
        //     }
        // });
        $('#ff').form('submit',{
            // contentType: "application/json;charset=UTF-8",
             url:"manage/contract/add",
            onSubmit: function(){
                return $(this).form('enableValidation').form('validate')
                // do some check
                // return false to prevent submit;
            },
            success:function(data){
              //  alert(data);
                   if(data=="1"){
                       //关闭对话框
                       $(".panel-tool-close").click();
                      // $.cookie('isSingle', true, { expires: 1 });
                   }
            },
            dataType:"text"
        });
    }
    function clearForm(){
        $('#ff').form('clear');
    }

    $(function(){
        $.extend($.fn.validatebox.defaults.rules, {
            number : {// 验证数字
                validator : function(value){
                    return /^[0-9]+$/i.test(value);
                },
                message : '请输入数字'
            }
        });

    });
</script>
</body>
</html>