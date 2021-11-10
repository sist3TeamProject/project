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
            <h1>응급의료 자료실(삭제하기)</h1>
            <h5>응급의료에 관한 다양한 자료를 다운로드받으실 수 있습니다.</h5>
            <form method="post" action="../emergency_treat/data_delete_ok.do">
		       <table class="table">
		         <tr>
		           <td class="inline">
		                      비밀번호:<input type=password name=pwd size=20 class="input-sm" id="pwd">
		                  <input type=hidden name=no value="${no }" id="no">
		                  <input type=hidden name=page value="${page }" id="page">
		           </td>
		         </tr>
		         <tr>
		           <td class="text-center">
		             <button class="btn btn-sm btn-danger">삭제</button>
		             <input type=button value="취소" class="btn btn-sm"
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