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
    <div class="tittle" >
      <h2 class="" style="width: 165px"><b>&nbsp专业技能</b></h2>
      <div class="modify" onclick="edit('Skills')">
        <i class="fa fa-pencil"></i><span>修改</span>
      </div>
      <hr />
    </div>
    <div class="col-md-12 info">
      <div class="skills">
        <c:choose>
          <c:when test="${empty sessionScope.resumeContextVO.skillList}">
            无专业技能
          </c:when>
          <c:otherwise>
            <c:forEach var="skillList" items="${sessionScope.resumeContextVO.skillList}">
              <div class="skillbar" data-percent="<c:forEach var="proficiency" items="${skillList['proficiency']}">${proficiency}</c:forEach>">
                <div class="skillbarTittle"><span>
                  <c:forEach var="skillName" items="${skillList['skillName']}">${skillName}</c:forEach>
                </span></div>
                <div class="skillbarBar"></div>
                <div class="skillbarPercent">
                  <c:forEach var="proficiency" items="${skillList['proficiency']}">${proficiency}</c:forEach>
                </div>
              </div>
            </c:forEach>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
</div>
<script>
  $('.skillbar').each(function() {
    $(this).find('.skillbarBar').width(0);
  });

  $('.skillbar').each(function() {
    $(this).find('.skillbarBar').animate({
      width: $(this).attr('data-percent')+'%'
    }, 2000);
  });
</script>
</body>
</html>
