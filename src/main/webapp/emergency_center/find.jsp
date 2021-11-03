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
</head>
<body>
	<div>
		<h2>응급실 찾기</h2>
		<p>응급실 정보 검색 서비스입니다.</p>
		
		<div class="putLatLon">
			<input type="text" v-model="baseLat">
			<input type="text" v-model="baseLon">
			<input type="submit" value="근처 응급실 찾기">
			<div class="printHpid" v-for="vo in hpidList">
				<p>{{vo.hpid}}</p>
				<p>{{vo.name}}</p>
				<p>{{vo.distance}}km</p>
			</div>
		</div>
		<script>
		new Vue({
			el:'.putLatLon',
			data:{
				hpidList:[],
				baseLat:37.6453,
				baseLon:126.792204040477
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
			}
		})
		</script>
	</div>
</body>
</html>