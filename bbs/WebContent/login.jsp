<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>欢迎进入登陆界面</title>
<script type="text/javascript">
	function checkFrom(form) {
		if (form.username.value == "") {
			alert("用户名不能为空");
			form.username.focus();
			return false
		}
		if (form.password.value = "") {
			alert("密码不能为空");
			form.password.focus();
			return false;
		}
		return true;
	}
</script>
</head>

<body background=img/1.jpg style="text-align:center;margin:0px auto;width:fit-content">
			<tr>
			<td><h1>欢迎进入登陆界面</h1>
			</td>
			</tr>
	<table >
		<form action="enter.jsp" method="post"
			onsubmit="return checkForm(this);">
			
			<tr>
				<td><h3>用户名：</td>
				<td><h4>
						<input type="text" name="username"></td>
			</tr>
			<tr>
				<td><h3>密码：</td>
				<td><h4>
						<input type="password" name="password"></td>
			</tr>
			<tr>
				<td><input type="submit" value="点击进入论坛" name="submit"></td>
				<td><input type="reset" value="重新设置" name="reset"></td>
			</tr>
		</form>
		<tr>
			<td>
				<form action="getPassword.jsp" method="post">
					<input type="submit" value="找回密码" name="getpass">
				</form>
			</td>
			<td>
				<form action="register.jsp" method="post">
					<input type="submit" value="注册新用户" name="regist">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>

