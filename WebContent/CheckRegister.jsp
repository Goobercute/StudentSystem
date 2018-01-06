<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册结果</title>
</head>
<body>
<% 
	String username=request.getParameter("username");
	String password1=request.getParameter("password1");
	String password2=request.getParameter("password2");
	if(!password1.equals(password2)){
	%>
	两次输入密码不相同！
	<a href="javascript:history.back()">重新输入，请返回！</a>
	<%	
	}else{
		String url = "jdbc:mysql://localhost:3306/user";
		String driver = "com.mysql.jdbc.Driver";
		String user = "root";
		String passwords ="123456";
		try{
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,user,passwords);
			if(con!=null){
			String sql = "insert into user(username,password) values(?,?)";
			String sql1="select * from user where username='"+username+"'";
			PreparedStatement ps,ps1;
			ps1=con.prepareStatement(sql1);
			ResultSet rs=ps1.executeQuery();
			if(rs.next()){
				%>
			该用户名已经被注册<a href="javascript:history.back()">返回重新输入!</a>
				<%
			}
			else{
			ps=con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password1);
			ps.addBatch();
			ps.executeBatch();
			out.print("注册成功！");
			%>
			<a href="Login.jsp">返回登录</a>
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
	}
			
%>

</body>
</html>