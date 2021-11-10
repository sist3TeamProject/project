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
            <h1>응급의료 자료실</h1>
            <h5>응급의료에 관한 다양한 자료를 다운로드받으실 수 있습니다.</h5>
            <div class="content-page">
              <hr class="hr1">
              <table class="table" style="background-color: #D3D3D3">
                <tr>
                  <td><h5>${vo.title }</h5></td>
                </tr>
		      </table>
			  <table class="table">
                <tr>
                  <td>${vo.regdate }  |  ${vo.hit } | ${vo.name }</td>
                </tr>
                <c:if test="${vo.filecount>0 }">
		        <tr>
		          <th width=20% class="text-center">첨부파일</th>
		          <td colspan="3" class="text-left">
		            <ul>
		              <c:forEach var="fn" items="${fList }" varStatus="s">
		                <li><a href="data_download.do?fn=${fn }">${fn }&nbsp;(${sList[s.index]}Bytes)</li>
		              </c:forEach>
		            </ul>
		          </td>  
		        </tr>
		        </c:if>
              </table>
              <table class="table">
                <tr>
                  <td><p>${vo.content }</p></td>
                </tr>
              </table>
            </div>
            <hr class="hr1">
            <div class="row text-right">
              <button class="btn btn-sm btn-danger"><a href="data_delete.do?no=${vo.no }&page=${page}">삭제</a></button>
              <button class="btn btn-sm btn-info"><a href="data_update.do?no=${vo.no }&page=${page}">수정</a></button>
              <button class="btn btn-sm"><a href="treat_data.do?page=${page }">목록</a></button>
            </div>
          </div>
        </div>
      </div>
</div>
</body>
</html>