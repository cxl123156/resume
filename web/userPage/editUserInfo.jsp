<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/12/15
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <script src="../js/My97DatePicker/WdatePicker.js"></script>
  <style>
    #userInfoForm li {
      margin: 25px 0;
    }
    #userInfoForm span{
      height: 20px;
      width: 220px;
    }
    #userInfoForm span input {
      float: left;
    }
    #userInfoForm span label {
      float: left;
      color: #EC1D19;
    }
  </style>
</head>
<body style="background: none">
<div class="tittle" style="margin: 10px;">
  <h2 class="" style="width: auto"><b>&nbsp个人资料</b></h2>
  <div class="modify">
    <i class="fa fa-pencil"></i><span id="saveBTN">保存</span>
  </div>
  <hr />
</div>
<form id="userInfoForm" action="">
  <div class="col-md-6 info">
    <ul>
      <li>
        <i class="fa fa-user"></i>
        <label>姓名：</label>
        <span class="value"><input id="realName" type="text" name="realName" value="${sessionScope.userVO.user.realName}"><label class="control-label text-danger"></label></span>
      </li>
      <li>
        <i class="fa fa-calendar"></i>
        <label>年龄：</label>
        <span class="value"><input id="age" type="text" name="age" value="${sessionScope.userVO.user.age}"><label class="control-label text-danger"></label></span>
      </li>
      <li>
        <i class="fa fa-birthday-cake"></i>
        <label>生日：</label>
        <span class="value"><input id="birthday" class="Wdate" type="text" name="birthday" value="${sessionScope.userVO.birthday}" onfocus="WdatePicker({isShowClear:false,readOnly:true})"><label class="control-label text-danger"></label></span>
      </li>
      <li>
        <i class="fa fa-university"></i>
        <label>毕业院校：</label>
        <span class="value"><input id="college" type="text" name="college" value="${sessionScope.userVO.user.college}"><label class="control-label text-danger"></label></span>
      </li>
      <li>
        <i class="fa fa-wrench"></i>
        <label>专业：</label>
        <span class="value"><input  id="major" type="text" name="major" value="${sessionScope.userVO.user.major}"><label class="control-label text-danger"></label></span>
      </li>
      <li>
        <i class="fa fa-graduation-cap"></i>
        <label>学历：</label>
            <span class="value">
                <input id="degree" type="text" name="degree" value="${sessionScope.userVO.user.degree}">
                <label class="control-label text-danger"></label>
            </span>
      </li>
    </ul>
  </div>
  <div class="col-md-6 info">
    <ul>
      <li>
        <i class="fa fa-home"></i>
        <label>籍贯：</label>
        <span class="value"><input id="nativePlace" type="text" name="nativePlace" value="${sessionScope.userVO.user.nativePlace}"><label class="control-label text-danger"></label></span>
      </li>
      <li>
        <i class="fa fa-phone"></i>
        <label>电话：</label>
        <span class="value"><input id="phone" type="text" name="phone" value="${sessionScope.userVO.user.phone}"><label class="control-label text-danger"></label></span>
      </li>
      <li>
        <i class="fa fa-envelope fa-2"></i>
        <label>邮箱：</label>
        <span class="value"><input id="email" type="text" name="email" value="${sessionScope.userVO.user.email}"><label class="control-label text-danger"></label></span>
      </li>
      <li>
        <i class="fa fa-globe"></i>
        <label>网站：</label>
            <span class="value">
                <input  id="webSite" type="text"  name="webSite" value="${sessionScope.userVO.user.webSite}">
            </span>
      </li>
      <li>
        <a class="btn btn-primary" href="/Resume/user/userInfo.do">取消</a>
      </li>
    </ul>
  </div>
</form>
<script>
  $(document).ready(function(){

    $("#saveBTN").click(function () {
      $("#userInfoForm").validate({
        rules: {
          "realName": {
            required: true
          },
          "age":{
            required : true
          },
          "birthday":{
            required : true
          },
          "college":{
            required :true
          },
          "major":{
            required :true
          },
          "degree":{
            required :true
          },
          "phone":{
            required :true
          },
          "email":{
            required :true
          }
        },
        messages : {
          "realName":{
            required : '请输入真实姓名'
          },
          "age":{
            required : ' 请输入您的年龄'
          },
          "birthday" :{
            required : '请输入您的生日'
          },
          "college" :{
            required : '请输入您的学校'
          },
          "major" :{
            required : '请输入您的专业'
          },
          "degree" :{
            required : '请输入您的学历'
          },
          "phone" :{
            required : '请输入您的电话号'
          },
          "email" :{
            required : '请输入Email'
          }
        },
        errorPlacement : function (error, element) {
          console.log(error);
          error.appendTo(element.next());
        }
      });
      if($("#userInfoForm").valid()){
        $("#userInfoForm").submit();
      }
    });

  });
</script>
</body>
</html>
