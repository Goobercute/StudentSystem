<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录结果</title>
</head>
<body>
<%
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String url = "jdbc:mysql://localhost:3306/user";
	String driver = "com.mysql.jdbc.Driver";
	String user = "root";
	String passwords ="123456";
	try{
		Class.forName(driver);
		Connection con = DriverManager.getConnection(url,user,passwords);
		if(con!=null){
		String sql="select * from user where username='"+username+"' and password='"+password+"'";
		Statement sta = con.createStatement();
		ResultSet rs= sta.executeQuery(sql);
		if(rs.next()){
			response.sendRedirect("home.jsp");	
		}else{
			%>
			登录失败！<a href="javascript:history.back()">重新登录</a>  <a href="Register.jsp">注册新账号</a>
			<%
		}
		}else{
			out.print("数据库连接失败！");
		}
	}catch(ClassNotFoundException e) {   
		 System.out.println("Sorry,can`t find the Driver!");   
		  e.printStackTrace();   
			} catch (SQLException e) {
			 e.printStackTrace();  
		}
%>
</body>
</html>