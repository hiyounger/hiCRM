<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>" />
    <meta charset="UTF-8">
    <title>新建产品</title>
    
	<meta name="pragma" content="no-cache">
	<meta name="cache-control" content="no-cache">
	<meta name="content-type" content="text/html;charset=UTF-8">
	<meta name="expires" content="0">
	  <base href="<%=basePath%>">
	  <link rel="stylesheet" type="text/css" href="static/easyui/themes/default/easyui.css">
	  <link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">

	  <script type="text/javascript" src="static/easyui/jquery.min.js"></script>
	  <script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
	  <script type="text/javascript" src="static/easyui/easyui-lang-zh_CN.js"></script>
	 <%-- D:\idea\crm\src\main\webapp\addProduct.jsp--%>
  </head>
  
  <body style="width:100%;max-width:600px;padding:30px 60px;">
	<section class="info-section">
		<div class="column">
			<span class="current">基本信息</span>
		</div>
		<form id="ff" method="post">
			<table>
				<tr>
					<td>是否上下架</td>					
					<td>产品名称</td>					
				</tr>
					<td class="kv-content">
						<select name="productState" id="productState" style="width:166px">
							<option value="-1">请选择</option>
							<option value="1">上架</option>
							<option value="0">下架</option>
						</select>
					</td>
					<td class="kv-content">
						<input type="text" id="productName" name="productName" placeholder="请输入" >
					</td>				
				</tr>
				
				<tr>
					<td>单位</td>
					<td>产品类型</td>
				</tr>
				
				<tr>
					<td class="kv-content">
						<%--<input type="text" id="unit" name="unit" placeholder="请输入" >--%>
						<select name="unit" id="unit" style="width:166px" placeholder="请输入" >
							<option value="-1">请选择</option>
							<option value="1">上架</option>
							<option value="0">下架</option>
						</select>
					</td>
					<td class="kv-content">
						<select name="productType" id="productType" style="width:166px" placeholder="请输入" data-options="required:true">
							<option value="-1">请选择</option>
							<option value="1">上架</option>
							<option value="0">下架</option>
						</select>
					</td>				
				</tr>
				
				<tr>
					<td>产品编码</td>
					<td>价格</td>
				</tr>
				
				<tr>
					<td class="kv-content">
						<input type="text" id="productId" name="productId" placeholder="请输入"  data-options="required:true">
					</td>
					<td class="kv-content">
						<input type="text" id="standardPrice" name="standardPrice" placeholder="请输入"  data-options="required:true">
					</td>				
				</tr>
				
				<tr>
					<td>产品描述</td>
                    <td>创建时间</td>
				</tr>
                <tr>
                    <td class="kv-content">
                        <input type="text" id="description" name="description" placeholder="请输入">
                    </td>
                    <td class="kv-content">
                        <input type="text" id="createTime" name="createTime" placeholder="请输入">
                    </td>
                </tr>

				<tr>
					<td colspan="2" align="center">
						<input type="submit"  name="submit1" value="保存" id="submit"/>
						<input type="reset"  name="reset" value="重置" id="reset"/>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<script type="text/javascript">
        var myDate = new Date();
        var date = myDate.getFullYear()
            + "-"
            + ((myDate.getMonth() + 1) < 10 ? "0" + (myDate.getMonth() + 1)
                : (myDate.getMonth() + 1))
            + "-"
            + (myDate.getDate() < 10 ? "0" + myDate.getDate() : myDate
                .getDate())
            + " "
            + (myDate.getHours()< 10 ? "0" + myDate.getHours() : myDate.getHours())
            + ":"
            + (myDate.getMinutes() < 10 ? "0" + myDate.getMinutes() : myDate.getMinutes())
            + ":"
            + (myDate.getSeconds() < 10 ? "0" + myDate.getSeconds() : myDate.getSeconds())
        $("input[name=createTime]").val(date);

		$(function() {
			
			
		});


        $("#submit").on("click",function () {
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
        })

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


	</script>
</body>
</html>
				
