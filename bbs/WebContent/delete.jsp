<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<body background=photo/100.jpg>
	<%
		String username = (String)session.getAttribute("username");
		String Rid=request.getParameter("Rid");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "root");
			ResultSet rs;
			String sql ,sql1;
// 			sql="select username from reply where username=' "+ username +" 'and (Rid='"+Rid+"')";
// 			rs = stmt.executeQuery(sql);
// 	        rs.next();
// 	        String Rname=""+rs.getInt(1);
			int id = Integer.parseInt(request.getParameter("Rid"));
			if (id > 0) {
				if (session.getAttribute("username").equals("admin")) {
					String updatecondition = "update reply set content='此回复已被删除！'" + "  where Rid=" + Rid
							+ " ";//删除回复贴
				} else{
						sql="delete from reply where username= "+ username +" ";
						Statement stmt = c.prepareStatement(sql);
						stmt.executeUpdate(sql);
						out.print("回复已经删除");
						out.println("<input type=button value=回上一页  onclick=history.back();>");
					}
			}else{
				out.print("没有权利删除帖子");
				out.println("<input type=button value=回上一页  onclick=history.back();>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			out.print("刪除失敗");
			out.println("<input type=button value=回上一页  onclick=history.back();>");
		}
		
			
// 			sql="select type from student where type='2'";
			
			
// 			int id = Integer.parseInt(request.getParameter("id"));//获得主贴id
// 			int replyid = Integer.parseInt(request.getParameter("replyid"));//删除主贴还是回复贴
// 			if (replyid > 0) {
// 				if (session.getAttribute("username").equals("admin")) {
// 					String updatecondition = "update reply set content='此回复已被删除！'" + "  where reply=" + id
// 							+ " and id =" + replyid;//删除回复贴
// 					sql = con.createStatement();
// 					sql.executeUpdate(updatecondition);
// 					out.print("帖子已经删除");
// 					response.sendRedirect("detail.jsp?id=" + id);
// 				} else
// 					out.print("<h4>" + "你是非管理员，所以，没有权利删除帖子");
	
	%>
</body>
</html>
