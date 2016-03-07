<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/12/18
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<div class="contentTittle" style="margin-left: 0px">
  <div class="contentText">获奖情况</div>
  <div class="modify" onclick="edit('Reward')">
    <i class="fa fa-pencil"></i><span>修改</span>
  </div>
  <div class="clear"></div>
</div>
<c:choose>
  <c:when test="${empty sessionScope.resumeContextVO.rewardList}">
    无获奖记录
  </c:when>
  <c:otherwise>
    <c:forEach var="rewardList" items="${sessionScope.resumeContextVO.rewardList}">
      <ul style="margin-left: 0px">
        <li>
          <p>
            <c:forEach var="reward" items="${rewardList['reward']}">
              ${reward}
            </c:forEach>
                  <span class="duration">
                    <i class="fa fa-calendar"></i>
                    <c:forEach var="rewardTime" items="${rewardList['rewardTime']}">
                      ${rewardTime}
                    </c:forEach>
                  </span>
          </p>
        </li>
      </ul>
    </c:forEach>
  </c:otherwise>
</c:choose>
</body>
</html>
