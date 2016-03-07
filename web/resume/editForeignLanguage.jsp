
<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/12/19
  Time: 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<form id="foreignLanguageForm" >
<div id="ForeignLanguage">
  <div class="contentTittle" style="margin-left: 0px">
    <div class="contentText">外语水平</div>
    <div class="modify" style="margin-top: 15px;" onclick="submit('foreignLanguage','foreignLanguageForm','/Resume/resumeContext/saveResume.do?action=saveForeignLanguage','ForeignLanguage')">
      <i class="fa fa-floppy-o"></i><span>保存</span>
    </div>
    <div class="clear"></div>
  </div>
    <c:forEach var="foreignLanguageList" items="${sessionScope.resumeContextVO.foreignLanguageList}">
      <ul style="float: left;">
        <li style="float: left">
          <p>
            <c:forEach var="foreignLanguage" items="${foreignLanguageList['foreignLanguage']}">
              证书名称：<input name="foreignLanguage" value="${foreignLanguage}" type="text">
              <a style='color: red; cursor: pointer;' onclick='deleteElement($(this))'><i class='fa fa-times' style='margin-left: 10px;'></i></a>
            </c:forEach>
          </p>
            <span class="duration" style="float: left;">
              <c:forEach var="getTime" items="${foreignLanguageList['getTime']}">
                获得时间：<input type="text" name="getTime" value="${getTime}" class="Wdate" onFocus="WdatePicker({isShowClear:false,readOnly:true})">
              </c:forEach>
            </span>
          <p style="float: left;">
            <c:forEach var="describe" items="${foreignLanguageList['describe']}">
              证书介绍：
              <textarea wrap="hard" name="describe" rows="5" >${describe}</textarea>
            </c:forEach>
          </p>
        </li>
      </ul>
    </c:forEach>

  <button style="clear: both; float: left;" type="button" onclick="add('foreignLanguage',$(this))" class="btn btn-primary">添加外语</button>
</div>
</form>
</body>
</html>
