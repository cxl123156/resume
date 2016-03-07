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
<body>
  <div class="container-fluid">
    <div class="row">
      <div class="tittle">
        <h2 class=""><b>&nbsp在校活动</b></h2>
        <div id="modifyInSchoolActive" class="modify"
             onclick="submit('activeName','inSchoolActiveForm','/Resume/resumeContext/saveResume.do?action=saveInSchoolActive','InSchoolActive')">
          <i class="fa fa-floppy-o"></i><span>保存</span>
        </div>
        <hr />
      </div>
      <form id="inSchoolActiveForm" >
      <div class="col-md-12 info">
        <c:forEach var="inSchoolActiveList" items="${sessionScope.resumeContextVO.inSchoolActiveList}">
          <div style="margin: 10px 0; padding: 5px 10px; background: rgba(134, 245, 89, 0.41);">
            <div align='right'>
              <a title="删除"  style=' cursor: pointer;' onclick='newDeleteElement($(this))'>
                <i class="fa fa-times" style="font-size: 23px;" ></i>
              </a>
            </div>
            <ul>
              <li>
                <h5>
                  <c:forEach var="activeName" items="${inSchoolActiveList['activeName']}">
                    参加的活动或社团：<input type="text" name="activeName" value="${activeName}">
                  </c:forEach>
                <span class="duration">
                  <c:forEach var="startTime"  items="${inSchoolActiveList['startTime']}">
                    <i class="fa fa-calendar"></i>
                    起止时间：<input  value="${startTime}" name="startTime" type="text" class="Wdate" onFocus="WdatePicker({isShowClear:false,readOnly:true})">
                  </c:forEach>
                  <c:forEach var="endTime"  items="${inSchoolActiveList['endTime']}">
                    --<input value="${endTime}" name="endTime" type="text" class="Wdate" onFocus="WdatePicker({isShowClear:false,readOnly:true})">
                  </c:forEach>
                </span>
                </h5>
                负责内容：
                <p>
                  <c:forEach var="describe"  items="${inSchoolActiveList['describe']}">
                    <textarea rows="5" name="describe">${describe}</textarea>
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
      <div class="add col-md-12"  align="center"><button class="btn btn-primary" onclick="add('inSchoolActive',$(this))">添加在校活动</button></div>
    </div>
  </div>

</body>
</html>
