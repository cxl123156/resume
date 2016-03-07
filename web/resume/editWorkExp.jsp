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
</head>
<body>
  <div class="container-fluid">
    <div class="row">
      <div class="tittle">
        <h2 class=""><b>&nbsp工作经验</b></h2>
        <div id="modifyWorkExp" class="modify" onclick="submit('company','workExpForm','/Resume/resumeContext/saveResume.do?action=saveWorkExp','WorkExp')">
          <i class="fa fa-floppy-o"></i><span>保存</span>
        </div>
        <hr />
      </div>
      <form id="workExpForm">
      <div class="col-md-12 info">
          <c:forEach var="workExp" items="${sessionScope.resumeContextVO.workExpList}">
              <div style="margin: 10px 0; padding: 5px 10px; background: rgba(134, 245, 89, 0.41);">
                  <div align='right'>
                      <a title="删除"  style=' cursor: pointer;' onclick='newDeleteElement($(this))'>
                          <i class="fa fa-times" style="font-size: 23px;" ></i>
                      </a>
                  </div>
                  <ul style="margin-bottom: 60px; border-bottom: solid 1px gray;">
                      <li>
                          <h5>
                              <c:forEach var="company" items="${workExp['company']}">
                                  公司名称:<input type="text" name="company" value="${company}">
                              </c:forEach>
                              <c:forEach var="corpName" items="${workExp['corpName']}">
                                  公司名称:<input type="text" name="company" value="${corpName}">
                              </c:forEach>
                                        <span class="duration">
                                            <i class="fa fa-calendar"></i>
                              <c:forEach var="startTime" items="${workExp['startTime']}">
                                           工作时间：<input type="text" name="startTime" value="${startTime}" class="Wdate" onFocus="WdatePicker({isShowClear:false,readOnly:true})">
                              </c:forEach>
                                  --
                              <c:forEach var="endTime" items="${workExp['endTime']}">
                                  <input type="text" name="endTime" value="${endTime}" class="Wdate" onFocus="WdatePicker({isShowClear:false,readOnly:true})">
                              </c:forEach>
                                        </span>
                          </h5>
                          <h6 class="color">
                                        <span class="fa fa-user color">
                                        </span>
                              <c:forEach var="job" items="${workExp['job']}">
                                  职位：<input name="job" type="text" value="${job}">
                              </c:forEach>
                          </h6>
                          <p>
                              <c:forEach var="duty" items="${workExp['duty']}">
                              主要职责:
                              <textarea name="duty" rows="5">${duty}</textarea>
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
      <div class="add col-md-12"  align="center"><button class="btn btn-primary" onclick="add('workExp')">添加工作经验</button></div>
    </div>
  </div>
</body>
</html>
