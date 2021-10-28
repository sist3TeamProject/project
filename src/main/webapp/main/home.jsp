<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
  left: 50px;
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
							        <a href='../bbs/board.php?bo_table=m101&sca=전남' onfocus='this.blur()' onmouseover=mus_on('mus1') onmouseout=mus_off('mus1') onclick=smenu_click('mus1')>
								      <img src='../map/m061.gif' alt='' border='0' name='mus1' class='list1' >
								    </a>
								    <a href='../bbs/board.php?bo_table=m101&sca=전북' onfocus='this.blur()' onmouseover=mus_on('mus2') onmouseout=mus_off('mus2') onclick=smenu_click('mus2')>
								      <img src='../map/m063.gif' alt='' border='0' name='mus2' class='list2' >
								    </a>
								    <a href='../bbs/board.php?bo_table=m101&sca=경남' onfocus='this.blur()' onmouseover=mus_on('mus3') onmouseout=mus_off('mus3') onclick=smenu_click('mus3')>
								      <img src='../map/m055.gif' alt='' border='0' name='mus3' class='list3' >
								    </a>
								    <a href='../bbs/board.php?bo_table=m101&sca=강원' onfocus='this.blur()' onmouseover=mus_on('mus4') onmouseout=mus_off('mus4') onclick=smenu_click('mus4')>
								      <img src='../map/m033.gif' alt='' border='0' name='mus4' class='list4' >
								    </a>
								    <a href='../bbs/board.php?bo_table=m101&sca=충남' onfocus='this.blur()' onmouseover=mus_on('mus5') onmouseout=mus_off('mus5') onclick=smenu_click('mus5')>
								      <img src='../map/m041.gif' alt='' border='0' name='mus5' class='list5' >
								    </a>
								    <a href='../bbs/board.php?bo_table=m101&sca=경기' onfocus='this.blur()' onmouseover=mus_on('mus6') onmouseout=mus_off('mus6') onclick=smenu_click('mus6')>
								      <img src='../map/m031.gif' alt='' border='0' name='mus6' class='list6' >
								    </a>
								    <a href='../bbs/board.php?bo_table=m101&sca=충북' onfocus='this.blur()' onmouseover=mus_on('mus7') onmouseout=mus_off('mus7') onclick=smenu_click('mus7')>
								      <img src='../map/m043.gif' alt='' border='0' name='mus7' class='list7' >
								    </a>
								    <a href='../bbs/board.php?bo_table=m101&sca=경북' onfocus='this.blur()' onmouseover=mus_on('mus8') onmouseout=mus_off('mus8') onclick=smenu_click('mus8')>
								      <img src='../map/m054.gif' alt='' border='0' name='mus8' class='list8' >
								    </a>
								    <a href='../bbs/board.php?bo_table=m101&sca=제주' onfocus='this.blur()' onmouseover=mus_on('mus9') onmouseout=mus_off('mus9') onclick=smenu_click('mus9')>
								      <img src='../map/m064.gif' alt='' border='0' name='mus9' class='list9' >
								    </a>
								    <a href='../bbs/board.php?bo_table=m101&sca=서울' onfocus='this.blur()' onmouseover=mus_on('mus10') onmouseout=mus_off('mus10') onclick=smenu_click('mus10')>
								      <img src='../map/m02.gif' alt='' border='0' name='mus10' class='list10' >
								    </a>
								    <a href='../bbs/board.php?bo_table=m101&sca=인천' onfocus='this.blur()' onmouseover=mus_on('mus11') onmouseout=mus_off('mus11') onclick=smenu_click('mus11')>
								      <img src='../map/m032.gif' alt='' border='0' name='mus11' class='list11' >
								    </a><a href='../bbs/board.php?bo_table=m101&sca=대전' onfocus='this.blur()' onmouseover=mus_on('mus12') onmouseout=mus_off('mus12') onclick=smenu_click('mus12')>
								      <img src='../map/m042.gif' alt='' border='0' name='mus12' class='list12' >
								    </a>
								    <a href='../bbs/board.php?bo_table=m101&sca=광주' onfocus='this.blur()' onmouseover=mus_on('mus13') onmouseout=mus_off('mus13') onclick=smenu_click('mus13')>
								      <img src='../map/m062.gif' alt='' border='0' name='mus13' class='list13' >
								    </a>
								    <a href='../bbs/board.php?bo_table=m101&sca=대구' onfocus='this.blur()' onmouseover=mus_on('mus14') onmouseout=mus_off('mus14') onclick=smenu_click('mus14')>
								      <img src='../map/m053.gif' alt='' border='0' name='mus14' class='list14' >
								    </a>
								    <a href='../bbs/board.php?bo_table=m101&sca=울산' onfocus='this.blur()' onmouseover=mus_on('mus15') onmouseout=mus_off('mus15') onclick=smenu_click('mus15')>
								      <img src='../map/m052.gif' alt='' border='0' name='mus15' class='list15' >
								    </a>
								    <a href='../bbs/board.php?bo_table=m101&sca=부산' onfocus='this.blur()' onmouseover=mus_on('mus16') onmouseout=mus_off('mus16') onclick=smenu_click('mus16')>
								      <img src='../map/m051.gif' alt='' border='0' name='mus16' class='list16' >
								    </a> 
						    </div>
						    <div id="content_yang">
						      
						      <ul class="nav">
						       <li class="carousel-subtitle-v7 margin-bottom-30">누적 확진환자&nbsp;&nbsp;&nbsp;&nbsp;<strong>1명</strong></li>
						       <li class="carousel-subtitle-v7 margin-bottom-30">전일 대비 증감률&nbsp;&nbsp;&nbsp;&nbsp;<strong>+1명</strong></li>
						       <li class="carousel-subtitle-v7 margin-bottom-30">격리중&nbsp;&nbsp;&nbsp;&nbsp;<strong>1명</strong></li>
						       <li class="carousel-subtitle-v7 margin-bottom-30">누적격리해제&nbsp;&nbsp;&nbsp;&nbsp;<strong>1명</strong></li>
						       <li class="carousel-subtitle-v7 margin-bottom-30">사망자&nbsp;&nbsp;&nbsp;&nbsp;<strong>1명</strong></li>
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
        <!-- BEGIN SERVICE BOX -->   
        <div class="row service-box margin-bottom-40">
          <div class="col-md-4 col-sm-4">
            <div class="service-box-heading">
              <em><i class="fa fa-location-arrow blue"></i></em>
              <span>Multipurpose Template</span>
            </div>
            <p>Lorem ipsum dolor sit amet, dolore eiusmod quis tempor incididunt ut et dolore Ut veniam unde nostrudlaboris. Sed unde omnis iste natus error sit voluptatem.</p>
          </div>
          <div class="col-md-4 col-sm-4">
            <div class="service-box-heading">
              <em><i class="fa fa-check red"></i></em>
              <span>Well Documented</span>
            </div>
            <p>Lorem ipsum dolor sit amet, dolore eiusmod quis tempor incididunt ut et dolore Ut veniam unde nostrudlaboris. Sed unde omnis iste natus error sit voluptatem.</p>
          </div>
          <div class="col-md-4 col-sm-4">
            <div class="service-box-heading">
              <em><i class="fa fa-compress green"></i></em>
              <span>Responsive Design</span>
            </div>
            <p>Lorem ipsum dolor sit amet, dolore eiusmod quis tempor incididunt ut et dolore Ut veniam unde nostrudlaboris. Sed unde omnis iste natus error sit voluptatem.</p>
          </div>
        </div>
        <!-- END SERVICE BOX -->

        <!-- BEGIN BLOCKQUOTE BLOCK -->   
        <div class="row quote-v1 margin-bottom-30">
          <div class="col-md-9">
            <span>Metronic - The Most Complete &amp; Popular Admin &amp; Frontend Theme</span>
          </div>
          <div class="col-md-3 text-right">
            <a class="btn-transparent" href="http://www.keenthemes.com/preview/index.php?theme=metronic_admin" target="_blank"><i class="fa fa-rocket margin-right-10"></i>Preview Admin</a>
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
                  <img src="../pages/img/works/ambulance.jpg" alt="Amazing Project" class="img-responsive">
                  <!-- <a href="portfolio-item.html"><i class="fa fa-link"></i></a> -->
                  <a href="../emergency_center/find.jsp" class="fancybox-button" title="응급실 찾기" data-rel="fancybox-button"><i class="fa fa-search"></i></a>
                </em>
                <a class="recent-work-description" href="javascript:;">
                  <strong>응급실 찾기</strong>
                  <b>주변에 위치한 응급실 정보를 알려드립니다.</b>
                </a>
              </div>
              <div class="recent-work-item">
                <em>
                  <img src="../pages/img/works/hopital.png" alt="Amazing Project" class="img-responsive" style="height: 165px">
                  <a href="portfolio-item.html"><i class="fa fa-link"></i></a>
                  <a href="../findhopital/find.jpg" class="fancybox-button" title="병원·약국 찾기" data-rel="fancybox-button"><i class="fa fa-search"></i></a>
                </em>
                <a class="recent-work-description" href="javascript:;">
                  <strong>병원·약국 찾기</strong>
                  <b>주변에 위치한 병원·약국 정보를 알려드립니다. </b>
                </a>
              </div>
              <div class="recent-work-item">
                <em>
                  <img src="../pages/img/works/img3.jpg" alt="Amazing Project" class="img-responsive">
                  <a href="portfolio-item.html"><i class="fa fa-link"></i></a>
                  <a href="../pages/img/works/img3.jpg" class="fancybox-button" title="Project Name #3" data-rel="fancybox-button"><i class="fa fa-search"></i></a>
                </em>
                <a class="recent-work-description" href="javascript:;">
                  <strong>Amazing Project</strong>
                  <b>Agenda corp.</b>
                </a>
              </div>
              <div class="recent-work-item">
                <em>
                  <img src="../pages/img/works/emer1.jpg" class="img-responsive" style="height: 167px">
                  <!-- <a href="portfolio-item.html"><i class="fa fa-link"></i></a> -->
                  <a href="../emergency_treat/list.jsp" class="fancybox-button" title="응급처치방법" data-rel="fancybox-button"><i class="fa fa-search"></i></a>
                </em>
                <a class="recent-work-description" href="../emergency_treat/list.jsp">
                  <strong>응급처치방법</strong>
                  <b>응급상황일때 대처요령 정보를 확인할 수 있습니다.</b>
                </a>
              </div>
                <div class="recent-work-item">
                    <em>
                        <img src="../pages/img/works/health-check.png" style="height: 163.5px;" alt="Amazing Project" class="img-responsive">
                        <a href="portfolio-item.html"><i class="fa fa-link"></i></a>
                        <a href="../pages/img/works/health-check.png" class="fancybox-button" title="Project Name #5" data-rel="fancybox-button"><i class="fa fa-search"></i></a>
                    </em>
                    <a class="recent-work-description" href="javascript:;">
                        <strong>자가 진단</strong>
                        <b>자가진단을 통해 본인의 건강상태를 스스로 체크해 볼 수 있습니다.</b>
                    </a>
                </div>

              <div class="recent-work-item">
                <em>
                  <img src="../pages/img/works/img6.jpg" alt="Amazing Project" class="img-responsive">
                  <a href="portfolio-item.html"><i class="fa fa-link"></i></a>
                  <a href="../pages/img/works/img6.jpg" class="fancybox-button" title="Project Name #6" data-rel="fancybox-button"><i class="fa fa-search"></i></a>
                </em>
                <a class="recent-work-description" href="javascript:;">
                  <strong>Amazing Project</strong>
                  <b>Agenda corp.</b>
                </a>
              </div>
              <div class="recent-work-item">
                <em>
                  <img src="../pages/img/works/img3.jpg" alt="Amazing Project" class="img-responsive">
                  <a href="portfolio-item.html"><i class="fa fa-link"></i></a>
                  <a href="../pages/img/works/img3.jpg" class="fancybox-button" title="Project Name #3" data-rel="fancybox-button"><i class="fa fa-search"></i></a>
                </em>
                <a class="recent-work-description" href="javascript:;">
                  <strong>Amazing Project</strong>
                  <b>Agenda corp.</b>
                </a>
              </div>
              <div class="recent-work-item">
                <em>
                  <img src="../pages/img/works/img4.jpg" alt="Amazing Project" class="img-responsive">
                  <a href="portfolio-item.html"><i class="fa fa-link"></i></a>
                  <a href="../pages/img/works/img4.jpg" class="fancybox-button" title="Project Name #4" data-rel="fancybox-button"><i class="fa fa-search"></i></a>
                </em>
                <a class="recent-work-description" href="javascript:;">
                  <strong>Amazing Project</strong>
                  <b>Agenda corp.</b>
                </a>
              <!-- </div> -->
