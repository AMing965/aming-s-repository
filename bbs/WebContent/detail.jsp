<%@page import="javax.print.attribute.standard.MediaSize.Other"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body background=img/1.jpg
	style="text-align: center; margin: 0px auto; width: fit-content">
<head>这是帖子的详细内容:
</head>
<table border="1">
	<%
		String Did = request.getParameter("Did");
		session.setAttribute("Did", Did);
		String username = request.getParameter("username");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "root");
			Statement stmt = c.createStatement();
			ResultSet rs;
			String sql = "select * from discuss where Did = '" + Did + "'";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String subject = rs.getString(3);
				String time = rs.getString(5);
				out.println("<tr><td width=200>" + "标题：" + subject + "</td></tr>");
				out.print("<tr><td width=200><textarea rows=5 cols=110 name=content>" + rs.getString(4)
						+ "</textarea></td></tr>");
				out.print("<tr><td width=20>" + "发布人：" + username + "&nbsp &nbsp &nbsp 发布时间：" + time
						+ "&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp<a href=delete.jsp?name=" + username + "&Rid=" + Did
						+ ">删除帖子</td></tr>");

			}

			Statement stmt2 = c.createStatement();
			ResultSet rs2;
			String sql2 = "select * from reply where Rid = '" + Did + "'";
			rs2 = stmt2.executeQuery(sql2);
			while (rs2.next()) {
				out.print("<tr>");
				out.print("<tr>");
				out.print("<th>用户" + rs2.getString(4) + "&nbsp &nbsp &nbsp 回复：" + rs2.getString(2) + "</th>");
				out.print("</tr>");
				int Rid = Integer.parseInt(rs2.getString(1));//提取回复贴的id；
				out.print("<td>回复的时间是：" + rs2.getString(3)
						+ "&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp<a href=delete.jsp?name=" + username + "&Rid=" + Rid
						+ ">删除回复</a></td>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</table>
<form action=saveRevert.jsp method="post"
	onsubmit="return checkForm(this)">
	<table border=1>
		<tr>
			<td>输入你要回复的内容</a></td>
		</tr>
		<tr>
			<td><textarea rows=5 cols=110 name=content></textarea></td>
		</tr>
		<tr align=center>
			<td colspan=2><input type=submit value=确认回复 name=send> <input
				type=reset value=清除重写></td>
		</tr>
	</table>
</form>
</body>
</html>