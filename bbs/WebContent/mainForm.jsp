<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<html>
<body  background=img/1.jpg>
<table  style="text-align:center;margin:0px auto;width:fit-content">
		<tr>
			<td width=1000 height=500><h1>欢迎查看论坛</h1>
			</td>
			</tr>
		</table>
		<table style="text-align:center;margin:0px auto;width:fit-content"  border="1"><tr><td width=500>主题</td>
		<td width=500>用户名</td>
		<td width=500>回复时间</td></tr>
	<%

		int MaxNum = 5;//每页容纳的主题论文的最大数目
		int count = 0, firstPage = 1, lastPage = 1, firstNum = 1, lastNum = 1, prePage = 1, nextPage = 1,
				pageNO = 1;
		if (request.getParameter("pageNO") == null || request.getParameter("pageNO").equals(""))
			pageNO = 1;
		else
			pageNO = Integer.parseInt(request.getParameter("pageNO"));
		//firstPage表示首页，lastPage表示末页，pageNO表示第几页
		//firstNum表示该页的起始贴的ID，lastNum表示该页的末帖的ID
		//prePage表示前一页，nextPage表示后一页
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "root");
			Statement stmt = c.createStatement();
			ResultSet rs;
			String sql = "select * from discuss"; //查询数据库
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				count++;//计算数据库里一共有多少帖子；
			}
			lastPage = (int) Math.ceil((double) count / MaxNum);
			//向上取整
			if (pageNO <= 0)
				pageNO = 1;
			if (pageNO > lastPage)
				pageNO = lastPage;
			firstNum = (pageNO - 1) * MaxNum + 1;
			lastNum = pageNO * MaxNum;
			if (pageNO <= 1)
				prePage = 1;
			else
				prePage = pageNO - 1;

			if (pageNO >= lastPage)
				nextPage = pageNO;
			else
				nextPage = pageNO + 1;
			ResultSet rs2;
			String sql2 = "SELECT * FROM bbs.discuss LIMIT 1,10";
			rs2 = stmt.executeQuery(sql2);
			
		%>
		
		<%		while (rs2.next()) {
				String Did=rs2.getString(1);
				String subject = rs2.getString(3);
				String time = rs2.getString(5);
				String username = rs2.getString(6);
				out.print("<tr ><td  width=300><a href=detail.jsp?username="
						+ username +"&Did=" + Did+ ">" + subject + "</a></td>");
				out.print("<td width=200>" + username + "</td>");
				out.println("<td width=200>" + time + "</td>");
				out.print("</tr>");
			}
			out.print("<th colspan=4> <a href=newTitle.jsp>发表新帖子</a></td>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	</table>
	<form action=dissess.jsp method=post>
		<table style="text-align:center;margin:0px auto;width:fit-content" border=1>
			<tr>
				<td>目前页数： <font color=red><%=pageNO%></font>
				</td>
				<td>总页数： <font color=red><%=lastPage%></font>
				</td>
				<td><a href=dissess.jsp?pageNO= <%=firstPage%>>【第一页】</a></td>
				<td><a href=dissess.jsp?pageNO= <%=prePage%>>【上一页】</a></td>
				<td><a href=dissess.jsp?pageNO= <%=nextPage%>>【下一页】</a></td>
				<td><a href=dissess.jsp?pageNO= <%=lastPage%>>【最后一页】</a></td>
				<td>输入页次： <input type=text size=3 name=pageNO
					value="<%=pageNO%>">
				</td>
				<td><input type=submit name=send value="送出"></td>
			</tr>
		</table>
	</form>
	</body>