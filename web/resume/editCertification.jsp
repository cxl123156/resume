<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/12/19
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<form id="certificateForm" >
<div id="Certification">
  <div class="contentTittle" style="margin-left: 0px;">
    <div class="contentText">专业证书</div>
    <div class="modify" style="margin-top: 15px;" onclick="submit('certification','certificateForm','/Resume/resumeContext/saveResume.do?action=saveCertificate','Certification')">
      <i class="fa fa-floppy-o"></i><span>保存</span>
    </div>
    <div class="clear"></div>
  </div>
    <c:forEach var="certificateList" items="${sessionScope.resumeContextVO.certificateList}">
      <ul style="margin-left: 0px; display: inline-block;">
        <li>
          <p>
            <c:forEach var="certification" items="${certificateList['certification']}">
              证书名称:<input type="text" name="certification" value="${certification}">
              <a style='color: red; cursor: pointer;' onclick='deleteElement($(this))'><i class='fa fa-times' style='margin-left: 10px;'></i></a>
            </c:forEach>
          </p>
            <span class="duration" style="margin-right: 33px; float: left">
              <c:forEach var="getTime" items="${certificateList['getTime']}">
                获得时间:<input name="getTime" value="${getTime}" type="text" class="Wdate" onFocus="WdatePicker({isShowClear:false,readOnly:true})">
              </c:forEach>
            </span>
        </li>
      </ul> <br>
    </c:forEach>
  <button type="button" style="clear:both; margin-left: 0px; display: block; float:left;" onclick="add('certification',$(this))" class="btn btn-primary">添加证书</button>
</div>
</form>
</body>
</html>
