<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" errorPage="/error"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Loading</title>	
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	</head>
	<body>
		<c:if test="${not empty redirectUri}">
			<form action="<c:url value="${redirectUri}" />" method="${method}" style="display:none">
				<c:forEach var="key" items="${params}">
					<input type="hidden" name="${key.key}" value="${key.value}" />
				</c:forEach>
			</form>
		</c:if>
		<c:if test="${empty redirectUri}">
			<form action="<c:url value="/" />" method="get" style="display:none">
			</form>
		</c:if>
		<script>
			$(function(){
				let message = "${message}";
				if (message != null) {
					alert(message);
				}
				$("form").submit();
			});
		</script>
	</body>
</html>