<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/12/18
  Time: 11:02
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
      <h2 class=""><b>&nbsp项目经验</b></h2>
      <div class="modify" onclick="edit('ProjExp')">
        <i class="fa fa-pencil"></i><span>修改</span>
      </div>
      <hr />
    </div>
    <div class="col-md-12 info">
      <c:choose>
        <c:when test="${empty sessionScope.resumeContextVO.projExpList}">
          无项目经验
        </c:when>
        <c:otherwise>
          <c:forEach var="projExpList" items="${sessionScope.resumeContextVO.projExpList}">
            <ul style="margin-left: 0px; margin-bottom: 40px;">
              <li>
                <h5>
                  <c:forEach var="projName" items="${projExpList['projName']}">
                    ${projName}
                  </c:forEach>
                  <span class="duration">
                    <i class="fa fa-calendar"></i>
                    <c:forEach var="startTime" items="${projExpList['startTime']}">
                      ${startTime}/
                    </c:forEach>
                    <c:forEach var="endTime" items="${projExpList['endTime']}">
                      ${endTime}
                    </c:forEach>
                  </span>
                </h5>
                <h6 class="color">
                                        <span class="fa fa-wrench color">
                                        </span>
                  <c:forEach var="environment" items="${projExpList['environment']}">
                    ${environment}
                  </c:forEach>
                </h6>
                <p>
                  <c:forEach var="projDescribe" items="${projExpList['projDescribe']}">
                    ${projDescribe}
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
