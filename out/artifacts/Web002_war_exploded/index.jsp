<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 31.10.2020
  Time: 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>WebLab2</title>
<link rel="stylesheet" href="css/main.css">
<%--<script src="js/jquery.js"></script>--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="js/home_page.js"></script>
</head>
<jsp:include page="partial/header.jsp"/>
<form id="data-form" method="get" name="dataForm">
    <%--    X part--%>
    <div>
        <div>
            <label>X value:</label>
        </div>
        <%--There need css for class "X-button" and "active"--%>
        <button type="button" class="X-button" name="x-value">-5</button>
        <button type="button" class="X-button" name="x-value">-4</button>
        <button type="button" class="X-button" name="x-value">-3</button>
        <button type="button" class="X-button" name="x-value">-2</button>
        <button type="button" class="X-button" name="x-value">-1</button>
        <button type="button" class="X-button" name="x-value">0</button>
        <button type="button" class="X-button" name="x-value">1</button>
        <button type="button" class="X-button" name="x-value">2</button>
        <button type="button" class="X-button" name="x-value">3</button>
    </div>
    <%--    Y part--%>
    <div>
        <div>
            <label>Y value:</label>
        </div>
        <input type="text" placeholder="(-3,3)" maxlength="16" id="y-value">
    </div>
    <%--    R part--%>
    <div>
        <div>
            <label>R value:</label>
        </div>
        <select id="r-value">
            <option selected>1</option>
            <option>1.5</option>
            <option>2</option>
            <option>2.5</option>
            <option>3</option>
        </select>
    </div>

    <input id="submit-button" type="submit" value="Submit">
</form>
</body>
</html>
