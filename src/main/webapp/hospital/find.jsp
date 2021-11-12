<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.hover:hover{
	cursor: pointer;
	background-color: #EFEFEF;
	font-weight: bold;
}
.overlaybox{
	background-color: white;
	border: 1px solid;
	padding: 20px;
}
.overlaybox :span{
	padding: 10px;
}
.popup-buttons{
	text-align: center;
}
.popup-buttons :button{
	margin-left: 10px;
	margin-right: 10px;
}
.mapDiv, .emcList{
	margin-top: 20px;
	border: 1px solid;
	height: 700px;
}
.emcList{
	overflow:scroll;
}
</style>
</head>
<body>
<div class="vue">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<h2>병원찾기</h2>
				<p>병원 정보 검색 서비스입니다.</p>
				
				<div class="content-page">
					<table class="table">
						
					</table>
						
					<div class="searchMap">
						<form action="../hospital/getFirst.do" id="searchFrm" method="get" autocomplete="off" >
							<div class="searchAddr">
								<input type="text" name="searchKeyword" value="${hospitalVo.searchKeyword}" id="searchKeyword" placeholder="지명을 입력하세요">
								<input type="button" value="근처 병원 찾기"  onclick ="$('#searchFrm').submit();">
							</div>
							<div class="col-sm-8 mapDiv">
								<div id="map" style="width:100%;height:700px;"></div>
							</div>
						</form>
						<div class="col-sm-4 emcList">
							
							<input type="hidden" v-model="baseLat">
							<input type="hidden" v-model="baseLon">
							<ul id="placesList" style="margin: 0px;padding: 0px;">
							<c:choose>
								<c:when test="${fn:length(resultList) > 0}">
								<c:forEach var="item" items="${resultList}" varStatus="status">
									<li class="hover" style="list-style: none;" onclick="location.href='/web/hospital/detail.do?IDX=${item.IDX}'">
										<h5 id="name_${status.count}">${item.NAME}</h5>
										<div class="voInfo" style="margin: 10px;">
											<p id="add_${status.count}">${item.ADDRESS}</p>
											<p>${item.PHONENUMBER}</p>
											<input type="hidden" id="x_${status.count}" value="${item.LATITUDE}" >
											<input type="hidden" id="y_${status.count}" value="${item.LONGITUDE}" >
										</div>
										<hr>
									</li>
								</c:forEach>
								</c:when>
							</c:choose>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div style="height: 200px;"></div>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6b29e2c503d2b1dc78aefe5d2e0d6ab2&libraries=services"></script>
<script>
var result_list_cnt = '${fn:length(resultList)}';
console.log(result_list_cnt);
if (result_list_cnt > 0)
{
	var first_x = document.getElementById("x_1").value;
	var first_y = document.getElementById("y_1").value;
}

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(first_x, first_y), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
var positions = [];
var tempx = 0;
var tempy = 0;
var h_name = "";
var ele = "";
for(var j = 0;j < (result_list_cnt); j++){
	//positions[i-1] = new kakao.maps.LatLng(document.getElementById("x_"+i).value, document.getElementById("y_"+i).value)
	tempx = document.getElementById("x_"+(j+1)).value;
	tempy = document.getElementById("y_"+(j+1)).value;
	ele =  document.getElementById("name_"+(j+1));
	h_name = ele.textContent;

	positions[j] =  {
	        title: h_name, 
	        latlng: new kakao.maps.LatLng(tempx,tempy)
	};	    
}

var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage// 마커 이미지        
    });
    
}


// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();



</script>
</html>
