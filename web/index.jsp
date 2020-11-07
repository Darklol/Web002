<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 31.10.2020
  Time: 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>WebLab2</title>
<link rel="stylesheet" href="css/main.css">
<%--<script src="js/jquery.js"></script>--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="js/validate.js"></script>
<script src="js/home_page.js"></script>
<script src="js/graphics.js"></script>
<script src="js/table.js"></script>

</head>
<jsp:include page="partial/header.jsp"/>
<form id="data-form" method="get" name="dataForm">
    <jsp:include page="partial/graphics.jsp"/>
    <%--    X part--%>
    <div class="value-space">
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
    <div class="value-space">
        <div>
            <label>Y value:</label>
        </div>
        <input type="text" placeholder="(-3,3)" maxlength="16" id="y-value" >
    </div>
    <%--    R part--%>
    <div class="value-space">
        <div>
            <label>R value:</label>
        </div>
        <select id="r-value">
            <option selected>1.0</option>
            <option>1.5</option>
            <option>2.0</option>
            <option>2.5</option>
            <option>3.0</option>
        </select>
    </div>

    <input id="submit-button" type="submit" value="Submit">
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
                            ${query.result ? "<div style=\"color: green\">In the area</div>" :
                                    "<div style=\"color: red\">Outside the area</div>"}
                    </div>
                </c:forEach>
            </div>
        </div>

</form>
</body>
</html>
