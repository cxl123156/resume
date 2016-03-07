<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/11/16
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>chen</title>
  <link rel="stylesheet" href="<%=basePath%>css/main.css">
  <link rel="stylesheet" href="<%=basePath%>css/bootstrap.css">
  <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css">
  <script src="<%=basePath%>js/jquery-2.1.3.js"></script>
  <script src="<%=basePath%>js/bootstrap.js"></script>
  <script type="text/javascript" src="<%=basePath%>js/MyJS.js"></script>
  <script type="text/javascript" src="<%=basePath%>js/main.js"></script>

</head>
<body>
<div id="nav">
  <div class="navLeft">
    <h2 class="fa fa-user "></h2>
    <h2 class="username">陈香林 Xianglin Chen</h2>
  </div>
  <div class="navRight">
    <div id="contactMe">
    <ul>
      <li onmouseover="inChangeColor(this)" onmouseout="outChangeColor(this)">
        <a class="navicon fa fa-steam" href="#"></a>
      </li>
      <li onmouseover="inChangeColor(this)" onmouseout="outChangeColor(this)">
        <a class="navicon fa fa-envelope" href="#"></a>
      </li>
      <li onmouseover="inChangeColor(this)" onmouseout="outChangeColor(this)">
        <a class="navicon fa fa-qq" href="#"></a>
      </li>
    </ul>
    </div>
    <div id="userInfo" class="dropdown">
    <button class="btn btn-primary" id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      <i class="fa fa-user"></i>
        <sec:authentication property="principal.username"></sec:authentication>
        <c:if test="${sessionScope.userVO.role=='[ROLE_ADMIN]'}">管理员</c:if>
        <c:if test="${sessionScope.userVO.role=='[ROLE_USER]'}">游客</c:if>
      <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" aria-labelledby="dLabel">
<c:if test="${sessionScope.userVO.role=='[ROLE_ADMIN]'}"><li><a href="<%=basePath%>user/userInfo.do">个人资料</a></li></c:if>
      <c:if test="${sessionScope.userVO.role=='[ROLE_ADMIN]'}"><li><a href="<%=basePath%>resumeContext/updateResume.do">修改简历</a></li></c:if>
      <c:if test="${sessionScope.userVO.role=='[ROLE_ADMIN]'}"><li><a >用户及权限管理</a></li></c:if>
      <li><a id="logout">注销</a></li>
    </ul>
    </div>
  </div>
