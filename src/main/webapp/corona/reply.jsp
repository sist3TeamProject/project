<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let u=0;// 전역변수
$(function(){
	$('.updates').click(function(){
		$('.up').hide();// 출력된 수정창을 닫는다
		$('.reply').hide();
		let no=$(this).attr("data-value"); // 출력할 위치를 확인 (어떤것이 수정할 지 확인 )
		if(u==0) // 열고
		{
			u=1; // 닫기
			$('#u'+no).show();
			$(this).text("취소");
		}
		else // 닫기
		{
			u=0; // 열기 
			$('#u'+no).hide();
			$(this).text("수정");
		}
	})
})
</script>
<style type="text/css">
.underbar:hover{
  text-decoration: underline;
}
ul{
 list-style:none;
}
</style>
</head>
<body>
<div class="main">
  <div class="container">
   <ul class="breadcrumb">
      <li><a href="index.html">Home</a></li>
      <li><a href="javascript:;">코로나</a></li>
      <li class="active">백신 리뷰</li>
   </ul>
   <div class="row">
    
        <h2>백신후기</h2>
        <table class="table">
		       <tr>
		        <td class="inline">
		          <form method="post" action="../corona/insert.do">
		         
		             <label><input type="radio" value="1" name="vaccine" checked="checked">화이자</label>
		             <label><input type="radio" value="2" name="vaccine">모더나</label>
		             <label><input type="radio" value="3" name="vaccine">아스트라제네카</label>
		           
		           <br>
		           <textarea rows="5" cols="50" name="msg" style="width:80%; float: left"></textarea>
		           <input type=submit value="댓글쓰기" style="width:20%; height: 105px;float: left" class="btn btn-danger">
		           <input type="hidden" name="page" value="${ curpage}">
		          </form>
		        </td>
		       </tr>
		</table>
   </div>
   <div class="row" style="margin-bottom: 100px;">
        
        <ul>
        <c:forEach var="vo" items="${list }">
          <li>
            <article>
              <div class="col-md-12 testimonials-v1">
                <div id="myCarousel" class="carousel slide">
	              <div class="carousel-inner">
	                <div class="active item">
		              <blockquote>
		              <header>
		                <address>
		                 <a href="#">${vo.id }</a>&nbsp;&nbsp;&nbsp;&nbsp;<time datetime="2045-04-06T08:15+00:00">${vo.dbday }</time>
		                </address>
		                
		                <table class="table up" style="display:none" id="u${vo.no }">
					       <tr>
					        <td class="inline">
					         <form method="post" action="../corona/reply_update.do">
					         <input type=hidden name="no" value="${vo.no }">
					         <textarea rows="5" cols="50" name="msg" style="float: left">${vo.msg }</textarea>
					           <input type=submit value="댓글수정" style="height: 105px;float: left" class="btn btn-danger">
					        </form>
					        </td>
					       </tr>
					   </table>
		              </header>
              
	                  <c:if test="${vo.vaccine eq 1 }">
	                    <p style="font-weight: bold; color: #8d192b; border: 1px solid; width: 46px;">화이자</p>
	                  </c:if>
	                  <c:if test="${vo.vaccine eq 2 }">
	                    <p  style="font-weight: bold; color: #8d192b; border: 1px solid; width: 46px;">모더나</p>
	                  </c:if>
	                  <c:if test="${vo.vaccine eq 3 }">
	                    <p  style="font-weight: bold; color: #8d192b; border: 1px solid; width: 105px;">아스트라제네카</p>
	                  </c:if>
	                  
	                  <p>${vo.msg }</p>
	                  <div style="float: right; position: relative; bottom: 30px;"> 
	                    <c:if test="${id eq vo.id}">
			              <span class="btn btn-xs updates underbar" style="color:black;" data-value="${vo.no }">수정</span>
			              <a href="../corona/reply_delete.do?no=${vo.no }&page=${curpage}" class="btn btn-xs underbar" style="color:black;">삭제</a>
			            </c:if>
			          </div>
	                  </blockquote>
	                </div>
	              </div>
                </div>
              </div>
            </article>
            
            <article>
              <c:if test="${vo.group_tab > 0}">
              <div class="col-md-10 testimonials-v1">
                <div id="myCarousel" class="carousel slide">
	              <div class="carousel-inner">
	                <div class="active item">
		              <blockquote>
		              <header>
		                <address>
		                 <a href="#">${vo.id }</a>&nbsp;&nbsp;&nbsp;&nbsp;<time datetime="2045-04-06T08:15+00:00">${vo.dbday }</time>
		                </address>
		                
		                <table class="table up" style="display:none" id="u${vo.no }">
					       <tr>
					        <td class="inline">
					         <form method="post" action="../corona/reply_update.do">
					         <input type=hidden name="no" value="${vo.no }">
					         <textarea rows="5" cols="50" name="msg" style="float: left">${vo.msg }</textarea>
					           <input type=submit value="댓글수정" style="height: 105px;float: left" class="btn btn-danger">
					        </form>
					        </td>
					       </tr>
					   </table>
		              </header>
              
	                  <c:if test="${vo.vaccine eq 1 }">
	                    <p style="font-weight: bold; color: #8d192b; border: 1px solid; width: 46px;">화이자</p>
	                  </c:if>
	                  <c:if test="${vo.vaccine eq 2 }">
	                    <p  style="font-weight: bold; color: #8d192b; border: 1px solid; width: 46px;">모더나</p>
	                  </c:if>
	                  <c:if test="${vo.vaccine eq 3 }">
	                    <p  style="font-weight: bold; color: #8d192b; border: 1px solid; width: 105px;">아스트라제네카</p>
	                  </c:if>
	                  
	                  <p>${vo.msg }</p>
	                  <c:if test="${id eq vo.id}">
		                <div style="float: right; position: relative; bottom: 30px;">
			              <span class="btn btn-xs updates underbar" style="color:black;" data-value="${vo.no }">수정</span>
			              <a href="../corona/reply_delete.do?no=${vo.no }&page=${curpage}" class="btn btn-xs underbar" style="color:black;">삭제</a>
			            </div>
			          </c:if>
	                  </blockquote>
	                </div>
	              </div>
                </div>
              </div>
              </c:if>
            </article>
          </li>
         </c:forEach> 
        </ul>
     </div>
     <div class="row" style="position: relative; bottom:50px;">
            <div class="col-md-4 col-sm-4 items-info"></div>
            <div class="col-md-8 col-sm-8">
              <ul class="pagination pull-right">
                <c:if test="${startPage>1 }">
		          <li><a href="../corona/reply.do?page=${startPage-1 }">« </a></li>
		        </c:if>
                   
                <c:forEach var="i" begin="${startPage }" end="${endPage }" >
                 <li><a href="../corona/reply.do?page=${i }">${i }</a></li>
                </c:forEach>
                <c:if test="${endPage<totalpage }">
		          <li><a href="../corona/reply.do?page=${endPage+1 }"> »</a></li>
		        </c:if>
                    
              </ul>
            </div>
     </div>
  </div>
</div>
<script>
new Vue({
	
})
</script>
</body>
</html>