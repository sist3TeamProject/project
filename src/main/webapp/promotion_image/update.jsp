<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<
<style type="text/css">
.container1{
   margin-top: 30px;
   height:1300px;
}
.row{
  margin: 0px auto;
  width:700px;
}
h1{
  text-align: center;
}
</style>
</head>
<body>
   <div class="container1">
     <h1>수정하기</h1>
     <div class="row">
      <form method="post" action="update_ok.do">
      <table class="table">
       <tr>
         <th width=25% class="text-center info">이름</th>
         <td width=75%>
          <input type=text name=name size=15 class="input-sm" value="${vo.name }">
          <input type=hidden name=no value="${vo.no }">
          <input type=hidden name=page value="${page }">
         </td> 
       </tr>
       <tr>
         <th width=25% class="text-center info">제목</th>
         <td width=75%>
          <input type=text name=subject size=55 class="input-sm" value="${vo.subject }">
         </td> 
       </tr>
       <tr>
         <th width=25% class="text-center info">내용</th>
         <td width=75%>
          <textarea rows="10" cols="55" name="content">${vo.content }</textarea>
         </td> 
       </tr>
       <tr>
         <th width=25% class="text-center info">비밀번호</th>
         <td width=75%>
          <input type="password" name=pwd size=10 class="input-sm">
         </td> 
       </tr>
       <tr>
         <td colspan="2" class="text-center">
          <button class="btn btn-sm btn-success">수정</button>
          <input type=button value="취소" class="btn btn-sm btn-danger"
           onclick="javascript:history.back()">
         </td>
       </tr>
      </table>
      </form>
     </div>
   </div>
</body>
</html>


