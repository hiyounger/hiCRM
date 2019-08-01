<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%						//获得协议
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>" />
    <title>Title</title>
    <link rel="stylesheet" href="../../static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../static/easyui/themes/icon.css">
    <script type="text/javascript" src="../../static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../../static/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../static/easyui/easyui-lang-zh_CN.js"></script>
    <script src="../../static/js/jquery.cookie.js" ></script>
<%--    <script type="text/javascript" src="../../static/easyui/datagrid-export.js"></script>--%>
    <style>

        .right{
            background:rgb(245,246,249);
            height: 100%;
        }

        .right .right_top{
            height: 80px;
        }

        .right .right_top h4{
            display: inline-block;
            float: left;
            margin-top: 25px;


        }
        .searchbox{
            margin: 20px auto;
            margin-left: 35%;
        }

        .right .right_top button{
            float: right;
            width: 80px;
            height: 30px;
            margin-top: 25px;
            margin-right: 20px;
            color: white;
            background: #00bbee;
            border: none;
            cursor: pointer;
        }
        .right .right_top button:hover{
            background: #dd2bdd;
        }



        .header_right .active a{
            color: #00bbee;
        }

        .header_right li{
            list-style: none;
            float: left;
            margin-left: 40px;
            margin-top: 20px;
        }

        .header_right li a{
            text-decoration: none;
            color: black;

        }
        .header_right li a:hover{
            color: blue;
        }
        #sm li{
            color:rgb(163,158,151) ;
            background:rgb(45,48,55);
        }

        #sm li:nth-of-type(8){
            background: rgb(69,78,87);
            color:white ;
        }

        iframe{
            border: none;
            width: 300px;
            /*display: none;*/

        }

        #dlg{
            width:500px;
            height:400px;


        }

    </style>
