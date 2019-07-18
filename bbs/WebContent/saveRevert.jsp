<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.GregorianCalendar"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String content = request.getParameter("content");
	String Rid = (String)session.getAttribute("Did");
	String username = (String)session.getAttribute("username");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "root");
			Statement stmt = c.createStatement();
			ResultSet rs;
			String sql;
			Date date = new Date();
	        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        String time = df.format(date);
	        sql = "select id from student where username='" + username + "'";
	        rs = stmt.executeQuery(sql);
	        rs.next();
	        String id=""+rs.getInt(1);
	        System.out.println(username);
			PreparedStatement updataContion = c.prepareStatement("insert into reply value(?,?,?,?,?)");
			updataContion.setString(1, Rid);
			updataContion.setString(2, content);
			updataContion.setString(3, time);
			updataContion.setString(4, username);
			updataContion.setString(5, id);
			updataContion.executeUpdate();
			response.sendRedirect("detail.jsp?Did=" + Rid);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("更新回复失败");
		}
	%>
</body>
</html>