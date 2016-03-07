
<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/12/7
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

</head>
<body >
    个人介绍：
    <div class="modify" onclick="submit()">
      <i class="fa fa-floppy-o"></i><span>保存</span>
    </div>
    <form id="reviewForm" action="" >
    <p>
      <c:choose>
        <c:when test="${empty sessionScope.resumeContextVO.resumeContext.introduction}">
          <textarea id="reviewText" name="introduction" rows="7"></textarea>
        </c:when>
        <c:otherwise>
          <textarea id="reviewText" name="introduction" rows="7">${sessionScope.resumeContextVO.resumeContext.introduction}</textarea>
        </c:otherwise>
      </c:choose>
    </p>
    </form>
</body>
<script>

  function submit(){
    $.ajax({
      url : "/Resume/resumeContext/saveResume.do?action=introduction",
      data : {"introduction" : $("#reviewText").val()},
      type : "POST",
      success:function(data){
        $("#Introduction").html(data);
      }
    })
  }
</script>
</body>
</html>
