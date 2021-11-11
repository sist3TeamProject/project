<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
    var stmnLEFT = 10; // 오른쪽 여백 
	var stmnGAP1 = 0; // 위쪽 여백 
	var stmnGAP2 = 65; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
	var stmnBASE = 100; // 스크롤 시작위치 
	var stmnActivateSpeed = 30; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
	var stmnScrollSpeed = 20; //스크롤 속도 (클수록 느림)
	var stmnTimer; 
	 
	function RefreshStaticMenu() { 
	  var stmnStartPoint, stmnEndPoint; 
	  stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10); 
	  stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; 
	  
	  if(stmnEndPoint < stmnGAP1) 
		 stmnEndPoint = stmnGAP1; 
	  
	  if(stmnStartPoint != stmnEndPoint){ 
	     stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
	     document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; 
	     stmnRefreshTimer = stmnScrollSpeed; 
	  }
	  stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed); 
	  } 
	
	function InitializeStaticMenu() {
	  document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';  //처음에 오른쪽에 위치. left로 바꿔도.
	  document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; 
	  RefreshStaticMenu();
	}
</script>
<style type="text/css">
#STATICMENU { margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px;}
.my-hr1 {
    border: 0;
    height: 1px;
    background: #ccc;
  }
</style>
</head>
<body onload="InitializeStaticMenu();">
<div class="main">
     <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="javascript:;">응급처치방법</a></li>
            <li class="active">응급의료 자료실</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1>응급의료 자료실</h1>
            <h5>응급의료에 관한 다양한 자료를 다운로드받으실 수 있습니다.</h5>
            
            <div class="content-page">
              <!-- BEGIN LEFT SIDEBAR -->            
              <div class="col-md-9 col-sm-9 blog-posts">
                <div class="text-right">
                  <input type="text" size=30 class="input-sm" placeholder="검색어를 입력하세요" v-model="ss">
      			  <button class="btn btn-sm btn-primary" v-on:click="dataFind()">검색</button>
                </div>
                <hr class="my-hr1">
                  <div class="row" v-for="vo in find_data">
                    <div class="col-md-4 col-sm-4">
                      <img class="img-responsive" alt="" src="../pages/img/data_image.JPG">
                    </div>
                    <div class="col-md-8 col-sm-8">
                    <!-- <a :href="'../food/detail.do?cno='+vo.cno"> -->
                      <h3><a :href="'../emergency_treat/data_detail.do?no='+vo.no+'&page='+vo.curpage">{{vo.subject }}</a></h3>
                      <ul class="blog-info">
                        <li><i class="fa fa-tags"></i>{{vo.name }}</li>
                      </ul>
                      <a href="#" class="more">Read more <i class="icon-angle-right"></i></a>
                    </div>
                  </div>
                <div class="row">
			    <div class="text-center">
			      <ul class="pagination">
			        <li v-for="i in totalpage"><a href="#" v-on:click="pageChange(i)">{{i}}</a></li>
			      </ul>
			    </div>
			  </div>
			  <div style="height: 40px"></div>    
              </div>
              
              <div class="col-md-3 col-sm-3 blog-sidebar" id="STATICMENU">
                  <!-- CATEGORIES START -->
                  <h2 class="no-top-space">Categories</h2>
                  <ul class="nav sidebar-categories margin-bottom-40">
                    <li><a href="../emergency_center/find.do">응급실</a></li>                    
                    <li><a href="../findhopital/find.do">병원&약국</a></li>
                    <li><a href="../aed/find.do">자동심장충격기(AED)</a></li>
                    <li><a href="../notice/notice.do">알림&소식</a></li>
                    <li><a href="../promotion_image/list.do">홍보자료</a></li>
                  </ul>
                            
                  <h2>Recent News</h2>
                  <div class="recent-news" style="width:280px">
                    <div class="row">
                      <h3 class="text-center"></h3>
                      <p class="text-center"><a href="../notice/notice.do">2021년 10월 응급의료기관 및 응급의료기관<br>외의 의료기관(응급의료시설) 현황</a></p>                          
                    </div>
                    <div class="row">
                      <h3 class="text-center"></h3>
                      <p class="text-center"><a href="../notice/notice.do">2021년 9월 응급의료기관 및 응급의료기관<br>외의 의료기관(응급의료시설) 현황</a></p>                          
                    </div>
                    <div class="row">
                      <h3 class="text-center"></h3>
                      <p class="text-center"><a href="../notice/notice.do">2021년 8월 응급의료기관 및 응급의료기관<br>외의 의료기관(응급의료시설) 현황</a></p>                        
                    </div>
                  </div>

                  <div class="blog-talks margin-bottom-30">
                    <h2>Popular Post</h2>
                    <div class="tab-style-1">
                      <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#tab-1">홍보웹툰</a></li>
                        <li><a data-toggle="tab" href="#tab-2">홍보동영상</a></li>
                      </ul>
                      <div class="tab-content">
                        <div id="tab-1" class="tab-pane row-fluid fade in active">
                          <p class="margin-bottom-10">[2016년 홍보자료] 미스터나이팅게일</p>
                          <p><a class="more" href="../promotion_webtoon/list.do">Read more</a></p>
                        </div>
                        <div id="tab-2" class="tab-pane fade">
                          <p>[2016년 대학생 응급의료 홍보대사] 스팸(SPEM) 팀_심폐소생술</p>
                          <p><a class="more" href="../promotion_video/list.do">Read more</a></p>
                        </div>
                      </div>
                    </div>
                  </div>                            
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
  		find_data:[],
  		page:1,
  		ss:'응급',
  		totalpage:0
  	},
  	mounted:function(){
  		axios.get("http://localhost:8080/web/emergency_treat/rest_data_find.do",{
  			params:{
  				ss:this.ss,
  				page:this.page
  			}
  		}).then(res=>{
  			console.log(res.data);
  			this.find_data=res.data;
  			this.page=this.find_data[0].curpage;
  			this.totalpage=this.find_data[0].totalpage;
  		})
  	},
  	methods:{
  		dataFind:function(){
  			axios.get("http://localhost:8080/web/emergency_treat/rest_data_find.do",{
      			params:{
      				ss:this.ss,
      				page:this.page
      			}
      		}).then(res=>{
      			console.log(res);
      			this.find_data=res.data;
      			this.page=this.find_data[0].curpage;
      			this.totalpage=this.find_data[0].totalpage;
      		})
  		},
  		pageChange:function(p){
  			this.page=p;
  			axios.get("http://localhost:8080/web/emergency_treat/rest_data_find.do",{
      			params:{
      				ss:this.ss,
      				page:this.page
      			}
      		}).then(res=>{
      			console.log(res);
      			this.find_data=res.data;
      			this.page=this.find_data[0].curpage;
      			this.totalpage=this.find_data[0].totalpage;
      		})
  		}
  	}
  })
</script>      
</body>
</html>




















