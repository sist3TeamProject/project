<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body onload="InitializeStaticMenu();">
<div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="../main/main.do">Home</a></li>
            <li><a href="../emergency_treat/list.do">응급처치방법</a></li>
            <li class="active">응급상황시 대처요령</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1>응급상황시 대처요령</h1>
            <h4>응급상황이 발생하였을때 대처요령 정보를 확인할 수 있습니다.</h4>
            <p>사고현장을 목격한 사람은 119와 환자를 신속히 연결해 주는데 아주 중요한 역할을 한다.<br>
			무조건적인 환자의 병원이송이 아니라 위험지역의 환자를 접근가능하고, 안전한 지역으로 옮기고 현장에서 환자를 돌보는 것이 중요하다.</p>
            <div class="content-page">
              <div class="row">
                <!-- BEGIN LEFT SIDEBAR -->            
                <div class="col-md-9 col-sm-9 blog-item">
                  <div class="blog-item-img">
                   	<c:forEach var="vo" items="${list }">
                      <div class="item">
                        <img src="${vo.poster }">
                        <blockquote>
		                  <h3>${vo.title }</h3><br>
		                  <p>${vo.sub1 }<p>
		                  <ul>
		                   <c:forTokens items="${vo.sub2 }" delims="^" var="sub2">
		                     <li>${sub2 }</li>
		                   </c:forTokens>
						  </ul>
		                </blockquote> 
                      </div>
                    </c:forEach>          
                  </div>  
                </div>
                <!-- END LEFT SIDEBAR -->

                <!-- BEGIN RIGHT SIDEBAR -->            
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
                  <!-- CATEGORIES END -->

                  <!-- BEGIN RECENT NEWS -->                            
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
                  <!-- END RECENT NEWS -->                            

                  <!-- BEGIN BLOG TALKS -->
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
                  <!-- END BLOG TALKS -->
                </div>
                <!-- END RIGHT SIDEBAR -->            
              </div>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>
</body>
</html>