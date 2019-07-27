<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >

<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>

<html>
<head>

<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">

<script type="text/javascript" src="static/easyui/jquery.min.js"></script>
<script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
  <script>
$(function(){
    $("#ff").submit(function(){
         //再执行关闭
        $.ajax({
            async: false,
            type: "POST",
            url:'manage/bussiness/addone',
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            data:$("#ff").serialize(),
            dataType: "text",
            success: function () {
            	window.close()
           	window.opener.location.href="jsp/bussiness/list_business2.jsp"
	
              },
            error: function () {
            	alert("提交失败")
            }
        })
    })
	
})


</script>


<style>
table {
	margin: auto;
}

</style>

</head>
<body>
<div >

	<form id="ff"  >

		<table width="70%" >
			<tr>
				<td>客户属性</td>
				<td>商机名称</td>


			</tr>

			<tr>
				<td><input name="customerAttribute" class="easyui-textbox" style="width: 300px">
				</td>
				<td><input name="name" class="easyui-textbox" style="width: 300px">
				</td>

			</tr>

			<tr>
				<td>客户名称</td>
				<td>商机金额</td>


			</tr>

			<tr>
				<td><input name="customerName" class="easyui-textbox" style="width: 300px">
				</td>
				<td><input name="money" data-options="prompt:'只能是填入数字'" class="easyui-numberbox" style="width: 300px">
				</td>

			</tr>
			<tr>
				<td>预计成交日期</td>
				<td>备注</td>


			</tr>

			<tr>
				<td><input name="preDate"  class="easyui-datebox" style="width: 300px">
				</td>
				<td><input name="beizhu" class="easyui-textbox" style="width: 300px">
				</td>

			</tr>

			<tr>
				<td>商机状态组</td>
				<td>商机阶段</td>


			</tr>

			<tr>
				<td><input name="status" class="easyui-textbox" style="width: 300px">
				</td>
				<td><input name="stage" class="easyui-textbox" style="width: 300px">
				</td>

			</tr>
				
				<tr >
				<td align="center">
				<input type="submit"  style="height: 30px;color: white;background-color: blue ">
				</td>
				<td align="left" >
				<input style="height: 30px;color: white;background-color: blue" type="reset">
				</td>
				
				</tr>
				
		</table>
        
	</form>

</div>

</body>
</html>