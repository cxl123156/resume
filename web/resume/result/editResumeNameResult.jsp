<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/12/26
  Time: 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<body>
<i class="fa fa-file-text"></i>
      <span>
        简历名称：
      </span>
      <span id="resumeName">
        ${sessionScope.resumeContextVO.resumeContext.resumeName}
        <i class="fa fa-edit" onclick="editResumeName()"></i>
      </span>
      <span id="editResumeName" style="display: none;">
        <input id="resumeNameVal" type="text" name="resumeName" value="${sessionScope.resumeContextVO.resumeContext.resumeName}">
        <i class="fa fa-save" onclick="saveResumeName()"></i>
      </span>
</body>
</html>
