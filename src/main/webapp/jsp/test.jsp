<%--
  Created by IntelliJ IDEA.
  User: Phi
  Date: 2017/6/18
  Time: 8:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/formListTest" method="post">
    <input type="text" name="users[0].name" />
    <input type="text" name="users[0].code" />
    <input type="text" name="users[1].name" />
    <input type="text" name="users[1].code" />
    <button type="submit" class="btn blue">生成</button>
</form>
</body>
</html>
