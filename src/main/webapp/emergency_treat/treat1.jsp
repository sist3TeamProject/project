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
            <li><a href="../main/main.do">Home</a></li>
            <li><a href="../emergency_treat/list.do">응급처치방법</a></li>
            <li class="active">응급처치 개요</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1>응급처치 개요</h1>
            <h4>응급상황시 행동원칙과 의료체계에 대한 정보를 확인하실 수 있습니다.</h4>
            <div class="content-page">
              <div class="row">
                <!-- BEGIN LEFT SIDEBAR -->            
                <div class="col-md-9 col-sm-9 blog-item">
                  <div class="blog-item-img">
                   	<c:forEach var="vo" items="${list }">
                      <div class="item">
                        <%-- <img src="${vo.poster }"> --%>
                        <blockquote>
		                  <h3>${vo.title }</h3><br>
		                  <p>${vo.sub1 }</p>
		                  <ul>
		                   <c:forTokens items="${vo.sub2 }" delims="^" var="sub2">
		                     <li>${sub2 }</li>
		                   </c:forTokens>
						  </ul>
		                </blockquote> 
                      </div>
                    </c:forEach>          
                  </div>
                  
                  <hr>

                  <h2>Comments</h2>
                  <div class="comments">
                  
                    <div class="media">
                      <div class="media-body">
                        <h4 class="media-heading">이름 <span>날짜 / <a href="javascript:;">Reply</a></span></h4>
                        <p>댓글 </p>
                      </div>
                    </div>

                  </div>

                  <div class="post-comment padding-top-40">
                    <h3>Leave a Comment</h3>
                    <form role="form">
                      <div class="form-group">
                        <label>Name</label>
                        <input class="form-control" type="text">
                      </div>

                      <div class="form-group">
                        <label>Email <span class="color-red">*</span></label>
                        <input class="form-control" type="text">
                      </div>

                      <div class="form-group">
                        <label>Message</label>
                        <textarea class="form-control" rows="8"></textarea>
                      </div>
                      <p><button class="btn btn-primary" type="submit">Post a Comment</button></p>
                    </form>
                  </div>                      
                </div>
                <!-- END LEFT SIDEBAR -->

                <!-- BEGIN RIGHT SIDEBAR -->            
                <div class="col-md-3 col-sm-3 blog-sidebar">
                  <!-- CATEGORIES START -->
                  <h2 class="no-top-space">Categories</h2>
                  <ul class="nav sidebar-categories margin-bottom-40">
                    <li><a href="#">응급실</a></li>                    
                    <li><a href="#">병원&약국</a></li>
                    <li><a href="#">자동심장충격기(AED)</a></li>
                    <li><a href="#">알림&소식</a></li>
                    <li><a href="#">홍보자료</a></li>
                  </ul>
                  <!-- CATEGORIES END -->

                  <!-- BEGIN RECENT NEWS -->                            
                  <h2>Recent News</h2>
                  <div class="recent-news" style="width:280px">
                    <div class="row">
                      <h3 class="text-center"></h3>
                      <p class="text-center"><a href="#">2021년 10월 응급의료기관 및 응급의료기관<br>외의 의료기관(응급의료시설) 현황</a></p>                          
                    </div>
                    <div class="row">
                      <h3 class="text-center"></h3>
                      <p class="text-center"><a href="#">2021년 9월 응급의료기관 및 응급의료기관<br>외의 의료기관(응급의료시설) 현황</a></p>                          
                    </div>
                    <div class="row">
                      <h3 class="text-center"></h3>
                      <p class="text-center"><a href="#">2021년 8월 응급의료기관 및 응급의료기관<br>외의 의료기관(응급의료시설) 현황</a></p>                        
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