<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/24
  Time: 16:12
  To change this template use File | Settings | File Templates.

  D:\idea\crm\src\main\webapp\listProduct.jsp

--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
          pageEncoding="UTF-8"%>
<%
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
    <title>展示产品信息</title>
    <base href="<%=basePath%>" />
    <link rel="stylesheet" type="text/css" href="static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">

    <script type="text/javascript" src="static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="static/easyui/easyui-lang-zh_CN.js"></script>

    <style type="text/css">
        .datagrid+.panel{
            top: 62px!important;
        }
        .datagrid+.panel+.window-shadow{
            top: 62px!important;
        }

        .right h4{
            font-size: 1.5em;
            display: inline-block;
            margin-top: 20px;
        }

        #easyui-searchbox{
            width: 200px;
            height: 8px;
            display: inline-block;

        }

        #addProduct{
            display: inline-block;
            float: right;
            margin-right: 10px;
            margin-top: 20px;
            background-color: dodgerblue;
        }

        #dg{
            width: 100%;
            height: 80%;
        }

        .panel-title{
            font-size: 1.33em;
        }

        .panel-htop{
            top: 62px;
        }



    </style>

    <script type="text/javascript">

        var num=0;   //默认选择0条数据
        var IsCheckFlag = false ;  //单选

        function loadData(){
            //用datagrid分页展示产品信息
            $('#dg').datagrid({
                url:'manage/product/listProductByPage.do',
                resizable:true,
                toolbar:"#tb",//设置工具条
                striped:true,//将行的展示条纹化
                //nowrap:false,//设置内容过多时是否换行，false是换行，true是不换行
                loadMsg:"正在加载，请稍等.....",//设置加载数据时的提示信息
                pagination:true,//设置显示分页工具条
                rownumbers:true,//设置是否显示行号
                selectOnCheck: true,//true勾选会选择行，false勾选不选择行, 1.3以后有此选项。重点在这里
                checkOnSelect: true, //true选择行勾选，false选择行不勾选, 1.3以后有此选项
                pageNumber:1,//设置起始页码
                pageSize:5,//设置每页展示的条数
                pageList:[5,10,15],//设置每页展示展示的条数的下拉列表
                singleSelect:true, //只允许选中一行
                columns:[[
                    {field:'ck',checkbox:'true'},
                    {field:'productName',title:'产品名称'},
                    {field:'productId',title:'产品编码'},
                    {field:'productType',title:'产品类别'},
                    {field:'standardPrice',title:'标准价格'},
                    {field:'description',title:'产品描述'},
                    {field:'creatorUserId',title:'创建人'},
                    {field:'updateTime',title:'更新时间'},
                    {field:'createTime',title:'创建时间'},
                    {field:'leaderId',title:'负责人'},
                    {field:'productState',title:'是否下架'},
                    /*{field:'  ',title:'操作',formatter: function(value,row,index){
                            return "<a href='javascript:updateStudent(\""+row.stuNo+"\");'>修改</a>&emsp;"+
                                "<a href='javascript:deleteStudent(\""+row.stuNo+"\");'>删除</a>&emsp;"
                        }
                    }*/
                ]],
                onCheck:function(rowIndex,rowData){
                    num =num + 1;             //选中多少项
                    $("#num").text(num);
                },onUncheck:function () {
                    num =num -1;
                    $("#num").text(num);
                },
                onSelect: function (rowIndex, rowData) {    //第二次点击行取消选中（单选）
                    if (!IsCheckFlag) {
                        IsCheckFlag = true;
                        rowIndexTo = rowIndex;
                    } else if (rowIndexTo == rowIndex) {
                        IsCheckFlag = false;
                        $('#dg').datagrid("unselectRow", rowIndex);
                    } else {
                        IsCheckFlag = false;
                    }
                },
                onClickRow: function (index, row) {        //单击行事件
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

        //把键盘按下事件和放开事件都放到JS中即可
            //-------------------------------------------------------------------------------
            //---------结合SHIFT,CTRL,ALT键点击行实现多选------------
            //-------------------------------------------------------------------------------
        var KEY = { SHIFT: 16, CTRL: 17, ALT: 18, DOWN: 40, RIGHT: 39, UP: 38, LEFT: 37 };
        var selectIndexs = { firstSelectRowIndex: 0, lastSelectRowIndex: 0 };
        var inputFlags = { isShiftDown: false, isCtrlDown: false, isAltDown: false }   //默认HIFT,CTRL,ALT键 都没点击

        function keyPress(event) {  //响应键盘按下事件
            var e = event || window.event;
            var code = e.keyCode | e.which | e.charCode;
            switch (code) {
                case KEY.SHIFT:  //点击shift键
                    inputFlags.isShiftDown = true;
                    $('#dg').datagrid('options').singleSelect = false;
                    break;
                case KEY.CTRL:   //点击ctrl键
                    inputFlags.isCtrlDown = true;
                    $('#dg').datagrid('options').singleSelect = false;
                case KEY.ALT:
                    inputFlags.isAltDown = true;
                    $('#dg').datagrid('options').singleSelect = false;
                    break;
                default:
            }
        }

        function keyRelease(event) { //响应键盘按键放开的事件
            var e = event || window.event;
            var code = e.keyCode | e.which | e.charCode;
            switch (code) {
                case KEY.SHIFT:
                    inputFlags.isShiftDown = false;
                    selectIndexs.firstSelectRowIndex = 0;
                    $('#dg').datagrid('options').singleSelect = true;
                    break;
                case KEY.CTRL:
                    inputFlags.isCtrlDown = false;
                    selectIndexs.firstSelectRowIndex = 0;
                    $('#dg').datagrid('options').singleSelect = true;
                case KEY.ALT:
                    inputFlags.isAltDown = false;
                    selectIndexs.firstSelectRowIndex = 0;
                    $('#dg').datagrid('options').singleSelect = true;
                    break;
                default:
            }
        }

        function loadSingle(){
            //用datagrid分页展示产品信息
            $('#dg').datagrid({
                url:'manage/product/listSingleProduct.do',
                resizable:true,
                toolbar:"#tb",//设置工具条
                striped:true,//将行的展示条纹化
                //nowrap:false,//设置内容过多时是否换行，false是换行，true是不换行
                loadMsg:"正在加载，请稍等.....",//设置加载数据时的提示信息
                pagination:true,//设置显示分页工具条
                rownumbers:true,//设置是否显示行号
                singleSelect:false,//设置是否只能选中一行
                selectOnCheck: true,//true勾选会选择行，false勾选不选择行, 1.3以后有此选项。重点在这里
                checkOnSelect: true, //true选择行勾选，false选择行不勾选, 1.3以后有此选项
                pageNumber:1,//设置起始页码
                pageSize:15,//设置每页展示的条数
                pageList:[15,30,45],//设置每页展示展示的条数的下拉列表
                columns:[[
                    {field:'ck',checkbox:'true'},
                    {field:'productName',title:'产品名称'},
                    {field:'productId',title:'产品编码'},
                    {field:'productType',title:'产品类别'},
                    {field:'standardPrice',title:'标准价格'},
                    {field:'description',title:'产品描述'},
                    {field:'creatorUserId',title:'创建人'},
                    {field:'updateTime',title:'更新时间'},
                    {field:'createTime',title:'创建时间'},
                    {field:'leaderId',title:'负责人'},
                    {field:'productState',title:'是否下架'}
                    /*{field:'  ',title:'操作',formatter: function(value,row,index){
                            return "<a href='javascript:updateStudent(\""+row.stuNo+"\");'>修改</a>&emsp;"+
                                "<a href='javascript:deleteStudent(\""+row.stuNo+"\");'>删除</a>&emsp;"
                        }
                    }*/
                ]]
            });
        }

        //根据条件分页查询产品信息
        function loadByContition(){
            var isSingle = false ;
            var productName = $("input[name=productName]").val();
            $('#dg').datagrid({
                queryParams: {
                    "productName":productName,
                    "isSingle":isSingle
                },
                url:'manage/product/listByPageByCondition.do',
                resizable:true,
                toolbar:"#tb",//设置工具条
                striped:true,//将行的展示条纹化
                //nowrap:false,//设置内容过多时是否换行，false是换行，true是不换行
                loadMsg:"正在加载，请稍等.....",//设置加载数据时的提示信息
                pagination:true,//设置显示分页工具条
                rownumbers:true,//设置是否显示行号
                singleSelect:false,//设置是否只能选中一行
                selectOnCheck: true,//true勾选会选择行，false勾选不选择行, 1.3以后有此选项。重点在这里
                checkOnSelect: true, //true选择行勾选，false选择行不勾选, 1.3以后有此选项
                pageNumber:1,//设置起始页码
                pageSize:15,//设置每页展示的条数
                pageList:[15,30,45],//设置每页展示展示的条数的下拉列表
                columns:[[
                    {field:'ck',checkbox:'true'},
                    {field:'productName',title:'产品名称'},
                    {field:'productId',title:'产品编码'},
                    {field:'productType',title:'产品类别'},
                    {field:'standardPrice',title:'标准价格'},
                    {field:'description',title:'产品描述'},
                    {field:'creatorUserId',title:'创建人'},
                    {field:'updateTime',title:'更新时间'},
                    {field:'createTime',title:'创建时间'},
                    {field:'leaderId',title:'负责人'},
                    {field:'productState',title:'是否下架'}
                    /*{field:'  ',title:'操作',formatter: function(value,row,index){
                            return "<a href='javascript:updateStudent(\""+row.stuNo+"\");'>修改</a>&emsp;"+
                                "<a href='javascript:deleteStudent(\""+row.stuNo+"\");'>删除</a>&emsp;"
                        }
                    }*/
                ]]
            });
        }


       $(function(){
            loadData();
           $("#num").text(num);
        })

        //添加产品
        function addProduct(){
            $('#dlg').dialog('open');
        }


        //搜索框 条件查询
        function doSearch(){
            //获得参数
            var productName=$("#search").val().trim();
            //判断合法性
            if(productName == ""){
                alert("产品名称为空了！");
                return;
            }
            //alert(productName);
            //用datagrid分页展示产品信息
            $('#dg').datagrid({
                url:'manage/product/listProductCondition.do?productName='+productName,
                resizable:true,
                toolbar:"#tb",//设置工具条
                striped:true,//将行的展示条纹化
                //nowrap:false,//设置内容过多时是否换行，false是换行，true是不换行
                loadMsg:"正在加载，请稍等.....",//设置加载数据时的提示信息
                pagination:true,//设置显示分页工具条
                rownumbers:true,//设置是否显示行号
                singleSelect:false,//设置是否只能选中一行
                pageNumber:1,//设置起始页码
                pageSize:15,//设置每页展示的条数
                pageList:[15,30,45],//设置每页展示展示的条数的下拉列表
                columns:[[
                    {field:'ck',checkbox:'true'},
                    {field:'productName',title:'产品名称'},
                    {field:'productId',title:'产品编码'},
                    {field:'productType',title:'产品类别'},
                    {field:'standardPrice',title:'标准价格'},
                    {field:'description',title:'产品描述'},
                    {field:'creatorUserId',title:'创建人'},
                    {field:'updateTime',title:'更新时间'},
                    {field:'createTime',title:'创建时间'},
                    {field:'leaderId',title:'负责人'},
                    {field:'productState',title:'是否下架'}
                    /*{field:'  ',title:'操作',formatter: function(value,row,index){
                            return "<a href='javascript:updateStudent(\""+row.stuNo+"\");'>修改</a>&emsp;"+
                                "<a href='javascript:deleteStudent(\""+row.stuNo+"\");'>删除</a>&emsp;"
                        }
                    }*/
                ]]
            });
        }

        //产品上/下架
        function onProduct() {
            $('#dlg01').dialog('open');  //打开上架产品原因的对话框

            //返回选中多行
            var selectRow = $('#dg').datagrid('getSelections')
            //判断是否选中行
            if (selectRow.length==0) {
                //没有选择上架产品
                $.messager.alert("提示", "请选择要上架的产品！", "info");
                return;
            }else{
                //选择了上架产品
                var temID="";
                //批量获取选中行的评估模板ID
                for (i = 0; i < selectRow.length;i++) {
                    if (temID =="") {
                        temID = selectRow[i].id;
                    }
                    else {
                        temID = selectRow[i].id + "," + temID;
                    }
                }

                //提交
                //点击上架的对话框的提交按钮
                $("#submit1").on("click",function () {

                    var onReason = $("#onReason").val()  //获取上架原因

                    console.info("onReason======"+onReason);

                    event.preventDefault();
                    $.post("manage/product/addOnReasonById.do?id=" + temID+"&onReason="+onReason,
                        // $("#ff").serialize(),
                        function(data) {
                            if(data.success){
                                //alert(data.success);
                                $(".panel-tool-close").click();  //对话框的右上角的关闭按钮默认的class 是panel-tool-close
                                loadData();
                            }else{
                                alert("添加失败");
                            }
                        },
                        'json')
                })

                //下架取消
                $("#reset1").on("click",function () {
                    //alert("1111");
                    $(".panel-tool-close").click();  //对话框的右上角的关闭按钮默认的class 是panel-tool-close
                })

            }

        }

        //上/下架原因的提交按钮绑定事件
        //就是逻辑删除，伪删除
        /*$("#submit").on("click",function () {
            event.preventDefault();
            $.post("manage/product/addProduct.do",
                $("#ff").serialize(),
                function(data) {
                    if(data.success){
                        //alert(data.success);
                        $(".panel-tool-close").click();  //对话框的右上角的关闭按钮默认的class 是panel-tool-close
                        loadSingle();
                    }else{
                        alert("添加失败");
                    }
                },
                'json')
        })*/

        //批量删除 下架产品
        function downProduct() {

            $('#dlg02').dialog('open').dialog('refresh');

            //返回选中多行
            var selectRow = $('#dg').datagrid('getSelections')
            //判断是否选中行
            if (selectRow.length==0) {
                //没有选择下架产品
                $.messager.alert("提示", "请选择要下架的产品！", "info");
                return;
            }else{
                //选择了下架产品
                var temID="";
                //批量获取选中行的评估模板ID
                for (i = 0; i < selectRow.length;i++) {
                    if (temID =="") {
                        temID = selectRow[i].id;
                    }
                    else {
                        temID = selectRow[i].id + "," + temID;
                    }
                }

                //提交
                //点击下架的对话框的提交按钮
                $("#submit2").on("click",function () {

                    var downReason = $("#downReason").val()  //获取下架原因

                    console.info("downReason======"+downReason);

                    event.preventDefault();
                    $.post("manage/product/addDownReasonById.do?id=" + temID+"&downReason="+downReason,
                       // $("#ff").serialize(),
                        function(data) {
                            if(data.success){
                                //alert(data.success);
                              $(".panel-tool-close").click();  //对话框的右上角的关闭按钮默认的class 是panel-tool-close
                                //$('#dlg02').dialog('destroy');
                                loadData();
                            }else{
                                alert("添加失败");
                            }
                        },
                        'json')
                })

                //下架取消
                $("#reset2").on("click",function () {
                   //alert("1111");
                   $(".panel-tool-close").click();  //对话框的右上角的关闭按钮默认的class 是panel-tool-close
                })

            }
        };

        //enter键添加操作
        function selectForKeyDown(){  //这个方法和onkeydown绑定，只要在指定容器中按键盘就会触发此方法
            if (event.keyCode == 13){   //13代表Enter键
                doSearch();  //实现条件查询功能块代码
            }
        }



    </script>
</head>
<body onkeydown="javascript:keyPress(event);" onkeyup="javascript:keyRelease(event);">

    <%--<div id="dlg" class="easyui-dialog"  title="新建产品" style="width: 500px;height: 400px"
         data-options="closed:true"  href="jsp/product/addProduct.jsp">

    </div>--%>
    <div id="dlg" class="easyui-dialog"  title="新建产品" style="width: 500px;height: 350px;overflow: hidden"
         data-options="closed:true" href="jsp/product/addProduct.jsp">

    </div>

    <div class="right">
        <h4>产品管理</h4>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        <input id="search" class="easyui-searchbox" onkeydown="selectForKeyDown()" data-options="prompt:'请输入值',searcher:doSearch"  style="padding-top: 15px" />
        <%--<button id="addProduct" onClick='addProduct()'>新建产品</button>--%>
        <a href="javascript:void(0)" id="addProduct" class="easyui-linkbutton" onclick="addProduct()">新建产品</a>
    </div>


    <div>
        <span style="margin-bottom: 8px">已选中</span>
        <span style="margin-bottom: 8px" id="num">    <%--已选中多少项--%>

        </span>
        <span style="margin-bottom: 8px">项</span>&emsp;&emsp;
        <input type="radio" name="productState1" id="on" style="margin-bottom: 8px" onclick="onProduct()">上架&emsp;&emsp;
        <input type="radio" name="productState1" id="down" style="margin-bottom: 8px" onclick="downProduct()">下架
    </div>

    <%--点击上架按钮后，弹出上架原因输入对话框--%>
    <div id="dlg01" class="easyui-dialog"  title="上架原因" style="width: 500px;height: 400px"
         data-options="closed:true" >
        <%--<div style="font-size: 1.5em">上架原因是：</div>--%>
        <textarea rows="17" cols="58" style="font-size: 1.2em" id="onReason"></textarea><br />
            <input type="reset"  name="reset1" value="取消" id="reset1" style="margin-top: 16px;font-size: 1.25em;float: right;margin-right: 8px"/>
            <input type="submit"  name="submit1" value="保存" id="submit1" style="margin-top: 16px;font-size: 1.25em;float: right;margin-right: 8px"/>

    </div>

    <%--点击下架按钮后，弹出下架原因输入对话框--%>
    <div id="dlg02" class="easyui-dialog"  title="下架原因" style="width: 500px;height: 400px"
         data-options="closed:true" >
        <textarea rows="17" cols="58" style="font-size: 1.2em" id="downReason"></textarea><br />
        <input type="reset"  name="reset2" value="取消" id="reset2" style="margin-top: 16px;font-size: 1.25em;float: right;margin-right: 8px"/>
        <input type="submit"  name="submit2" value="保存" id="submit2" style="margin-top: 16px;font-size: 1.25em;float: right;margin-right: 8px"/>

    </div>

    <table id="dg"></table>

</body>
</html>
