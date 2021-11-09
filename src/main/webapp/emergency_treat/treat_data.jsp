<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="javascript:;">응급처치방법</a></li>
            <li class="active">응급처치자료실</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1>응급처치 자료실</h1>
            <div class="content-page">
                <!-- BEGIN LEFT SIDEBAR -->            
                <div class="col-md-9 col-sm-9 blog-posts">
                  <c:forEach var="vo" items="${list }">
                  <hr class="blog-post-sep">
                  <div class="row">
                    <div class="col-md-4 col-sm-4">
                      <img class="img-responsive" alt="" src="assets/pages/img/works/img4.jpg">
                    </div>
                    <div class="col-md-8 col-sm-8">
                      <h2><a href="blog-item.html">${vo.title }</a></h2>
                      <ul class="blog-info">
                        <li><i class="fa fa-calendar"></i>${vo.regdate }</li>
                        <li><i class="fa fa-comments"></i>${vo.hit }</li>
                        <li><i class="fa fa-tags"></i>${vo.name }</li>
                      </ul>
                      <p>${vo.content }</p>
                      <a href="#" class="more">Read more <i class="icon-angle-right"></i></a>
                    </div>
                  </div>
                  </c:forEach>
                  <hr class="blog-post-sep">
                  <ul class="pagination">
                    <c:if test="${startPage>1 }">
			          <li><a href="../emergency_treat/treat_data.do?page=${startPage-1 }">&laquo; Previous</a></li>
			        </c:if>
			        <c:forEach var="i" begin="${startPage }" end="${endPage }">
			          <c:if test="${i==curpage }">
			            <li class="active"><a href="../emergency_treat/treat_data.do?page=${i }">${i }</a></li>
			          </c:if>
			          <c:if test="${i!=curpage }">
			            <li><a href="../emergency_treat/treat_data.do?page=${i }">${i }</a></li>
			          </c:if>
			        </c:forEach>
			        <c:if test="${endPage<totalpage }">
			          <li><a href="../emergency_treat/treat_data.do?page=${endPage+1 }">Next &raquo;</a></li>
			        </c:if>
                  </ul>         
                  <div style="height: 40px"></div>    
                </div>
                <!-- END LEFT SIDEBAR -->

                <!-- BEGIN RIGHT SIDEBAR -->            
                <div class="col-md-3 col-sm-3 blog-sidebar">
                  <!-- CATEGORIES START -->
                  <h2 class="no-top-space">Categories</h2>
                  <ul class="nav sidebar-categories margin-bottom-40">
                    <li><a href="../emergency_center/find.do">응급실</a></li>                    
                    <li><a href="../findhopital/find.do">병원&약국</a></li>
                    <li><a href="../aed/find.do">자동심장충격기(AED)</a></li>
                    <li><a href="../notice/notice.do">알림&소식</a></li>
                    <li><a href="#">홍보자료</a></li>
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
                          <p><a class="more" href="#">Read more</a></p>
                        </div>
                        <div id="tab-2" class="tab-pane fade">
                          <p>[2016년 대학생 응급의료 홍보대사] 스팸(SPEM) 팀_심폐소생술</p>
                          <p><a class="more" href="#">Read more</a></p>
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