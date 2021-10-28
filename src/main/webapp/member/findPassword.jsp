<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" errorPage="/error"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>비밀번호 찾기</title>
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
		<div id="checkModal" class="modal fade" tabindex = "-1" role = "dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
		 			<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" style="font-size:40px">&times;</button>
						<h4 class="modal-title" style="font-size:25px">이메일 인증</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="col-form-label">이메일을 확인해주세요.</label>
							<input id="modalCode" class="form-control" placeholder="인증코드 입력" />
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="emailCodeCheck()">확인</button>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix">
			<form onsubmit="return login()">
				<div class="input-group col-sm-10" style="margin:0px auto">
					<span class="input-group-addon">
						<label style="margin:0px" for="username">
							<i class="glyphicon glyphicon-envelope"></i>
						</label>
					</span>
					<input type="text" class="form-control" id="email" name="email"
						placeholder="찾으실 이메일을 입력해주세요." oninput="noSpaceForm(this)">
					<span class="input-group-btn">
						<button type="submit" class="btn">인증</button>
					</span>
				</div>
			</form>
			<span id="valid_login" style="color: red">${loginFailMsg}</span>
		</div>
		<script>
			const login=()=>{
				$("#valid_login").text("");
				let email = $("#email");
				let valid = "";
				if (email.val() === "") {
					valid = "이메일을 입력하세요.";
				}else if (!emailCheck(email.val())) {
					valid = "이메일 형식에 맞지 않습니다.";
				}else if(!checkEmailDuplicate()){
					valid = "존재하지 않는 이메일입니다.";
				}
				if(valid === ""){
					$("#checkModal").modal("toggle");
					$("#modalCode").val("");
					
					let uri = contextRoot+"/member/emailSend.do";
					let headers = {};
					headers["X-HTTP-Method-Override"] = "POST";
					let email = "email=" + $("#email").val();

					$.ajax({
						url : uri,
						type : "POST",
						headers : headers,
						data : email,
						error : function(request, status, error) {
							console.log("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:" + error);
							alert("에러가 발생하였습니다.");
						}
					});
				}else{
					$("#valid_login").text(valid);
					email.focus();
				}
				return false;
			}
	
			const emailCodeCheck=()=>{
				let code = $("#modalCode");
				if (code.val() === "") {
					code.focus();
					return;
				}
	
				let uri = contextRoot+"/member/emailCheck.do";
				let headers = {};
				headers["X-HTTP-Method-Override"] = "POST";
				let emailCode = "emailCode=" + code.val();

				$.ajax({
					url : uri,
					type : "POST",
					headers : headers,
					data : emailCode,
					success : function(response) {
						if (response) {
							uri = contextRoot+"/member/passwordReset.do";
							let email = "email=" + $("#email").val();

							$.ajax({
								url : uri,
								type : "POST",
								headers : headers,
								data : email,
								success : function(response) {
									alert(response);
								},
								error : function(request, status, error) {
									console.log("code:" + request.status + "\n" + "message:"
											+ request.responseText + "\n" + "error:" + error);
									alert("에러가 발생하였습니다.");
								}
							});
						}else{
							$("#modalCode").val("");
							$("#modalCode").focus();
							alert("올바르지 않는 코드입니다.");
						}
					},
					error : function(request, status, error) {
						console.log("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:" + error);
						alert("에러가 발생하였습니다.");
					}
				});
			}
	
			const checkEmailDuplicate=()=>{
				let email = $("#email").val();
				let uri = contextRoot+"/member/checkEmailDuplicate/";
				uri += email;
				uri += "/exists.do";
				let headers = {};
				headers["X-HTTP-Method-Override"] = "POST";
	
				let value = false;
				$.ajax({
					url : uri,
					type : "POST",
					headers : headers,
					async : false,
					success : function(response) {
						if (response)
							$("#valid_email").text("이미 존재하는 이메일입니다.")
	
						value = response;
					},
					error : function(request, status, error) {
						console.log("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:" + error);
						alert("에러가 발생하였습니다.");
						value = true;
					}
				});
				
				return value;
			}
            
            $("#checkModal input").keydown(function(key) {
                if (key.keyCode == 13) {
                	emailCodeCheck();
                }
            });
		</script>
	</body>
</html>