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
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">

    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>

    <style type="text/css">


    </style>

    <script type="text/javascript">

        function loadData(){
            //用datagrid分页展示产品信息
            $('#dg').datagrid({
                url:'manage/product/listProductByPage.do',
                toolbar:"#tb",
                striped:true,
                pagination:true,
                singleSelect:true,
                resizable:true,
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
        })

    </script>
</head>
<body>

    <table id="dg"></table>

</body>
</html>
