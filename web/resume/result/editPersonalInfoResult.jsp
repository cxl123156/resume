<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/12/18
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title></title>
</head>
<body>
<p>
  <c:choose>
    <c:when test="${empty sessionScope.resumeContextVO.resumeContext.introduction}">
      暂无自我介绍
    </c:when>
    <c:otherwise>
      <i class="fa fa-quote-left"> </i>
      ${sessionScope.resumeContextVO.resumeContext.introduction}
    </c:otherwise>
  </c:choose>
</p>
<div><button type="button" class="btn btn-primary" onclick="edit('Introduction')">修改自我介绍</button></div>
</body>
</html>
