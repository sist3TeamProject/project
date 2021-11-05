<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
	<div class="putLatLon">
		<h2>응급실 찾기</h2>
		<p>응급실 정보 검색 서비스입니다.</p>
		<div id="map" style="width:500px;height:500px;"></div>
		<div>
			<!-- <input type="text" v-model="baseLat">
			<input type="text" v-model="baseLon"> -->
			<input type="text" v-model="findAddr">
			<input type="button" value="근처 응급실 찾기" v-on:click="findBtn">
			<div class="printHpid" v-for="vo in hpidList">
				<div class="hover" v-on:click="goDetail(vo.hpid)">
					<p>{{vo.hpid}}</p>
					<p>{{vo.name}}</p>
					<p>{{vo.distance}}km</p>
					<p v-model="lat">위도 : {{vo.lat}}</p>
					<p v-model="lon">경도 : {{vo.lon}}</p>
					<hr>
				</div>
			</div>
		</div>
		<script>
		new Vue({
			el:'.putLatLon',
			data:{
				hpidList:[],
				baseLat:37.642201088897444,
				baseLon:126.83219640795551,
				lat:this.lat,
				lon:this.lon,
				findAddr:this.findAddr
			},
			mounted:function(){
				axios.get("http://localhost:8080/web/emergency_center/getFirst.do",{
					params:{
						baseLat:this.baseLat,
						baseLon:this.baseLon
					}
				}).then(res=>{
					console.log(res);
					this.hpidList=res.data;
				})
				
				window.kakao && window.kakao.maps
			      ? this.initMap()
			      : this.addKakaoMapScript();
			},
			  methods: {
				  	findBtn(){
					  	// 주소로 장소 찾기
				  		var geocoder = new kakao.maps.services.Geocoder();
				  		geocoder.addressSearch(this.findAddr, function(result, status) {
				  		    // 정상적으로 검색이 완료됐으면 
				  		     if (status === kakao.maps.services.Status.OK) {
								baseLat=result[0].y;
								baseLon=result[0].x;
								
								///////////////////////////////////묶기
								axios.get("http://localhost:8080/web/emergency_center/getFirst.do",{
									params:{
										baseLat:this.baseLat,
										baseLon:this.baseLon
									}
								}).then(res=>{
									console.log(res);
									this.hpidList=res.data;
								})
								///////////////////////////////////
				  		        /* var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				  		        // 결과값으로 받은 위치를 마커로 표시합니다
				  		        var marker = new kakao.maps.Marker({
				  		            map: map,
				  		            position: coords
				  		        });

				  		        // 인포윈도우로 장소에 대한 설명을 표시합니다
				  		        var infowindow = new kakao.maps.InfoWindow({
				  		            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
				  		        });
				  		        infowindow.open(map, marker);

				  		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				  		        map.setCenter(coords); */
				  		    }
				  		});
				  		//
				  		window.kakao && window.kakao.maps
					      ? this.initMap()
					      : this.addKakaoMapScript();
				  	},
				  	
				  	getJson(){
				  		axios.get("http://localhost:8080/web/emergency_center/getFirst.do",{
							params:{
								baseLat:this.baseLat,
								baseLon:this.baseLon
							}
						}).then(res=>{
							console.log(res);
							this.hpidList=res.data;
						})
				  	},
				  
				    //지도
				    addKakaoMapScript() {
				      const script = document.createElement("script");
				      /* global kakao */
				      script.onload = () => kakao.maps.load(this.initMap);
				      script.src =
				        "http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=be0965f85428a75d750a50fe123d2748&libraries=services";
				      document.head.appendChild(script);
				    },
				    
				    initMap() {
				      var container = document.getElementById("map"); //지도를 담을 영역의 DOM 레퍼런스
				      var options = {
				        //지도를 생성할 때 필요한 기본 옵션
				        center: new kakao.maps.LatLng(this.baseLat, this.baseLon), //지도의 중심좌표.
				        level: 8 //지도의 레벨(확대, 축소 정도)
				      };

				      var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

				      
				   	// 마커를 표시할 위치와 title 객체 배열입니다
				      var positions = [];
				      
		    		for( var i = 0 ; i < this.hpidList.length ; i++ ) {
		    			positions.push({ title : this.hpidList[i].name, latlng : new kakao.maps.LatLng(this.hpidList[i].lat,this.hpidList[i].lon) });
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
				    	
				    	
				    },
				    goDetail(hpid){
				    	location.href="detail.do?hpid="+hpid;
				    }
				  }
		})
		</script>
		
	</div>
  </div>
</body>
</html>