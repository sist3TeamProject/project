<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
<style type="text/css">
.list0 { clear:both; position: relative; z-index: 1; top: -35px; left: -5px; } 
.list1 { clear:both; position: absolute; z-index: 1; top: 260px; left: 20px; }
.list2 { clear:both; position: absolute; z-index: 2; top: 215px; left: 52px; } 
.list3 { clear:both; position: absolute; z-index: 3; top: 232px; left: 115px; } 
.list4 { clear:both; position: absolute; z-index: 4; top: 050px; left: 88px; } 
.list5 { clear:both; position: absolute; z-index: 5; top: 154px; left: 35px; } 
.list6 { clear:both; position: absolute; z-index: 6; top: 074px; left: 63px; } 
.list7 { clear:both; position: absolute; z-index: 7; top: 143px; left: 98px; } 
.list8 { clear:both; position: absolute; z-index: 8; top: 147px; left: 128px; } 
.list9 { clear:both; position: absolute; z-index: 9; top: 368px; left: 40px; } 
.list10 { clear:both; position: absolute; z-index: 10; top: 112px; left: 72px; } 
.list11 { clear:both; position: absolute; z-index: 11; top: 101px; left: 39px; } 
.list12 { clear:both; position: absolute; z-index: 12; top: 192px; left: 96px; } 
.list13 { clear:both; position: absolute; z-index: 13; top: 275px; left: 62px; } 
.list14 { clear:both; position: absolute; z-index: 14; top: 223px; left: 157px; } 
.list15 { clear:both; position: absolute; z-index: 15; top: 242px; left: 189px; } 
.list16 { clear:both; position: absolute; z-index: 16; top: 263px; left: 179px; }
#wrapper_yang{
  
  width: 840px;
  height:700px;
  padding: 10px;
  position: absolute;
  transform:scale(1.3);
  margin: 0px auto;
  left: 150px;
}
#map_yang{
  border: 1px solid;
  width: 300px;
  height:390px;
  float: left;
  padding: 10px;
  top: 50px;
  
  
}
#content_yang{
  border: 1px solid;
  width: 490px;
  height: 390px;
  float: right;
  padding: 10px;
  
}
.chart-div{
  margin-left: 160px;
  margin-bottom: 30px; 
}
#map_yang > button{
  display: none;
}
</style>

