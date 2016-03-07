
<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/12/19
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<div class="contentTittle" style="margin-left: 0px">
  <div class="contentText">专业证书</div>
  <div class="modify" onclick="edit('Certification')">
    <i class="fa fa-pencil"></i><span>修改</span>
  </div>
  <div class="clear"></div>
</div>
<c:choose>
  <c:when test="${empty sessionScope.resumeContextVO.certificateList}">
    无专业证书
  </c:when>
  <c:otherwise>
    <c:forEach var="certificateList" items="${sessionScope.resumeContextVO.certificateList}">
      <ul style="margin-left: 0px">
        <li>
          <p>
            <c:forEach var="certification" items="${certificateList['certification']}">
              ${certification}
            </c:forEach>
                  <span class="duration">
                    <i class="fa fa-calendar"></i>
                    <c:forEach var="getTime" items="${certificateList['getTime']}">
                      ${getTime}
                    </c:forEach>
                  </span>
          </p>
        </li>
      </ul>
    </c:forEach>
  </c:otherwise>
</c:choose>
</body>
</html>
