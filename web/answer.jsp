<%--
  Created by IntelliJ IDEA.
  User: TheHs
  Date: 2020/11/6
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Results</title>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<jsp:include page="partial/header.jsp"/>
<form id="data-form">

    <jsp:include page="partial/graphics.jsp"/>
    <div id="home-button">
        <a class="button" href="index.jsp">Home page</a>
    </div>
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
            ${qss.updateStatuses()}
            <c:forEach var="query" items="${qss.queries}">
                <div class="table-row">
                    <div>${query.x}</div>
                    <div>${query.y}</div>
                    <div>${query.r}</div>
                    <div>${qss.dateFormat.format(query.queryTime)}</div>
                        ${query.result ? "<div style=\"color: lawngreen\">In the area</div>" :
                                "<div style=\"color: red\">Outside the area</div>"}
                </div>
            </c:forEach>
        </div>
    </div>


</form>
<form id="secret-form" hidden action="controller">
    <input type="text" name="x" id="x">
    <input type="text" name="y" id="y">
    <input type="text" name="r" id="r">

</form>
<script src="js/jquery.js"></script>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
<script src="js/validate.js"></script>
<script src="js/home_page.js"></script>
<script src="js/graphics.js"></script>
<script src="js/table.js"></script>
</body>
</html>