</head>
<body>
    <!-- BEGIN SLIDER -->
    <div class="page-slider margin-bottom-40">
        <div id="carousel-example-generic" class="carousel slide carousel-slider">
            <!-- Indicators -->
            <ol class="carousel-indicators carousel-indicators-frontend">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <!-- First slide -->
                <div class="item carousel-item-eight active"  style="background-color: #e6f4fa;">
                    <div class="container">
                        <div class="carousel-position-six text-uppercase text-center" >
                          <div id="wrapper_yang">
                            
                            <div id="map_yang" >
							        <a href='#' onfocus='this.blur()' onmouseover=mus_on('mus1') onmouseout=mus_off('mus1')  v-on:click="corona_city('전남')">
								      <img src='../map/m061.gif' alt='' border='0' name='mus1' class='list1' >
								    </a>
								    <a href='#' onfocus='this.blur()' onmouseover=mus_on('mus2') onmouseout=mus_off('mus2') v-on:click="corona_city('전북')">
								      <img src='../map/m063.gif' alt='' border='0' name='mus2' class='list2' >
								    </a>
								    <a href='#' onfocus='this.blur()' onmouseover=mus_on('mus3') onmouseout=mus_off('mus3') v-on:click="corona_city('경남')">
								      <img src='../map/m055.gif' alt='' border='0' name='mus3' class='list3' >
								    </a>
								    <a href='#' onfocus='this.blur()' onmouseover=mus_on('mus4') onmouseout=mus_off('mus4') v-on:click="corona_city('강원')">
								      <img src='../map/m033.gif' alt='' border='0' name='mus4' class='list4' >
								    </a>
								    <a href='#' onfocus='this.blur()' onmouseover=mus_on('mus5') onmouseout=mus_off('mus5') v-on:click="corona_city('충남')">
								      <img src='../map/m041.gif' alt='' border='0' name='mus5' class='list5' >
								    </a>
								    <a href='#' onfocus='this.blur()' onmouseover=mus_on('mus6') onmouseout=mus_off('mus6') v-on:click="corona_city('경기')">
								      <img src='../map/m031.gif' alt='' border='0' name='mus6' class='list6' >
								    </a>
								    <a href='#' onfocus='this.blur()' onmouseover=mus_on('mus7') onmouseout=mus_off('mus7') v-on:click="corona_city('충북')">
								      <img src='../map/m043.gif' alt='' border='0' name='mus7' class='list7' >
								    </a>
								    <a href='#' onfocus='this.blur()' onmouseover=mus_on('mus8') onmouseout=mus_off('mus8') v-on:click="corona_city('경북')">
								      <img src='../map/m054.gif' alt='' border='0' name='mus8' class='list8' >
								    </a>
								    <a href='#' onfocus='this.blur()' onmouseover=mus_on('mus9') onmouseout=mus_off('mus9') v-on:click="corona_city('제주')">
								      <img src='../map/m064.gif' alt='' border='0' name='mus9' class='list9' >
								    </a>
								    <a href='#' onfocus='this.blur()' onmouseover=mus_on('mus10') onmouseout=mus_off('mus10') v-on:click="corona_city('서울')">
								      <img src='../map/m02.gif' alt='' border='0' name='mus10' class='list10' >
								    </a>
								    <a href='#' onfocus='this.blur()' onmouseover=mus_on('mus11') onmouseout=mus_off('mus11') v-on:click="corona_city('인천')">
								      <img src='../map/m032.gif' alt='' border='0' name='mus11' class='list11' >
								    </a>
								    <a href='#' onfocus='this.blur()' onmouseover=mus_on('mus12') onmouseout=mus_off('mus12') v-on:click="corona_city('대전')">
								      <img src='../map/m042.gif' alt='' border='0' name='mus12' class='list12' >
								    </a>
								    <a href='#' onfocus='this.blur()' onmouseover=mus_on('mus13') onmouseout=mus_off('mus13') v-on:click="corona_city('광주')">
								      <img src='../map/m062.gif' alt='' border='0' name='mus13' class='list13' >
								    </a>
								    <a href='#' onfocus='this.blur()' onmouseover=mus_on('mus14') onmouseout=mus_off('mus14') v-on:click="corona_city('대구')">
								      <img src='../map/m053.gif' alt='' border='0' name='mus14' class='list14' >
								    </a>
								    <a href=#' onfocus='this.blur()' onmouseover=mus_on('mus15') onmouseout=mus_off('mus15') v-on:click="corona_city('울산')">
								      <img src='../map/m052.gif' alt='' border='0' name='mus15' class='list15' >
								    </a>
								    <a href='#' onfocus='this.blur()' onmouseover=mus_on('mus16') onmouseout=mus_off('mus16') v-on:click="corona_city('부산')">
								      <img src='../map/m051.gif' alt='' border='0' name='mus16' class='list16' >
								    </a> 
						    </div>
						    <div id="content_yang">
						      <!-- city,total_count,total_today,quarantine,quarantine_release,dying -->
						      <ul class="nav" >
						       <li class="carousel-subtitle-v7 " style="margin-bottom: 10px;"><strong>{{corona.city}}</strong></li>
						       <li class="carousel-subtitle-v7 " style="margin-bottom: 10px;">누적 확진환자&nbsp;&nbsp;&nbsp;&nbsp;<strong>{{corona.totalcount}}명</strong></li>
						       <li class="carousel-subtitle-v7 " style="margin-bottom: 10px;">전일 대비 증감률&nbsp;&nbsp;&nbsp;&nbsp;<strong>+{{corona.totaltoday}}명</strong></li>
						       <li class="carousel-subtitle-v7 " style="margin-bottom: 10px;">격리중&nbsp;&nbsp;&nbsp;&nbsp;<strong>{{corona.quarantine}}명</strong></li>
						       <li class="carousel-subtitle-v7 " style="margin-bottom: 10px;">누적격리해제&nbsp;&nbsp;&nbsp;&nbsp;<strong>{{corona.quarantinerelease}}명</strong></li>
						       <li class="carousel-subtitle-v7 " style="margin-bottom: 10px;">사망자&nbsp;&nbsp;&nbsp;&nbsp;<strong>{{corona.dying}}명</strong></li>
						      </ul>
						      <div class="chart-div">
						            <canvas id="pieChartCanvas" width="130px" height="130px"></canvas>
						      </div>      
						    </div>
						    
					      </div>  
                        </div>
                    </div>
                </div>
                
                <!-- Second slide -->
                <div class="item carousel-item-nine">
                    <div class="container">
                        <div class="carousel-position-six">
                            <h2 class="animate-delay carousel-title-v6 text-uppercase" data-animation="animated fadeInDown">
                                Need a website design?
                            </h2>
                            <p class="carousel-subtitle-v6 text-uppercase" data-animation="animated fadeInDown">
                                This is what you were looking for
                            </p>
                            <p class="carousel-subtitle-v7 margin-bottom-30" data-animation="animated fadeInDown">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br/>
                                Sed est nunc, sagittis at consectetur id.
                            </p>
                            <a class="carousel-btn-green" href="#" data-animation="animated fadeInUp">Purchase Now!</a>
                        </div>
                    </div>
                </div>

                <!-- Third slide -->
                <div class="item carousel-item-ten">
                    <div class="container">
                        <div class="carousel-position-six">
                            <h2 class="animate-delay carousel-title-v6 text-uppercase" data-animation="animated fadeInDown">
                                Powerful &amp; Clean
                            </h2>
                            <p class="carousel-subtitle-v6 text-uppercase" data-animation="animated fadeInDown">
                                Responsive Website &amp; Admin Theme
                            </p>
                            <p class="carousel-subtitle-v7 margin-bottom-30" data-animation="animated fadeInDown">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br/>
                                Sed est nunc, sagittis at consectetur id.
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control carousel-control-shop carousel-control-frontend" href="#carousel-example-generic" role="button" data-slide="prev">
                <i class="fa fa-angle-left" aria-hidden="true"></i>
            </a>
            <a class="right carousel-control carousel-control-shop carousel-control-frontend" href="#carousel-example-generic" role="button" data-slide="next">
                <i class="fa fa-angle-right" aria-hidden="true"></i>
            </a>
        </div>
    </div>
    <!-- END SLIDER -->
  
    <div class="main">
      <div class="container">
        
        <!-- BEGIN BLOCKQUOTE BLOCK -->   
        <div class="row quote-v1 margin-bottom-30">
          <div class="text-center">
            <span>응급의료정보</span>
          </div>
          
        </div>
        <!-- END BLOCKQUOTE BLOCK -->

        <!-- BEGIN RECENT WORKS -->
        <div class="row recent-work margin-bottom-40">
          <div class="col-md-12">
            <div class="owl-carousel owl-carousel5">
            <!-- <div class="owl-carousel owl-carousel3"> -->
              <div class="recent-work-item">
                <em>
                  <img src="../pages/img/works/img1.jpg" class="img-responsive">
                  <!-- <a href="portfolio-item.html"><i class="fa fa-link"></i></a> -->
                  <a href="../emergency_center/find.jsp" class="fancybox-button" title="응급실 찾기" data-rel="fancybox-button"><i class="fa fa-search"></i></a>
                </em>
                <a class="recent-work-description" href="../emergency_center/find.jsp">
                  <strong>응급실 찾기</strong>
                  <b>주변에 위치한 응급실 정보를 알려드립니다.</b>
                </a>
              </div>
              <div class="recent-work-item">
                <em>
                  <img src="../pages/img/works/img2.jpg" class="img-responsive">
                  <a href="../findhopital/find.jpg" class="fancybox-button" title="병원·약국 찾기" data-rel="fancybox-button"><i class="fa fa-search"></i></a>
                </em>
                <a class="recent-work-description" href="../findhopital/find.jpg">
                  <strong>병원·약국 찾기</strong>
                  <b>주변에 위치한 병원·약국 정보를 알려드립니다. </b>
                </a>
              </div>
              <div class="recent-work-item">
                <em>
                  <img src="../pages/img/works/img3.jpg" class="img-responsive">
                  <a href="../pages/img/works/AED.jpg" class="fancybox-button" title="자동 심장충격기" data-rel="fancybox-button"><i class="fa fa-search"></i></a>
                </em>
                <a class="recent-work-description" href="../pages/img/works/AED.jpg">
                  <strong>자동 심장충격기</strong>
                  <b>주변에 위치한 자동 심장충격기 정보를 알려드립니다. </b>
                </a>
              </div>
              <div class="recent-work-item">
                <em>
                  <img src="../pages/img/works/img4.jpg" class="img-responsive">
                  <a href="../emergency_treat/list.jsp" class="fancybox-button" title="응급처치방법" data-rel="fancybox-button"><i class="fa fa-search"></i></a>
                </em>
                <a class="recent-work-description" href="../emergency_treat/list.do">
                  <strong>응급처치방법</strong>
                  <b>응급상황일때 대처요령 정보를 확인할 수 있습니다.</b>
                </a>
              </div>
              <div class="recent-work-item">
                <em>
                    <img src="../pages/img/works/img5.jpg" class="img-responsive">
                    <a href="../pages/img/works/health-check.png" class="fancybox-button" title="자가 진단" data-rel="fancybox-button"><i class="fa fa-search"></i></a>
                </em>
                <a class="recent-work-description" href="javascript:;">
                    <strong>자가 진단</strong>
                    <b>자가진단을 통해 본인의 건강상태를 스스로 체크해 볼 수 있습니다.</b>
                </a>
              </div>
              <!-- </div> -->
            </div>       
          </div>
        </div>   
        <!-- END RECENT WORKS -->

        <!-- BEGIN TABS AND TESTIMONIALS -->
        <div class="row mix-block margin-bottom-40">
          <!-- TABS -->
          <div class="col-md-7 tab-style-1">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab-1" data-toggle="tab">공지사항</a></li>
              <li><a href="#tab-2" data-toggle="tab">보도자료</a></li>
              <li><a href="#tab-3" data-toggle="tab">홍보동영상&음성</a></li>
              <li><a href="#tab-4" data-toggle="tab">홍보웹툰&이미지</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane row fade in active" id="tab-1">
                <div class="col-md-9 col-sm-9">
                  <a href="assets/temp/photos/img7.jpg" class="fancybox-button" title="Image Title" data-rel="fancybox-button">
                    <img class="img-responsive" src="../pages/img/photos/img7.jpg" alt="">
                  </a>
                </div>
                <div class="col-md-12 col-sm-12">
                <ul>
                  <li><a class="margin-bottom-10" href="../notice/notice.jsp"><strong>2021년 10월 응급의료기관 및 응급의료기관 외의 의료기관(응급의료시설) 현황</strong></a></li>
                  <li><a class="margin-bottom-10" href="../notice/notice.jsp"><strong>2021년 9월 응급의료기관 및 응급의료기관 외의 의료기관(응급의료시설) 현황</strong></a></li>
                  <li><a class="margin-bottom-10" href="../notice/notice.jsp"><strong>2021년 8월 응급의료기관 및 응급의료기관 외의 의료기관(응급의료시설) 현황</strong></a></li>
                 </ul>
                  <p><a class="more" href="../notice/notice.jsp">더 알아 보기 <i class="icon-angle-right"></i></a></p>
                </div>
              </div>
              
              
              <div class="tab-pane row fade" id="tab-2">
                <div class="col-md-9 col-sm-9">
                <a href="assets/temp/photos/img7.jpg" class="fancybox-button" title="Image Title" data-rel="fancybox-button">
                    <img class="img-responsive" src="../pages/img/photos/img7.jpg" alt="">
                  </a>
                </div>
                <div class="col-md-9 col-sm-9">
                <ul>
                  <li><a class="margin-bottom-10" href="../press/press.jsp"><strong>유행성 이하선염 소아청소년 환자 4월부터 응급실 이용 급증</strong></a><br></li>
                  <li><a class="margin-bottom-10" href="../press/press.jsp"><strong>개학하는 3월에 초중고생 독감환자 급증, 4월 중순까지 영향</strong></a><br></li>
                 <li> <a class="margin-bottom-10" href="../press/press.jsp"><strong>유행성 이하선염 소아청소년 환자 4월부터 응급실 이용 급증</strong></a><br></li>
                  </ul>
                   <p><a class="more" href="../press/press.jsp">더 알아 보기 <i class="icon-angle-right"></i></a></p>
                </div>
                <div class="col-md-3 col-sm-3">
                  <a href="assets/temp/photos/img10.jpg" class="fancybox-button" title="Image Title" data-rel="fancybox-button">
                    <img class="img-responsive" src="../pages/img/photos/img10.jpg" alt="">
                  </a>
                </div>
              </div>
              <div class="tab-pane fade" id="tab-3">
                <ul>
                  <li><a class="margin-bottom-10" href="#"><strong>홍보동영상 - </strong>[2016년 대학생 응급의료 홍보대사] 에디션즈(E.DI.CIANS) 팀_달빛어린이병원</strong></a><br></li>
                  <li><a class="margin-bottom-10" href="#"><strong>홍보동영상 - </strong>[2016년 대학생 응급의료 홍보대사] 스팸(SPEM) 팀_심폐소생술</strong></a><br></li>
                 <li> <a class="margin-bottom-10" href="#"><strong>홍보음성 - </strong>[2016년 홍보자료] 보건복지부_응급실감염예방 라디오 광고</strong></a><br></li>
                  </ul>
                   <p><a class="more" href="#">더 알아 보기 <i class="icon-angle-right"></i></a></p>
               
              </div>
              <div class="tab-pane fade" id="tab-4">
                 <ul>
                  <li><a class="margin-bottom-10" href="#"><strong>홍보웹툰 - </strong>[2016년 홍보자료] 미스터나이팅게일_8화</strong></a><br></li>
                  <li><a class="margin-bottom-10" href="#"><strong>홍보웹툰 - </strong>[2016년 홍보자료] 미스터나이팅게일_7화</strong></a><br></li>
                 <li> <a class="margin-bottom-10" href="#"><strong>홍보이미지 - </strong>외상응급처치) 도와줘요~ 닥터T</strong></a><br></li>
                  <li> <a class="margin-bottom-10" href="#"><strong>홍보이미지 - </strong>생활 속 거리두기! 1일 1깡? 나는 1일 5수칙</strong></a><br></li>
                  </ul>
                   <p><a class="more" href="#">더 알아 보기 <i class="icon-angle-right"></i></a></p>
               
              </div>
            </div>
          </div>
          <!-- END TABS -->
        
          <!-- TESTIMONIALS -->
          <div class="col-md-5 testimonials-v1">
            <div id="myCarousel" class="carousel slide">
            <iframe width="400" height="200" src="https://www.youtube.com/embed/q7J2T6MFA9g" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

              
            </div>
          </div>
          <!-- END TESTIMONIALS -->
        </div>                
        <!-- END TABS AND TESTIMONIALS -->

       

        <!-- BEGIN CLIENTS -->
        <div class="row margin-bottom-40 our-clients">
          <div class="text-center">
            <h2>응급처치방법</h2>
           
          </div>
          <div style="transform:scale(0.7)">
            <div class="owl-carousel owl-carousel5">
              <div class="client-item" style="margin-right: 20px; ">
                <a href="../emergency_treat/treat.do">
                  <img src="../pages/img/main_service1.png" class="img-responsive" alt="">
                  <img src="../pages/img/main_service1.png" class="color-img img-responsive" alt="">
                  <h4>응급상황시 대처요령</h4>
                  
                </a>
                
              </div>
              <div class="client-item" style="margin-right: 20px; ">
                <a href="../emergency_treat/treat1.do" >
                  <img src="../pages/img/main_service2.png" class="img-responsive" alt="">
                  <img src="../pages/img/main_service2.png" class="color-img img-responsive" alt="">
                  <h4>응급처치 개요</h4>
                </a>
              </div>
              <div class="client-item" style="margin-right: 20px; ">
                <a href="../emergency_treat/treat2.do">
                  <img src="../pages/img/main_service3.png" class="img-responsive" alt="">
                  <img src="../pages/img/main_service3.png" class="color-img img-responsive" alt="">
                  <h4>응급상황</h4>
                </a>
              </div>
              <div class="client-item" style="margin-right: 20px; ">
                <a href="../emergency_treat/treat3.do">
                  <img src="../pages/img/main_service4.png" class="img-responsive" alt="">
                  <img src="../pages/img/main_service4.png" class="color-img img-responsive" alt="">
                  <h4>기본응급처치</h4>
                </a>
              </div>
              <div class="client-item" style="margin-right: 20px; ">
                <a href="../emergency_treat/treat4.do">
                  <img src="../pages/img/main_service5.png" class="img-responsive" alt="">
                  <img src="../pages/img/main_service5.png" class="color-img img-responsive" alt="">
                  <h4>상황별응급처치</h4>
                </a>
              </div>                
            </div>
          </div>          
        </div>
        <!-- END CLIENTS -->
      </div>
    </div>
    <script>
