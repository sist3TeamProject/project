<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="javascript:;">코로나</a></li>
            <li class="active">병원 목록</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12">
            
            <h1>병원 목록</h1>
            <div class="content-page">
              <div class="row">
                <ul class="blog-info" style="float: right;">
                  <li>
                   <select class="form-control" id="career-position">
                    <option>모든 백신</option>
                    <option>화이자</option>
                    <option>모더나</option>
                    <option>아스트라제네카</option>
                   </select></li>
                  <li><input type="text" class="form-control" placeholder="지역을 입력하세요" style="width: 300px;"></li>
                  <li ><button type="submit" class="btn btn-primary" >검색</button></li>
                </ul>
             </div>
             <div class="row">
               <table class="table" border="1">
                 <tr>
                   <th class="text-center" width=40%>병원명</th>
                   <th class="text-center" width=50%>주소</th>
                   <th class="text-center" width=10%>잔여백신</th>
                 </tr>
                 <tr>
                   <td class="text-center" rowspan="2" width=40%><a href="#">세브란스</a></td>
                   <td class="text-center" rowspan="2" width=50%><a href="#">서울</a></td>
                   <td class="text-center" width=10%><a href="#">3</a></td> 
                 </tr>
               </table>
             </div>

              <div class="row">
                <div class="col-md-4 col-sm-4 items-info">Items 1 to 9 of 10 total</div>
                <div class="col-md-8 col-sm-8">
                  <ul class="pagination pull-right">
                    <li><a href="javascript:;">«</a></li>
                    <li><a href="javascript:;">1</a></li>
                    <li><span>2</span></li>
                    <li><a href="javascript:;">3</a></li>
                    <li><a href="javascript:;">4</a></li>
                    <li><a href="javascript:;">5</a></li>
                    <li><a href="javascript:;">»</a></li>
                  </ul>
                </div>
              </div>

            </div>
          </div>
          <!-- END CONTENT -->
        </div>
      </div>
    </div>
</body>
</html>