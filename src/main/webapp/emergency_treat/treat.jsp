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
		                  <p>${vo.sub1 }<p><br>
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
                    <li><a href="javascript:;">London (18)</a></li>
                    <li><a href="javascript:;">Moscow (5)</a></li>
                    <li class="active"><a href="javascript:;">Paris (12)</a></li>
                    <li><a href="javascript:;">Berlin (7)</a></li>
                    <li><a href="javascript:;">Istanbul (3)</a></li>
                  </ul>
                  <!-- CATEGORIES END -->

                  <!-- BEGIN RECENT NEWS -->                            
                  <h2>Recent News</h2>
                  <div class="recent-news margin-bottom-10">
                    <div class="row margin-bottom-10">
                      <div class="col-md-3">
                        <img class="img-responsive" alt="" src="assets/pages/img/people/img2-large.jpg">                        
                      </div>
                      <div class="col-md-9 recent-news-inner">
                        <h3><a href="javascript:;">Letiusto gnissimos</a></h3>
                        <p>Decusamus tiusto odiodig nis simos ducimus qui sint</p>
                      </div>                        
                    </div>
                    <div class="row margin-bottom-10">
                      <div class="col-md-3">
                        <img class="img-responsive" alt="" src="assets/pages/img/people/img1-large.jpg">                        
                      </div>
                      <div class="col-md-9 recent-news-inner">
                        <h3><a href="javascript:;">Deiusto anissimos</a></h3>
                        <p>Decusamus tiusto odiodig nis simos ducimus qui sint</p>
                      </div>                        
                    </div>
                    <div class="row margin-bottom-10">
                      <div class="col-md-3">
                        <img class="img-responsive" alt="" src="assets/pages/img/people/img3-large.jpg">                        
                      </div>
                      <div class="col-md-9 recent-news-inner">
                        <h3><a href="javascript:;">Tesiusto baissimos</a></h3>
                        <p>Decusamus tiusto odiodig nis simos ducimus qui sint</p>
                      </div>                        
                    </div>
                  </div>
                  <!-- END RECENT NEWS -->                            

                  <!-- BEGIN BLOG TALKS -->
                  <div class="blog-talks margin-bottom-30">
                    <h2>Popular Talks</h2>
                    <div class="tab-style-1">
                      <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#tab-1">Multipurpose</a></li>
                        <li><a data-toggle="tab" href="#tab-2">Documented</a></li>
                      </ul>
                      <div class="tab-content">
                        <div id="tab-1" class="tab-pane row-fluid fade in active">
                          <p class="margin-bottom-10">Raw denim you probably haven't heard of them jean shorts Austin. eu banh mi, qui irure terry richardson ex squid Aliquip placeat salvia cillum iphone.</p>
                          <p><a class="more" href="javascript:;">Read more</a></p>
                        </div>
                        <div id="tab-2" class="tab-pane fade">
                          <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. aliquip jean shorts ullamco ad vinyl aesthetic magna delectus mollit. Keytar helvetica VHS salvia..</p>
                        </div>
                      </div>
                    </div>
                  </div>                            
                  <!-- END BLOG TALKS -->

                  <!-- BEGIN BLOG PHOTOS STREAM -->
                  <div class="blog-photo-stream margin-bottom-20">
                    <h2>Photos Stream</h2>
                    <ul class="list-unstyled">
                      <li><a href="javascript:;"><img alt="" src="assets/pages/img/people/img5-small.jpg"></a></li>
                      <li><a href="javascript:;"><img alt="" src="assets/pages/img/works/img1.jpg"></a></li>
                      <li><a href="javascript:;"><img alt="" src="assets/pages/img/people/img4-large.jpg"></a></li>
                      <li><a href="javascript:;"><img alt="" src="assets/pages/img/works/img6.jpg"></a></li>
                      <li><a href="javascript:;"><img alt="" src="assets/pages/img/pics/img1-large.jpg"></a></li>
                      <li><a href="javascript:;"><img alt="" src="assets/pages/img/pics/img2-large.jpg"></a></li>
                      <li><a href="javascript:;"><img alt="" src="assets/pages/img/works/img3.jpg"></a></li>
                      <li><a href="javascript:;"><img alt="" src="assets/pages/img/people/img2-large.jpg"></a></li>
                    </ul>                    
                  </div>
                  <!-- END BLOG PHOTOS STREAM -->

                  <!-- BEGIN BLOG TAGS -->
                  <div class="blog-tags margin-bottom-20">
                    <h2>Tags</h2>
                    <ul>
                      <li><a href="javascript:;"><i class="fa fa-tags"></i>OS</a></li>
                      <li><a href="javascript:;"><i class="fa fa-tags"></i>Metronic</a></li>
                      <li><a href="javascript:;"><i class="fa fa-tags"></i>Dell</a></li>
                      <li><a href="javascript:;"><i class="fa fa-tags"></i>Conquer</a></li>
                      <li><a href="javascript:;"><i class="fa fa-tags"></i>MS</a></li>
                      <li><a href="javascript:;"><i class="fa fa-tags"></i>Google</a></li>
                      <li><a href="javascript:;"><i class="fa fa-tags"></i>Keenthemes</a></li>
                      <li><a href="javascript:;"><i class="fa fa-tags"></i>Twitter</a></li>
                    </ul>
                  </div>
                  <!-- END BLOG TAGS -->
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