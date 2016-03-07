<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/12/7
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
  <div class="container-fluid">
    <div class="row">
      <div class="tittle">
        <h2 class=""><b>&nbsp项目经验</b></h2>
        <div id="modifyProjExp" class="modify" onclick="submit('projName','projExpForm','/Resume/resumeContext/saveResume.do?action=saveProjExp','ProjExp')">
          <i class="fa fa-floppy-o"></i><span>保存</span>
        </div>
        <hr />
      </div>
      <form id="projExpForm">
      <div class="col-md-12 info">
        <c:forEach var="projExpList" items="${sessionScope.resumeContextVO.projExpList}">
          <div style="margin: 10px 0; padding: 5px 10px; background: rgba(134, 245, 89, 0.41);">
            <div align='right'>
              <a title="删除"  style=' cursor: pointer;' onclick='newDeleteElement($(this))'>
                <i class="fa fa-times" style="font-size: 23px;" ></i>
              </a>
            </div>
              <ul style="margin-bottom: 60px; border-bottom: solid 1px gray;">
                <li>
                  <h5>
                    <c:forEach var="projName" items="${projExpList['projName']}">
                      项目名称：<input type="text" name="projName" value="${projName}"/>
                    </c:forEach>
                    <span class="duration">
                      <i class="fa fa-calendar"></i>
                      <c:forEach var="startTime" items="${projExpList['startTime']}">
                        起始时间：<input type="text" name="startTime" value="${startTime}" class="Wdate" onFocus="WdatePicker({isShowClear:false,readOnly:true})">
                      </c:forEach>
                      --
                      <c:forEach var="endTime" items="${projExpList['endTime']}">
                        <input type="text" name="endTime" value="${endTime}" class="Wdate" onFocus="WdatePicker({isShowClear:false,readOnly:true})">
                      </c:forEach>
                    </span>
                  </h5>
                  <h6 class="color">
                    <span class="fa fa-wrench color"></span>
                    <c:forEach var="environment" items="${projExpList['environment']}">
                      项目环境:<input value="${environment}" name="environment">
                    </c:forEach>
                  </h6>
                  项目描述：
                  <p>
                    <c:forEach var="projDescribe" items="${projExpList['projDescribe']}">
                      <textarea name="projDescribe" rows="5">${projDescribe}</textarea>
                    </c:forEach>
                  </p>
                </li>
              </ul>
          </div>
        </c:forEach>
      </div>
      </form>
    <div class="row">
      <div class="add col-md-12"  align="center"><button class="btn btn-primary" onclick="add('projExp')">添加项目</button></div>
    </div>
  </div>
</div>

</body>
</html>
