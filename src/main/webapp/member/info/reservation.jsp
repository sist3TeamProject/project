<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
	<head>
		<title>예약</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
		<style>
			.table > thead > tr > th:first-child {
				width: 60px;
			}
			.table > thead > tr > th:nth-child(2) {
				width: 200px;
			}
			.table > thead > tr > th:last-child {
				min-width: 130px;
			}
			.table > thead > tr > th {
				width: 100px;
			}
			.table > tbody > tr {
				cursor: pointer;
			}
		</style>
	</head>
	<body>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="nav navbar-nav" style="margin:0px">
					<a class="navbar-brand" href="<c:url value="/member/info.do?type=0" />">계정변경</a>
					<a class="navbar-brand" href="<c:url value="/member/info.do?type=1" />">병원예약</a>
					<!-- <a class="navbar-brand" href="<c:url value="/member/info.do?type=2" />">코로나예약</a> -->
				</div>
			</div>
		</nav>
		<div class="table-responsive col-sm-10" style="margin: 0px auto; float: none">
			<table class="table table-hover">
				<thead>
					<tr class="success">
						<th>번호</th>
						<th>${type==1?'병원명':'약국명'}</th>
						<th>인원수</th>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<th>예약자</th>
							<th>전화번호</th>
						</sec:authorize>
						<th>예약일</th>
						<th>처리현황</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${fn:length(reservationList) > 0}">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<c:forEach var="reservationDTO" items="${reservationList}">
								<tr onclick="viewTarget(${reservationDTO.targetIdx})">
									<td>${reservationDTO.idx}</td>
									<td>${reservationDTO.title}</td>
									<td>${reservationDTO.peopleNumber}명</td>
									<td>${reservationDTO.writer}</td>
									<td>${reservationDTO.phoneNumber}</td>
									<fmt:parseDate value="${reservationDTO.reservationTime}" var="dateFmt" pattern="yyyy-MM-dd'T'HH:mm" />
									<td><fmt:formatDate value="${dateFmt}" pattern="yy-MM-dd HH:mm" /></td>
									<c:if test="${reservationDTO.status != 0}">
										<td>${reservationDTO.status==1?'승인 완료':'승인 거부'}</td>
									</c:if>
									<c:if test="${reservationDTO.status == 0}">
										<td>
											<input type="button" class="btn btn-xs btn-success" style="width:50px; height:30px" onclick="reservationCheck(this, ${reservationDTO.idx}, 1)" value="승인" />
											<input type="button" class="btn btn-xs btn-danger" style="width:50px; height:30px" onclick="reservationCheck(this, ${reservationDTO.idx}, -1)" value="거부" />
										</td>
									</c:if>
								</tr>
							</c:forEach>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_USER')">
							<c:forEach var="reservationDTO" items="${reservationList}">
								<tr onclick="viewTarget(${reservationDTO.targetIdx})">
									<td>${reservationDTO.idx}</td>
									<td>${reservationDTO.title}</td>
									<td>${reservationDTO.peopleNumber}명</td>
									<fmt:parseDate value="${reservationDTO.reservationTime}" var="dateFmt" pattern="yyyy-MM-dd'T'HH:mm" />
									<td><fmt:formatDate value="${dateFmt}" pattern="yy-MM-dd HH:mm" /></td>
									<td>${reservationDTO.status==0?'처리 대기중':(reservationDTO.status==1?'승인 완료':'승인 거부')}</td>
								</tr>
							</c:forEach>
						</sec:authorize>
					</c:if>
					<c:if test="${fn:length(reservationList) == 0}">
						<tr>
							<td colspan="100%">조회된 결과가 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
		<script>
			let type;
			$(function(){
				$("a.navbar-brand:nth-child("+parseInt(${1 + type})+")").addClass("active");
				
				$(".phoneNumber").each(function(){
					console.log($(this).text());
					$(this).text(phoneNumberCheck($(this).text()));
				});
			});
	
			const viewTarget=(idx)=>{
				let link;
				//if(type === 1){
					link = contextRoot+"/hospital/detail.do?IDX=";
				/*}else{
					link = contextRoot+"/test/detail.do?IDX=";
				}*/
				link += idx;
				location.href = link;
			}
		
			const reservationCheck=(obj, idx, status)=>{
				event.stopPropagation();
				
				let uri = contextRoot+"/reservation/update.do";
				let data = {
						"idx" : idx,
						"status" : status
					}
				let headers = {};
				headers["X-HTTP-Method-Override"] = "POST";
	
				$.ajax({
					url : uri,
					type : "POST",
					headers : headers,
					data : data,
					success : function(response) {
						if(response != null){
							$(obj).parent().text(response);
						}else{
							alert("실패하였습니다.");
						}
					},
					error : function(request, status, error) {
						console.log("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:" + error);
						alert("에러가 발생하였습니다.");
					}
				});
			}
		</script>
	</body>
</html>