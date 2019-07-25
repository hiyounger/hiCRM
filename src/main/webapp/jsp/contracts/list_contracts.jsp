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
    <title>联系人列表</title>
    <link rel="stylesheet" href="static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
    <script type="text/javascript" src="static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
    <script src="static/easyui/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
        body{
            background-color: gainsboro;
        }

        #d1{
            width: 100%;
            height: 60px;
            font-size:x-large;

        }
        #d2{
            margin-left: auto;
            margin-right: auto;
            width: 95%;
            height: 500px;


        }
        #img1,#img2{
            width: 15px;
            height: 15px;
        }
        #bt1{
            float: right;
        }
    </style>
    <script>

        //打开添加窗口
        function addContracts(){
           window.open(
               'cns/add.cns',
               '联系人添加页面',
               'height=600, width=800, top=100, left=350, toolbar=no, menubar=no, scrollbars=yes, resizable=no, location=no, status=no'
           )
        }

        function loadData(){
            $("#dg").datagrid({
                url:"cns/list",
                checkOnSelect:true,
                pagination:true,
                pageSize:4,
                pageList:[2,4,6,8],
                singleSelect:false,checkOnSelect: true, selectOnCheck: true,
                rownumbers:true,
                striped:true,
                frozenColumns:[[
                    {field:'id',checkbox:true,width:20},
                    {field:'name',title:'姓名',width:100},
                    {field:'customerName',title:'客户名称',width:100},
                ]],
                columns:[[

                    {field:'telephone',title:'手机',width:120},
                    {field:'phone',title:'电话',width:120},
                    {field:'email',title:'电子邮箱',width:120},
                    {field:'job',title:'职务',width:100},
                    {field:'address',title:'地址',width:180},

                    {field:'nextContactTime',title:'下次联系时间',width:240},
                    {field:'remarks',title:'备注',width:180},
                    {field:'creater',title:'创建人',width:100},
                    {field:'updateTime',title:'更新时间',width:240},
                    {field:'removeState',title:'操作',formatter: function(value,row,index){
                            return "<a href='javascript:updateData(\""+row.id+"\");'>修改</a>&emsp;"
                        }
                    }

                ]]
            })
        }
        function updateData(id) {
            alert(id);
        }

        $(function(){
            loadData();

            $('#topWindow').window({
                onBeforeClose: function () { //当面板关闭之前触发的事件
                    if (confirm('窗口正在关闭，请确认您当前的操作已保存。\n 是否继续关闭窗口？')) {
                        loadData();
                        $('#topWindow').window('close', true); //这里调用close 方法，true 表示面板被关闭的时候忽略onBeforeClose 回调函数。

                    } else
                        alert("欢迎回来");
                        return false;

                }


            });
        })

        function deleteData(){
            //返回选中多行
            var selRow = $('#dg').datagrid('getSelections')
            //判断是否选中行
            if (selRow.length==0) {
                $.messager.alert("提示", "请选择要删除的行！", "info");
                return;
            }else{
                var temID="";
                //批量获取选中行的评估模板ID
                for (i = 0; i < selRow.length;i++) {
                    if (temID =="") {
                        temID = selRow[i].id
                    } else {
                        temID = selRow[i].id+ "," + temID;
                    }
                }

                $.messager.confirm('提示', '是否删除选中数据?', function (r) {

                    if (!r) {
                        return;
                    }
                    //提交
                    //使用ajax提交
                    $.get(
                        "cns/delete",
                        {ids:temID},
                        function(data) {
                            if(data){
                                alert("删除成功");
                                loadData();
                            }else{
                                alert("删除失败");
                            }
                        },'json')

                });

            }
        }

    </script>
</head>
<body>
<div id="d1">&ensp;&ensp;&ensp;联系人管理<span><button id="bt1" onclick="addContracts()">新建联系人</button></span></div>
<div id="d11">
    场景：<select name="">
    <option value="">全部联系人</option>
    <option></option>
</select> &ensp;&ensp;<img src="static/images/login_logo.png" id="img1" />&ensp; <a href="javascript:void(0)">高级筛选</a> &ensp;
            <img src="static/images/login_logo.png" id="img2" /> <a href="javascript:deleteData()">删除</a>
</div>
<div id="d2">
    <table id="dg" style="width:100%;" ></table>

</div>
</body>
</html>
