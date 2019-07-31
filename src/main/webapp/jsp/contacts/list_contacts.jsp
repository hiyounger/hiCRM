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
        #d10{
            width: 50%;
            height: 80px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;

        }
        #d2{
            margin-left: auto;
            margin-right: auto;
            width: 95%;
            height: 500px;


        }

        #img1,#img2,#img4{
            width: 15px;
            height: 15px;
        }
        #d12{
            width: 250px;
            height: 100%;
            float: right;
        }
        a{
            color: black;
            text-decoration:none;
        }
    </style>
    <script>

        //打开添加窗口
        function addContacts(){
           window.open(
               'manage/Contacts/add.cns',
               '联系人添加页面',
               'height=600, width=800, top=100, left=350, toolbar=no, menubar=no, scrollbars=yes, resizable=no, location=no, status=no'
           )
        }

        function loadData(url){
            $("#dg").datagrid({
                url:url,
                checkOnSelect:true,
                pagination:true,
                pageSize:4,
                pageList:[2,4,6,8],
                singleSelect:false,checkOnSelect: true, selectOnCheck: true,
                striped:true,
                rownumbers:true,//设置是否显示行号
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
                    {field:'updateTime',title:'更新时间',width:240}
                ]]
                ,onCheck:function(rowIndex,rowData){//选中一行行数加一
                $("#num").text($('#dg').datagrid('getChecked').length)
            },onUncheck:function () {//取消选中一行行数减一
                $("#num").text($('#dg').datagrid('getChecked').length)
            },onCheckAll:function(){
                $("#num").text($('#dg').datagrid('getChecked').length)
            },onUncheckAll:function(){
                $("#num").text($('#dg').datagrid('getChecked').length)
            }
            });
            //更改列表底部样式，及刷新效果
            var pager=$('#dg').datagrid().datagrid('getPager');// get the pager of datagrid
            pager.pagination({
                displayMsg:'显示 {from} 到 {to}  共{total}记录 ',onBeforeRefresh:function(){
                    loadData("manage/Contacts/list");
                    return true;
                },showPageList:true,beforePageText:'第',afterPageText:'页'
            });
        }

        $(function(){
            loadData("manage/Contacts/list");
            $("#num").text($('#dg').datagrid('getChecked').length);
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
                        "manage/Contacts/delete",
                        {ids:temID},
                        function(data) {
                            if(data){
                                alert("删除成功");
                                loadData("manage/Contacts/list");
                            }else{
                                alert("删除失败");
                            }
                        },'json')

                });

            }
        }
        function search() {
            var word=$("#ss").val();
            loadData("manage/Contacts/listpart?word="+word);
            $("#num").text($('#dg').datagrid('getChecked').length);
        }


    </script>
</head>
<body>
<div id="d1">&ensp;&ensp;&ensp;联系人管理
    <div id="d10">
        <input id="ss" class="easyui-searchbox" style="width:250px;"
               data-options="searcher:search,prompt:'请输入联系人姓名或手机号'"/>
    </div>
</div>
<div id="d11">
    场景：<select name="">
    <option value="">全部联系人</option>
    <option></option>
</select>
    <span class="tx1">已选中</span>
    <span class="tx1" id="num">
			</span>
    <span class="tx1">项&emsp;&emsp;|</span>
    &ensp;&ensp;<img src="static/img/logo.png" id="img1" />&ensp; <a href="javascript:void(0)">高级筛选</a> &ensp;
            <img src="static/img/logo.png" id="img2" /> <a href="javascript:deleteData()">删除</a>&ensp;
          <div id="d12">
              <img src="static/easyui/themes/black/images/slider_handle.png" id="img4" />
              <a href="javascript:addContacts()">新建联系人</a>&ensp;
          </div>
</div>
<br/>
<div id="d2">
    <table id="dg" style="width:100%;" ></table>

    <form id="form1" action="manage/Contacts/import"  enctype="multipart/form-data" method="post">
        <input id="file" type="file" name="file"/>
        <button id="import" type="submit">导入</button>
        <button id="export">导出</button>
    </form>

</div>

</body>
</html>
