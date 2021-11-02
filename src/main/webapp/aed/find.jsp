<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.btn{
	padding: 10px 250px;
}
</style>
</head>
<body>
<div class="main">
      <div class="container">
        <div class="row margin-bottom-40">
          <div class="col-md-12 col-sm-12">
            <h1>자동심장 충격기(AED) 찾기</h1>
            <h4>자동 심장충격기(AED) 정보 검색 서비스입니다.</h4>
            <div class="content-page">
            	<table class="table">
            		<tr>
            			<td class="text-center inline" width="100%">
            				<input type="button" class="btn" name=map id=map value="지도">
            				<input type="button" class="btn" name=general id=general value="일반">
            			</td>
            		</tr>
            	</table>
            	
            	<table class="table" style="border:1px solid;border-color:grey">
            		<tr>
            			<td rowspan=2>
            				<img src="#">
            			</td>
            			<td><strong style="color:blue">서울특별시 중구 을지로 245</strong></td>
            		</tr>
            		<tr>
            			<td>
	            			<p>현재 자신의 위치정보가 일치하지 않을경우
	위치설정에서 자신의 위치를 설정(주소 또는 명칭 검색)하시면 정확한 주변 정보를 제공해드립니다.
	주소 또는 반경 변경시 결과내 검색의 결과는 반영되지 않습니다.</p>
						</td>
            		</tr>
            	</table>
            </div>
          </div>
        </div>
      </div>
</div>            
</body>
</html>