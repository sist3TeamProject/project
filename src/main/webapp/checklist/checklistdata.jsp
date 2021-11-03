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
        <div class="col-md-10 col-md-offset-1" style="margin-top: 50px">
            <h3 class="text-center">자가진단 체크리스트</h3>
            <table class="table table-hover table-bordered" style="margin-top: 70px;">
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
                        ${checklist.title}
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
            <ul class="pagination">
                <li class="">
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li><a href="#">1</a></li>
                <li class="active"><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
