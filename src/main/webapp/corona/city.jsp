<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
<link rel="stylesheet" href="../corona/coronacss.css">
</head>
<body>
<div class="container">
  <ul class="breadcrumb">
     <li><a href="index.html">Home</a></li>
     <li><a href="javascript:;">코로나</a></li>
     <li class="active">시도별 발생동향</li>
  </ul>
  <div class="row">
    <h1>시도별 발생동향</h1>
    <hr style="border: 2px solid ;">
  </div>
  <div class="row" style="border: 1px solid; height: 60px; margin-bottom: 20px; ">
   <h3 class="text-center">시간 기준</h3>
  </div>
  <div class="row bottom-term">
                            <div class ="size60_yang">
                              <div id="map_yang" class=" top-color">
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
                       
                       
  <div class="row" style="margin-bottom: 100px;">
    <table class="table" border="1">
      <tr>
       <th class="text-center" rowspan="2" style="border-top: 3px groove #97b0d1; font-weight: bold; vertical-align: middle;">시도명</th>
       <th class="text-center" colspan="3" style="border-top: 3px groove #97b0d1; font-weight: bold;">전일대비확진환자 증감</th>
       <th class="text-center" colspan="5" style="border-top: 3px groove #97b0d1; font-weight: bold;">확진환자 (명)</th>
      </tr>
      <tr>
       <th style="font-weight: bold;">합계</th>
       <th style="font-weight: bold;">국내발생</th>
       <th style="font-weight: bold;">해외유입</th>
       <th style="font-weight: bold;">확진환자	</th>
       <th style="font-weight: bold;">격리중</th>
       <th style="font-weight: bold;">격리해제</th>
       <th style="font-weight: bold;">사망자</th>
       <th style="font-weight: bold;">발생률 (*)</th>
      </tr>
      <c:forEach var="vo" items="${list }">
      <tr><!-- city,totaltoday,domestic,overseas,totalcount,quarantine,quarantinerelease,dying,incidencerate -->
       <td class="text-center">${vo.city }</td>
       <td class="text-right">${vo.totaltoday }</td>
       <td class="text-right">${vo.domestic }</td>
       <td class="text-right">${vo.overseas }</td>
       <td class="text-right">${vo.totalcount }</td>
       <td class="text-right">${vo.quarantine }</td>
       <td class="text-right">${vo.quarantinerelease }</td>
       <td class="text-right">${vo.dying }</td>
       <td class="text-right">${vo.incidencerate }</td>
      </tr>
      </c:forEach>
    </table>
  </div>                     
</div>
                    
                    
<script>
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
</script>
</body>
</html>