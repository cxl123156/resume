<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/12/18
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
</head>
<body>
<div class="container-fluid">
  <div class="row">
    <div class="tittle">
      <h2 class=""><b>&nbsp在校活动</b></h2>
      <div class="modify" onclick="edit('InSchoolActive')">
        <i class="fa fa-pencil"></i><span>修改</span>
      </div>
      <hr />
    </div>
    <div class="col-md-12 info">
      <c:choose>
        <c:when test="${empty sessionScope.resumeContextVO.inSchoolActiveList}">
          无在校活动
        </c:when>
        <c:otherwise>
          <c:forEach var="inSchoolActiveList" items="${sessionScope.resumeContextVO.inSchoolActiveList}">
            <ul>
              <li>
                <h5>
                  <c:forEach var="activeName" items="${inSchoolActiveList['activeName']}">
                    ${activeName}
                  </c:forEach>
                  <span class="duration">
                    <i class="fa fa-calendar"></i>
                    <c:forEach var="startTime" items="${inSchoolActiveList['startTime']}">
                      ${startTime}/
                    </c:forEach>
                    <c:forEach var="endTime" items="${inSchoolActiveList['endTime']}">
                      ${endTime}
                    </c:forEach>
                  </span>
                </h5>
                <p>
                  <c:forEach var="describe" items="${inSchoolActiveList['describe']}">
                    ${describe}
                  </c:forEach>
                </p>
              </li>
            </ul>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</div>
</body>
</html>
