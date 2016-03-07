<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/12/18
  Time: 11:00
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
      <h2 class=""><b>&nbsp工作经验</b></h2>
      <div class="modify" onclick="edit('WorkExp')">
        <i class="fa fa-pencil"></i><span>修改</span>
      </div>
      <hr />
    </div>
    <div class="col-md-12 info">


      <c:choose>
        <c:when test="${empty sessionScope.resumeContextVO.workExpList}">
          无工作经历
        </c:when>
        <c:otherwise>
          <c:forEach var="workExpList" items="${sessionScope.resumeContextVO.workExpList}">
            <ul style="margin-bottom: 40px;">
              <li>
                <h5>
                  <c:forEach var="company" items="${workExpList['company']}">
                    ${company}
                  </c:forEach>
                  <span class="duration">
                    <i class="fa fa-calendar"></i>
                    <c:forEach var="startTime" items="${workExpList['startTime']}">
                      ${startTime}/
                    </c:forEach>
                    <c:forEach var="endTime" items="${workExpList['endTime']}">
                      ${endTime}
                    </c:forEach>
                  </span>
                </h5>
                <h6 class="color">
                  <span class="fa fa-user color">
                  </span>
                  <c:forEach var="job" items="${workExpList['job']}">
                    ${job}
                  </c:forEach>
                </h6>
                <p>
                  <c:forEach var="duty" items="${workExpList['duty']}">
                    ${duty}
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
