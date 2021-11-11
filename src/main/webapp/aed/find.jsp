<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=97f2ee7c718dbf621d02d84d93a458e2&libraries=services"></script>
<script src="https://code.jquery.com/jquery-latest.min.js" type="application/javascript"></script>
<script type="application/javascript" src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
<style type="text/css">
span .btn{
	padding: 10px 250px;
}
span.on .btn{
		color:white;
		padding: 10px 250px;
		border:1px solid #007b94;
		background:#007b94;
}
.table{
	border-top:none;
}
</style>
<style>
.map {
  width: 100%;
  height: 400px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	
	$('#mapBtn').click(function(){
		$('#id_class').attr('class','on');
		$('#gen_class').attr('class','');
	})
	
	$('#generalBtn').click(function(){
		$('#gen_class').attr('class','on')
		$('#id_class').attr('class','');
	})
})
</script>
</head>
<body>
<div class="main">
      <div class="container">
        <div class="row margin-bottom-40">
          <div class="col-md-12 col-sm-12">
            <h1>자동심장 충격기(AED) 찾기</h1>
            <h4>자동 심장충격기(AED) 정보 검색 서비스입니다.</h4>
            <div class="content-page">
            	<table class="table">
            		<tr>
            			<td class="text-center inline" width="100%">
            				<span class="on" id="id_class"><input type="button" class="btn" name=map id=mapBtn value="지도" v-on:click="map()"></span>
            				<span class="" id="gen_class"><input type="button" class="btn" name=general id=generalBtn value="일반" v-on:click="gen()"></span>
            			</td>
            		</tr>
            	</table>
            	<div v-show="isShow1">
            	<table style="border-top:none;">
            		<tr>
            			<td rowspan=2>
            				<img src="../pages/img/works/maps.png" style="width:63px;height:59px">
            			</td>
            			<td><strong style="color:blue">서울특별시 중구 을지로 245</strong></td>
            			
						<td rowspan=2 align="center">
							<input type="button" class="btn" value="위치 재설정" style="color:white;background:#007b94;margin-left:50px;margin-bottom:30px">
						</td>
            		</tr>
            		<tr>
            			<td>
	            			<p>현재 자신의 위치정보가 일치하지 않을경우
	위치설정에서 자신의 위치를 설정(주소 또는 명칭 검색)하시면 정확한 주변 정보를 제공해드립니다.
	<br>주소 또는 반경 변경시 결과내 검색의 결과는 반영되지 않습니다.</p>
						</td>
            		</tr>
            		
            		<tr>
            			<td colspan=3 align="right">
            				<input type="button" class="btn" size=50 value="검색결과 다운로드">
            			</td>
            		</tr>    
            	</table>
            	
            	<br>
            	<table class="table">
            		<tr>
            			<td>
            				<select id="sido" style="width:100px;" v-model="addr1" v-on:change="getAddr1()">
						       <option value=''>선택</option>
		                       <option value='서울특별시'>서울특별시</option>
		                       <option value='부산광역시'>부산광역시</option>
		                       <option value='대구광역시'>대구광역시</option>
		                       <option value='인천광역시'>인천광역시</option>
		                       <option value='광주광역시'>광주광역시</option>
		                       <option value='대전광역시'>대전광역시</option>
		                       <option value='울산광역시'>울산광역시</option>
		                       <option value='경기도'>경기도</option>
		                       <option value='강원도'>강원도</option>
		                       <option value='충청북도'>충청북도</option>
		                       <option value='충청남도'>충청남도</option>
		                       <option value='전라북도'>전라북도</option>
		                       <option value='전라남도'>전라남도</option>
		                       <option value='경상북도'>경상북도</option>
		                       <option value='경상남도'>경상남도</option>
		                       <option value='제주특별자치도'>제주도</option>
						    </select>
						    <select id="gugun" style="width:100px;" v-model="addr2" v-on:change="addAddr()">
						      <option value="">선택</option>
						    </select>
            			</td>
            		</tr>
            		<tr>
            			<td>
            			<!-- <div>
            				<input type="text" size=15 class="input-sm" placeholder="지명을 입력하세요" v-model="targetAddr" onclick="javascript:this.value='';">
            				<input type="button" class="btn" v-on:click="findAED" value="검색">
            			</div> -->
            				<div class="col-sm-8">
								<div id="map" style="width:100%;height:700px;"></div>
								<ul v-for="vo in aedList">
								</ul>
						</div>
						<div class="col-sm-4" style="width:300px; height:700px;overflow:auto">
							<table class="table" v-for="vo,index in aedList">
								<tr>
									<td>{{index+1.}}&nbsp;{{vo.title}}</td>
								</tr>
								<tr>
									<td>{{vo.tel}}</td>
								</tr>
								<tr>
									<td>{{vo.addr}}</td>
								</tr>
							</table>
						</div>
            			</td>
            		</tr>
            	</table>
            	
			    

			</div>
			
			<div v-show="isShow2">
				<table class="table" style="background-color:#FAF7EE">
					<tr>
						<td align="right">
							<input type="button" class="btn" size=50 value="검색결과 다운로드">
						</td>
					</tr>
					<tr>
						<td>
							<select id="gen_sido" style="width:100px;" v-model="gen_addr1" v-on:change="getGenAddr1()">
						       <option value=''>선택</option>
		                       <option value='서울특별시'>서울특별시</option>
		                       <option value='부산광역시'>부산광역시</option>
		                       <option value='대구광역시'>대구광역시</option>
		                       <option value='인천광역시'>인천광역시</option>
		                       <option value='광주광역시'>광주광역시</option>
		                       <option value='대전광역시'>대전광역시</option>
		                       <option value='울산광역시'>울산광역시</option>
		                       <option value='경기도'>경기도</option>
		                       <option value='강원도'>강원도</option>
		                       <option value='충청북도'>충청북도</option>
		                       <option value='충청남도'>충청남도</option>
		                       <option value='전라북도'>전라북도</option>
		                       <option value='전라남도'>전라남도</option>
		                       <option value='경상북도'>경상북도</option>
		                       <option value='경상남도'>경상남도</option>
		                       <option value='제주특별자치도'>제주도</option>
						    </select>
						    <select id="gen_gugun" style="width:100px;" v-model="gen_addr2" v-on:click="getData()">
						      <option value="">선택</option>
						    </select>
						    
						<h5 style="color:red;margin-top:-5px" align="left">동 검색 시 비슷한 이름이 들어 갈 경우 AED가 중복으로 검색될 수 있습니다.</h5>
						<input type="button" value="검색" style="background-color:black;border:none;color:white;font-weight:bold;margin-top:5px;" v>
						</td>
					</tr>
				</table>
				<table class="table" v-for="vo,index in aedList">
								<tr>
									<td>{{index+1.}}&nbsp;{{vo.title}}</td>
								</tr>
								<tr>
									<td>{{vo.tel}}</td>
								</tr>
								<tr>
									<td>{{vo.addr}}</td>
								</tr>
							</table>
				
			</div>

            </div>
          </div>
        </div>
      </div>
