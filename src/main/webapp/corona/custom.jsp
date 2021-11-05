<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
     <li class="active">백신 예약/예약변경</li>
    </ul>
    <div class="row">
      <h2>예약 현황</h2>
      <table class="table">
        <tr>
          <th width="25%">병원</th>
          <th width="30%">주소</th>
          <th width="10%">날짜</th>
          <th width="10%">시간</th>
          <th width="10%">백신종류</th>
          <th width="15%"></th>
        </tr>
        <tr>
          <td width="25%">${vo.orgnm }</td>
          <td width="30%">${vo.caddress }</td>
          <td width="10%">${vo.regdate }</td>
          <td width="10%">${vo.time }</td>
          <td width="10%">${vo.vaccine }</td>
          <td width="15%">
            <a href="../corona/custom_update.do?no=${vo.no }" class="btn btn-sm btn-info" style="float: left;">예약변경</a>
            <a href="../corona/custom_delete.do?no=${vo.no }" class="btn btn-sm btn-danger">취소</a>
          </td>
        </tr>
      </table>
    </div>
  </div>

</body>
</html>