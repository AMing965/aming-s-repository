<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<body  background=img/1.jpg style="text-align: center; margin: 0px auto; width: fit-content">
	<p>
	<center>
		<h2>填写以下资料，找回您的密码</h2>
	</center>
	<form action="" name="getpassword" >
		<table border=2 align="center">
			<tr>
				<th>姓名：</th>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<th>性别：</th>
				<td><input type="text" name="sex"></td>
			</tr>
			<tr>
				<th>邮箱：</th>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<th colspan="2" ><input type="submit" name="submit" value="提交"></th>
			</tr>
			<tr>
			<th  colspan="2"><a href=login.jsp>返回登陆页面</a></th>
			</tr>

			<%
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "root");
					Statement stmt = c.createStatement();
					ResultSet rs;
					if (request.getParameter("username") != null//username用户名
							&& request.getParameter("sex") != null//sex性别
							&& request.getParameter("email") != null) {//email电子邮箱
						String username = request.getParameter("username");
						String sex = request.getParameter("sex");
						String email = request.getParameter("email");
						String sql = "select * from student where username='" + username + "' and sex='" + sex
								+ "' and email='" + email + "'";
						rs = stmt.executeQuery(sql);
						if (rs.next()) {//如果找到
							String password = rs.getString(3);
							String errmsg = "信息填写正确,你的密码为：";
							out.println("<center><font color=green size=5>提示信息：<hr></font><font color=red size=4>" + errmsg
									+ password + "</font><hr>" );
						} else {
							String errmsg = "对不起，您不能取回你的密码，原因是你没能正确的填写信息！";
							out.println("<center><font color=green size=5>提示信息：<hr></font><font color=red size=4>" + errmsg
									+ "</font><hr>");
							out.println("<input type=button value=回上一页  onclick=history.back();>");
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					out.print("系统的错误");
				}
			%>
		</table>
	</form>
</body>
</html>