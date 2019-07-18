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
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
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
			PreparedStatement updataContion = c.prepareStatement("insert into discuss value(?,?,?,?,?,?,?)");
			updataContion.setString(1, null);
			updataContion.setString(2, email);
			updataContion.setString(3, subject);
			updataContion.setString(4, content);
			updataContion.setString(5, time);
			updataContion.setString(6, username);
			updataContion.setString(7, id);
			updataContion.executeUpdate();
 			response.sendRedirect("mainForm.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
			out.print("更新失败");
		}
	%>
</body>
</html>
