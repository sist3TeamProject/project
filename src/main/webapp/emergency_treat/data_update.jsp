<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.hr1 {
  border: 0;
  height: 1px;
  background: #ccc;
}
</style>
</head>
<body>
<div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="javascript:;">응급처치방법</a></li>
            <li class="active">응급의료 자료실</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1>응급의료 자료실(수정하기)</h1>
            <h5>응급의료에 관한 다양한 자료를 다운로드받으실 수 있습니다.</h5>
            <form method="post" action="data_update_ok.do">
             <table class="table">
               <tr>
		         <th width=25% class="text-right" style="background-color: #D3D3D3">이름</th>
		         <td width=75%>
		          <input type=text name=name size=15 class="input-sm" value="${vo.name }">
		          <input type=hidden name=no value="${vo.no }">
		          <input type=hidden name=page value="${page }">
		         </td> 
		       </tr>
		       <tr>
		         <th width=25% class="text-right" style="background-color: #D3D3D3">제목</th>
		         <td width=75%>
		          <input type=text name=subject size=55 class="input-sm" value="${vo.subject }" id=subject>
		         </td> 
		       </tr>
		       <tr>
		         <th width=25% class="text-right" style="background-color: #D3D3D3">내용</th>
		         <td width=75%>
		          <textarea rows="10" cols="55" name="content" id="content">${vo.content }</textarea>
		         </td> 
		       </tr>
		       <tr>
		         <th width=25% class="text-right" style="background-color: #D3D3D3">비밀번호</th>
		         <td width=75%>
		          <input type="password" name=pwd size=10 class="input-sm" id="pwd">
		         </td> 
		       </tr>
		       <tr>
		         <td colspan="2" class="text-center">
		          <input type=submit class="btn btn-sm" value="수정">
		          <input type=button value="취소" class="btn btn-sm btn-danger"
		           onclick="javascript:history.back()">
		         </td>
		       </tr>
		      </table>
            </form>
          </div>
        </div>
      </div>
</div>
</body>
</html>