</div>            

<script>
new Vue({
	el:'.main',
	data:{
		isShow1:true,
		isShow2:false,
		aedList:[],
		targetAddr:"서울시 마포구 서교동",
		baseLat:0,
		baseLon:0,
		addr1:"",
		addr2:"",
		gen_addr1:"",
		gen_addr2:"",
		index:0
		
	},
	mounted:function(){
		this.findAED();
	},updated:function(){
		this.initMap();
	},
	methods:{
		getData:function(){
			this.targetAddr= this.gen_addr1+" "+this.gen_addr2;
			this.findAED();
		},
		addAddr:function(){
			this.targetAddr= this.addr1+" "+this.addr2;
			this.findAED();
		},
		getAddr1:function(){
			console.log(this.addr1);
		     var cnt = new Array();
		     cnt[0] = new Array('선택');
		     cnt[1] = new Array('선택','강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
		     cnt[2] = new Array('선택','강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
		     cnt[3] = new Array('선택','남구','달서구','동구','북구','서구','수성구','중구','달성군');
		     cnt[4] = new Array('선택','계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');
		     cnt[5] = new Array('선택','광산구','남구','동구','북구','서구');
		     cnt[6] = new Array('선택','대덕구','동구','서구','유성구','중구');
		     cnt[7] = new Array('선택','남구','동구','북구','중구','울주군');
		     cnt[8] = new Array('선택','고양시','과천시','광명시','구리시','군포시','남양주시','동두천시','부천시','성남시','수원시','시흥시','안산시','안양시','오산시','의왕시','의정부시','평택시','하남시','가평군','광주시','김포시','안성시','양주군','양평군','여주군','연천군','용인시','이천군','파주시','포천시','화성시');
		     cnt[9] = new Array('선택','강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','황성군');
		     cnt[10] = new Array('선택','제천시','청주시','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');
		     cnt[11] = new Array('선택','공주시','보령시','서산시','아산시','천안시','금산군','논산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
		     cnt[12] = new Array('선택','군산시','김제시','남원시','익산시','전주시','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
		     cnt[13] = new Array('선택','광양시','나주시','목포시','순천시','여수시','여천시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','여천군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
		     cnt[14] = new Array('선택','경산시','경주시','구미시','김천시','문겅시','상주시','안동시','영주시','영천시','포항시','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
		     cnt[15] = new Array('선택','거제시','김해시','마산시','밀양시','사천시','울산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','양산시','의령군','창녕군','하동군','함안군','함양군','합천군');
		     cnt[16] = new Array('선택','서귀포시','제주시','남제주군','북제주군');
		     
		     var target = document.getElementById("gugun");
		     let x=this.addr1;
		     if(x=="선택")
		    	 var d = cnt[0];
		     else if(x=="서울특별시")
		    	 var d =cnt[1];
		     else if(x=="부산광역시")
		    	 var d =cnt[2];
		     else if(x=="대구광역시")
		    	 var d =cnt[3];
		     else if(x=="인천광역시")
		    	 var d =cnt[4];
		     else if(x=="광주광역시")
		    	 var d =cnt[5];
		     else if(x=="대전광역시")
		    	 var d =cnt[6];
		     else if(x=="울산광역시")
		    	 var d =cnt[7];
		     else if(x=="경기도")
		    	 var d =cnt[8];
		     else if(x=="강원도")
		    	 var d =cnt[9];
		     else if(x=="충청북도")
		    	 var d =cnt[10];
		     else if(x=="충청남도")
		    	 var d =cnt[11];
		     else if(x=="전라북도")
		    	 var d =cnt[12];
		     else if(x=="전라남도")
		    	 var d =cnt[13];
		     else if(x=="경상북도")
		    	 var d =cnt[14];
		     else if(x=="경상남도")
		    	 var d =cnt[15];
		     else if(x=="제주특별자치도")
		    	 var d =cnt[16];
		     
		     target.options.length=0;
		     
		     for(c in d)
		     {
		    	 var opt = document.createElement("option");
		    	 opt.value=d[c];
		    	 opt.innerHTML=d[c];
		    	 target.appendChild(opt);
		     }
		},getGenAddr1:function(){
			console.log(this.gen_addr1);
		     var cnt = new Array();
		     cnt[0] = new Array('선택');
		     cnt[1] = new Array('선택','강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
		     cnt[2] = new Array('선택','강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
		     cnt[3] = new Array('선택','남구','달서구','동구','북구','서구','수성구','중구','달성군');
		     cnt[4] = new Array('선택','계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');
		     cnt[5] = new Array('선택','광산구','남구','동구','북구','서구');
		     cnt[6] = new Array('선택','대덕구','동구','서구','유성구','중구');
		     cnt[7] = new Array('선택','남구','동구','북구','중구','울주군');
		     cnt[8] = new Array('선택','고양시','과천시','광명시','구리시','군포시','남양주시','동두천시','부천시','성남시','수원시','시흥시','안산시','안양시','오산시','의왕시','의정부시','평택시','하남시','가평군','광주시','김포시','안성시','양주군','양평군','여주군','연천군','용인시','이천군','파주시','포천시','화성시');
		     cnt[9] = new Array('선택','강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','황성군');
		     cnt[10] = new Array('선택','제천시','청주시','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');
		     cnt[11] = new Array('선택','공주시','보령시','서산시','아산시','천안시','금산군','논산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
		     cnt[12] = new Array('선택','군산시','김제시','남원시','익산시','전주시','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
		     cnt[13] = new Array('선택','광양시','나주시','목포시','순천시','여수시','여천시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','여천군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
		     cnt[14] = new Array('선택','경산시','경주시','구미시','김천시','문겅시','상주시','안동시','영주시','영천시','포항시','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
		     cnt[15] = new Array('선택','거제시','김해시','마산시','밀양시','사천시','울산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','양산시','의령군','창녕군','하동군','함안군','함양군','합천군');
		     cnt[16] = new Array('선택','서귀포시','제주시','남제주군','북제주군');
		     
		     var target = document.getElementById("gen_gugun");
		     let x=this.gen_addr1;
		     if(x=="선택")
		    	 var d = cnt[0];
		     else if(x=="서울특별시")
		    	 var d =cnt[1];
		     else if(x=="부산광역시")
		    	 var d =cnt[2];
		     else if(x=="대구광역시")
		    	 var d =cnt[3];
		     else if(x=="인천광역시")
		    	 var d =cnt[4];
		     else if(x=="광주광역시")
		    	 var d =cnt[5];
		     else if(x=="대전광역시")
		    	 var d =cnt[6];
		     else if(x=="울산광역시")
		    	 var d =cnt[7];
		     else if(x=="경기도")
		    	 var d =cnt[8];
		     else if(x=="강원도")
		    	 var d =cnt[9];
		     else if(x=="충청북도")
		    	 var d =cnt[10];
		     else if(x=="충청남도")
		    	 var d =cnt[11];
		     else if(x=="전라북도")
		    	 var d =cnt[12];
		     else if(x=="전라남도")
		    	 var d =cnt[13];
		     else if(x=="경상북도")
		    	 var d =cnt[14];
		     else if(x=="경상남도")
		    	 var d =cnt[15];
		     else if(x=="제주특별자치도")
		    	 var d =cnt[16];
		     
		     target.options.length=0;
		     
		     for(c in d)
		     {
		    	 var opt = document.createElement("option");
		    	 opt.value=d[c];
		    	 opt.innerHTML=d[c];
		    	 target.appendChild(opt);
		     }
		},
		map:function(){
			this.isShow1=true;
			this.isShow2=false;
		},
		gen:function(){
			this.isShow2=true;
			this.isShow1=false;
		},
		getGeolocation:function(){
			let this_=this;
			if (navigator.geolocation) {
			    
			    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			    navigator.geolocation.getCurrentPosition(function(position) {
			        
			    	this_lat = position.coords.latitude; // 위도
			    	this_lon = position.coords.longitude; // 경도
			        
			      });
			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			    
			    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);

			}
		},findAED:function(){
			let base = this
			
			var geocoder = new kakao.maps.services.Geocoder();
			
			geocoder.addressSearch(this.targetAddr, function(result, status) {
				// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {
					baseLat=result[0].y;
					baseLon=result[0].x;
					
					//JSON 불러오기
					axios.get("http://localhost:8080/web/aed/aed_get.do",{
						params:{
							baseLat:this.baseLat,
							baseLon:this.baseLon
						}
					}).then(res=>{
						base.aedList=res.data;
						base.baseLat=this.baseLat;
						base.baseLon=this.baseLon;
					})
	  		    }
	  		});
		},
		getJSON:function(){
			axios.get("http://localhost:8080/web/aed/aed_get.do",{
				param:{
					lat:this.lat,
					lon:this.lon
				}
			}).then(res=>{
				this.aedList=res.data;
			})
			
		},initMap:function() {
		      var container = document.getElementById("map"); //지도를 담을 영역의 DOM 레퍼런스
		      var options = {
		        //지도를 생성할 때 필요한 기본 옵션
		        center: new kakao.maps.LatLng(this.baseLat, this.baseLon), //지도의 중심좌표.
		        level: 6 //지도의 레벨(확대, 축소 정도)
		      };

		      var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		      
		      var circle = new kakao.maps.Circle({
				    center : new kakao.maps.LatLng(this.baseLat, this.baseLon),
				    radius: 3000,
				    strokeWeight: 2,
				    strokeColor: '#FF00FF',
				    strokeOpacity: 0.8,
				    strokeStyle: 'dashed',
				    fillColor: '#D3D5BF',
				    fillOpacity: 0.5
				});
			    
			    // 지도 중심좌표를 접속위치로 변경합니다
			    circle.setMap(map);    
		      
			    var positions = [];
				
				for (var i = 0 ; i < this.aedList.length; i++) {
					positions.push(
						{
							title: this.aedList[i].title,
							latlng: new kakao.maps.LatLng(this.aedList[i].lat,this.aedList[i].lon)
						}
					);
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
				        image : markerImage // 마커 이미지 
				    });
				}
		},
	}
})
</script>
</body>
</html>