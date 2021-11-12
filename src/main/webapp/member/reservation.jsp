<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<title>예약</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
		<style>
			.btn.btn-success.btn-xs {
				padding: 6px 10px 6px;
				margin-right: 4px;
			}
			.btn.btn-danger.btn-xs {
				padding: 6px 16px 6px;
			}
		</style>
	</head>
	<body>
		<form id="form" class="form-horizontal" onsubmit="return insertResevation()">
			<input type="hidden" name="targetIdx" value="${reservationDTO.targetIdx}" />
			<input type="hidden" name="targetType" value="${reservationDTO.targetType}" />
			<input type="hidden" name="memberIdx" value="${reservationDTO.memberIdx}" />
			<div class="form-group">
				<label class="col-sm-2 control-label">예약처</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" value="${reservationDTO.title}" readonly />
				</div>
			</div>

			<div class="form-group">
				<label for=peopleNumber class="col-sm-2 control-label">인원수</label>
				<div class="col-sm-9">
					<input type="number" class="form-control" id="peopleNumber" name="peopleNumber" value="1" min="1" max="5" />
					<span id="valid_peopleNumber"></span>
				</div>
			</div>

			<div class="form-group">
				<label for="inputDate" class="col-sm-2 control-label">날짜</label>
				<div class="col-sm-9">
					<input type="date" class="form-control" id="inputDate" name="inputDate" />
					<span id="valid_inputDate"></span>
				</div>
			</div>

			<div class="form-group">
				<label for="inputTime" class="col-sm-2 control-label">시간</label>
				<div class="col-sm-9">
					<input type="time" class="form-control" id="inputTime" name="inputTime" min="09:00:00" max="18:00:00" />
					<span id="valid_inputTime"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">예약자</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" value="${reservationDTO.writer}" readonly />
				</div>
			</div>

			<div id="btnDiv" class="text-center table-btn">
				<input type="button" class="btn btn-default" onclick="window.history.back()" value="뒤로가기" />
				<button type="submit" class="btn btn-success">저장하기</button>
			</div>
		</form>
		<script>
			$(function(){
				let date = new Date();
				date.setDate(date.getDate() + 1);
				date = date.toISOString();
				$("#inputDate").attr("min", date.substring(0, 10));
			});
			
			const insertResevation=()=>{
				$("#valid_peopleNumber").text("");
				$("#valid_inputDate").text("");
				$("#valid_inputTime").text("");
				if (checkValidation()) {
					return false;
				}
				let reservationDTO = $("#form").serializeArray();
				let uri = contextRoot+"/reservation/insert.do";
				let headers = {};
				headers["X-HTTP-Method-Override"] = "POST";

				$.ajax({
					url : uri,
					type : "POST",
					headers : headers,
					data : reservationDTO,
					success : function(response) {
						if(response){
							alert("예약을 성공하였습니다.");
							location.href=contextRoot+"/member/info.do?type=1";
						}else{
							alert("예약을 실패하였습니다.");
						}
					},
					error : function(request, status, error) {
						console.log("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:" + error);
						alert("에러가 발생하였습니다.");
					}
				});
				return false;
			}
	
			const checkValidation=()=>{
				let reservationDTO = $("#form").serialize();
				let uri = contextRoot+"/reservation/checkValidation.do";
				let headers = {};
				headers["X-HTTP-Method-Override"] = "POST";

				let value = false;
				$.ajax({
					url : uri,
					type : "POST",
					headers : headers,
					dataType : "json",
					data : reservationDTO,
					async : false,
					success : function(response) {
						for (let key in response) {
							$("#" + key).text(response[key]);
							value = true;
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
	</body>
</html>