>>>>>>> branch 'master' of https://github.com/sist3TeamProject/project.git
            </div>       
          </div>
        </div>   
        <!-- END RECENT WORKS -->

        <!-- BEGIN TABS AND TESTIMONIALS -->
        <div class="row mix-block margin-bottom-40">
          <!-- TABS -->
          <div class="col-md-7 tab-style-1">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab-1" data-toggle="tab">Multipurpose</a></li>
              <li><a href="#tab-2" data-toggle="tab">Documented</a></li>
              <li><a href="#tab-3" data-toggle="tab">Responsive</a></li>
              <li><a href="#tab-4" data-toggle="tab">Clean & Fresh</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane row fade in active" id="tab-1">
                <div class="col-md-3 col-sm-3">
                  <a href="assets/temp/photos/img7.jpg" class="fancybox-button" title="Image Title" data-rel="fancybox-button">
                    <img class="img-responsive" src="../pages/img/photos/img7.jpg" alt="">
                  </a>
                </div>
                <div class="col-md-9 col-sm-9">
                  <p class="margin-bottom-10">Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Cosby sweater eu banh mi, qui irure terry richardson ex squid Aliquip placeat salvia cillum iphone.</p>
                  <p><a class="more" href="javascript:;">Read more <i class="icon-angle-right"></i></a></p>
                </div>
              </div>
              <div class="tab-pane row fade" id="tab-2">
                <div class="col-md-9 col-sm-9">
                  <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia..</p>
                </div>
                <div class="col-md-3 col-sm-3">
                  <a href="assets/temp/photos/img10.jpg" class="fancybox-button" title="Image Title" data-rel="fancybox-button">
                    <img class="img-responsive" src="../pages/img/photos/img10.jpg" alt="">
                  </a>
                </div>
              </div>
              <div class="tab-pane fade" id="tab-3">
                <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork. Williamsburg banh mi whatever gluten-free, carles pitchfork biodiesel fixie etsy retro mlkshk vice blog. Scenester cred you probably haven't heard of them, vinyl craft beer blog stumptown. Pitchfork sustainable tofu synth chambray yr.</p>
              </div>
              <div class="tab-pane fade" id="tab-4">
                <p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater. Lomo wolf viral, mustache readymade thundercats keffiyeh craft beer marfa ethical. Wolf salvia freegan, sartorial keffiyeh echo park vegan.</p>
              </div>
            </div>
          </div>
          <!-- END TABS -->
        
          <!-- TESTIMONIALS -->
          <div class="col-md-5 testimonials-v1">
            <div id="myCarousel" class="carousel slide">
              <!-- Carousel items -->
              <div class="carousel-inner">
                <div class="active item">
                  <blockquote><p>Denim you probably haven't heard of. Lorem ipsum dolor met consectetur adipisicing sit amet, consectetur adipisicing elit, of them jean shorts sed magna aliqua. Lorem ipsum dolor met.</p></blockquote>
                  <div class="carousel-info">
                    <img class="pull-left" src="../pages/img/people/img1-small.jpg" alt="">
                    <div class="pull-left">
                      <span class="testimonials-name">Lina Mars</span>
                      <span class="testimonials-post">Commercial Director</span>
                    </div>
                  </div>
                </div>
                <div class="item">
                  <blockquote><p>Raw denim you Mustache cliche tempor, williamsburg carles vegan helvetica probably haven't heard of them jean shorts austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica.</p></blockquote>
                  <div class="carousel-info">
                    <img class="pull-left" src="../pages/img/people/img5-small.jpg" alt="">
                    <div class="pull-left">
                      <span class="testimonials-name">Kate Ford</span>
                      <span class="testimonials-post">Commercial Director</span>
                    </div>
                  </div>
                </div>
                <div class="item">
                  <blockquote><p>Reprehenderit butcher stache cliche tempor, williamsburg carles vegan helvetica.retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid Aliquip placeat salvia cillum iphone.</p></blockquote>
                  <div class="carousel-info">
                    <img class="pull-left" src="../pages/img/people/img2-small.jpg" alt="">
                    <div class="pull-left">
                      <span class="testimonials-name">Jake Witson</span>
                      <span class="testimonials-post">Commercial Director</span>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Carousel nav -->
              <a class="left-btn" href="#myCarousel" data-slide="prev"></a>
              <a class="right-btn" href="#myCarousel" data-slide="next"></a>
            </div>
          </div>
          <!-- END TESTIMONIALS -->
        </div>                
        <!-- END TABS AND TESTIMONIALS -->

        <!-- BEGIN STEPS -->
        <div class="row margin-bottom-40 front-steps-wrapper front-steps-count-3">
          <div class="col-md-4 col-sm-4 front-step-col">
            <div class="front-step front-step1">
              <h2>Goal definition</h2>
              <p>Lorem ipsum dolor sit amet sit consectetur adipisicing eiusmod tempor.</p>
            </div>
          </div>
          <div class="col-md-4 col-sm-4 front-step-col">
            <div class="front-step front-step2">
              <h2>Analyse</h2>
              <p>Lorem ipsum dolor sit amet sit consectetur adipisicing eiusmod tempor.</p>
            </div>
          </div>
          <div class="col-md-4 col-sm-4 front-step-col">
            <div class="front-step front-step3">
              <h2>Implementation</h2>
              <p>Lorem ipsum dolor sit amet sit consectetur adipisicing eiusmod tempor.</p>
            </div>
          </div>
        </div>
        <!-- END STEPS -->

        <!-- BEGIN CLIENTS -->
        <div class="row margin-bottom-40 our-clients">
          <div class="col-md-3">
            <h2><a href="javascript:;">Our Clients</a></h2>
            <p>Lorem dipsum folor margade sitede lametep eiusmod psumquis dolore.</p>
          </div>
          <div class="col-md-9">
            <div class="owl-carousel owl-carousel6-brands">
              <div class="client-item">
                <a href="javascript:;">
                  <img src="../pages/img/clients/client_1_gray.png" class="img-responsive" alt="">
                  <img src="../pages/img/clients/client_1.png" class="color-img img-responsive" alt="">
                </a>
              </div>
              <div class="client-item">
                <a href="javascript:;">
                  <img src="../pages/img/clients/client_2_gray.png" class="img-responsive" alt="">
                  <img src="../pages/img/clients/client_2.png" class="color-img img-responsive" alt="">
                </a>
              </div>
              <div class="client-item">
                <a href="javascript:;">
                  <img src="../pages/img/clients/client_3_gray.png" class="img-responsive" alt="">
                  <img src="../pages/img/clients/client_3.png" class="color-img img-responsive" alt="">
                </a>
              </div>
              <div class="client-item">
                <a href="javascript:;">
                  <img src="../pages/img/clients/client_4_gray.png" class="img-responsive" alt="">
                  <img src="../pages/img/clients/client_4.png" class="color-img img-responsive" alt="">
                </a>
              </div>
              <div class="client-item">
                <a href="javascript:;">
                  <img src="../pages/img/clients/client_5_gray.png" class="img-responsive" alt="">
                  <img src="../pages/img/clients/client_5.png" class="color-img img-responsive" alt="">
                </a>
              </div>
              <div class="client-item">
                <a href="javascript:;">
                  <img src="../pages/img/clients/client_6_gray.png" class="img-responsive" alt="">
                  <img src="../pages/img/clients/client_6.png" class="color-img img-responsive" alt="">
                </a>
              </div>
              <div class="client-item">
                <a href="javascript:;">
                  <img src="../pages/img/clients/client_7_gray.png" class="img-responsive" alt="">
                  <img src="../pages/img/clients/client_7.png" class="color-img img-responsive" alt="">
                </a>
              </div>
              <div class="client-item">
                <a href="javascript:;">
                  <img src="../pages/img/clients/client_8_gray.png" class="img-responsive" alt="">
                  <img src="../pages/img/clients/client_8.png" class="color-img img-responsive" alt="">
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
        data: [95, 12, 13, 7, 13, 10],
        backgroundColor: ['rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', 'rgb(153, 102, 255)']
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
</script>
</body>
</html>