<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>
<html>
<body>
	<%
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		boolean b=false;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "root");
			Statement stmt = c.createStatement();
			ResultSet rs;
			String sql;	
			String msg=null;
			sql = "select username,password,type from student";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				if(rs.getString("username").equals(username)&&rs.getString("password").equals(password)){
					request.getSession(true);//创建一个session
					session.setAttribute("username", username);
					session.setAttribute("password", password);
// 					session.setAttribute("enter", "true");
					if(rs.getInt("type")==2){
						response.sendRedirect("mainForm.jsp");//登录成功
					}else{
						response.sendRedirect("mainForm.jsp");
					}
					b=true;
				}
			}
			if(!b){
				msg = "账号或密码错误！";
				out.println("<center><font color=green size=5>提示信息：<hr></font><font color=red size=4>" + msg
						+ "</font><hr>");
			/* 	response.sendRedirect("login.jsp"); */
				out.println("<input type=button value=回上一页  onclick=history.back();>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
					
	
		
	%>
</body>
</html>
