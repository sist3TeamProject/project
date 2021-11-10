<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="container">
    <div class="row">
      <table class="table">
        <tr>
          <th width="30%">병원</th>
          <th width="30%">주소</th>
          <th width="10%">날짜</th>
          <th width="10%">시간</th>
          <th width="10%">백신종류</th>
        </tr>
        <tr>
          <td width="30%">${vo.orgnm }</td>
          <td width="30%">${vo.caddress }</td>
          <td width="10%">${vo.regdate }</td>
          <td width="10%">${vo.time }</td>
          <td width="10%">${vo.vaccine }</td>
        </tr>
      </table>
    </div>
  </div>
</body>
</html>