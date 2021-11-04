<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style type="text/css">
body {
  padding : 10px ;
  
}

#exTab1 .tab-content {
  color : white;
  background-color: #428bca;
  padding : 5px 15px;
}

#exTab2 h3 {
  color : white;
  background-color: #428bca;
  padding : 5px 15px;
}

/* remove border radius for the tab */

#exTab1 .nav-pills > li > a {
  border-radius: 0;
}

/* change border radius for the tab , apply corners on top*/

#exTab3 .nav-pills > li > a {
  border-radius: 4px 4px 0 0 ;
}

#exTab3 .tab-content {
  color : white;
  background-color: #428bca;
  padding : 5px 15px;
}

</style>
</head>
<body>
<div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="../main/main.do">Home</a></li>
            <li><a href="../emergency_treat/list.do">응급처치방법</a></li>
            <li class="active">응급상황</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1>응급상황</h1>
            <h4>특수한 응급상황이 발생시 응급처치에 대한 정보를 확인하실 수 있습니다.</h4>
            <div id="exTab2" class="container">	
		      <ul class="nav nav-tabs">
			    <li class="active"><a  href="#1" data-toggle="tab">여행 중 일어날 수 있는 응급상황</a></li>
				<li><a href="#2" data-toggle="tab">항공 여행 시 응급상황</a></li>
			 </ul>
			   <div class="tab-content ">
			     <div class="tab-pane active" id="1">
		           <h1>여행중 일어날 수 있는 응급상황</h1>
            	   <p>여행 중 일어날 수 있는 응급 상황은 아주 다양하다. 일반적으로 뼈가 부러지는 골절 사고, 기도가 막혀 숨을 못 쉬는 기도 폐쇄, 심한 운동으로 인한 심장 마비, 더운 날씨에 체온이 심하게 올라가는 열사병, 추운 곳에 오래 방치된 경우 체온이 떨어지는 저체온증 등 일어날 수 있는 상황은 많다. 따라서 평소에 생각하지 못하는 예기치 못한 응급상황에 대처하기 위하여 일반적 응급처치법과 아울러 예방도 중요하다고 하겠다.</p>
				   <blockquote>
				     <h3>해외 여행 중 필요한 의료 비상용품</h3>
				     <p>먼저 가고자 하는 여행 목적지에 어떤 질병이 많은지, 풍토병 등에 대한 예방이 필요하지는 않은지, 준비해야 하는 약품이나 응급처치 용품들에 대해 전문의의 조언을 구하는 것이 좋다.</p>
				     <h4>여행 시 필요한 구급 키트와 위생용품</h4>
				     <ul>
				       <li>여행기간에 필요한 의료 용품은 여행 기간동안 모든 추후 필요성을 고려하여 구비해야 한다.</li>
				       <li>구급키트는 건강 위험요인이 있을 수 있는 모든 여행지 특히 개발도상국과 특정 약물을 구입할 수 없는 지역을 여행 시 구비하여야 한다. 이러한 구급키트는 흔한 질병 치료를 위한 기초약물, 1차 치료 용품, 개인이 특히 필요로 하는 의료제품이 포함될 것이다.</li>
				       <li>처방 약물의 경우에는 의사의 사인을 받아 의학 증명서와 함께 소지하고 개인용 필요 약물 임을 보증해 주어야 한다. 몇몇 나라들은 의사뿐만 아니라, 국립보건기관이 보증해 주는 증명서를 요구한다.</li>
				       <li>모든 약물은 여행동안 분실의 위험성을 최소화하기 위해 손가방에 넣어 보관하여야 한다. 동일한 약물을 2개 정도의 가방에 각각 하나씩 넣어 두는 것이 가방 분실 시 안전한 방법이 될 수 있다.</li>
				       <li>위생용품 또한 여행시 충분히 양이 구비되어 있어야 한다. 위생용품에는 치아관리 용품, 콘텍트 렌즈를 포함한 눈 관리용품, 피부용품, 개인 위생용품이 포함된다.</li>
				       <li>영문으로 된 처방전, 진단서 등을 소지하는것도 도움이 된다.</li>
				     </ul>
				   </blockquote>
				 </div>
				 <div class="tab-pane" id="2">
		           <h1>일반적인 주의 사항</h1>
            	   <p>항공기를 이용한 여행 중 기내에서 질병이 발생하거나 악화되어 여행을 중단하거나 심지어 사망하는 경우도 있다. 항공 여행 도중의 상황은 지상에서의 상황과 많은 차이가 있다. 비행 환경과 관련된 스트레스로는 지상보다 낮은 기압과 산소 분압, 소음과 진동, 이상 난기류에 의한 기체의 흔들림 , 차고 건조한 공기, 시차에 따른 신체적 부조화, 좁은 공간으로 인한 육체적 피로 등을 들 수 있다. 이런 스트레스 요인들은 건강한 사람이라면 별 문제를 일으키지 않고, 잘 극복할 수 있지만, 질병이 있거나, 연령이 많은 승객 중에는 문제를 일으켜 질병의 악화 나 심지어 사망에 이르는 경우도 있다.
						항공기가 고도비행을 할 경우, 낮은 산소 분압으로 관상동맥질환, 폐질환, 뇌혈관 질환이 있거나, 빈혈이 있는 승객에게는 문제가 될 수고, 그리고 항공기의 상승과 하강 시 공기의 팽창 및 수축현상은 귀 또는 코 주위에 있는 부비동에 통증을 일으킬 수 있으며, 항공성 중이염이나 부비동염(축농증)을 발생할 수 있다.</p>
				   <blockquote>
				     <h3>원칙적으로 항공 여행이 부적합한 경우</h3>
				     <ul>
				       <li>심하고 중한 상태의 심장질환, 예컨대 심한 심부전 환자, 또는 최근 심근경색으로 관상 동맥폐색을 일으켰던 환자, 상기의 경우에는 그 상태가 중하지 않더라도 보통 발병 후 약 6주 이내에는 적합지 않다.</li>
				       <li>생후 14일 미만의 초생아</li>
				       <li>32주(8개월) 이상된 임부</li>
				       <li>중증 중이염 환자</li>
				       <li>최근에 기흉 또는 뇌실조영으로 뇌신경 계통에 공기주입 등 체강 내에 기체가 포함되어있는 환자</li>
				       <li>거대한 종격동 종양, 또는 처치되지 않은 거대한 탈장증, 장폐색증, 뇌압상승을 수반하는 두부질환, 두개골 및 비골골절, 또는 하악골절로 최근 하악을 금속으로 영구식 고정을 한 환자</li>
				       <li>다량의 진정제 사용을 요하는 정신질환 또는 명백히 알코올, 약품 등의 중독 상태에 있는 자</li>
				       <li>창상 치료에 충분한 시간을 못 가진 최근 수술환자 (흉부 및 복부수술 후 10일 미만인 자)</li>
				       <li>발병 후 1개월 미만의 소아마비 환자, 연수성 소아마비 환자의 경우에는 특수한 조치를 하지 않는 한 항상 부적합함</li>
				       <li>급성감염성 질환 또는 전염병 환자</li>
				       <li>감염성을 가진 또는 타 승객에게 혐오감을 일으키게 하는 피부질환환자</li>
				     </ul>
				   </blockquote>
				 </div>
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