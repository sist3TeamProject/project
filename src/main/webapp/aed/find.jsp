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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=97f2ee7c718dbf621d02d84d93a458e2"></script>

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
				<template>
				  <div>
				    <div id="map" class="map"></div>
				  </div>
				</template>
			</div>
			
			<div v-show="isShow2">
				<table class="table">
					<tr>
						<td align="right">
							<input type="button" class="btn" size=50 value="검색결과 다운로드">
						</td>
					</tr>
					<tr>
						<td>
							<select id="sido" name="sido" title="시도선택">
								<option>시도선택</option>
								<option value="서울특별시">서울특별시</option>
								<option value="부산광역시">부산광역시</option>
								<option value="대구광역시">대구광역시</option>
								<option value="인천광역시">인천광역시</option>
								<option value="광주광역시">광주광역시</option>
								<option value="대전광역시">대전광역시</option>
								<option value="울산광역시">울산광역시</option>
								<option value="세종특별자치시">세종특별자치시</option>
								<option value="경기도">경기도</option>
								<option value="강원도">강원도</option>
								<option value="충청북도">충청북도</option>
								<option value="충청남도">충청남도</option>
								<option value="전라북도">전라북도</option>
								<option value="전라남도">전라남도</option>
								<option value="경상북도">경상북도</option>
								<option value="경상남도">경상남도</option>
								<option value="제주특별자치도">제주특별자치도</option>
							</select>
							<select id="gugun" name="gugun" title="구군선택">
								<option>구군선택</option>
								<option value="서울특별시">강동구</option>
								<option value="부산광역시">강북구</option>
								<option value="대구광역시">강서구</option>
								<option value="인천광역시">관악구</option>
								<option value="광주광역시">광진구</option>
								<option value="대전광역시">구로구</option>
								<option value="울산광역시">금천구</option>
								<option value="세종특별자치시">노원구</option>
								<option value="경기도">도봉구</option>
								<option value="강원도">동대문구</option>
								<option value="충청북도">동작구</option>
								<option value="충청남도">마포구</option>
								<option value="전라북도">서대문구</option>
								<option value="전라남도">서초구</option>
								<option value="경상북도">성동구</option>
								<option value="경상남도">성북구</option>
								<option value="제주특별자치도">양천구</option>
								<option value="제주특별자치도">영등포구</option>
								<option value="제주특별자치도">용산구</option>
								<option value="제주특별자치도">은평구</option>
								<option value="제주특별자치도">종로구</option>
								<option value="제주특별자치도">중구</option>
								<option value="제주특별자치도">중랑구</option>
							</select>
							<select id="sido" name="sido" title="시도선택">
								<option>시도선택</option>
								<option value="서울특별시">서울특별시</option>
								<option value="부산광역시">부산광역시</option>
								<option value="대구광역시">대구광역시</option>
								<option value="인천광역시">인천광역시</option>
								<option value="광주광역시">광주광역시</option>
								<option value="대전광역시">대전광역시</option>
								<option value="울산광역시">울산광역시</option>
								<option value="세종특별자치시">세종특별자치시</option>
								<option value="경기도">경기도</option>
								<option value="강원도">강원도</option>
								<option value="충청북도">충청북도</option>
								<option value="충청남도">충청남도</option>
								<option value="전라북도">전라북도</option>
								<option value="전라남도">전라남도</option>
								<option value="경상북도">경상북도</option>
								<option value="경상남도">경상남도</option>
								<option value="제주특별자치도">제주특별자치도</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
			
				<script>
				module.export {
				  mounted() {
				    window.kakao && window.kakao.maps
				      ? this.initMap()
				      : this.addKakaoMapScript();
				};
				  methods: {
				    addKakaoMapScript() {
				      const script = document.createElement("script");
				      /* global kakao */
				      script.onload = () => kakao.maps.load(this.initMap);
				      script.src =
				        "http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=97f2ee7c718dbf621d02d84d93a458e2";
				      document.head.appendChild(script);
				    },
				    initMap() {
				      var container = document.getElementById("map"); //지도를 담을 영역의 DOM 레퍼런스
				      var options = {
				        //지도를 생성할 때 필요한 기본 옵션
				        center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
				        level: 3 //지도의 레벨(확대, 축소 정도)
				      };
				
				      var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
				    }
				  }
				};
				</script>
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
			isShow2:false
		},mounted:function(){
			
		},methods:{
			map:function(){
				this.isShow1=true;
				this.isShow2=false;
			},
			gen:function(){
				this.isShow2=true;
				this.isShow1=false;
			}
		}
	})
</script>


</body>
</html>