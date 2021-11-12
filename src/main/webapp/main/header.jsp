<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="pre-header">
        <div class="container">
            <div class="row">
                <!-- BEGIN TOP BAR LEFT PART -->
                <div class="col-md-6 col-sm-6 additional-shop-info">
                    <ul class="list-unstyled list-inline">
                        <li><i class="fa fa-phone"></i><span>02-1234-5678</span></li>
                        <li><i class="fa fa-envelope-o"></i><span>team3@hongdae.com</span></li>
                    </ul>
                </div>
                <!-- END TOP BAR LEFT PART -->
                <!-- BEGIN TOP BAR MENU -->
                <div class="col-md-6 col-sm-6 additional-nav">
                    <sec:authorize access="isAnonymous()">
						<ul class="list-unstyled list-inline pull-right">
	                        <li>
	                        	<a href="<c:url value="/member/login.do" />">로그인</a>
	                        </li>
	                        <li>
	                        	<a href="<c:url value="/member/findPassword.do" />">비밀번호찾기</a>
	                        </li>
	                        <li>
	                       	 	<a href="<c:url value="/member/signup.do" />">회원가입</a>
	                        </li>
	                    </ul>
	                </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
						<ul class="list-unstyled list-inline pull-right">
							<li>
								<a href="javascript:void(0)" onclick="reservation()" class="button asset fit">긴급 예약</a>
							</li>
							<li>
								<a href="<c:url value="/member/info.do" />" class="button asset fit">내 정보</a>
							</li>
							<li>
								<a href="javascript:void(0)" onclick="logout()" class="button asset primary fit">로그아웃</a>
							</li>
							<li>
								<a href="javascript:void(0)" onclick="deleteMember()" class="button asset fit">회원탈퇴</a>
							</li>
	                    </ul>
	                </sec:authorize>
                </div>
                <!-- END TOP BAR MENU -->
            </div>
        </div>        
    </div>
     <div class="header">
      <div class="container">
        <a class="site-logo" href="../main/main.do">홍대공동의료포털</a>

        <a href="javascript:void(0);" class="mobi-toggler"><i class="fa fa-bars"></i></a>

        <!-- BEGIN NAVIGATION -->
        <div class="header-navigation pull-right font-transform-inherit">
          <ul>
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
                코로나
                
              </a>
                
              <ul class="dropdown-menu">
                <li><a href="<c:url value="/corona/domestic.do" />">국내 발생 현황</a></li>
                <li><a href="<c:url value="/corona/city.do" />">시도별 발생동향</a></li>
                <li><a href="<c:url value="/corona/route.do" />">확진환자 이동경로</a></li>
                <li><a href="<c:url value="../corona/primary.do" />">백신 예약</a></li>
                <li><a href="<c:url value="../corona/user_check.do" />">예약변경/취소</a></li>
                <li><a href="<c:url value="../corona/reply.do" />">백신 리뷰</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
                응급실
                
              </a>
                
              <ul class="dropdown-menu">
                <li><a href="#">응급실찾기</a></li>
                <li><a href="#">종합상황판</a></li>
                <li><a href="#">민간구급차 검색</a></li>
              </ul>
            </li>
         
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
               병원
                
              </a>
                
              <ul class="dropdown-menu">
                <li><a href="../hospital/find.do">병원찾기</a></li><!-- 약국아직 못함 -->
              </ul>
            </li>
              <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
               자동심장충격기(AED)
                
              </a>
                
              <ul class="dropdown-menu">
                <li><a href="../aed/find.do">자동심장충격기(AED)찾기</a></li>
                <li><a href="../aed/use.do">자동심장충격기(AED)사용법</a></li>
                <li><a href="../aed/youtube.do">자동심장충격기(AED)홍보동영상</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="../emergency_treat/list.do">
               응급처치방법
                
              </a>
                
              <ul class="dropdown-menu">
                <li><a href="../emergency_treat/treat.do">응급상황시 대처요령</a></li>
                <li><a href="../emergency_treat/treat1.do">응급처치 개요</a></li>
                <li><a href="../emergency_treat/treat2.do">응급상황</a></li>
                <li><a href="../emergency_treat/treat3.do">기본응급처치</a></li>
                <li><a href="../emergency_treat/treat4.do">상황별응급처치</a></li>
                <li><a href="../emergency_treat/treat_data.do">응급처치자료실</a></li> 
              </ul>
            </li>
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
               알림&소식
                
              </a>
                
              <ul class="dropdown-menu">
                <li><a href="blog.html">공지사항</a></li>
                <li><a href="blog-item.html">보도자료</a></li>
              </ul>
            </li>

             <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
               홍보자료
                
              </a>
            <ul class="dropdown-menu">
                <li><a href="../promotion_video/list.do">홍보동영상</a></li>
                <li><a href="../promotion_audio/list.do">홍보음성</a></li>
                <li><a href="../promotion_webtoon/list.do">홍보웹툰</a></li>
                <li><a href="../promotion_image/list.do">홍보이미지</a></li>
              </ul>
            </li>   
            


            <!-- BEGIN TOP SEARCH -->
            <li class="menu-search">
              <span class="sep"></span>
              <i class="fa fa-search search-btn"></i>
              <div class="search-box">
                <form action="#">
                  <div class="input-group">
                    <input type="text" placeholder="Search" class="form-control">
                    <span class="input-group-btn">
                      <button class="btn btn-primary" type="submit">Search</button>
                    </span>
                  </div>
                </form>
              </div> 
            </li>
            <!-- END TOP SEARCH -->
          </ul>
        </div>
        <!-- END NAVIGATION -->
      </div>
    </div>

</body>
</html>