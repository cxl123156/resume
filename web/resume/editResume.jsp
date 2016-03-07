<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/12/4
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link href="../css/editResume.css" rel="stylesheet" />
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/font-awesome.min.css">
<script src="../js/jquery-2.1.3.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/main.js"></script>
<script src="../js/editResume.js"></script>
<script src="../js/My97DatePicker/WdatePicker.js"></script>
<script src="../js/jquery.Jcrop.js" type="text/javascript"></script>
<script src="../js/jquery.form.js" type="text/javascript"></script>
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
        ${sessionScope.userVO.user.username},
        <c:if test="${sessionScope.userVO.role=='[ROLE_ADMIN]'}">管理员</c:if>
        <c:if test="${sessionScope.userVO.role=='[ROLE_USER]'}">普通用户</c:if>
        <span class="caret"></span>
      </button>
      <ul class="dropdown-menu" aria-labelledby="dLabel">
        <li><a href="<%=basePath%>user/userInfo.do">个人资料</a></li>
        <c:if test="${sessionScope.userVO.role=='[ROLE_ADMIN]'}"><li><a href="<%=basePath%>resumeContext/updateResume.do">修改简历</a></li></c:if>
        <c:if test="${sessionScope.userVO.role=='[ROLE_ADMIN]'}"><li><a >用户及权限管理</a></li></c:if>
        <li><a id="logout">注销</a></li>
      </ul>
    </div>
  </div>
</div>
<div class="mainContainer container">
  <div class="leftContainer">
    <div id="resumeNameDiv" class="resumeName">
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
    </div>
    <div class="column">
      <ul>
        <li><a href="#PersonalInfo"><i class="fa fa-user"></i><label>个人资料</label></a></li>
        <li><a href="#EduExp"><i class="fa fa-graduation-cap"></i><label>教育经历</label></a></li>
        <li><a href="#WorkExp"><i class="fa fa-briefcase"></i><label>工作经验</label></a></li>
        <li><a href="#ProjExp"><i class="fa fa-wrench"></i><label>项目经验</label></a></li>
        <li><a href="#Reward"><i class="fa fa-diamond"></i><label>获奖及证书</label></a></li>
        <li><a href="#Skills"><i class="fa fa-gear"></i><label>专业技能</label></a></li>
        <li><a href="#InSchoolActive"><i class="fa fa-university"></i><label>在校活动</label></a></li>
      </ul>
    </div>
  </div>
  <div class="rightContainer">
    <div id="PersonalInfo" class="contentPanel">
      <div class="container-fluid">
        <div class="row">
          <div class="tittle" style="margin: 10px;">
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
               <div><button type="button" class="btn btn-primary" onclick="edit('Introduction')">修改自我介绍</button></div>
            </div>
          </div>
          <div class="col-md-6 photo">
            <c:choose>
              <c:when test="${empty sessionScope.resumeContextVO.resumeContext.photo}">
                暂无照片
              </c:when>
              <c:otherwise>
                <img src="<%=basePath%>${sessionScope.resumeContextVO.resumeContext.photo}" width="295px" height="412px" onload="AutoResizeImage(295,412,this)">
              </c:otherwise>
            </c:choose>
            <div style="margin-top: 20px;"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#uploadPhoto">上传照片</button></div>
          </div>

        </div>
      </div>
    </div>
    <div id="EduExp" class="contentPanel">
      <div class="container-fluid">
        <div class="row">
          <div class="tittle">
            <h2 class=""><b>&nbsp教育经历</b></h2>
            <div class="modify" onclick="edit('EduExp')">
              <i class="fa fa-pencil"></i><span>修改</span>
            </div>
            <hr />
          </div>

          <div class="col-md-12 info">
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
          </div>
        </div>
      </div>
    </div>
    <div id="WorkExp" class="contentPanel">
      <div class="container-fluid">
        <div class="row">
          <div class="tittle">
            <h2 class=""><b>&nbsp工作经验</b></h2>
            <div class="modify" onclick="edit('WorkExp')">
              <i class="fa fa-pencil"></i><span>修改</span>
            </div>
            <hr />
          </div>
          <div class="col-md-12 info">
            <c:choose>
              <c:when test="${empty sessionScope.resumeContextVO.workExpList}">
                无工作经历
              </c:when>
              <c:otherwise>
                <c:forEach var="workExpList" items="${sessionScope.resumeContextVO.workExpList}">
                  <ul style="margin-bottom: 40px;">
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
                      <p>
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
        </div>
      </div>
    </div>
    <div id="ProjExp" class="contentPanel">
      <div class="container-fluid">
        <div class="row">
          <div class="tittle">
            <h2 class=""><b>&nbsp项目经验</b></h2>
            <div class="modify" onclick="edit('ProjExp')">
              <i class="fa fa-pencil"></i><span>修改</span>
            </div>
            <hr />
          </div>
          <div class="col-md-12 info">
            <c:choose>
              <c:when test="${empty sessionScope.resumeContextVO.projExpList}">
                无项目经验
              </c:when>
              <c:otherwise>
                <c:forEach var="projExpList" items="${sessionScope.resumeContextVO.projExpList}">
                  <ul style="margin-left: 0px; margin-bottom: 40px;">
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
                      <p>
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
    <div id="RewardAndCertification" class="contentPanel">
      <div class="container-fluid">
        <div class="row">
          <div class="tittle" >
            <h2 class="" style="width: 165px"><b>&nbsp获奖及证书</b></h2>
            <hr />
          </div>
          <div class="col-md-6 info">
            <div id="Reward">
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
            </div>

            <div id="ForeignLanguage">
              <div class="contentTittle" style="margin-left: 0px">
                <div class="contentText">外语水平</div>
                <div class="modify" onclick="edit('ForeignLanguage')">
                  <i class="fa fa-pencil"></i><span>修改</span>
                </div>
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

          </div>
          <div class="col-md-6 info">
            <div id="Certification">
              <div class="contentTittle" style="margin-left: 0px">
                <div class="contentText">专业证书</div>
                <div class="modify" onclick="edit('Certification')">
                  <i class="fa fa-pencil"></i><span>修改</span>
                </div>
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
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id="Skills" class="contentPanel">
      <div class="container-fluid">
        <div class="row">
          <div class="tittle" >
            <h2 class="" style="width: 165px"><b>&nbsp专业技能</b></h2>
            <div class="modify" onclick="edit('Skills')">
              <i class="fa fa-pencil"></i><span>修改</span>
            </div>
            <hr />
          </div>
          <div class="col-md-12 info">
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
        </div>
      </div>
    </div>
    <div id="InSchoolActive" class="contentPanel">
      <div class="container-fluid">
        <div class="row">
          <div class="tittle">
            <h2 class=""><b>&nbsp在校活动</b></h2>
            <div class="modify" onclick="edit('InSchoolActive')">
              <i class="fa fa-pencil"></i><span>修改</span>
            </div>
            <hr />
          </div>
          <div class="col-md-12 info">
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
          </div>
        </div>
      </div>
    </div>

  </div>
