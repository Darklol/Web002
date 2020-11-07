<%--
  Created by IntelliJ IDEA.
  User: TheHs
  Date: 2020/11/6
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="js/validate.js"></script>
<script src="js/graphics.js"></script>
<script src="js/table.js"></script>

<html>
<head>
    <title>Results</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <script src="js/home_page.js"></script>
    <script src="js/graphics.js"></script>
</head>
<body>
<jsp:include page="partial/header.jsp"/>
<div class="table">
    <div class="table-header">
        <div>X</div>
        <div>Y</div>
        <div>R</div>
        <div>Current time</div>
        <div>Result</div>
    </div>
    <div class="table-content">
        <jsp:useBean id="qss" scope="session" class="models.QueryStorageService"/>
        <c:forEach var="query" items="${qss.freshQueries}">
            <div class="table-row">
                <div>${query.x}</div>
                <div>${query.y}</div>
                <div>${query.r}</div>
                <div>${qss.dateFormat.format(query.queryTime)}</div>
                    ${query.result ? "<div style=\"color: green\">In the area</div>" :
                            "<div style=\"color: red\">Outside the area</div>"}
            </div>
        </c:forEach>
    </div>
</div>

<div id="home-button">
    <a href="index.jsp">To Home Page</a>
</div>
</div>

</body>
</html>
