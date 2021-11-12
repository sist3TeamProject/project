<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row{
	margin: 0px;
}
h2,h3,h5{
	font-weight: bolder;
	margin: 20px 0;
}
li{
	padding: 4px;
	display: inline-block;
	/* float: left; */
	font-size: 13px;
	list-style: none;
}
.detailpart{
	margin: 15px;
}
.detailList{
	padding: 10px 0;
	border-top: 1px solid;
	border-bottom: 1px solid;
}
ul{
	padding: 0;
}
th{
	background-color: #F5F5F5;
}
.able{ color: blue; }
.disable{ color: red; }
/*
.clearfix {*zoom:1;}
.clearfix:before, .clearfix:after {display:block; content: ''; line-height: 0;}
.clearfix:after {clear: both;} */
</style>
</head>
<body>
<div class="container">
	<div class="row">
		<h2>병원 찾기</h2>
		<p>병원 정보 검색 서비스입니다.</p>
		<h3>${result.NAME }</h3>
		<div style="height: 200px;">
			<div class="col-sm-5"></div>
			<div class="col-sm-7">
				<table class="table">
					<tr>
						<th width="30%">주소</th>
						<td width="70%">${result.ADDRESS }</td>
					</tr>
					<tr>
						<th width="30%">대표전화</th>
						<td width="70%">${result.PHONENUMBER }</td>
					</tr>
					<tr>
						<th width="30%">소개</th>
						<td width="70%">${result.TYPE }</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="detailpart" >
			<h5>외래 진료시간</h5>
			<div class="detailList">
				<ul class="clearfix">
					<li class="col-sm-3"><b>&middot;</b>&nbsp;월요일 ${result.MONDAY }</li>
					<li class="col-sm-3"><b>&middot;</b>&nbsp;화요일 ${result.TUESDAY }</li>
					<li class="col-sm-3"><b>&middot;</b>&nbsp;수요일 ${result.WEDNESDAY }</li>
					<li class="col-sm-3"><b>&middot;</b>&nbsp;목요일 ${result.THURSDAY }</li>
					<li class="col-sm-3"><b>&middot;</b>&nbsp;금요일 ${result.FRIDAY }</li>
					<li class="col-sm-3"><b>&middot;</b>&nbsp;토요일 ${result.SATURDAY }</li>
					<li class="col-sm-3"><b>&middot;</b>&nbsp;일요일 ${result.SUNDAY }</li>
					<li class="col-sm-3"><b>&middot;</b>&nbsp;공휴일 ${result.HOLIDAY }</li>
				</ul>
			</div>
		</div>
		<div style="text-align:center">
			<input type="button" class="btn btn-danger" size=30 value="병원 예약하기" onclick="reservationTarget()" />
		</div>
	</div>
</div>
<div style="height: 200px;"></div>
	<script>
		const reservationTarget=()=>{
			let uri = contextRoot+"/reservation/write.do";
			let form = $("<form></form>");
			form.attr("action", uri);
			form.attr("method", "post");
			form.appendTo("body");
			form.append("<input type='hidden' name='targetType' value='hospital' />");
			form.append("<input type='hidden' name='targetIdx' value='${result.IDX}' />");
			form.append("<input type='hidden' name='title' value='${result.NAME}' />");
			form.submit();
		}
	</script>
</body>
</html>
