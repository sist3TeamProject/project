<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
  <div class="container">
    <ul class="breadcrumb">
     <li><a href="../main/main.do">Home</a></li>
     <li><a href="javascript:;">코로나</a></li>
     <li class="active">백신 예약</li>
    </ul>
    <div class="row" >
   
      <div style="margin-left: 300px;">
          <h1>백신예약 / 개인정보 확인</h1>
          <div class="content-form-page">
            <div class="row">
              <div class="col-md-7 col-sm-7">
                <form class="form-horizontal" role="form" method="post" action="../corona/list.do">
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
                    <div class="form-group">
                      <label for="email" class="col-lg-4 control-label">우편번호 <span class="require">*</span></label>
                      <div class="col-lg-8">
                        <input type="text" class="form-control" id="user_post" name="post" required>
                        <input type=button class="btn" value="우편번호검색" onclick="postfind()">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="email" class="col-lg-4 control-label">주소 <span class="require">*</span></label>
                      <div class="col-lg-8">
                        <input type="text" class="form-control" id="user_addr" name="addr" required>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="email" class="col-lg-4 control-label">e메일 <span class="require">*</span></label>
                      <div class="col-lg-8">
                        <input type="text" class="form-control" id="user_email" name="email" required>
                      </div>
                    </div>
                  </fieldset>
                  <fieldset>
                   <legend>문자 통보서비스</legend>
                    <div class="checkbox form-group">
                      <label>
                        <div>
                          <input type="checkbox" name="receive" value="1">
                        </div>
                        <div>문자 통보서비스</div>
                      </label>
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

<script type="text/javascript">
function postfind()
{
	new daum.Postcode({
		oncomplete:function(data){
			$('#user_post').val(data.zonecode);
			$('#user_addr').val(data.address)
		}
	}).open();
}
</script>
</body>
</html>