//-----------------------------------------------------------------------------------------
/* 메뉴를 늘이거나 줄일때 추가~삭제하세요. 쌍으로 구성되어있습니다. */
mus1on  = new Image( );
mus1off = new Image( );
mus2on  = new Image( );
mus2off = new Image( );
mus3on  = new Image( );
mus3off = new Image( );
mus4on  = new Image( );
mus4off = new Image( );
mus5on  = new Image( );
mus5off = new Image( );
mus6on  = new Image( );
mus6off = new Image( );
mus7on  = new Image( );
mus7off = new Image( );
mus8on  = new Image( );
mus8off = new Image( );
mus9on  = new Image( );
mus9off = new Image( );
mus10on  = new Image( );
mus10off = new Image( );
mus11on  = new Image( );
mus11off = new Image( );
mus12on  = new Image( );
mus12off = new Image( );
mus13on  = new Image( );
mus13off = new Image( );
mus14on  = new Image( );
mus14off = new Image( );
mus15on  = new Image( );
mus15off = new Image( );
mus16on  = new Image( );
mus16off = new Image( );
/* 메뉴를 늘이거나 줄일때 추가~삭제하세요. 쌍으로 구성되어있습니다. */
mus1off.src = '../map/m061.gif';
mus2off.src = '../map/m063.gif';
mus3off.src = '../map/m055.gif';
mus4off.src = '../map/m033.gif';
mus5off.src = '../map/m041.gif';
mus6off.src = '../map/m031.gif';
mus7off.src = '../map/m043.gif';
mus8off.src = '../map/m054.gif';
mus9off.src = '../map/m064.gif';
mus10off.src = '../map/m02.gif';
mus11off.src = '../map/m032.gif';
mus12off.src = '../map/m042.gif';
mus13off.src = '../map/m062.gif';
mus14off.src = '../map/m053.gif';
mus15off.src = '../map/m052.gif';
mus16off.src = '../map/m051.gif';
mus1on.src  = '../map/m061o.gif';
mus2on.src  = '../map/m063o.gif';
mus3on.src  = '../map/m055o.gif';
mus4on.src  = '../map/m033o.gif';
mus5on.src  = '../map/m041o.gif';
mus6on.src  = '../map/m031o.gif';
mus7on.src  = '../map/m043o.gif';
mus8on.src  = '../map/m054o.gif';
mus9on.src  = '../map/m064o.gif';
mus10on.src  = '../map/m02o.gif';
mus11on.src  = '../map/m032o.gif';
mus12on.src  = '../map/m042o.gif';
mus13on.src  = '../map/m062o.gif';
mus14on.src  = '../map/m053o.gif';
mus15on.src  = '../map/m052o.gif';
mus16on.src  = '../map/m051o.gif';
/* ----------------------------------------------------------------- */
var cMuName="";
/* ----------------아래내용 순서 변경 불가-------------------------------- */
var exx = new Array("","전남","전북","경남","강원","충남","경기","충북","경북","제주","서울","인천","대전","광주","대구","울산","부산");
function mus_on(musName) {
  if(cMuName!=musName) {
     document [musName].src = eval(musName + 'on.src');
  }
}
function mus_off(musName) {
  if(cMuName!=musName)
     document [musName].src = eval(musName + 'off.src');
}

