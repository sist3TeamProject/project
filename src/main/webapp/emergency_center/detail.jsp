<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be0965f85428a75d750a50fe123d2748"></script>
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
		<h2>응급실 찾기</h2>
		<p>응급실 정보 검색 서비스입니다.</p>
		<h3>${vo.name }</h3>
		<div style="height: 300px;">
			<div class="col-sm-5">
				<div id="map" style="width: 100%; height: 300px;"></div>
			</div>
			<div class="col-sm-7">
				<table class="table">
					<tr>
						<th width="30%">주소</th>
						<td width="70%">${vo.addr }</td>
					</tr>
					<tr>
						<th width="30%">대표전화</th>
						<td width="70%">${vo.tel }</td>
					</tr>
					<tr>
						<th width="30%">소개</th>
						<td width="70%">${vo.info }</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="detailpart" >
			<h5>외래 진료시간</h5>
			<div class="detailList">
				<ul class="clearfix">
					<li class="col-sm-3"><b>&middot;</b>&nbsp;월요일 ${vo.monday }</li>
					<li class="col-sm-3"><b>&middot;</b>&nbsp;화요일 ${vo.tuesday }</li>
					<li class="col-sm-3"><b>&middot;</b>&nbsp;수요일 ${vo.wednesday }</li>
					<li class="col-sm-3"><b>&middot;</b>&nbsp;목요일 ${vo.thursday }</li>
					<li class="col-sm-3"><b>&middot;</b>&nbsp;금요일 ${vo.friday }</li>
					<li class="col-sm-3"><b>&middot;</b>&nbsp;토요일 ${vo.saturday }</li>
					<li class="col-sm-3"><b>&middot;</b>&nbsp;일요일 ${vo.sunday }</li>
					<li class="col-sm-3"><b>&middot;</b>&nbsp;공휴일 ${vo.holiday }</li>
				</ul>
			</div>
			<h5>진료과목</h5>
			<div class="detailList">
				<ul class="clearfix">
					<c:forTokens var="sub" items="${vo.subjects }" delims="," varStatus="s">
						<li class="col-sm-3"><b>&middot;</b>&nbsp;${sub }</li>
					</c:forTokens>
				</ul>
			</div>
			<h5>실시간 병상정보</h5>
			<div class="detailList">
				<ul class="clearfix">
					<li class="col-sm-3">
						응급실일반병상
						<c:if test="${vo.hvec <= 0 }">
							<span class="disable">[${vo.hvec }병상 여유병상 없음]</span>
						</c:if>
						<c:if test="${vo.hvec > 0 }">
							<span class="able">[${vo.hvec }병상 이용가능]</span>
						</c:if>
					</li>
					<li class="col-sm-3">
						수술실
						<c:if test="${vo.hvoc <= 0 }">
							<span class="disable">[${vo.hvoc }병상 여유병상 없음]</span>
						</c:if>
						<c:if test="${vo.hvoc > 0 }">
							<span class="able">[${vo.hvoc }병상 이용가능]</span>
						</c:if>
					</li>
					<li class="col-sm-3">
						신생중환자실
						<c:if test="${vo.hvncc <= 0 }">
							<span class="disable">[${vo.hvncc }병상 여유병상 없음]</span>
						</c:if>
						<c:if test="${vo.hvncc > 0 }">
							<span class="able">[${vo.hvncc }병상 이용가능]</span>
						</c:if>
					</li>
					<li class="col-sm-3">
						일반중환자실
						<c:if test="${vo.hvicc <= 0 }">
							<span class="disable">[${vo.hvicc }병상 여유병상 없음]</span>
						</c:if>
						<c:if test="${vo.hvicc > 0 }">
							<span class="able">[${vo.hvicc }병상 이용가능]</span>
						</c:if>
					</li>
					<li class="col-sm-3">
						입원실
						<c:if test="${vo.hvgc <= 0 }">
							<span class="disable">[${vo.hvgc }병상 여유병상 없음]</span>
						</c:if>
						<c:if test="${vo.hvgc > 0 }">
							<span class="able">[${vo.hvgc }병상 이용가능]</span>
						</c:if>
					</li>
					<li class="col-sm-3">
						CT
						<c:if test="${vo.hvctayn == 'N' || vo.hvctayn == null }">
							<span class="disable">[이용불가]</span>
						</c:if>
						<c:if test="${vo.hvctayn == 'Y' }">
							<span class="able">[이용가능]</span>
						</c:if>
					</li>
					<li class="col-sm-3">
						MRI
						<c:if test="${vo.hvmriayn == 'N' || vo.hvmriayn == null }">
							<span class="disable">[이용불가]</span>
						</c:if>
						<c:if test="${vo.hvmriayn == 'Y' }">
							<span class="able">[이용가능]</span>
						</c:if>
					</li>
					<li class="col-sm-3">
						조영촬영기
						<c:if test="${vo.hvangioayn == 'N' || vo.hvangioayn == null }">
							<span class="disable">[이용불가]</span>
						</c:if>
						<c:if test="${vo.hvangioayn == 'Y' }">
							<span class="able">[이용가능]</span>
						</c:if>
					</li>
					<li class="col-sm-3">
						인공호흡기
						<c:if test="${vo.hvventiayn == 'N' || vo.hvventiayn == null }">
							<span class="disable">[이용불가]</span>
						</c:if>
						<c:if test="${vo.hvventiayn == 'Y' }">
							<span class="able">[이용가능]</span>
						</c:if>
					</li>
					<li class="col-sm-3">
						구급차
						<c:if test="${vo.hvamyn == 'N' || vo.hvamyn == null }">
							<span class="disable">[이용불가]</span>
						</c:if>
						<c:if test="${vo.hvamyn == 'Y' }">
							<span class="able">[이용가능]</span>
						</c:if>
					</li>
					<li class="col-sm-3">
						인큐베이터
						<c:if test="${vo.hv11 == 'N' || vo.hv11 == null }">
							<span class="disable">[이용불가]</span>
						</c:if>
						<c:if test="${vo.hv11 == 'Y' }">
							<span class="able">[이용가능]</span>
						</c:if>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div style="height: 200px;"></div>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${vo.lat }, ${vo.lon }), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

//마커가 표시될 위치입니다
var markerPosition  = new kakao.maps.LatLng(${vo.lat }, ${vo.lon }); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
 position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
</script>
</body>
</html>