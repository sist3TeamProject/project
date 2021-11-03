<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" errorPage="/error"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>내 정보</title>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<style>
		</style>
	</head>
	<body>
		<div class="clearfix">
			<form id="form" action="<c:url value="/member/update.do" />"
				method="post" onsubmit="return checkConditions()">
				<input type="hidden" name="idx" value="${memberDTO.idx}" />
				<input type="hidden" name="updateCheck" value="" />
				<div class="input-group col-sm-10" style="margin:0px auto">
					<span class="input-group-addon">
						<label style="margin:0px" for="email">
							<i class="glyphicon glyphicon-envelope"></i>
						</label>
					</span>
					<input type="text" class="form-control" id="email" name="email" style="background-color:#ffffff" value="${memberDTO.email}" maxlength="30" placeholder="이메일을 입력해주세요." oninput="noSpaceForm(this)" readonly>
				</div>
				<div class="input-group col-sm-10" style="margin:0px auto">
					<span id="valid_email"></span>
				</div>
				
				<div class="input-group col-sm-10" style="margin:0px auto">
					<span class="input-group-addon">
						<label style="margin:0px" for="password">
							<i class="glyphicon glyphicon-lock"></i>
						</label>
					</span>
					<input type="password" class="form-control" id="password" name="password" maxlength="20" placeholder="비밀번호를 입력해주세요." oninput="noSpaceForm(this)">
				</div>
				<div class="input-group col-sm-10" style="margin:0px auto">
					<span id="valid_password"></span>
				</div>
				
				<div class="input-group col-sm-10" style="margin:0px auto">
					<span class="input-group-addon">
						<label style="margin:0px" for="nickname">
							<i class="glyphicon glyphicon-user"></i>
						</label>
					</span>
					<input type="text" class="form-control" id="nickname" name="nickname" value="${memberDTO.nickname}" maxlength="10" placeholder="닉네임을 입력해주세요." oninput="noSpaceForm(this)">
				</div>
				<div class="input-group col-sm-10" style="margin:0px auto">
					<span id="valid_nickname"></span>
				</div>
				
				<div class="input-group col-sm-10" style="margin:0px auto">
					<span class="input-group-addon">
						<label style="margin:0px" for="phoneNumber">
							<i class="glyphicon glyphicon-earphone"></i>
						</label>
					</span>
					<input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${memberDTO.phoneNumber}" maxlength="11" placeholder="전화번호를 입력해주세요" oninput="numberForm(this)" data-format="ddd-dddd-dddd">
				</div>
				<div class="input-group col-sm-10" style="margin:0px auto">
					<span id="valid_phoneNumber"></span>
				</div>
				
				<div style="margin-top:30px">
					<div class="input-group col-sm-10" style="margin:0px auto">
						<span class="input-group-addon">
							<label style="margin:0px" for="find">
								<i class="glyphicon glyphicon-home"></i>
							</label>
						</span>
						<input type="text" class="form-control" style="width:calc(100% - 50px); background-color:#ffffff" id="postcode" name="postcode" placeholder="우편번호" readonly>
						<button type="button" id="find" class="btn btn-success" style="width:50px; height:34px" onclick="execDaumPostcode()">찾기</button>
						<div id="wrap" style="display:none; border:1px solid;width:50%; min-width:320px; height:400px; margin:5px 0; position:relative">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer; position:absolute; right:0px; top:-1px; z-index:1; width:30px; height:30px" onclick="foldDaumPostcode()" alt="접기 버튼" />
						</div>
						<input type="text" class="form-control" style="width:100%; background-color:#ffffff" id="address" name="address" placeholder="주소" readonly>
						<input type="text" class="form-control" style="width:50%" id="detailAddress" name="detailAddress" maxlength="20" placeholder="상세주소">
						<input type="text" class="form-control" style="width:50%" id="extraAddress" name="extraAddress" maxlength="20" placeholder="참고항목">
					</div>
					<div class="input-group col-sm-10" style="margin:0px auto">
						<span id="valid_postcode"></span>
					</div>
				</div>
				<div class="input-group col-sm-10" style="margin:20px auto 60px">
					<input type="button" class="btn btn-primary" style="float:right" value="가입하기" onclick="checkConditions()" />
				</div>
			</form>
		</div>
		<script>
			const checkConditions=()=>{
				let check = true;
				$("#valid_password").text("");
				$("#valid_nickname").text("");
				$("#valid_phoneNumber").text("");
				$("#valid_postcode").text("");
				if (checkValidation()) {
					check = false;
				}
				
				return check;
			}
	
			const checkValidation=()=>{
				let memberDTO = $("#form").serialize();
				let uri = contextRoot+"/member/checkValidation.do";
				let headers = {};
				headers["X-HTTP-Method-Override"] = "POST";

				let value = false;
				$.ajax({
					url : uri,
					type : "POST",
					headers : headers,
					data : memberDTO,
					async : false,
					success : function(response) {
						for (let key in response) {
							if(key != "valid_password" || $("#password") != null){
								$("#" + key).text(response[key]);
								value = true;
							}
						}
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
		</script>
		<script src="<c:url value="/resources/js/postcode.js" />"></script>
	</body>
</html>