function smenu_click(musName){
     cMuName=musName;
     document [musName].src = eval(musName + 'on.src');
}

//-----------------------------------------------------------------------------------------
window.onload = function () {
    pieChartDraw();
}

let pieChartData = {
    
    datasets: [{
        data: [95, 12, 13, 7, 13],
        backgroundColor: ['rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)']
    }] 
};

let pieChartDraw = function () {
    let ctx = document.getElementById('pieChartCanvas').getContext('2d');
    
    window.pieChart = new Chart(ctx, {
        type: 'pie',
        data: pieChartData,
        options: {
            responsive: false
        }
    });
};

new Vue({
	   el:'.page-slider',
	   // 멤버변수 => this.접근 (this.food,this.info,this.cno)
	   data:{
		   corona:{},
	       city:''
	   },
	   // 값을 받는다 (요청 / 응답 : axios)
	   mounted:function(){
		  // 여러개를 동시에 받을 수 있다 
		  axios.get("http://localhost:8080/web/main/corona_city.do",{
			  params:{
				  city:'합계'
			  }
		  }).then(res=>{
			  
			  this.corona=res.data;
		  });
		 
	   },
	   methods:{
   		corona_city:function(city){
   			console.log(city);
   			this.city=city;
			this.isShow=true;
			axios.get("http://localhost:8080/web/main/corona_city.do",{
				  params:{
					  city:this.city
				  }
			}).then(response=>{
				console.log(response.data);
				this.corona=response.data
			})
			
		}
	}
})
</script>
</body>
</html>