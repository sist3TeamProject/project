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
</style>
</head>
<body>
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
		<div class="printHpid" v-for="vo in hpidList">
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
<script>
new Vue({
	el:'.container',
	data:{
		hpidList:[],
		baseLat:0,
		baseLon:0,
		targetAddr:this.targetAddr
	},
	mounted:function(){
		this.targetAddr='서울특별시 마포구 서교동';
		this.findEMC();
	},
	updated:function(){
		this.initMap();
	},
	methods: {
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
					{title : this.hpidList[i].name,
					latlng : new kakao.maps.LatLng(this.hpidList[i].lat,this.hpidList[i].lon)}
				);
			}
	    	// 마커 이미지의 이미지 주소입니다
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
	    	        image : markerImage // 마커 이미지 
    	    	});
	    	}
	    	//************************* /마커 *************************
	  	},
		goDetail(hpid){
			location.href="detail.do?hpid="+hpid;
		}
	}
})
</script>
</body>
</html>