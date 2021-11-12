<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be0965f85428a75d750a50fe123d2748&libraries=services"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.voInfo{
	margin-left: 30px;
	margin-top: 20px;
}
.row{
	margin: 15px;
}
.container{
	padding: 0px;
}
h2{
	font-weight: bolder;
	margin: 20px 0;
}
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
	overflow: auto;
}
</style>
</head>
<body>
<div class="vue">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<h2>응급실 찾기</h2>
				<p>응급실 정보 검색 서비스입니다.</p>
				<div class="content-page">
					<table class="table">
						<!-- <tr>
            			<td class="text-center inline" width="100%">
            				<span class="on" id="id_class"><input type="button" class="btn" name=map id=mapBtn value="지도" v-on:click="map()"></span>
            				<span class="" id="gen_class"><input type="button" class="btn" name=general id=generalBtn value="일반" v-on:click="gen()"></span>
            			</td>
            		</tr> -->
					</table>
						
					<div class="searchMap">
						<div class="searchAddr">
							<input type="text" size="30" v-model="targetAddr" placeholder="지명을 입력하세요" onclick="javascript:this.value='';">
							<input type="button" value="근처 응급실 찾기" v-on:click="findEMC">
							<input type="button" value="현재 위치에서 찾기" v-on:click="getCurrentLocation	">
						</div>
						<div class="col-sm-8 mapDiv">
							<div id="map" style="width:100%;height:700px;"></div>
						</div>
						
						<div class="col-sm-4 emcList">
							<input type="hidden" v-model="baseLat">
							<input type="hidden" v-model="baseLon">
							<ul id="placesList" v-for="vo,index in hpidList" style="margin: 0px;padding: 0px;">
								<li class="hover" v-on:click="goDetail(vo.hpid)" style="list-style: none;">
									<h5>{{index+1}} . {{vo.name}}</h5>
									<div class="voInfo">
										<p style="font-size: small;">거리 : {{vo.distance}}km</p>
										<p>{{vo.addr}}</p>
										<p>{{vo.tel}}</p>
									</div>
									<hr>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div style="height: 200px;"></div>
<script>
new Vue({
	el:'.vue',
	data:{
		hpidList:[],
		baseLat:0,
		baseLon:0,
		targetAddr:this.targetAddr
	},
	mounted:function(){
		this.getCurrentLocation();
	},
  	watch:{
  		baseLat: function (val) {
  	      this.getJSON();
  	    },
  		hpidList: function (val) {
  			this.initMap();
  		}
  	},
	methods: {
		getCurrentLocation(){
			let base=this;
			if (navigator.geolocation) {
				  // GeoLocation을 이용해서 접속 위치를 얻어옵니다
				  navigator.geolocation.getCurrentPosition(function(position) {
				  	base.baseLat = position.coords.latitude, // 위도
					base.baseLon = position.coords.longitude; // 경도
					//base.targetAddr="";
					//좌표 => 주소
					var geocoder = new kakao.maps.services.Geocoder();
					geocoder.coord2RegionCode(position.coords.longitude, position.coords.latitude, function(result, status){
						if (status === kakao.maps.services.Status.OK) {
							base.targetAddr = result[0].address_name;
						}
					});
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
					base.baseLat=result[0].y;
					base.baseLon=result[0].x;
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
			
			//************************* 원 *************************
			// 지도에 표시할 원을 생성합니다
			var circle = new kakao.maps.Circle({
			    center : new kakao.maps.LatLng(this.baseLat, this.baseLon),  // 원의 중심좌표 입니다 
			    radius: 3000, // 미터 단위의 원의 반지름입니다 
			    strokeWeight: 5, // 선의 두께입니다 
			    strokeColor: '#75B8FA', // 선의 색깔입니다
			    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
			    strokeStyle: 'dashed', // 선의 스타일 입니다
			    fillColor: '#CFE7FF', // 채우기 색깔입니다
			    fillOpacity: 0.7  // 채우기 불투명도 입니다   
			}); 

			// 지도에 원을 표시합니다 
			circle.setMap(map); 
			
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
				selectBtn.appendChild(document.createTextNode('상세보기'));
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
<!-- <div class="filter-area">
				<select name="sidoCode" id="sidoCode" title="시도 선택"></select>
				<select name="gugunCode" id="gugunCode" title="구군 선택"></select>
				<select name="dongCode" id="dongCode" title="동 선택"></select>
				
				<select v-model="selectedOne" @change="loadData">
					<option v-for="select in selectedOne">{{ select.name }}</option>
				</select>
				
				<div v-if="selectedOne && !selected2.length">
					<i>Loading</i>
				</div>
				
				<select v-if="selected2.length"> <option v-for="item in selected2">{{ item.label }}</option> </select>
			</div> -->