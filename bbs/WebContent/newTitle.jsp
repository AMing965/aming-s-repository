<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body background=img/1.jpg
	style="text-align: center; margin: 0px auto; width: fit-content">
	<form action=saveNewTitle.jsp?pageNO=1 method=post
		onsubmit="return checkForm(this);">
		<table border=3>
			<tr>
				<td>用户名</td>
				<td><input type="text" size=60 name=name></td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td><input type=text size=60 name=email></td>
			</tr>
			<tr>
				<td><pre>主题</td>
				<td><input type=text size=60 name=subject></td>
			</tr>
			<tr valign=top>
				<td><pre>内容</td>
				<td><textarea rows=10 cols=60 name=content></textarea></td>
			</tr>
			<tr align=center>
				<td colspan=2><input type=submit value=发送心得主题 name=send>
					<input type=reset value="重置"></td>
			</tr>
		</table>
		<hr>
		<a href=mainForm.jsp>返回主题页</a>
	</form>
</body>
</html>
