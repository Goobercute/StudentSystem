<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String password1=request.getParameter("password1");
	String password2=request.getParameter("password2");
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
			if(!password1.equals(password2)){
				%>
				两次输入密码不相同！
				<a href="javascript:history.back()">重新输入，请返回！</a>
				<%	
			}else{
			String sql1="update user set password='"+password1+"' where username='"+username+"'";	
			Statement sta1=con.createStatement();
			sta1.executeUpdate(sql1);
			out.print("修改密码成功！");
			%>
			<a href="home.jsp">返回主页</a>>
			<%
			}
			}else{
			%>
			修改失败！当前账号密码输入不正确！
			<a href="javascript:history.back()">重新输入</a>
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