</head>
<script type="text/javascript">


    //声明全局变量
    var IsCheckFlag=false;
    var num=0;   //默认选择0条数据
    var param=null;
    var isSingle=0;//0:正常，1：显示单条

    //-------------------------------------------------------------------------------
    //---------结合SHIFT,CTRL,ALT键点击行实现多选------------
    //-------------------------------------------------------------------------------
    var KEY = { SHIFT: 16, CTRL: 17, ALT: 18, DOWN: 40, RIGHT: 39, UP: 38, LEFT: 37 };
    var selectIndexs = { firstSelectRowIndex: 0, lastSelectRowIndex: 0 };
    var inputFlags = { isShiftDown: false, isCtrlDown: false, isAltDown: false };



    //分页方法
    function loadData(param,isSingle){
        $('#dg').datagrid({
            url:'manage/contract/listByPage',
            queryParams:{
                contactName:param,
                isSingle:isSingle,
            },
            frozenColumns:[[
                //   {field:'id',title:'id',width:80},
                //  {field:'status',title:'状态',width:80},
            ]],
            toolbar:"#tb",
            striped:true,
            pagination:true,
            singleSelect:true,
            selectOnCheck: true,//true勾选会选择行，false勾选不选择行, 1.3以后有此选项。重点在这里
            checkOnSelect: true, //true选择行勾选，false选择行不勾选, 1.3以后有此选项
            //  rownumbers:true,
            pageNumber:1,
            pageSize:5,
            pageList:[5,10,15],
            resizable:true,
            //修改行的样式
            //     rowStyler: function(index, row) {
            //         //index:下标   row对象
            //         //此处可以添加条件
            //         if(row.列名==‘条件’){
            //             // return 'background-color:red;';
            //             return 'background-color:green;color:white';
            //         }
            //     },
            columns:[[
                {field:'ck',checkbox:"true"},
                //修改列的样式
                {field:'number',title:'合同编号', styler: function (value, row, index) {
                        //不需要条件可不写
                        return 'color:blue';
                    }},
                {field:'contactname',title:'合同名称'},
                {field:'customername',title:'客户名称', styler: function (value, row, index) {
                        //不需要条件可不写
                        return 'color:blue';
                    }},
                {field:'businessname',title:'商机名称', styler: function (value, row, index) {
                        //不需要条件可不写
                        return 'color:blue';
                    }},
                {field:'ordertime',title:'下单时间',formatter:function (value,row,index) {
                        return new Date(value).getFullYear()+"-"+
                            new Date(value).getMonth()+"-"+
                            new Date(value).getDate();
                    }},
                {field:'contractamount',title:'合同金额'},
                {field:'startingtimecontract',title:'合同开始时间',formatter:function (value,row,index) {
                        return new Date(value).getFullYear()+"-"+
                            new Date(value).getMonth()+"-"+
                            new Date(value).getDate();
                    }},
                {field:'endtimecontract',title:'合同结束时间',formatter:function (value,row,index) {
                        return new Date(value).getFullYear()+"-"+
                            new Date(value).getMonth()+"-"+
                            new Date(value).getDate();
                    }},
                {field:'customercontractor',title:'客户签约人'},
                {field:'companycontractor',title:'公司签约人'},
                {field:'remarks',title:'备注'},
                {field:'founder',title:'创建人'},
                {field:'updatetime',title:'更新时间',formatter:function (value,row,index) {
                        return new Date(value).getFullYear()+"-"+
                            new Date(value).getMonth()+"-"+
                            new Date(value).getDate();
                    }},
                {field:'creationtime',title:'创建时间',formatter:function (value,row,index) {
                        return new Date(value).getFullYear()+"-"+
                            new Date(value).getMonth()+"-"+
                            new Date(value).getDate();
                    }},
                {field:'personincharge',title:' 负责人'},
                {field:'status',title:' 状态',styler: function (value, row, index) {
                        // if(value==0){
                        //     return 'color:orange;border:1px solid;padding:1px';
                        // }
                        if(value==1){
                            return 'color:green';
                        }

                    },formatter:function (value) {
                        if(value==1){

                            return "通过"
                        }

                        return "<a style='color:orange;text-decoration:none;border:1px solid;font-size: 12px;' href='javascript:;'>待审核</a>";
                    }}
            ]],
            /**
             * 选择单行/多行
             * @param rowIndex
             * @param rowData
             */
            onSelect: function (rowIndex, rowData) {
                if (!IsCheckFlag) {
                    IsCheckFlag = true;
                    rowIndexTo = rowIndex;
                } else if (rowIndexTo == rowIndex) {
                    IsCheckFlag = false;
                    $('#dg').datagrid("unselectRow", rowIndex);
                } else {
                    IsCheckFlag = false;
                }
                if(num<2){
                    $("#num").css("opacity","0");
                }else{
                    $("#num").css("opacity","1");
                }
                var ids = [];
                var rows = $('#dg').datagrid('getSelections');
                for(var i=0; i<rows.length; i++){
                    ids.push(rows[i].id);
                }
                num=ids.length;
              //  $("#num").text(ids.length);
            },
            onLoadSuccess:function(){

            },
            onCheck:function(rowIndex,rowData){

                       //选中多少项
                if(inputFlags.isShiftDown||inputFlags.isCtrlDown||inputFlags.isAltDown){
                   num =num + 1;
                }
                $("#num").text(num);

            },onUncheck:function () {
                if(inputFlags.isShiftDown||inputFlags.isCtrlDown||inputFlags.isAltDown){
                   if(num<=1){
                       num=1;
                   }else{
                       num--;
                   }
                }
                $("#num").text(num);
            },
            //单击行事件
            onClickRow: function (index, row) {
                //---------结合SHIFT,CTRL,ALT键点击行实现多选------------
                if (index != selectIndexs.firstSelectRowIndex && !inputFlags.isShiftDown) {
                    selectIndexs.firstSelectRowIndex = index;
                }
                if (inputFlags.isShiftDown) {
                    $('#dg').datagrid('clearSelections');
                    selectIndexs.lastSelectRowIndex = index;
                    var tempIndex = 0;
                    if (selectIndexs.firstSelectRowIndex > selectIndexs.lastSelectRowIndex) {
                        tempIndex = selectIndexs.firstSelectRowIndex;
                        selectIndexs.firstSelectRowIndex = selectIndexs.lastSelectRowIndex;
                        selectIndexs.lastSelectRowIndex = tempIndex;
                    }
                    for (var i = selectIndexs.firstSelectRowIndex ; i <= selectIndexs.lastSelectRowIndex ; i++) {
                        $('#dg').datagrid('selectRow', i);
                    }
                }
                //---------结合SHIFT,CTRL,ALT键点击行实现多选------------
            }
        });
    }


    //响应键盘按下事件
    function keyPress(event) {

        var e = event || window.event;
        var code = e.keyCode | e.which | e.charCode;
      //  alert(code);
        switch (code) {
            case KEY.SHIFT:
                inputFlags.isShiftDown = true;
                //  alert("singleSelect = false");
                $('#dg').datagrid('options').singleSelect = false;
                break;
            case KEY.CTRL:
                inputFlags.isCtrlDown = true;
                //  alert("singleSelect = false");
                $('#dg').datagrid('options').singleSelect = false;
            default:
        }
    }

    //响应键盘按键放开的事件
    function keyRelease(event) {

        var e = event || window.event;
        var code = e.keyCode | e.which | e.charCode;
       // alert(code);
        switch (code) {
            case KEY.SHIFT:
                inputFlags.isShiftDown = false;
                selectIndexs.firstSelectRowIndex = 0;
                // alert("singleSelect = true");
                $('#dg').datagrid('options').singleSelect = true;
                break;
            case KEY.CTRL:
                inputFlags.isCtrlDown = false;
                selectIndexs.firstSelectRowIndex = 0;
                // alert("singleSelect = true");
                $('#dg').datagrid('options').singleSelect = true;
            default:
        }
    }



    $(function(){
        //默认加载数据
        loadData();

        $("#num").text(num);
        // var row = $("#dg").datagrid('getSelected');
        // console.log("row.length="+row.length);
        //批量删除的方法
        function deletedata() {
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
                        temID = selRow[i].id;
                    } else {
                        temID = selRow[i].id + "," + temID;
                    }
                }
                $.messager.confirm('提示', '是否删除选中数据?', function (r) {

                    if (!r) {
                        return;
                    }
                    //alert(temID);
                    //提交
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "manage/contract/delete?ids=" + temID,
                        data: temID,
                        success: function (result) {
                            if (result) {
                                $.messager.alert("提示", "恭喜您，信息删除成功！", "info");
                                loadData();
                            } else {
                                $.messager.alert("提示", "删除失败，请重新操作！", "info");
                            }
                        }
                    });
                });

            }
        };

        //删除按钮的点击事件
        $("#del").click(function () {
            deletedata();
        });
    });





    //模糊查询
    $(".searchbox-button").click(function () {
        //alert($(".easyui-searchbox").val());
        param=$(".easyui-searchbox").val();
        loadData(param);
    });
    $("#dlg").dialog({
        onClose:function(){
//alert(123456);
            console.log("cookie---->"+$.cookie('isSingle'));
            if($.cookie('isSingle')!=null){
                isSingle=1;
                // alert("刷新");
                $.removeCookie('isSingle');
            };
            // isSingle=1;
            console.log(typeof isSingle+":"+isSingle);
            param=$(".easyui-searchbox").val();
            console.log(isSingle+","+param);
            loadData(param,isSingle);
            isSingle=0;
            console.log(isSingle+","+param);
        }
    });


