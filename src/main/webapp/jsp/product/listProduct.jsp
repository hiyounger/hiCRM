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

    </style>

    <script type="text/javascript">

        var num=0;   //默认选择0条数据

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
                    {field:'productState',title:'是否下架'},
                    /*{field:'  ',title:'操作',formatter: function(value,row,index){
                            return "<a href='javascript:updateStudent(\""+row.stuNo+"\");'>修改</a>&emsp;"+
                                "<a href='javascript:deleteStudent(\""+row.stuNo+"\");'>删除</a>&emsp;"
                        }
                    }*/
                ]],
                onCheck:function(rowIndex,rowData){
                    num=num + 1;             //选中多少项
                    $("#num").text(num)
                },onUncheck:function () {
                    num=num -1;
                    $("#num").text(num)
                }
            });
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

        //产品上下架
        function modifyState() {
            $('#dlg01').dialog('open');
        }


    </script>
</head>
<body>

    <div id="dlg" class="easyui-dialog"  title="新建产品" style="width: 500px;height: 400px"
         data-options="closed:true"  href="jsp/product/addProduct.jsp">

    </div>

    <div class="right">
        <h4>产品管理</h4>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        <input id="search" class="easyui-searchbox" data-options="prompt:'请输入值',searcher:doSearch"  style="padding-top: 15px" />
        <button id="addProduct" onClick='addProduct()'>新建产品</button>
    </div>


    <div>
        <span style="margin-bottom: 8px">已选中</span>
        <span style="margin-bottom: 8px" id="num">    <%--已选中多少项--%>

        </span>
        <span style="margin-bottom: 8px">项</span>&emsp;&emsp;
        <input type="radio" name="productState1" id="on" style="margin-bottom: 8px" onclick="modifyState()">上架&emsp;&emsp;
        <input type="radio" name="productState1" id="down" style="margin-bottom: 8px">下架
    </div>

    <%--点击上架按钮后，弹出上架原因输入对话框--%>
    <div id="dlg01" class="easyui-dialog"  title="上架原因" style="width: 500px;height: 400px"
         data-options="closed:true" >
        <%--<div style="font-size: 1.5em">上架原因是：</div>--%>
        <textarea rows="17" cols="58" style="font-size: 1.2em"></textarea><br />
            <input type="reset"  name="reset" value="取消" id="reset" style="margin-top: 16px;font-size: 1.25em;float: right;margin-right: 8px"/>
            <input type="submit"  name="submit1" value="保存" id="submit" style="margin-top: 16px;font-size: 1.25em;float: right;margin-right: 8px"/>

    </div>

    <table id="dg"></table>

</body>
</html>
