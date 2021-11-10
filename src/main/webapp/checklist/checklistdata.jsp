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

        .input-error {
            border-color: tomato !important;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <h3 class="text-center" style="margin-top: 30px;">자가진단 체크리스트</h3>
            <div class="col-md-2 col-md-offset-11" style="padding: 0px;">
                <div class="dropup">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        정렬
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                        <li><a href="../checklist/checklist.do?page=${curPage}&sort=title${searchUrl}">제목</a></li>
                        <li><a href="../checklist/checklist.do?page=${curPage}&sort=department${searchUrl}">진료과</a></li>
                        <li><a href="../checklist/checklist.do?page=${curPage}&sort=hit${searchUrl}">조회순</a></li>
                    </ul>
                </div>
            </div>
            <table class="table table-hover table-bordered" style="margin-top: 50px;">
                <thead>
                <tr>
                    <th class="text-center" style="width: 60%;">제목</th>
                    <th class="text-center" style="width: 30%;">진료과</th>
                    <th class="text-center" style="width: 10%;">조회수</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${checklistData}" var="checklist">
                    <tr>
                        <td class="text-center">
                            <a style="color: #000000"
                               href="${pageContext.request.contextPath}/${checklist.checklistId}/checklist.do">${checklist.title}</a>
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
                        <a href="${pageContext.request.contextPath}/checklist/checklist.do?page=${startPage - 1}&sort=${sort}${searchUrl}"
                           aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
                    <li class="${curPage == pageNum ? 'active' : ''}"><a
                            href="${pageContext.request.contextPath}/checklist/checklist.do?page=${pageNum}&sort=${sort}${searchUrl}">${pageNum}</a>
                    </li>
                </c:forEach>
                <c:if test="${((next && (endPage > 0)) == true)}">
                    <li>
                        <a href="${pageContext.request.contextPath}/checklist/checklist.do?page=${endPage + 1}&sort=${sort}${searchUrl}"
                           aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
            <div class="row">
                <div class="col-md-2">
                    <select class="form-control" id="type">
                        <option value="title" ${checklistSearch.type == 'title' ? 'selected' : ''}>제목</option>
                        <option value="department" ${checklistSearch.type == 'department' ? 'selected' : ''}>진료과
                        </option>
                    </select>
                </div>
                <div class="col-md-4">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="검색어" id="keyword"
                               value="${checklistSearch.keyword}">
                        <span class="input-group-btn">
                        <button onclick="searchBtnHandler()" class="btn btn-default" type="button">검색하기</button>
                      </span>
                    </div>
                </div>
                <div class="col-md-1">
                    <a href="../checklist/checklist.do" class="btn btn-info">초기화</a>
                </div>
            </div>
        </div>
    </div>
    <script>
        function searchBtnHandler() {
            const input = document.querySelector('#keyword');

            if (inputCheck(input)) {
                const type = document.querySelector('#type').value;
                const keyword = input.value;

                const href = `../checklist/checklist.do?page=1&sort=${sort}&keyword=\${keyword}&type=\${type}`;

                location.href = href;
            }
        }

        function inputCheck(input) {
            if (input.value.trim() === '') {

                input.classList.add('input-error');
                input.placeholder = "공백으로 검색이 불가합니다";
                input.focus();
                return false;
            }
            return true;
        }
    </script>
</div>
</body>
</html>
