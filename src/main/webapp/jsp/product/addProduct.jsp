<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
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
						<input type="submit"  name="submit" value="保存" id="submit"/>
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
            //event.preventDefault();
            $('#ff').form('submit',{
                url:'manage/product/addProduct.do',
                success:function(result){
                    if(result.success){
                        alert("新建产品失败");
                    }
                    else {
                        //添加成功
                        //console.log(data);
                        window.close();
                        //window.onbeforeunload=loadSingleData;
                    }
                }

            });
        })


		//添加产品
		/*$.ajax({
			type: "POST",
			contentType: "application/json;charset=utf-8",
			url: "manage/product/addProduct.do",
			data: $('#ff').serialize(),
			dataType: "json",
			success: function (result) {
				console.info("result = " + result);
			},
			error: function (result, status) {
				console.info(result);
				console.info(status);
				//alert("异常！");
			}
		});*/


	</script>
</body>
</html>
				
