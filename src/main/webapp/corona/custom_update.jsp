<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.a-change{
  background-color:transparent;
  border:none;
  cursor: pointer;
  font-weight: bold;
}
.a-change:hover {
  background-color:transparent;
  text-decoration:underline;
  border:none;
  cursor: pointer;
  font-weight: bold;
  color:red;
}
</style>
</head>
<body>
  <div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="javascript:;">코로나</a></li>
            <li class="active">병원 목록</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12">
            
            <h1>병원 목록</h1>
            <div class="content-page">
              <div class="row">
                <form method="get" action="../corona/custom_update.do?no=${no }&addr2=${addr2 }&vaccine=${vaccine}">
                <ul class="blog-info" style="float: right;">
                  <li>
                   <select class="form-control" id="career-position" name="vaccine">
                    <option value="all">모든 백신</option>
                    <option value="phzar">화이자</option>
                    <option value="moderna">모더나</option>
                    <option value="astrazeneca">아스트라제네카</option>
                   </select></li>
                  <li><input type="text" class="form-control" placeholder="지역을 입력하세요" style="width: 300px;" name="addr2"></li>
                  <li ><button type="submit" class="btn btn-primary" >검색</button></li>
                  <input type="hidden" value="${no }" name=no>
                </ul>
                </form>
             </div>
             
             <div class="row">
               <table class="table" border="1">
                 <tr>
                   <th class="text-center" width=35%>병원명</th>
                   <th class="text-center" width=50%>주소</th>
                   <th class="text-center" width=15%>잔여백신</th>
                 </tr>
                 <c:forEach var="vo" items="${list }">
                 <tr>
                   <td class="text-center" width=35%>
                    <form method="post" action="../corona/update_choice.do?orgcd=${vo.orgcd}">
                     <input type="submit" value="${vo.orgnm }" name="orgnm" class="a-change">
                     <input type="hidden" value="${vo.orgzipaddr }" name="addr2">
                     <input type="hidden" value="${no }" name=no>
                    </form>
                   </td>
                   <td class="text-center" width=50%>${vo.orgzipaddr }</td>
                   <c:if test="${vaccine eq 'all' }">
                   <td class="text-center" width=15%>${vo.phzer+vo.moderna+vo.astrazeneca }</td> 
                   </c:if>
                   <c:if test="${vaccine eq 'phzar' }">
                   <td class="text-center" width=15%>화이자:${vo.phzer }</td> 
                   </c:if>
                   <c:if test="${vaccine eq 'moderna' }">
                   <td class="text-center" width=15%>모더나:${vo.moderna }</td> 
                   </c:if>
                   <c:if test="${vaccine eq 'astrazeneca' }">
                   <td class="text-center" width=15%>아스트라제네카:${vo.astrazeneca }</td> 
                   </c:if>
                 </tr>
                 </c:forEach>
               </table>
             </div>

              <div class="row">
                <div class="col-md-4 col-sm-4 items-info"></div>
                <div class="col-md-8 col-sm-8">
                  <ul class="pagination pull-right">
                    <c:if test="${startPage>1 }">
		              <li><a href="../corona/custom_update.do?no=${no }&addr2=${addr2 }&vaccine=${vaccine}&page=${startPage-1 }">« </a></li>
		            </c:if>
                   
                    <c:forEach var="i" begin="${startPage }" end="${endPage }" >
                     <li><a href="../corona/custom_update.do?no=${no }&addr2=${addr2 }&vaccine=${vaccine}&page=${i }">${i }</a></li>
                    </c:forEach>
                    <c:if test="${endPage<totalpage }">
		              <li><a href="../corona/custom_update.do?no=${no }&addr2=${addr2 }&vaccine=${vaccine}&page=${endPage+1 }"> »</a></li>
		            </c:if>
                    
                  </ul>
                </div>
              </div>

            </div>
          </div>
          <!-- END CONTENT -->
        </div>
      </div>
    </div>
</body>
</html>