<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 31.10.2020
  Time: 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WebLab2</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="partial/header.jsp"/>
<form id="data-form" method="get" name="dataForm">
<%--    X part--%>
    <div>
        <div>
            <label>X value:</label>
        </div>
        <button type="button" name="x-value">-4</button>
        <button type="button" name="x-value">-3</button>
        <button type="button" name="x-value">-2</button>
        <button type="button" name="x-value">-1</button>
        <button type="button" name="x-value">0</button>
        <button type="button" name="x-value">1</button>
        <button type="button" name="x-value">2</button>
        <button type="button" name="x-value">3</button>
        <button type="button" name="x-value">4</button>
    </div>
<%--    Y part--%>
    <div>
        <div>
            <label>Y value:</label>
        </div>
        
    </div>
</form>
</body>
</html>