</div>
<div id="wrapper">
  <div class="content">
    <div class="toolbar">
      <ul>
        <li  onmouseover="inChangeColor(this)" onmouseout="outChangeColor(this)" onclick="fadeout(this)" data-subject="personalInfo">
          <i class="fa fa-user"></i>
        </li>
        <li class="tabs-resume" onmouseover="inChangeColor(this)" onmouseout="outChangeColor(this)" onclick="fadeout(this)" data-subject="resume">
          <i class=" fa fa-file-text"></i>
        </li>
        <li onmouseover="inChangeColor(this)" onmouseout="outChangeColor(this)" onclick="fadeout(this)" data-subject="experence">
          <i class="fa fa-tasks"></i>
        </li>
        <li  onmouseover="inChangeColor(this)" onmouseout="outChangeColor(this)" onclick="fadeout(this)" data-subject="leaveMessage">
          <i class=" fa fa-envelope"></i>
        </li>
      </ul>
    </div>
    <div class="mainContent">
      <div id="personalInfo" class="contentPanel">
        <div class="container-fluid">
          <div class="row">
            <div class="aboutMe">
              <h2 class=""><b>&nbsp个人资料</b></h2>
              <hr />
            </div>


            <div class="col-md-6 info">
              <ul>
                <li>
                  <i class="fa fa-user"></i>
                  <label>姓名：</label>
            <span class="value">
              ${sessionScope.userVO.user.realName}
            </span>
                </li>
                <li>
                  <i class="fa fa-calendar"></i>
                  <label>年龄：</label>
                  <span class="value"> ${sessionScope.userVO.user.age}</span>
                </li>
                <li>
                  <i class="fa fa-birthday-cake"></i>
                  <label>生日：</label>
                  <span class="value"> ${sessionScope.userVO.birthday}</span>
                </li>
                <li>
                  <i class="fa fa-university"></i>
                  <label>毕业院校：</label>
                  <span class="value">${sessionScope.userVO.user.college}</span>
                </li>
                <li>
                  <i class="fa fa-wrench"></i>
                  <label>专业：</label>
                  <span class="value">${sessionScope.userVO.user.major}</span>
                </li>
                <li>
                  <i class="fa fa-graduation-cap"></i>
                  <label>学历：</label>
                  <span class="value">${sessionScope.userVO.user.degree}</span>
                </li>
                <li>
                  <i class="fa fa-phone"></i>
                  <label>电话：</label>
                  <span class="value">${sessionScope.userVO.user.phone}</span>
                </li>
                <li>
                  <i class="fa fa-envelope fa-2"></i>
                  <label>邮箱：</label>
                  <span class="value">${sessionScope.userVO.user.email}</span>
                </li>
                <li>
                  <i class="fa fa-globe"></i>
                  <label>网站：</label>
            <span class="value">
              <a href="http://www.chenxl.com" target="_blank">${sessionScope.userVO.user.webSite}</a>
            </span>
                </li>
              </ul>
              <div id="Introduction" class="review ">
                <p>
                  <c:choose>
                    <c:when test="${empty sessionScope.resumeContextVO.resumeContext.introduction}">
                      暂无自我介绍
                    </c:when>
                    <c:otherwise>
                      <i class="fa fa-quote-left"> </i>
                      ${sessionScope.resumeContextVO.resumeContext.introduction}
                    </c:otherwise>
                  </c:choose>
                </p>
              </div>
            </div>
            <div class="col-md-6 photo">
              <c:choose>
                <c:when test="${empty sessionScope.resumeContextVO.resumeContext.photo}">
                  暂无照片
                </c:when>
                <c:otherwise>
                  <img src="<%=basePath%>${sessionScope.resumeContextVO.resumeContext.photo}" width="295px" height="412px">
                </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>
      </div>
      <div id="resume" class="contentPanel">
        <div class="container-fluid">
          <div class="row">
            <div class="aboutMe">
              <h2 class=""><b>&nbsp教育</b></h2>
              <hr />
            </div>


            <div class="col-md-6 info">
              <div class="contentTittle">
                <div class="contentText">教育经历</div>
                <div class="clear"></div>
              </div>
              <c:choose>
                <c:when test="${empty sessionScope.resumeContextVO.eduExpList}">
                  无教育经历
                </c:when>
                <c:otherwise>
                  <c:forEach var="eduExp" items="${sessionScope.resumeContextVO.eduExpList}">

                    <ul>
                      <li>
                        <h5>
                          <c:forEach var="schoolName" items="${eduExp['schoolName']}">
                            ${schoolName}
                          </c:forEach>
              <span class="duration">
                <i class="fa fa-calendar"></i>
                <c:forEach var="startTime" items="${eduExp['startTime']}">
                  ${startTime}/
                </c:forEach>
                <c:forEach var="endTime" items="${eduExp['endTime']}">
                  ${endTime}
                </c:forEach>
                                        </span>
                        </h5>
                        <h6 class="color">
                                        <span class="fa fa-book color">
                                        </span>
                          <c:forEach var="degree" items="${eduExp['degree']}">
                            ${degree}
                          </c:forEach>
                      <span class="major">
                        <c:forEach var="major" items="${eduExp['major']}">
                          专业： ${major}
                        </c:forEach>
                      </span>
                        </h6>
                        <p>
                          <c:forEach var="majorReview" items="${eduExp['majorReview']}">
                            ${majorReview}
                          </c:forEach>
                        </p>
                      </li>
                    </ul>
                  </c:forEach>
                </c:otherwise>
              </c:choose>
              <div class="contentTittle">
                <div class="contentText">校内活动</div>
                <div class="clear"></div>
              </div>
              <c:choose>
                <c:when test="${empty sessionScope.resumeContextVO.inSchoolActiveList}">
                  无在校活动
                </c:when>
                <c:otherwise>
                  <c:forEach var="inSchoolActiveList" items="${sessionScope.resumeContextVO.inSchoolActiveList}">
                    <ul>
                      <li>
                        <h5>
                          <c:forEach var="activeName" items="${inSchoolActiveList['activeName']}">
                            ${activeName}
                          </c:forEach>
                  <span class="duration">
                    <i class="fa fa-calendar"></i>
                    <c:forEach var="startTime" items="${inSchoolActiveList['startTime']}">
                      ${startTime}/
                    </c:forEach>
                    <c:forEach var="endTime" items="${inSchoolActiveList['endTime']}">
                      ${endTime}
                    </c:forEach>
                  </span>
                        </h5>
                        <p>
                          <c:forEach var="describe" items="${inSchoolActiveList['describe']}">
                            ${describe}
                          </c:forEach>
                        </p>
                      </li>
                    </ul>
                  </c:forEach>
                </c:otherwise>
              </c:choose>
              <div class="contentTittle">
                <div class="contentText">英文水平</div>
                <div class="clear"></div>
              </div>
              <c:choose>
                <c:when test="${empty sessionScope.resumeContextVO.foreignLanguageList}">
                  外语证书
                </c:when>
                <c:otherwise>
                  <c:forEach var="foreignLanguageList" items="${sessionScope.resumeContextVO.foreignLanguageList}">
                    <ul>
                      <li>
                        <h5>
                          <c:forEach var="foreignLanguage" items="${foreignLanguageList['foreignLanguage']}">
                            ${foreignLanguage}
                          </c:forEach>
                  <span class="duration">
                    <i class="fa fa-calendar"></i>
                    <c:forEach var="getTime" items="${foreignLanguageList['getTime']}">
                      ${getTime}
                    </c:forEach>
                  </span>
                        </h5>
                        <p>
                          <c:forEach var="describe" items="${foreignLanguageList['describe']}">
                            ${describe}
                          </c:forEach>
                        </p>
                      </li>
                    </ul>
                  </c:forEach>
                </c:otherwise>
              </c:choose>
            </div>
            <div class="col-md-6 info">
              <div class="contentTittle" style="margin-left: 0px">
                <div class="contentText">获奖情况</div>
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
              <div class="contentTittle" style="margin-left: 0px">
                <div class="contentText">专业证书</div>
                <div class="clear"></div>
              </div>
              <c:choose>
                <c:when test="${empty sessionScope.resumeContextVO.certificateList}">
                  无专业证书
                </c:when>
                <c:otherwise>
                  <c:forEach var="certificateList" items="${sessionScope.resumeContextVO.certificateList}">
                    <ul style="margin-left: 0px">
                      <li>
                        <p>
                          <c:forEach var="certification" items="${certificateList['certification']}">
                            ${certification}
                          </c:forEach>
                  <span class="duration">
                    <i class="fa fa-calendar"></i>
                    <c:forEach var="getTime" items="${certificateList['getTime']}">
                      ${getTime}
                    </c:forEach>
                  </span>
                        </p>
                      </li>
                    </ul>
                  </c:forEach>
                </c:otherwise>
              </c:choose>
              <div class="contentTittle" style="margin-left: 0px">
                <div class="contentText">专业技能</div>
                <div class="clear"></div>
              </div>
              <div class="skills">
                <c:choose>
                  <c:when test="${empty sessionScope.resumeContextVO.skillList}">
                    无专业技能
                  </c:when>
                  <c:otherwise>
                    <c:forEach var="skillList" items="${sessionScope.resumeContextVO.skillList}">
                      <div class="skillbar" data-percent="<c:forEach var="proficiency" items="${skillList['proficiency']}">${proficiency}</c:forEach>">
                        <div class="skillbarTittle"><span>
                  <c:forEach var="skillName" items="${skillList['skillName']}">${skillName}</c:forEach>
                </span></div>
                        <div class="skillbarBar"></div>
                        <div class="skillbarPercent">
                          <c:forEach var="proficiency" items="${skillList['proficiency']}">${proficiency}%</c:forEach>
                        </div>
                      </div>
                    </c:forEach>
                  </c:otherwise>
                </c:choose>
              </div>
            </div>
            <div style="height: 30px; width: 100%; clear: both;"></div>
          </div>
        </div>
      </div>
      <div id="experence" class="contentPanel">
        <div class="container-fluid">
          <div class="row">
            <div class="aboutMe">
              <h2 class=""><b>&nbsp工作经验</b></h2>
              <hr />
            </div>
            <div class="col-md-6 info">
              <div class="contentTittle">
                <div class="contentText">工作经历</div>
                <div class="clear"></div>
              </div>
              <c:choose>
                <c:when test="${empty sessionScope.resumeContextVO.workExpList}">
                  无工作经历
                </c:when>
                <c:otherwise>
                  <c:forEach var="workExpList" items="${sessionScope.resumeContextVO.workExpList}">
                    <ul style="margin-bottom: 20px;">
                      <li>
                        <h5>
                          <c:forEach var="company" items="${workExpList['company']}">
                            ${company}
                          </c:forEach>
                  <span class="duration">
                    <i class="fa fa-calendar"></i>
                    <c:forEach var="startTime" items="${workExpList['startTime']}">
                      ${startTime}/
                    </c:forEach>
                    <c:forEach var="endTime" items="${workExpList['endTime']}">
                      ${endTime}
                    </c:forEach>
                  </span>
                        </h5>
                        <h6 class="color">
                  <span class="fa fa-user color">
                  </span>
                          <c:forEach var="job" items="${workExpList['job']}">
                            ${job}
                          </c:forEach>
                        </h6>
                        <p style="text-indent: 2em;">
                          <c:forEach var="duty" items="${workExpList['duty']}">
                            ${duty}
                          </c:forEach>
                        </p>
                      </li>
                    </ul>
                  </c:forEach>
                </c:otherwise>
              </c:choose>
            </div>
            <div class="col-md-6 info">
              <div class="contentTittle" style="margin-left: 0px">
                <div class="contentText">项目经验</div>
                <div class="clear"></div>
              </div>
              <c:choose>
                <c:when test="${empty sessionScope.resumeContextVO.projExpList}">
                  无项目经验
                </c:when>
                <c:otherwise>
                  <c:forEach var="projExpList" items="${sessionScope.resumeContextVO.projExpList}">
                    <ul style="margin-left: 0px; margin-bottom: 20px;">
                      <li>
                        <h5>
                          <c:forEach var="projName" items="${projExpList['projName']}">
                            ${projName}
                          </c:forEach>
                  <span class="duration">
                    <i class="fa fa-calendar"></i>
                    <c:forEach var="startTime" items="${projExpList['startTime']}">
                      ${startTime}
                    </c:forEach>
                    <c:forEach var="endTime" items="${projExpList['endTime']}">
                      ${endTime}
                    </c:forEach>
                  </span>
                        </h5>
                        <h6 class="color">
                                        <span class="fa fa-wrench color">
                                        </span>
                          <c:forEach var="environment" items="${projExpList['environment']}">
                            ${environment}
                          </c:forEach>
                        </h6>
                        <p style="text-indent: 2em;">
                          <c:forEach var="projDescribe" items="${projExpList['projDescribe']}">
                            ${projDescribe}
                          </c:forEach>
                        </p>
                      </li>
                    </ul>
                  </c:forEach>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>
      </div>
      <div id="leaveMessage" class="contentPanel">
        <div class="container-fluid">
          <div class="row">
            <div class="aboutMe">
              <h2 class=""><b>&nbsp给我留言</b></h2>
              <hr />
            </div>


            <div class="col-md-12 info">
              <div class="col-md-12" style="margin-bottom: 20px;">
                <form>
                  <div class="form-group">
                    <label for="massageUserName">您的称呼：</label>
                    <input id="massageUserName" class="form-control" name="massageUserName" type="text">
                  </div>
                  <div class="form-group">
                    <label for="message">留言内容：</label>
                    <textarea id="message" class="form-control" name="message"></textarea>
                  </div>
                  <div class="form-group">
                    <label for="contactMethod">联系方式（电话或邮箱）：</label>
                    <input id="contactMethod" class="form-control" name="contactMethod" type="text">
                  </div>
                  <button id="submitMessage" type="button" class="btn btn-primary">提交留言</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
<div id="foot">
  <label>陈香林简历 2016</label>
</div>
<script>
  $("#logout").click(function(){
    $.ajax({
      url : "/Resume/logout",
      type : "post",
      success : function(data){
        if(data){
          alert("已成功注销");
          window.location.href = "<%=basePath%>login.jsp";
        }else{
          alert("Error ");
        }
      },
     error : function(data){
       alert("Error ");
     }
    });

  });
  $("#submitMessage").click(function(){
    $.ajax({
      url : "<%=basePath%>comment/sendEmail.do",
      type : "post",
      data : {
        massageUserName : $("#massageUserName").val(),
        message : $("#message").val(),
        contactMethod : $("#contactMethod").val()
      },
      success : function(data){
          alert(data);
      },
      error : function(data){
        alert("Error ");
      }
    });

  });

</script>
</body>

</html>
