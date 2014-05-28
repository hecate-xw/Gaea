<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" errorPage="./error.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="../style/login.css"/>
	<title>My Garden!</title>
</head>

<body>
	<div id="welcome">
		Welcome!
	</div>
	<form action="login.jsp" method="post" id="form">
	用 户 名:<input type="text" name="userName" /><a href="#">忘记用户名</a>
	<br/>
	密&#160;&#160;&#160;&#160;&#160; 码:<input type="password" name="password" /> <a href="#">忘记密码</a>
	<br/>
	<input id="submit" type="submit" value="登 陆" /> 
	<input id="reset" type="reset" value="重 填" />
	</form>
	
	<br/>
	<div id="date">
	<%@ page import="java.util.Date"%>
	<%@ page import="java.text.DateFormat"%>
	<%
		DateFormat dateFormat = DateFormat.getDateInstance( DateFormat.LONG );
		String s = dateFormat.format( new Date() );
		out.println( "Today is " + s );
	%>
	</div>
	
	<div id="table">
	</div>
<%@ page import="java.sql.*"%>
<%
	String userName = null;
	String password = null;
	Cookie[] cookies = request.getCookies();	//获取本站在客户端上保留的所有Cookie
	if( cookies != null ) {
		for( Cookie c : cookies ) {
			if( "ccUser".equals( c.getName() ) ) {
				userName = c.getValue();
			}
			if( "ccPassword".equals( c.getName() ) ) {
				password = c.getValue();
			}
		}
	}
	if( userName == null && request.getParameter("userName") != null ) {
		userName = request.getParameter("userName");
	}
	if( password == null && request.getParameter("password") != null ) {
		password = request.getParameter("password");
	}
	if( userName != null ) {
		String getPasswordSql = "SELECT password from user_info where user_name='" + userName + "'";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/myblog", "root", "o123456789");
			PreparedStatement pStatement = connection.prepareStatement(getPasswordSql);
			ResultSet resultSet = pStatement.executeQuery();
			while( resultSet.next() ) {
				String pw = resultSet.getString("password");
				if( pw.equals(password) ) {
					Cookie c1 = new Cookie("ccUser",userName);
					c1.setMaxAge(3600);
					Cookie c2 = new Cookie("ccPassword",password);
					c2.setMaxAge(3600);
					response.addCookie(c1);
					response.addCookie(c2);
					out.println("<span style='color:pink'>登陆成功!!!</span>");
					response.sendRedirect("../index.html");
				} else {
					out.println("输入错误");
				}
			}
		} catch( ClassNotFoundException e1 ) {
		} catch( SQLException e2 ) {
			out.println("Wrong!!!");
		}
	}
%>
</body>
</html>