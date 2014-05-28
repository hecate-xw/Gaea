<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" errorPage="./error.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="../style/register.css"/>
	<title>My Garden!</title>
</head>

<body>
	<!-- 欢迎横幅 -->
	<div id="welcome">
		Welcome!
	</div>
	<!-- 注册表单 -->
	<form action="register.jsp" method="post" id="form">
	<span class="input">用 户 名:<br /><input class="box" type="text" name="userName" id="userName" required/>*</span>
	<span class="input">密&#160;&#160;&#160;&#160;&#160;码:<br /><input class="box" type="password" name="password" id="pw"/>*</span>
	<span class="input">确&#160;&#160;&#160;&#160;&#160;认:<br /><input class="box" type="password" name="confirmPassword" id="pwd"/>*</span>
	<span class="input">邮&#160;&#160;&#160;&#160;&#160;箱:<br /><input class="box" type="text" name="mailAddress" />*</span>
	<span class="input">手&#160;&#160;&#160;&#160;&#160;机:<br /><input class="box" type="text" name="phoneNumber" /></span>
	<span class="input">QQ&#160;&#160;&#160;&#160;号:<br /><input class="box" type="text" name="qq" /></span>
	<span class="input">
	性&#160;&#160;&#160;&#160;&#160;别:
	<br /><input type="radio" name="sex" value="male" /> 男 <input type="radio" name="sex" value="female" /> 女
	</span>
	<span class="input">
	<input id="submit" type="submit" value="注 册" /> 
	<input id="reset" type="reset" value="重 填" />
	</span>
	</form>
	
	<hr/>
	
	<!-- 显示日期小功能 -->
	<div id="date">
	<%@ page import="java.util.Date"%>
	<%@ page import="java.text.DateFormat"%>
	<%
		String s = ( new Date() ).toString();
		out.println( "<span style='color:green'>Now:</span> " + s );
	%>
	</div>
	<hr />
<!-- 连接数据库,将注册用户数据加载到数据库 -->
<%@ page import="java.sql.Connection, java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException, java.sql.PreparedStatement"%>
<%
	String userName = request.getParameter("userName");
	String password = request.getParameter("password");
	String confirmPassword = request.getParameter("confirmPassword");
	String mailAddress = request.getParameter("mailAddress");
	String phoneNumber = request.getParameter("phoneNumber");
	String qq = request.getParameter("qq");
	String sexName = request.getParameter("sex");
	boolean sex = false;
	if( "female".equals(sexName) ) sex = true;
	DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.SHORT);	//日期格式化的格式
	String registerDate = dateFormat.format( new Date() );					//获取当前系统时间并格式化为上述格式
	String sql = "INSERT INTO user_info(user_name,password,register_date,mail_address,phone_number,qq,sex)" + 
		" VALUES('" + userName + "'," + "'" + password + "'," +"'" + registerDate + "'," + "'" + mailAddress + "',"
		+ "'" + phoneNumber + "'," + "'" + qq + "'," + sex + ")";	//要执行的sql语句
	if( confirmPassword!=null && password!=null && confirmPassword.equals(password) ) {
		String driver = application.getInitParameter("driver");
		String url = application.getInitParameter("url");
		String user = application.getInitParameter("user");
		String mysqlPw = application.getInitParameter("password");
		try {
			Class.forName(driver);
			Connection connection = DriverManager.getConnection( url, user, mysqlPw );
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.executeUpdate();
			out.println( "<span style='color:red'>Success!!!</span>" );
		} catch( ClassNotFoundException e1 ) {
		} catch( SQLException e2 ) {
			out.println("<span style='font-size:20px color:red'>Wrong!!!</span>");
		}
	} else {
		out.println("<span style='color:red'>请输入数据!!!</span><hr/>");
	}
%>

	<!-- 显示版权 -->
	<span style="font-size:20px">&copy;2014 XW</span>
<script src="../js/register.js"></script>
</body>
</html>