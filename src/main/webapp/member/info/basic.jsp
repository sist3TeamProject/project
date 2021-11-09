<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title></title>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
		<style>
			div.input-group.col-sm-10{
				margin: 0px auto;
			}
			@media ( max-width : 767px) {
				.input-group.col-sm-10.valid {
					margin-left: 0px;
				}
			}
		</style>
	</head>
	<body>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="nav navbar-nav" style="margin:0px">
					<a class="navbar-brand" href="<c:url value="/member/info.do?type=0" />">계정변경</a>
					<a class="navbar-brand" href="<c:url value="/member/info.do?type=1" />">병원예약</a>
					<a class="navbar-brand" href="<c:url value="/member/info.do?type=2" />">코로나예약</a>
				</div>
			</div>
		</nav>
		<form id="form" action="<c:url value="/member/update.do" />"
			method="post" onsubmit="return checkConditions()">
			<input type="hidden" name="idx" value="${memberDTO.idx}" />
			<input type="hidden" name="updateCheck" value="" />
			<div class="input-group col-sm-10">
				<span class="input-group-addon">
					<label style="margin:0px" for="email">
						<i class="glyphicon glyphicon-envelope"></i>
					</label>
				</span>
				<input type="text" class="form-control" id="email" name="email" value="${memberDTO.email}" maxlength="30" placeholder="이메일을 입력해주세요." oninput="noSpaceForm(this)" readonly>
			</div>
			<div class="input-group col-sm-10 valid">
				<span id="valid_email"></span>
			</div>
			
			<div class="input-group col-sm-10">
				<span class="input-group-addon">
					<label style="margin:0px" for="password">
						<i class="glyphicon glyphicon-lock"></i>
					</label>
				</span>
				<input type="password" class="form-control" id="password" name="password" maxlength="20" placeholder="비밀번호를 입력해주세요." oninput="noSpaceForm(this)">
			</div>
			<div class="input-group col-sm-10 valid">
				<span id="valid_password"></span>
			</div>
				
			<div class="input-group col-sm-10">
				<span class="input-group-addon">
					<label style="margin:0px" for="nickname">
						<i class="glyphicon glyphicon-user"></i>
					</label>
				</span>
				<input type="text" class="form-control" id="nickname" name="nickname" value="${memberDTO.nickname}" maxlength="10" placeholder="닉네임을 입력해주세요." oninput="noSpaceForm(this)">
			</div>
			<div class="input-group col-sm-10 valid">
				<span id="valid_nickname"></span>
			</div>
			
			<div class="input-group col-sm-10">
				<span class="input-group-addon">
					<label style="margin:0px" for="phoneNumber">
						<i class="glyphicon glyphicon-earphone"></i>
					</label>
				</span>
				<input type="text" style="text-align:center; width: calc(25% - 20px)" class="form-control phoneNumber" id="phoneNumber" name="phoneNumber" value="${phoneNumber[0]}" maxlength="3" placeholder="010" oninput="numberForm(this)">
				<div style="float:left; text-align:center; font-size:22px; width:20px">-</div>
				<input type="text" style="text-align:center; width: calc(37.5% - 10px)" class="form-control phoneNumber" name="phoneNumber" value="${phoneNumber[1]}" maxlength="4" placeholder="1234" oninput="numberForm(this)">
				<div style="float:left; text-align:center; font-size:22px; width:20px">-</div>
				<input type="text" style="text-align:center; width: calc(37.5% - 10px)" class="form-control phoneNumber" name="phoneNumber" value="${phoneNumber[2]}" maxlength="4" placeholder="56789" oninput="numberForm(this)">
			</div>
			<div class="input-group col-sm-10 valid">
				<span id="valid_phoneNumber"></span>
			</div>
				
			<div style="margin-top:30px">
				<div class="input-group col-sm-10">
					<span class="input-group-addon">
						<label style="margin:0px" for="find">
							<i class="glyphicon glyphicon-home"></i>
						</label>
					</span>
					<input type="text" class="form-control" style="width:calc(100% - 50px); background-color:#ffffff" id="postcode" name="postcode" value="${memberDTO.postcode}" placeholder="우편번호" readonly>
					<button type="button" id="find" class="btn btn-success" style="width:50px; height:34px" onclick="execDaumPostcode()">찾기</button>
					<div id="wrap" style="display:none; border:1px solid;width:50%; min-width:320px; height:400px; margin:5px 0; position:relative">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer; position:absolute; right:0px; top:-1px; z-index:1; width:30px; height:30px" onclick="foldDaumPostcode()" alt="접기 버튼" />
					</div>
					<input type="text" class="form-control" style="width:100%; background-color:#ffffff" id="address" name="address" value="${memberDTO.address}" placeholder="주소" readonly>
					<input type="text" class="form-control" style="width:50%" id="detailAddress" name="detailAddress" value="${memberDTO.detailAddress}" maxlength="20" placeholder="상세주소">
					<input type="text" class="form-control" style="width:50%" id="extraAddress" name="extraAddress" value="${memberDTO.extraAddress}" maxlength="20" placeholder="참고항목">
				</div>
				<div class="input-group col-sm-10 valid">
					<span id="valid_postcode"></span>
				</div>
			</div>
			<div class="input-group col-sm-10 text-right" style="padding-top:30px">
				<button type="submit" class="btn btn-primary">수정하기</button>
			</div>
		</form>
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
			
            $("#form input").keydown(function(key) {
                if (key.keyCode == 13) {
                	if(checkConditions()){
                		$("#form").submit();
                	}
                }
            });
		</script>
		<script src="<c:url value="/resources/js/postcode.js" />"></script>
	</body>
</html>