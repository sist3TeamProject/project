<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.button {
  background-color: #04AA6D;
  border: none;
  color: white;
  padding: 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  width: 200px;
}
.button20{
  border-radius: 20px;
}
</style>
</head>
<body>
  <div class="container">
    <ul class="breadcrumb">
     <li><a href="../main/main.do">Home</a></li>
     <li><a href="javascript:;">코로나</a></li>
     <li class="active">백신 예약/예약변경</li>
    </ul>
    <div class="row">
      <div style="text-align: center;">
        <a href="../corona/primary.do" class="button button20"><span>백신예약</span></a><br>
        <a href="#" class="button button20">예약변경/취소</a>
      </div>
    </div>
  </div>
</body>
</html>