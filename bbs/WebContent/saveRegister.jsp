<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<html>
<body style="text-align:center">
	<%
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String telephone = request.getParameter("telephone");
		String email = request.getParameter("email");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String year = request.getParameter("year");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "root");
			Statement stmt = c.createStatement();
			ResultSet rs;
			String sql;
			String msg=null;
			sql = "select * from student where username='" + username + "'"; //查询数据库
			rs = stmt.executeQuery(sql);
			if (!rs.next()) {//如果不存在
				String birth;
				birth = year + "年" + month + "月" + day + "日";
				String type = "2";
				String sql1 = "insert into student ( username, password, sex, birth, age, telephone , email , type)values('"
						+ username + "','" + password + "','" + sex + "','" + birth + "','" + age + "','"
						+ telephone + "','" + email + "','" + type + "')";
				stmt.executeUpdate(sql1);
				msg = "恭喜你，已注册成功！";
				out.println("<center><font color=green size=5>提示信息：<hr></font><font color=red size=4>" + msg
						+ "</font><hr>");
			/* 	response.sendRedirect("login.jsp"); */
				out.println("<input type=button value=回上一页  onclick=history.back();>");
			} else {//如果注册用户已存在
				msg = "你所注册的用户已经存在，请你重新注册！";
				out.println("<center><font color=green size=5>提示信息：<hr></font><font color=red size=4>" + msg
						+ "</font><hr>");
				out.println("<input type=button value=回上一页  onclick=history.back();>");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.println("系统错误");
		};
	%>
</body>
</html>
