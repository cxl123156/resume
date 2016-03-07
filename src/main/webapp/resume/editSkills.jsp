
<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/12/7
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

</head>
<body>
  <div class="container-fluid">
    <div class="row">
      <div class="tittle" >
        <h2 class="" style="width: 165px"><b>&nbsp专业技能</b></h2>
        <div class="modify" onclick="submit('skillName','skillsForm','/Resume/resumeContext/saveResume.do?action=saveSkills','Skills')">
          <i class="fa fa-floppy-o"></i><span>保存</span>
        </div>
        <hr />
      </div>
      <div class="col-md-6 info">
        <form id="skillsForm">
        <div class="skills">
          <c:forEach var="skillList" items="${sessionScope.resumeContextVO.skillList}">
            <ul style="margin-left: 0px; display: inline-block;">
              <li style="float:left;">
                <span class="duration" style="float: left; margin-bottom: 10px;">
                  <c:forEach var="skillName" items="${skillList['skillName']}">
                    技能名称：<input type="text" name="skillName" value="${skillName}">
                    <a style='color: red; cursor: pointer;' onclick='deleteElement($(this))'><i class='fa fa-times' style='margin-left: 10px;'></i></a>
                  </c:forEach>
                </span>
                <span class="duration" style="float: left">
                  <c:forEach var="proficiency" items="${skillList['proficiency']}">
                    熟练程度：<input type="text" name="proficiency" value="${proficiency}">
                  </c:forEach>
                </span>
              </li>
            </ul>
          </c:forEach>
        </div>
        </form>
        <button type="button" onclick="add('skills',$(this))" class="btn btn-primary">添加技能</button>
      </div>
      <div class="col-md-6">
        <p class="bg-warning">“熟练度”请输入1—100的数字，结果将以百分比形式显示。</p>
      </div>
    </div>
  </div>
</body>
</html>
