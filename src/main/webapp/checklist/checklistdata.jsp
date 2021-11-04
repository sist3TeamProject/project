<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: wjddh
  Date: 2021-11-01
  Time: 오후 4:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <style>
        tr {
            font-size: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <h3 class="text-center" style="margin-top: 30px;">자가진단 체크리스트</h3>
            <table class="table table-hover table-bordered" style="margin-top: 30px;">
                <thead>
                <tr>
                    <th class="text-center">제목</th>
                    <th class="text-center">진료과</th>
                    <th class="text-center">조회수</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${checklistData}" var="checklist">
                <tr>
                    <td class="text-center">
                        <a style="color: #000000" href="${pageContext.request.contextPath}/${checklist.checklistId}/checklist.do">${checklist.title}</a>
                    </td>
                    <td class="text-center">
                        ${checklist.department}
                    </td>
                    <td class="text-center">
                        ${checklist.hit}
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
            <ul class="pagination pull-right">
                <c:if test="${prev == true}">
                <li class="">
                    <a href="${pageContext.request.contextPath}/checklist/checklist.do?page=${startPage - 1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                </c:if>
                    <c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
                        <li class="${curPage == pageNum ? 'active' : ''}"><a href="${pageContext.request.contextPath}/checklist/checklist.do?page=${pageNum}">${pageNum}</a></li>
                    </c:forEach>
                <c:if test="${((next && (endPage > 0)) == true)}">
                <li>
                    <a href="${pageContext.request.contextPath}/checklist/checklist.do?page=${endPage + 1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                </c:if>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
