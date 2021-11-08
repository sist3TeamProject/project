<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>로그인</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
		<style>
			/* 영역 선택 차단 */
			label {
			   -ms-user-select: none; 
			   -moz-user-select: -moz-none;
			   -khtml-user-select: none;
			   -webkit-user-select: none;
			   user-select: none;
			 }
			 
			@media ( max-width : 767px) {
				.input-group.col-sm-10 {
					width:100%;
				}
			}
		</style>
	</head>
	<body>
		<div class="clearfix">
			<form action="<c:url value="/member/processLogin.do" />" method="post"
				onsubmit="return login()">
				<div style="width:100%">
					<div class="input-group col-sm-10" style="margin:0px auto">
						<span class="input-group-addon">
							<label style="margin:0px" for="username">
								<i class="glyphicon glyphicon-envelope"></i>
							</label>
						</span>
						<input type="text" class="form-control" id="username" name="username"
							placeholder="Email" oninput="noSpaceForm(this)">
					</div>
					<div class="input-group col-sm-10" style="margin:0px auto">
						<span class="input-group-addon">
							<label style="margin:0px" for="password">
								<i class="glyphicon glyphicon-lock"></i>
							</label>
						</span>
						<input type="password"
							class="form-control" id="password" name="password"
							placeholder="Password" oninput="noSpaceForm(this)">
					</div>
					<div class="input-group col-sm-10" style="margin:0px auto">
						<button type="submit" class="btn btn-success"
							style="width: 100%; height: 40px; padding: 0px">로그인</button>
					</div>
				</div>
				<div class="input-group col-sm-10" style="margin:0px auto">
					<div style="float: left; font-size: 15px; margin-left: 10px">
						<input type="checkbox" id="autoLogin" name="remember-me" checked /> <label
							for="autoLogin">자동로그인</label>
					</div>
					<div style="float: right; font-size: 15px; margin-right: 10px">
						<a href="<c:url value="/member/signup.do" />">회원가입</a>
					</div>
					<div style="float: right; font-size: 15px; margin-right: 10px">
						<a href="<c:url value="/member/findPassword.do" />">비밀번호 찾기</a>
					</div>
				</div>
			</form>
			<div class="input-group col-sm-10" style="margin:0px auto 60px">
				<span id="valid_login" style="color: red">${loginFailMsg}</span>
			</div>
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