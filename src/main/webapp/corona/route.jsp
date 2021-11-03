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
</head>
<body>
  <div class="container">
    <ul class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="javascript:;">코로나</a></li>
            <li class="active">확진환자 이동경로</li>
        </ul>
    <div class="row">
     <h1>확진환자 이동경로</h1>
     <hr style="border-bottom: 2px solid;">
    </div>
    
    <div class="row" style="border: 1px solid;  padding: 20px; margin-bottom: 100px;" >
      <ul>
       <li>"확진환자의 이동경로 등 정보공개 지침(1판)(10.7) 및 감염병예방법 제34조의 2(9.29) 근거"에 따라 확진자가 마지막 접촉자와 접촉한 날로부터 14일 경과 시, 이동경로에 대한 부분은 공개되지 않음을 알려드립니다.</li>
      </ul>
      <h4 style="text-align: center; background-color: #90d5eb;padding: 10px;">※ 집단발생 관련 반복대량 노출장소 현황 (2021년 10월 29일 17시 기준)</h4>
      <h5>해당 시간대에 아래 시설을 방문하신 분은 증상이 없어도 진단검사를 꼭 받아주세요.</h5>
      <table class="table" border="1">
        <tr>
          <th colspan="2">지역</th>
          <th>유형</th>
          <th>상호명(주소)</th>
          <th>노출일자</th>
          <th>소독여부</th>
        </tr>
        <c:forEach var="vo" items="${list }">
        <tr><!-- area,gu,type,address,day,disinfect -->
          <td class="text-center">${vo.area }</td>
          <td class="text-center">${vo.gu }</td>
          <td class="text-center">${vo.type }</td>
          <td class="text-center">${vo.address }</td>
          <td class="text-center">${vo.day }</td>
          <td class="text-center">${vo.disinfect }</td>
        </tr>
        </c:forEach>
      </table>
      <h5>* 발생 상황 정보를 신속 · 투명히 알리기 위해 위 명단을 공개하며, 추가 역학조사 결과 등에 따라 수정 및 보완될 수 있음</h5>
      <ul>
       <li>추가 정보는 공식 브리핑 및 지자체별 동향 정보로 확인 하시기 바랍니다.</li>
      </ul>
    </div>
  </div>
  
</body>
</html>