</script>
<body  onkeydown="javascript:keyPress(event);" onkeyup="javascript:keyRelease(event);">

<!--    <div class="container">-->
<%--设置隐藏滚动条style="overflow:hidden;"--%>
<div id="dlg" href="jsp/contact/add.jsp" class="easyui-dialog" title="新建合同"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">

</div>
<%--        <div  src="add.jsp" id="dlg" class="easyui-dialog" title="Basic Dialog" data-options="iconCls:'icon-save'" style="width:400px;height:200px;padding:10px">--%>

<%--        </div>--%>
<!--        <div class="header">-->
<!--            <div class="header_left">-->
<!--                <img src="static/img/logo.png">-->
<!--            </div>-->
<!--            <div class="header_right">-->
<!--                <ul>-->
<!--                    <li><a href="">办公</a></li>-->
<!--                    <li class="active"><a href="">客户管理</a></li>-->
<!--                    <li><a href="">商业智能</a></li>-->
<!--                    <li><a href="">项目管理</a></li>-->
<!--                </ul>-->
<!--            </div>-->
<!--        </div>-->
<!--        <div class="left">-->
<!--            <div style="margin:20px 0;">-->
<!--                <a href="javascript:;" class="easyui-linkbutton" onclick="toggle()">Toggle</a>-->
<!--            </div>-->
<!--            <div id="sm" class="easyui-sidemenu" data-options="data:data"></div>-->

<!--        </div>-->
        <div class="right">
            <div class="right_top">
                <h4>合同管理</h4>

                <input class="easyui-searchbox" name="condition" data-options="prompt:'请输入合同名称'"  style="padding-top: 15px"/>

                <button id="add" class="easyui-linkbutton" onclick="$('#dlg').dialog('open')">添加</button>
<%--                <button id="add" class="easyui-linkbutton" onclick="parent.$('#dlg').dialog('open')">添加</button>--%>
            </div>
            <div id="tb">

                <a class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="$('#add').trigger('click')">添加</a>
                <a id="del" title="status--0:待审核,1:已审核,2:删除" class="easyui-linkbutton" iconCls="icon-cut" plain="true" onclick="javascript:void(0)">删除</a>
                <a  class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:alert('Save')">保存</a>
                <p style="color: #4b72a4;display: inline-block;" >按住shift/ctrl/alt可以多选 &emsp;&emsp; </p><span id="num" style="opacity: 0" ></span>
                <a class="easyui-linkbutton" id="exportExcel" onclick="javascript:exportExcel()" > 一键导出 </a>
                <form style="display: inline-block;margin-left: 40px;" id="upload" enctype="multipart/form-data" method="post" title="日期格式yyyy/MM/dd" >
                    <input name="file" type="file" id="f" /><a class="easyui-linkbutton" id="entranceExcel" onclick="javascript:if(f.value=='')alert('请选择xls文件');else importXLS(f.value)" > 一键导入 </a>

                </form>

            </div>

            <table id="dg"></table>


        </div>

<!--    </div>-->

</body>
<script>
    function exportExcel() {
       // var url=base+'/api/xx?xx='+$("#xx").val()+'&xx='+$("#xx").val()+'&xx='+$("#xx").val();
        window.location.href = "manage/contract/export";
    }
    function importXLS(fileName)
    {
        $("#upload").form("submit",{
            url:"manage/contract/import",
             success:function (data) {

                     alert(data);

             },
            dataType:"text"
        });
    }
</script>
</html>