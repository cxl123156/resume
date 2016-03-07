
<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/12/22
  Time: 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title></title>
</head>
<body>
<c:choose>
  <c:when test="${empty sessionScope.resumeContextVO.resumeContext.photo}">
    暂无照片
  </c:when>
  <c:otherwise>
    <img src="<%=basePath%>${sessionScope.resumeContextVO.resumeContext.photo}" width="295px" height="412px" onload="AutoResizeImage(295,412,this)">
  </c:otherwise>
</c:choose>
</body>
</html>
