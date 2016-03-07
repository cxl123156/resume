<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/11/20
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>个人资料</title>
<link href="../css/editResume.css" rel="stylesheet" />
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/font-awesome.min.css">
<script src="../js/jquery-2.1.3.js"></script>
<script src="../js/bootstrap.js"></script>
<script type="text/javascript" src="<%=basePath%>js/MyJS.js"></script>
<script type="text/javascript" src="<%=basePath%>js/main.js"></script>
<script src="../js/jquery-validate.js"></script>
<style>
  #editPWD{
    display: none;
  }
  #editPWD ul{
    margin-left: 200px;
  }
  #editPWD ul li {
    margin: 5px auto;
    border-bottom: none !important;
  }
  #personalInfo li{
    margin: 20px auto;
  }
  #manageResume{
    display: none;
  }
</style>
</head>
<body>
<div id="nav">
  <div class="navLeft">
    <h2 class="fa fa-user "></h2>
    <h2 class="username">chen xxxxxxx</h2>

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
    <div class="resumeName">
    </div>
    <div class="column">
      <ul>
        <li onclick="fadeout(this)" data-subject="personalInfo"><a href="#personalInfo"><i class="fa fa-user"></i><label>个人资料</label></a></li>
        <li onclick="fadeout(this)" data-subject="editPWD"><a href="#eduExp"><i class="fa fa fa-key"></i><label>修改密码</label></a></li>
        <li onclick="fadeout(this)" data-subject="manageResume"><a href="#manageResume"><i class="fa fa-paperclip"></i><label>简历管理</label></a></li>
      </ul>
    </div>
  </div>
  <div class="rightContainer" >
    <div id="personalInfo" class="contentPanel" style="height: 400px;">
      <div class="container-fluid">
        <div class="row">
          <div class="tittle" style="margin: 10px;">
            <h2 class=""><b>&nbsp个人资料</b></h2>
            <div class="modify">
              <i class="fa fa-pencil"></i><span>修改</span>
            </div>
            <hr />
          </div>
          <div class="col-md-6 info">
            <ul>
              <li>
                <i class="fa fa-user"></i>
                <label>姓名：</label>
                <span class="value"> ${sessionScope.userVO.user.realName}</span>
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
                <span class="value"> ${sessionScope.userVO.user.college}</span>
              </li>
              <li>
                <i class="fa fa-wrench"></i>
                <label>专业：</label>
                <span class="value"> ${sessionScope.userVO.user.major}</span>
              </li>
              <li>
                <i class="fa fa-graduation-cap"></i>
                <label>学历：</label>
                <span class="value"> ${sessionScope.userVO.user.degree}</span>
              </li>
            </ul>
          </div>
          <div class="col-md-6 info">
            <ul>
              <li>
                <i class="fa fa-home"></i>
                <label>籍贯：</label>
                <span class="value">${sessionScope.userVO.user.nativePlace}</span>
              </li>
              <li>
                <i class="fa fa-phone"></i>
                <label>电话：</label>
                <span class="value"> ${sessionScope.userVO.user.phone}</span>
              </li>
              <li>
                <i class="fa fa-envelope fa-2"></i>
                <label>邮箱：</label>
                <span class="value"> ${sessionScope.userVO.user.email}</span>
              </li>
              <li>
                <i class="fa fa-globe"></i>
                <label>网站：</label>
                                    <span class="value">
                                    <a href="http://www.chenxl.com" target="_blank"> ${sessionScope.userVO.user.webSite}</a>
                                    </span>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div id="editPWD" class="contentPanel">
      <div class="container-fluid">
        <div class="row">
          <div class="tittle" style="margin: 10px;">
            <h2 class=""><b>&nbsp修改密码</b></h2>
            <hr />
          </div>
          <div class="col-md-12 info">
            <form id="editPWDForm" action="<%=basePath%>user/editPWD.do?update=1" >
            <ul>
              <li>
                <i class="fa fa-key"></i>
                <label>当前密码：</label>
                <input id="currentPWD" name="currentPWD" value="" type="password" required>
                <label class="control-label text-danger"></label>
              </li>
              <li>
                <i class="fa fa-key"></i>
                <label>修改密码：</label>
                <input id="password" name="password" value="" type="password" required>
                <label class="control-label text-danger"></label>
              </li>
              <li>
                <i class="fa fa-key"></i>
                <label>确认密码：</label>
                <input name="reTypePassword" value="" type="password" required>
                <label class="control-label text-danger"></label>
              </li>
              <input type="hidden" name="update" value="1">
            </ul>
              <button id="savePWD" type="button" class="btn btn-primary" style="width:100px; margin:10px 0 0 200px">保存</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    <div id="manageResume" class="contentPanel">
      <div class="container-fluid">
        <div class="row">
          <div class="tittle" style="margin: 10px;">
            <h2 class=""><b>&nbsp我的简历</b></h2>
            <hr />
          </div>
          <div class="col-md-12 info">
            <form id="manageResumeForm" action="<%=basePath%>user/editPWD.do?update=1" >
              <ul>
                <li >
                  <div style="display: inline-block">
                    <i class="fa fa-file-text"></i>
                    <label>简历名称：</label>
                    <a><span>JavaEE</span></a>
                  </div>
                  <div  style="display: inline-block; margin-right: -100px;">
                    <span>
                      <i class="fa fa-edit"></i>修改
                    </span>
                    <span>
                      <i class="fa fa-trash"></i>删除
                    </span>
                  </div>
                </li>
                <li >
                  <div style="display: inline-block">
                    <i class="fa fa-file-text"></i>
                    <label>简历名称：</label>
                    <a><span>JavaEE</span></a>
                  </div>
                  <div  style="display: inline-block;  margin-right: -100px;">
                    <span>
                      <i class="fa fa-edit"></i>修改
                    </span>
                    <span>
                      <i class="fa fa-trash"></i>删除
                    </span>
                  </div>
                </li>
              </ul>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div id="foot" class="navbar-fixed-bottom">
  <label>asdasdasddgg</label>
</div>

<script>
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


    $(".modify").click(function(){
      $.ajax({
        url : "<%=basePath%>user/userInfo.do?modify=1",
        dataType : "html",
        type : "post",
        success : function(data){
          console.log(data);
          $("#personalInfo").html(data);
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
    });

    $("#savePWD").click(function () {
      $("#editPWDForm").validate({
        rules: {
          "currentPWD": {
            required: true,
            remote: {
              type: "post",
              url: "<%=basePath%>user/editPWD.do",
              dataType: "json",
              data: {
                   currentPWD: function(){ return $("#currentPWD").val(); },
              }
            }
          },
          "password":{
            required : true,
            minlength:6
          },
          "retypePassword":{
            required : true,
            equalTo:'#password',
            minlength:6
          }
        },
        messages : {
          "currentPWD":{
            required : ' 请输入当前密码',
            remote:'当前密码错误'
          },
        "password":{
          required : ' 请输入新密码',
          minlength:'密码不能小于6位'
          },
    "reTypePassword":{
      required : '请再次输入密码',
              minlength
    :
      '密码不能小于6位',
              equalTo
    :
      '两次输入的密码不一致'
    }
  },
  errorPlacement : function (error, element) {
    console.log(error);
    error.appendTo(element.next());
  }
  });
  if($("#editPWDForm").valid()){
    $("#editPWDForm").submit();
  }

  });

  });
</script>
</body>
</html>

