<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- <%@page import="javax.xml.soap.Detail"%> --%>
<%@ page import="java.sql.*" %>
<html>
<body background=photo/07.jpg>
<%
Statement sql;
Connection con;
ResultSet rs;
int MaxNum = 5;//每页容纳的主题论文的最大数目
int count = 0, firstPage = 1, lastPage=1, firstNum=1, lastNum=1, prePage=1, nextPage=1, pageNO=1;
if (request.getParameter("pageNO") == null||request.getParameter("pageNO").equals(""))
	pageNO = 1;
else
	pageNO = Integer.parseInt(request.getParameter("pageNO"));

//firstPage表示首页，lastPage表示末页，pageNO表示第几页
//firstNum表示该页的起始贴的ID，lastNum表示该页的末帖的ID
//prePage表示前一页，nextPage表示后一页
   try{
	   
       Class.forName("com.mysql.jdbc.Driver");
       }
       catch(Exception e){
    	   out.print(e);
       };
     
       
    	try{ 
    		String database="test";
      String uri="jdbc:mysql://localhost/"+database; 
          
    	   con = DriverManager.getConnection(uri,"root","root");
    	   
//翻页功能的实现
String condition="select * from discuss";
sql=con.createStatement();
rs=sql.executeQuery(condition);
while(rs.next())
{
 count++;//计算数据库里一共有多少帖子；
 } 
	/* if (request.getParameter("pageNO") == null)
			pageNO = 0;
		else
			pageNO = Integer.parseInt(request.getParameter("pageNO")); */
    lastPage=(int)Math.ceil((double)count/MaxNum);
   //向上取整
   if(pageNO<=0)
	   pageNO=1;
   if(pageNO>lastPage)
	   pageNO=lastPage;
   firstNum=(pageNO-1)*MaxNum+1;
   lastNum=pageNO*MaxNum;
   if(pageNO<=1)
	   prePage=1;
   else
	   prePage=pageNO-1;
   
   if(pageNO>=lastPage)
	   nextPage=pageNO;
   else
	   nextPage=pageNO+1;
   ResultSet rs2;
   String condition2 = "select * from discuss where id between " + firstNum
		   + " and " + lastNum;
   rs2=sql.executeQuery(condition2);
   String name,subject,time;
   int replyid,id;
   while(rs2.next())
   {
	   name=rs2.getString(1);
       subject=rs2.getString(3);
       time=rs2.getString(5);
       id=rs2.getInt(7);
       out.print("<table><tr ><td><a href=Delete.jsp?id="+id+
    		   "&replyid=0><img src=photo/110.jpg width=40 height=40></a></td><td  width=300><a href=Detail.jsp?id="+ id + 
    		   ">" + subject + "</a></td>");
		out.print("<td width=200>" + name + "</td>");
		out.println("<td width=200>" + time + "</td>");
		out.print("</tr><table>");
		}
   out.print("<td><a href=NewTitle.jsp>发表新帖子</a></td>");
    	}
   	 catch(Exception e) {
    		
   		 out.println("捕捉的错误2");}
   		 %>
　　　<form action=dissess.jsp method=post>
	<table border=0>
		<tr>
			<td>
				目前页数：
				<font color=red><%=pageNO%></font>
			</td>
			<td>
				总页数：
				<font color=red><%=lastPage%></font>
			</td>
			<td>
				<a href=dissess.jsp?pageNO=<%=firstPage%>>【第一页】</a>
			</td>
			<td>
				<a href=dissess.jsp?pageNO=<%=prePage%>>【上一页】</a>
			</td>
			<td>
				<a href=dissess.jsp?pageNO=<%=nextPage%>>【下一页】</a>
			</td>
			<td>
				<a href=dissess.jsp?pageNO=<%=lastPage%>>【最后一页】</a>
			</td>
			<td>
				输入页次：
				<input type=text size=3 name=pageNO value="<%=pageNO %>">
			</td>
			<td>
				<input type=submit name=send value="送出">
			</td>
		</tr>
	</table>
</form>
