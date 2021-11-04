<%--
  Created by IntelliJ IDEA.
  User: wjddh
  Date: 2021-11-04
  Time: 오전 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container clearfix">
    <div class="row">
        <div class="col-md-10 col-md-offset-1" style="margin-top: 30px; margin-bottom: 70px">
            <div class="page-header">
                <h1 class="text-right">${checklist.title}<small style="margin-left: 20px;">${checklist.department}</small></h1>
            </div>
            <div class="jumbotron" style="border-radius: 15px !important;">
                ${checklist.content}
            </div>
        </div>
    </div>
</div>
</body>
</html>
