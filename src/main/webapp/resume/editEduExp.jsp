<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/12/7
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
</head>
<body >

  <div class="container-fluid">
    <div class="row">
      <div class="tittle">
        <h2 class=""><b>&nbsp教育经历</b></h2>
        <div id="modifyEduExp" class="modify"  onclick="submit('schoolName','eduExpForm','/Resume/resumeContext/saveResume.do?action=saveEduExp','EduExp')">
          <i class="fa fa-floppy-o"></i><span>保存</span>
        </div>
        <hr />
      </div>
      <form id="eduExpForm" action="">
      <div class="col-md-12 info">
<c:forEach var="eduExp" items="${sessionScope.resumeContextVO.eduExpList}">
      <div style="margin: 10px 0; padding: 5px 10px; background: rgba(134, 245, 89, 0.41);">
        <div align='right'>
          <a title="删除" id='"+eduElementCount+"' style=' cursor: pointer;' onclick='newDeleteElement($(this))'>
            <i class="fa fa-times" style="font-size: 23px;" ></i>
          </a>
        </div>
        <ul style="margin-bottom: 60px; border-bottom: solid 1px gray;">
          <li>
            <h5>
  <c:forEach var="schoolName" items="${eduExp['schoolName']}">
              学校名称：<input name="schoolName" type="text" value="${schoolName}">
  </c:forEach>
              <span class="duration">
                <i class="fa fa-calendar"></i>
                <c:forEach var="startTime" items="${eduExp['startTime']}">
                入学时间：<input name="startTime" type="text" value="${startTime}" class="Wdate" onFocus="WdatePicker({isShowClear:false,readOnly:true})">--
                </c:forEach>
                <c:forEach var="endTime" items="${eduExp['endTime']}">
                毕业时间：<input name="endTime" type="text" value="${endTime}" class="Wdate" onFocus="WdatePicker({isShowClear:false,readOnly:true})">
                </c:forEach>
              </span>
            </h5>
            <h6 class="color">
              <span class="fa fa-book color">
              </span>
              <c:forEach var="degree" items="${eduExp['degree']}">
              学历：<select name="degree">
              <option value="" <c:if test="${degree == ''}"> selected </c:if>>选择学历</option>
              <option value="初中" <c:if test="${degree == '初中'}"> selected </c:if>>初中</option>
              <option value="高中"<c:if test="${degree == '高中'}"> selected </c:if>>高中</option>
              <option value="本科"<c:if test="${degree == '本科'}"> selected </c:if>>本科</option>
              <option value="硕士"<c:if test="${degree == '硕士'}"> selected </c:if>>硕士</option>
              <option value="博士"<c:if test="${degree == '博士'}"> selected </c:if>>博士</option>
                    </select>
              </c:forEach>
              <span class="major">
                <c:forEach var="major" items="${eduExp['major']}">
                专业：<input type="text" name="major" value="${major}"/>
                </c:forEach>
              </span>
            </h6>
            <p>
              <c:forEach var="majorDescrip" items="${eduExp['majorReview']}">
              专业介绍：
              <textarea name="majorReview" rows="5">${majorDescrip}</textarea>
              </c:forEach>
            </p>
          </li>
        </ul>
      </div>
</c:forEach>
      </div>
      </form>
    </div>
    <div class="row">
      <div class="add col-md-12"  align="center"><button class="btn btn-primary" onclick="add('eduExp')">添加学历</button></div>
    </div>
  </div>
</body>
</html>
