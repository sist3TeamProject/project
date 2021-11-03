<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.th-backcol{
  background-color: #dce4f0;
  
}
th{
  
}
.td-title > td{
  font-weight: bold;
}

.td-title{
  color: #3b5f7b;
}
.td-color{
  color: red;
}
</style>
</head>
<body>
  <div class="container">
    <ul class="breadcrumb">
        <li><a href="index.html">Home</a></li>
        <li><a href="javascript:;">코로나</a></li>
        <li class="active">국내 발생 현황</li>
    </ul>
    <h1 class="text-center">국내발생현황</h1>
    <hr>
    <div class="row" style="margin-bottom: 50px;">
    <h3>누적 확진자 현황</h3>
      <table class="table" border="1">
        <tr>
          <th class="text-center th-backcol" colspan="4" style="border-top: 3px groove #97b0d1; font-weight: bold;">확진환자</th>
          <th class="text-center th-backcol" colspan="2" style="border-top: 3px groove #97b0d1; font-weight: bold;">격리해제</th>
          <th class="text-center th-backcol" colspan="2" style="border-top: 3px groove #97b0d1; font-weight: bold;">격리중</th>
          <th class="text-center th-backcol" colspan="2" style="border-top: 3px groove #97b0d1; font-weight: bold;">사망</th>
        </tr>
        <tr class="td-title">
          <td class="text-center" style="">누적</td>
          <td class="text-center" colspan="3">전일대비</td>
          <td class="text-center" >누적</td>
          <td class="text-center" >전일대비</td>
          <td class="text-center" >누적</td>
          <td class="text-center" >전일대비</td>
          <td class="text-center" >누적</td>
          <td class="text-center" >전일대비</td>
        </tr>
        <tr>
          <td class="text-center " rowspan="2" style="vertical-align: middle;">${vo.totalCount }</td>
          <td class="text-center" >소계</td>
          <td class="text-center" style="color: #3077ab; font-weight: bold;">국내발생</td>
          <td class="text-center" style="color: #3077ab; font-weight: bold;">해외유입</td>
          <td class="text-center" rowspan="2"  style="vertical-align: middle;">${vo.release }</td>
          <td class="text-center" rowspan="2"  style="vertical-align: middle; color: #DC143C; font-weight: bold;" >${vo.todayRelease }</td>
          <td class="text-center" rowspan="2"  style="vertical-align: middle;">${vo.quarantine }</td>
          <td class="text-center" rowspan="2"  style="vertical-align: middle; color: #DC143C; font-weight: bold;">${vo.todayQuarantine }</td>
          <td class="text-center" rowspan="2"  style="vertical-align: middle;">${vo.dying }</td>
          <td class="text-center" rowspan="2"  style="vertical-align: middle; color: #DC143C; font-weight: bold;">${vo.todayDying }</td>
        </tr>
        <tr>
          <td class="text-center" style="color: #DC143C; font-weight: bold;">${vo.totalOccur }</td>
          <td class="text-center" style="color: #DC143C; font-weight: bold;">${vo.domestic }</td>
          <td class="text-center" style="color: #DC143C; font-weight: bold;">${vo.overseas }</td>
        </tr>
      </table>
    </div>
    <div class="row" style="margin-bottom: 150px;">
      <h3>확진자 연령별 현황</h3>
      <table class="table" border="1">
        <tr>
          <th class="text-center" style="border-top: 3px groove #97b0d1; font-weight: bold;">구분</th>
          <th class="text-center" style="border-top: 3px groove #97b0d1; font-weight: bold;">확진자</th>
          <th class="text-center" style="border-top: 3px groove #97b0d1; font-weight: bold;">사망자</th>
          <th class="text-center" style="border-top: 3px groove #97b0d1; font-weight: bold;">치명률</th>
        </tr>
        <c:forEach var="avo" items="${ aList}" >
        <tr>
          <td class="text-center">${avo.age }</td>
          <td class="text-center">${avo.infected }</td>
          <td class="text-center">${avo.dying }</td>
          <td class="text-center">${avo.lethality }</td>
        </tr>
        </c:forEach>
      </table>
    </div>
  </div>
</body>
</html>