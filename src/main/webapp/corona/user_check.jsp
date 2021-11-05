<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
    <ul class="breadcrumb">
     <li><a href="../main/main.do">Home</a></li>
     <li><a href="javascript:;">코로나</a></li>
     <li class="active">백신 예약/예약변경</li>
    </ul>
    <div class="row" >
   
      <div style="margin-left: 300px;">
          <h1 style="margin-left: 150px;">개인정보 확인</h1>
          <div class="content-form-page">
            <div class="row">
              <div class="col-md-7 col-sm-7">
                <form class="form-horizontal" role="form" method="get" action="../corona/custom.do?no=${no }">
                  <fieldset>
                    <div class="form-group">
                      <label for="firstname" class="col-lg-4 control-label">이름 <span class="require">*</span></label>
                      <div class="col-lg-8">
                        <input type="text" class="form-control" id="user_name" name="name" maxlength="46" required>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="lastname" class="col-lg-4 control-label">주민번호 <span class="require">*</span></label>
                      <div class="col-lg-4">
                        <input type="text" class="form-control" id="user_birth" name="birth1" maxlength="6" required>
                      </div>
                      <div class="col-lg-4">
                        <input type="text" class="form-control" id="user_birth" name="birth2" maxlength="7" required>
                      </div>
                    </div>
                  </fieldset>
                  
                  <div class="row">
                   <div class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-20">                        
                      <button type="submit" class="btn btn-primary">확인</button>
                      <button type="button" class="btn btn-default" onclick="javascript:history.back();">취소</button>
                   </div>
                 </div>
               </form>
            </div>
                
          </div>
        </div>
     </div>
  </div>
</div>

</body>
</html>