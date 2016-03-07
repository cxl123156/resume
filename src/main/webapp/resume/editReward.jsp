
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
<form id="rewardForm">
        <div id="Reward">
          <div class="contentTittle" style="margin-left: 0px">
            <div class="contentText">获奖情况</div>
            <div class="modify" style="margin-top: 15px;" onclick="submit('reward','rewardForm','/Resume/resumeContext/saveResume.do?action=saveReward','Reward')">
              <i class="fa fa-floppy-o"></i><span>保存</span>
            </div>
            <div class="clear"></div>
          </div>

            <c:forEach var="rewardList" items="${sessionScope.resumeContextVO.rewardList}">
              <ul style="margin-left: 0px; display: inline-block;">
                <li>
                  <p>
                    <c:forEach var="reward" items="${rewardList['reward']}">
                      奖项名称：<input type="text" name="reward" value="${reward}">
                      <a style='color: red; cursor: pointer;' onclick='deleteElement($(this))'><i class='fa fa-times' style='margin-left: 10px;'></i></a>
                    </c:forEach>
                  </p>
            <span class="duration" style=" float: left;">
              <c:forEach var="rewardTime" items="${rewardList['rewardTime']}">
                获奖时间：<input type="text" name="rewardTime" value="${rewardTime}" class="Wdate" onFocus="WdatePicker({isShowClear:false,readOnly:true})">
              </c:forEach>
            </span>
                </li>
              </ul> <br>
            </c:forEach>

          <button style="clear:both; margin-left: 0px; display: block; float:left;" type="button" onclick="add('reward',$(this))" class="btn btn-primary">添加奖项</button>
        </div>
        </form>
</body>
</html>
