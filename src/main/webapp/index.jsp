<%@ page language="java" contentType="text/html; charset=utf-8"

pageEncoding="utf-8"%>

<%@ page import="java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

<title>测试登录页面--webjook</title>

</head>

<body>

<form name="loginForm" method="post" action="judgeUser.jsp">

<table>

<tr>

<td>用户名:<input type="text" name="userName" id="userName"></td>

</tr>

<tr>

<td>密码:<input type="password" name="password" id="password"></td>

</tr>

<tr>

<td><input type="submit" value="登录" style="background-color:pink"> <input

type="reset" value="重置" style="background-color:red"></td>

</tr>

</table>

</form>

</body>

</html>
