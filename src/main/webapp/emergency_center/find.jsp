<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be0965f85428a75d750a50fe123d2748&libraries=services"></script>
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
</style>
</head>
<body>
<div class="vue">
	<div class="container">
		<h2>응급실 찾기</h2>
		<p>응급실 정보 검색 서비스입니다.</p>
		<div id="map" style="width:500px;height:500px;"></div>
		<div>
			<input type="hidden" v-model="baseLat">
			<input type="hidden" v-model="baseLon">
			<br>
			<input type="text" v-model="targetAddr">
			<input type="button" value="근처 응급실 찾기" v-on:click="findEMC">
			<div class="printHpid" v-for="vo,index in hpidList">
				<div class="hover" v-on:click="goDetail(vo.hpid)">
					<p>{{vo.hpid}}</p>
					<p>{{vo.name}}</p>
					<p>{{vo.distance}}km</p>
					<p>위도 : {{vo.lat}}</p>
					<p>경도 : {{vo.lon}}</p>
					<hr>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
new Vue({
	el:'.vue',
	data:{
		hpidList:[],
		baseLat:0,
		baseLon:0,
		targetAddr:this.targetAddr,
		index:0
	},
	mounted:function(){
		this.targetAddr="서울시 마포구 서교동";
		this.findEMC();
	},
	updated:function(){
		this.initMap();
	},
	methods: {
		getCurrentLocation(){
			if (navigator.geolocation) {
				  // GeoLocation을 이용해서 접속 위치를 얻어옵니다

				  navigator.geolocation.getCurrentPosition(function(position) {
				  	this.baseLat = position.coords.latitude, // 위도
					this.baseLon = position.coords.longitude; // 경도
					console.log(this.baseLat);
				  });
			}else {
			  // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			  var locPosition = new kakao.maps.LatLng(37.557410136383446, 126.91976317670375);
			}
		},
		findEMC(){
			let base=this;
			
			// 주소로 장소 찾기
			var geocoder = new kakao.maps.services.Geocoder();
			
			geocoder.addressSearch(this.targetAddr, function(result, status) {
				// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {
					baseLat=result[0].y;
					baseLon=result[0].x;
					
					//JSON 불러오기
					axios.get("http://localhost:8080/web/emergency_center/getFirst.do",{
						params:{
							baseLat:this.baseLat,
							baseLon:this.baseLon
						}
					}).then(res=>{
						base.hpidList=res.data;
						base.baseLat=this.baseLat;
						base.baseLon=this.baseLon;
					})
	  		    }
	  		});
		},
		getJSON(){
			axios.get("http://localhost:8080/web/emergency_center/getFirst.do",{
				params:{
					baseLat:this.baseLat,
					baseLon:this.baseLon
				}
			}).then(res=>{
				this.hpidList=res.data;
			})
		},
		initMap(){
			var container = document.getElementById("map"); //지도를 담을 영역의 DOM 레퍼런스
			
			var options = {
		        //지도를 생성할 때 필요한 기본 옵션
		        center: new kakao.maps.LatLng(this.baseLat, this.baseLon), //지도의 중심좌표.
		        level: 6 //지도의 레벨(확대, 축소 정도)
			};

			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			//************************* 마커 *************************
			// 마커를 표시할 위치와 title 객체 배열입니다
			var positions = [];
			
			for (var i = 0 ; i < this.hpidList.length; i++) {
				positions.push(
					{
						hpid : this.hpidList[i].hpid,
						title : this.hpidList[i].name,
						addr : this.hpidList[i].addr,
						distance : this.hpidList[i].distance,
						tel : this.hpidList[i].tel,
						latlng : new kakao.maps.LatLng(this.hpidList[i].lat,this.hpidList[i].lon)
						
					}
				);
			}
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png", // 마커이미지의 주소입니다
		    imageSize = new kakao.maps.Size(24, 35), // 마커이미지의 크기입니다
		    imageOption = { offset: new kakao.maps.Point(20, 35) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
			    
			positions.forEach(function(pos) {
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				  map: map, // 마커를 표시할 지도
				  position: pos.latlng, // 마커의 위치
				  image: markerImage,
				});
				
				var customOverlay = new kakao.maps.CustomOverlay({
				  position: pos.latlng,
				  xAnchor: 0.5,
				  yAnchor: 1.05,
				});
				
				var content = document.createElement('div');
				content.className = 'overlaybox';
				
				var title = document.createElement('div');
				title.className = 'map-popup-title';
				
				var store = document.createElement('h3');
				store.className = 'popup-name';
				store.appendChild(document.createTextNode(pos.title));
				title.appendChild(store);
				content.appendChild(title);
				
				var location = document.createElement('span');
				location.className = 'store-location';
				location.appendChild(document.createTextNode(pos.addr));
				location.appendChild(document.createElement('br'));
				content.appendChild(location);
				
				/*
				var timeContainer = document.createElement('div');
				
				var time = document.createElement('p');
				time.className = 'time-text';
				time.appendChild(document.createTextNode(pos.time));
				timeContainer.appendChild(time);
				var vacation = document.createElement('p');
				vacation.className = 'time-text';
				vacation.appendChild(document.createTextNode(pos.vacation));
				timeContainer.appendChild(vacation);
				content.appendChild(timeContainer);
				*/
				var tel = document.createElement('span');
				tel.className = 'telephone';
				tel.appendChild(document.createTextNode(pos.tel));
				content.appendChild(tel);
				
				var buttonContainer = document.createElement('div');
				buttonContainer.className = 'popup-buttons';
				
				var closeBtn = document.createElement('button');
				closeBtn.className = 'popup-button';
				closeBtn.appendChild(document.createTextNode('취소'));
				closeBtn.onclick = function() {
				  customOverlay.setMap(null);
				};
				
				var selectBtn = document.createElement('button');
				selectBtn.className = 'popup-button';
				selectBtn.appendChild(document.createTextNode('선택'));
				selectBtn.onclick = function() {
					window.location.href='detail.do?hpid='+pos.hpid;
					console.log(pos.hpid);
				};
				
				buttonContainer.appendChild(closeBtn);
				buttonContainer.appendChild(selectBtn);
				
				content.appendChild(buttonContainer);
				
				kakao.maps.event.addListener(marker, 'click', function() {
				  customOverlay.setMap(map);
				});
				
				customOverlay.setContent(content);
			});
	    	//************************* /마커 *************************
	  	},
	  	goDetail(hpid){
	  		location.href='detail.do?hpid='+hpid;
	  	}
	}
})
</script>
</body>
</html>