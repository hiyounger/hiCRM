<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >

<%
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>

<html>
<head>

<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

div{
   
   float:right;
  
  }
  button {
	background-color: blue;
}

</style>
</head>
<body>
<input style="text">
<div><button><font  color="white">新建联系人</font></button></div>



</body>
</html>