</div>
<div id="foot" >
  <label>asdasdasddgg</label>
</div>

<<!-- Modal -->
<div class="modal fade" id="uploadPhoto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">上传照片</h4>
      </div>
      <div class="modal-body">
        <div id="head">
          <div style="width: 130px; height: 38px;">
            <form id="photoUploadForm" action="<%=basePath%>resumeContext/uploadPic.do" enctype="multipart/form-data" method="post">
              <input type="button" class="btn btn-primary" value="选择图片" style="width: 130px; height: 38px;" >
              <input id="photoFile" type="file" class="uploatFile" name="file" onchange="uploadPhoto()">
            </form>
          </div><br>
          <div id="photoArea"></div>
        </div>
      </div>
      <div class="modal-footer">
        <button id="close" type="button" class="btn btn-default" data-dismiss="modal" >关闭</button>
        <button type="button" class="btn btn-primary" onclick=" savePhoto()" data-dismiss="modal">保存更改</button>
      </div>
    </div>
  </div>
</div>

<script>
  function editResumeName(){
    $("#resumeName").css("display","none");
    $("#editResumeName").css("display","block");
  }
  function saveResumeName(){
    $.ajax({
      url : "<%=basePath%>resumeContext/saveResume.do",
      data : {
        action : "resumeName",
        resumeName : $("#resumeNameVal").val()
      },
      type : "post",
      dataType : "html",
      success : function(data){
        $("#resumeNameDiv").html(data);
      }
    })
  }
  function savePhoto(){
    var event = document.createEvent("MouseEvents");
    event.initEvent("click", true, true);
    $.ajax({
      url : "<%=basePath%>resumeContext/cutPic.do",
      dataType : "json",
      data : {
        x : $("#x").val(),
        y : $("#y").val(),
        width : $("#width").val(),
        height : $("#height").val(),
        sourceFile : $("#sourceFile").val()
      },
      success : function(data){
        $(".photo").html(data);
      }
    });
  }
  function edit(ele){
    var temp = "edit"+ele;
    $.ajax({
      url : "<%=basePath%>resumeContext/updateResume.do",
      data : {
        action : ele
      },
      dataType : "html",
      type : "post",
      success : function(data){
        $("#"+ele).html(data);
      }
    });
  }
  function uploadPhoto(){
    var file = $("#photoFile").val();
    var splitFile = file.split(".");
    if(splitFile[splitFile.length-1] === "jpg"){
      var hideForm = $('#photoUploadForm');
      var options = {
        dataType : "html",
        type : "post",
        success : function(result) {
//        console.log(result);
          $("#photoArea").html(result);
        },
        error : function(result) {
          alert("error");
        }
      };
      hideForm.ajaxSubmit(options);
    }else{
      if(file != null || file!=""){
        alert("文件格式不对，请上传jpg格式文件!");
      }
    }
  }
  $(document).ready(function(){
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

    var menuYloc = $(".leftContainer").position().top;
    var temp =1;
    $(window).scroll(function (){
      if(menuYloc <= $(window).scrollTop()){
        $(".leftContainer").css("top","0px");
      }
      if(menuYloc > $(window).scrollTop()){
        $(".leftContainer").css("top",100-$(window).scrollTop()+"px");
      }
      if($(window).scrollTop()>=1261 && temp===1){
        temp =0;
        $('.skillbar').each(function() {
          $(this).find('.skillbarBar').width(0);
        });

        $('.skillbar').each(function() {
          $(this).find('.skillbarBar').animate({
            width: $(this).attr('data-percent')+'%'
          }, 2000);
        });
      }
    });
  });
</script>

</body>
</html>

