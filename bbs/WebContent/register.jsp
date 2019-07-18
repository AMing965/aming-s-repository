<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<body background=img/1.jpg style="text-align: center; margin: 0px auto; width: fit-content">
		<tr>
			<td>您好，欢迎登陆注册页面，请详细填写您的资料。</td>
		</tr>
		<table border="2">
		<form action=saveRegister.jsp method="post">
			<tr>
				<th>姓名</th>
				<td><input type="text" size=20 name="username"></td>
			</tr>
			<tr>
				<th>密码</th>
				<td><input type="password" size=20 name="password"></td>
			</tr>
			<tr>
				<th>性别</th>
				<td><input type="text" size=20 name="sex"></td>
			</tr>
			<tr>
				<th>年龄</th>
				<td><input type="text" size=20 name="age"></td>
			</tr>
			<tr>
				<th rowspan="3">生日</th>
				<td><input type="text" size=8 name="year">年</td><tr/>
				<td><input type="text" size=8 name="month">月</td><tr/>
				<td><input type="text" size=8 name="day">日</td><tr/>
			</tr>
			<tr>
				<th>电话</th>
				<td><input type="text" size=20 name="telephone"></td>
			</tr>
			<tr>
				<th>邮箱</th>
				<td><input type="text" size=20 name="email"></td>
			</tr>
			<tr>
				<th colspan="3"><input type="submit" name="submit" value="注册"></th>
			</tr>
			<tr>
				<th><a href=login.jsp>返回前一页</a></th>
			</tr>
			</form>
		</table>
	
</body>
</html>

