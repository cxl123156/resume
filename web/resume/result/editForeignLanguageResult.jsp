<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/12/19
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<div class="contentTittle" style="margin-left: 0px">
  <div class="contentText">外语水平</div>
  <div class="modify" onclick="edit('ForeignLanguage')">
    <i class="fa fa-pencil"></i><span>修改</span>
  </div>
  <div class="clear"></div>
</div>
<c:choose>
  <c:when test="${empty sessionScope.resumeContextVO.foreignLanguageList}">
    外语证书
  </c:when>
  <c:otherwise>
    <c:forEach var="foreignLanguageList" items="${sessionScope.resumeContextVO.foreignLanguageList}">
      <ul>
        <li>
          <h5>
            <c:forEach var="foreignLanguage" items="${foreignLanguageList['foreignLanguage']}">
              ${foreignLanguage}
            </c:forEach>
                  <span class="duration">
                    <i class="fa fa-calendar"></i>
                    <c:forEach var="getTime" items="${foreignLanguageList['getTime']}">
                      ${getTime}
                    </c:forEach>
                  </span>
          </h5>
          <p>
            <c:forEach var="describe" items="${foreignLanguageList['describe']}">
              ${describe}
            </c:forEach>
          </p>
        </li>
      </ul>
    </c:forEach>
  </c:otherwise>
</c:choose>
</body>
</html>
