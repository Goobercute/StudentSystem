<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
</head>
<body>
<form action="Checkchange.jsp" method="post">
<table>
<p>输入当前账号：<input type="text" name="username"></p>
<p>输入当前密码：<input type="text" name="password"></p>
<p>输入新密码：<input type="text" name="password1"></p>
<p>确认新密码：<input type="text" name="password2"></p>
<p><input type ="submit" value="确认"></p>
</table>
</form>
</body>
</html>