<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" errorPage="/error"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>로그인</title>
		<style>
			div > img {
				width: 300px;
				display: block;
				margin: 0px auto;
				cursor: pointer;
			}
		</style>
	</head>
	<body>
		<div class="clearfix">
			<form action="<c:url value="/member/processLogin.do" />" method="post"
				onsubmit="return login()">
				<div style="float: left; width: calc(100% - 100px)">
					<div class="input-group">
						<span class="input-group-addon">
							<label style="margin:0px" for="username">
								<i class="glyphicon glyphicon-envelope"></i>
							</label>
						</span>
						<input type="text" class="form-control" id="username" name="username"
							placeholder="Email" oninput="noSpaceForm(this)">
					</div>
					<div class="input-group">
						<span class="input-group-addon">
							<label style="margin:0px" for="password">
								<i class="glyphicon glyphicon-lock"></i>
							</label>
						</span>
						<input type="password"
							class="form-control" id="password" name="password"
							placeholder="Password" oninput="noSpaceForm(this)">
					</div>
				</div>
				<div style="float: right; width: 100px">
					<button type="submit" class="btn btn-primary"
						style="width: 100%; height: 90px; padding: 0px">로그인</button>
				</div>
				<div style="clear: both; font-size: 25px; margin-left: 10px">
					<input type="checkbox" id="autoLogin" name="remember-me" checked /> <label
						for="autoLogin">자동로그인</label>
				</div>
			</form>
			<span id="valid_login" style="color: red">${loginFailMsg}</span>
		</div>
		<script>
			const login=()=>{
				let valid_login = $("#valid_login");
				let username = $("#username");
				if (username.val() === "") {
					username.focus();
					valid_login.text("이메일을 입력하세요.");

	                return false;
				}else if (!emailCheck(username.val())) {
					username.focus();
					valid_login.text("이메일 형식에 맞지 않습니다.");

	                return false;
				}
				let password = $("#password");
				if (password.val() === "") {
					password.focus();
					valid_login.text("비밀번호을 입력하세요.");

	                return false;
				}
				return true;
			}
		</script>
	</body>
</html>