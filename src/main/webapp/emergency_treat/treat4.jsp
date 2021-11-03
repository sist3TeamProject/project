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
            <li class="active">상황별응급처치</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1>상황별응급처치</h1>
            <h4>상황마다 다른 응급처치법에 대한 정보를 확인하실 수 있습니다.</h4>
            <div id="exTab2" class="container">	
		      <ul class="nav nav-tabs">
			    <li class="active"><a  href="#1" data-toggle="tab">뱀에게 물렸을때</a></li>
				<li><a href="#2" data-toggle="tab">성인&소아 기도폐쇄</a></li>
			 </ul>
			   <div class="tab-content ">
			     <div class="tab-pane active" id="1">
		           <h1>뱀에게 물렸을 때 응급처치</h1>
            	   <div class="blog-item-img">
                   	<c:forEach var="vo" items="${list2 }">
                      <div class="item">
                        <img src="${vo.poster }">
                        <blockquote>
		                  <h3>${vo.title }</h3><br>
		                  <ul>
		                   <c:forTokens items="${vo.sub1 }" delims="^" var="sub1">
		                     <li>${sub1 }</li>
		                   </c:forTokens>
						  </ul>
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
				 <div class="tab-pane" id="2">
		           <h1>성인&소아 기도폐쇄</h1>
            	   <div class="blog-item-img">
                   	<c:forEach var="vo" items="${list3 }">
                      <div class="item">
                        <img src="${vo.poster }">
                        <blockquote>
		                  <h3>${vo.title }</h3><br>
		                  <ul>
		                   <c:forTokens items="${vo.sub1 }" delims="^" var="sub1">
		                     <li>${sub1 }</li>
		                   </c:forTokens>
						  </ul>
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