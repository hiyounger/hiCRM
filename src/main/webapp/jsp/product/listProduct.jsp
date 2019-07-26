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

    </style>

    <script type="text/javascript">

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
                singleSelect:true,//设置是否只能选中一行
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
        })

        //添加产品
        /* window.open 弹出新窗口的命令；
     　　'page.html' 弹出窗口的文件名；
     　　'新建产品' 弹出窗口的名字（不是文件名），非必须，可用空''代替；
     　　height=400 窗口高度；
     　　width=600 窗口宽度；
     　　top=350 窗口距离屏幕上方的象素值；
     　　left=350 窗口距离屏幕左侧的象素值；
     　　toolbar=no 是否显示工具栏，yes为显示；
     　　menubar，scrollbars 表示菜单栏和滚动栏。
     　　resizable=no 是否允许改变窗口大小，yes为允许；
     　　location=no 是否显示地址栏，yes为允许；
     　　status=no 是否显示状态栏内的信息（通常是文件已经打开），yes为允许；*/

        function addProduct(){
            //alert("1111");
            window.open('jsp/product/addProduct.jsp', '新建产品', 'height=400, width=600, top=350, left=350, toolbar=no, menubar=no, scrollbars=yes, resizable=no, location=no, status=no')
        }

    </script>
</head>
<body>
    <div class="right">
        <h4>产品管理</h4>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        <input class="easyui-searchbox" data-options="prompt:'请输入值'"  style="padding-top: 15px"/>
        <button id="addProduct" onClick='addProduct()'>新建产品</button>
    </div>

    <table id="dg"></table>

</body>
</html>
