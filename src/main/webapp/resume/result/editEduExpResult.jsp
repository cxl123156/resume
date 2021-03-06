<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/12/18
  Time: 10:59
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
      <h2 class=""><b>&nbsp教育经历</b></h2>
      <div class="modify" onclick="edit('EduExp')">
        <i class="fa fa-pencil"></i><span>修改</span>
      </div>
      <hr />
    </div>

    <div class="col-md-12 info">
      <c:choose>
        <c:when test="${empty sessionScope.resumeContextVO.eduExpList}">
          无教育经历
        </c:when>
        <c:otherwise>
          <c:forEach var="eduExp" items="${sessionScope.resumeContextVO.eduExpList}">

            <ul style="margin-bottom: 40px;">
              <li>
                <h5>
                  <c:forEach var="schoolName" items="${eduExp['schoolName']}">
                    ${schoolName}
                  </c:forEach>
              <span class="duration">
                <i class="fa fa-calendar"></i>
                <c:forEach var="startTime" items="${eduExp['startTime']}">
                  ${startTime}/
                </c:forEach>
                <c:forEach var="endTime" items="${eduExp['endTime']}">
                  ${endTime}
                </c:forEach>
                                        </span>
                </h5>
                <h6 class="color">
                                        <span class="fa fa-book color">
                                        </span>
                  <c:forEach var="degree" items="${eduExp['degree']}">
                    ${degree}
                  </c:forEach>
                      <span class="major">
                        <c:forEach var="major" items="${eduExp['major']}">
                          专业： ${major}
                        </c:forEach>
                      </span>
                </h6>
                <p>
                  <c:forEach var="majorReview" items="${eduExp['majorReview']}">
                    ${majorReview}
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
