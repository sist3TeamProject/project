<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.choiceV{
  list-style: none;
  font-size: 20px;
  width: 400px;
  height: 200px;
}
.choice1{
  
  
  
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
      <div style="text-align: center;">
        <h1>${orgnm }</h1>
      </div>
    </div>
    <div class="row" style="text-align: center;">
      <div style="text-align:center; height:600px; width:500px;  border: 1px solid; display: inline-block;">
        <form method="post" action="../corona/choice_ok.do">
        <div style="border: 1px solid; width:400px; display: inline-block; margin-top: 30px; margin-bottom: 30px;">
        <h2 style="margin-top: 30px;">예약 날짜</h2>
        <select style="margin-bottom: 30px; " name="regdate" required>
          <option value="none">====== 날짜를 선택하세요 ======</option>
          <option>2021/11/03</option>
          <option>2021/11/04</option>
          <option>2021/11/05</option>
          <option>2021/11/06</option>
          <option>2021/11/07</option>
          <option>2021/11/08</option>
          <option>2021/11/09</option>
          <option>2021/11/10</option>
        </select>
        
        
        <h2>시간</h2>
        <select style="margin-bottom: 30px; " name="time" required> 
          <option>====== 시간을 선택하세요 ======</option>
          <option>10:00</option>
          <option>11:00</option>
          <option>12:00</option>
          <option>14:00</option>
          <option>15:00</option>
          <option>16:00</option>
          <option>17:00</option>
        </select>
        
        <ul class="choiceV">
	    <li>화이자&nbsp;
	      <input type="radio" name="vaccine" value="phzer" >
	    </li>
	    <li>모더나&nbsp;
	      <input type="radio" name="vaccine" value="moderna">
	    </li>
	    <li>아스트라제네카&nbsp;
	      <input type="radio" name="vaccine" value="astrazeneca">
	    </li>
	  </ul>
	  </div>
	   <input type="hidden" value="${orgnm }" name="orgnm">
	   <input type="hidden" value="${orgcd }" name="orgcd">
       <input type="hidden" value="${name }" name="name"> 
       <input type="hidden" value="${birth }" name="birth"> 
       <input type="hidden" value="${addr }" name="addr"> 
       <input type="hidden" value="${email }" name="email"> 
       <input type="hidden" value="${receive }" name="receive">
       <input type="hidden" value="${addr2 }" name="addr2">
       <input type="hidden" value="${post }" name="post">   
	  <div>
	    <button class="btn btn-danger" type="submit">확인</button>
	  </div>
	  </form>
      </div>
    </div>
  </div>
</body>
</html>