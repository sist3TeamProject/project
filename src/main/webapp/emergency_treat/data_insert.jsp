<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let fileIndex=0;
$(function(){
	$('#add').click(function(){
		$('#fileView').append(
		    '<tr id=m'+(fileIndex)+'>'
		  + '<td width=25% class="text-right">파일 '+(fileIndex+1)+'</td>'
		  + '<td width=75%><input type=file name=files['+fileIndex+'] size=20></td>'
		  + '</tr>'
		)
		fileIndex++;
	});
	$('#remove').click(function(){
		if(fileIndex>0)
		{
		   	$('#m'+(fileIndex-1)).remove();
		   	fileIndex--;
		}
	})
});

</script>
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
         <h1>응급의료 자료실(글쓰기)</h1>
         <h5>응급의료에 관한 다양한 자료를 다운로드받으실 수 있습니다.</h5>
	     <form method="post" action="data_insert_ok.do" enctype="multipart/form-data">
	      <table class="table">
	        <tr>
	          <th width=25% class="text-right">이름</th>
	          <td width=75%>
	            <input type=text name=name size=15 class="input-sm">
	          </td>
	        </tr>
	        <tr>
	          <th width=25% class="text-right">제목</th>
	          <td width=75%>
	            <input type=text name=subject size=55 class="input-sm">
	          </td>
	        </tr>
	        <tr>
	          <th width=25% class="text-right">내용</th>
	          <td width=75%>
	            <textarea rows="10" cols="55" name="content"></textarea>
	          </td>
	        </tr>
	        <tr>
	          <th width=25% class="text-right">첨부파일</th>
	          <td width=75%>
	            <table class="table">
	              <tr>
	                <td class="text-right">
	                  <input type=button value="추가" class="btn btn-xs btn-danger" id="add">
	                  <input type=button value="삭제" class="btn btn-xs btn-info" id="remove">
	                </td>
	              </tr>
	            </table>
	            <table class="table" id="fileView">
	            
	            </table>
	          </td>
	        </tr>
	        <tr>
	          <th width=25% class="text-right">비밀번호</th>
	          <td width=75%>
	            <input type=password name=pwd size=10 class="input-sm">
	          </td>
	        </tr>
	        <tr>
	          <td colspan="2" class="text-center">
	            <button class="btn btn-sm btn-success">글쓰기</button>
	            <input type=button value="취소" class="btn btn-sm btn-danger"
	            onclick="javascript:history.back();">
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