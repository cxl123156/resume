<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/12/9
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>注册用户</title>
    <link rel="stylesheet" href="../css/userCSS.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <script src="../js/jquery-2.1.3.js"></script>
    <script src="../js/jquery-validate.js"></script>
    <script src="../js/editResume.js"></script>
    <script src="../js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div id="nav">
    <div class="navLeft">
        <h2 class="fa fa-user "></h2>

        <h2 class="username">chen xxxxxxx</h2>
    </div>
    <div class="navRight">
        <div id="userInfo" class="dropdown">
            <a class="btn btn-primary" href="../login.jsp">登录</a>
        </div>
    </div>
</div>
<div class="mainContainer container">
    <div class="row">
        <div class="col-md-12 tittle">
            <h2 align="center">新用户注册</h2>
        </div>
    </div>
    <form id="regForm" action="<%=basePath%>user/regUser.do">
        <div class="row">
            <div class="col-md-6 userRequire">
                <ul>
                    <li>
                        <label><span>用户名：</span></label>

                        <div>
                            <input id="username" type="text" name="username" value="" required>
                            <label id="codeError" class="control-label text-danger"></label>
                        </div>
                    </li>
                    <li>
                        <label><span>密码：</span></label>

                        <div>
                            <input id="password" type="password" name="password" value="" required>
                            <label class="text-danger"></label>
                        </div>
                    </li>
                    <li>
                        <label><span>确认密码：</span></label>

                        <div>
                            <input type="password" name="retypePassword" value="" required>
                            <label class="text-danger"></label>
                        </div>
                    </li>
                    <li>
                        <label><span>邮箱：</span></label>

                        <div>
                            <input id="email" type="text" name="email" value="" required>
                            <label class="text-danger"></label>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="col-md-6 userInfo">
                <ul>
                    <li>
                        <label><span>年龄：</span></label>

                        <div>
                            <input id="age" type="text" name="age" value="">
                            <label class="text-danger"></label>
                        </div>
                    </li>
                    <li>
                        <label><span>出生日期：</span></label>

                        <div>
                            <input id="birthday" type="text" name="birthday" value="" class="Wdate"
                                   onFocus="WdatePicker({isShowClear:false,readOnly:true})">
                            <label class="text-danger"></label>
                        </div>
                    </li>
                    <li>
                        <label><span>籍贯：</span></label>

                        <div>
                            <input id="nativePlace" type="text" name="nativePlace" value="">
                            <label class="text-danger"></label>
                        </div>
                    </li>
                    <li>
                        <label><span>电话号：</span></label>

                        <div>
                            <input id="phone" type="text" name="phone" value="">
                            <label class="text-danger"></label>
                        </div>
                    </li>
                    <li>
                        <label><span>个人主页：</span></label>

                        <div>
                            <input id="webSite" type="text" name="webSite" value="">
                            <label class="text-danger"></label>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tool">
                    <button type="button" id="register" class="btn btn-primary" width="100px">注册用户</button>
                    <button class="btn btn-default">返回登录</button>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    jQuery(document).ready(function () {
        $("#register").click(function () {
            $("#regForm").validate({
                rules: {
                    "username": {
                        required: true,
                        remote: {
                            type: "post",
                            url: "<%=basePath%>user/validateUsername.do",
                            dataType: "json",
                            data: {
                                username: function () {
                                    return $("#username").val();
                                }
        }
    }
    },
    "password"
    :
    {
        required : true,
                minlength
    :
        6
    }
    ,
    "retypePassword"
    :
    {
        required : true,
                equalTo
    :
        '#password',
                minlength
    :
        6
    }
    ,
    "email"
    :
    {
        required : true,
                email
    :
        true
    }
    ,
    "phone"
    :
    {
        maxlength : 13
    }
    },
    messages : {
        "username"
    :
        {
            required : ' 请输入用户名',
                    remote
        :
            '用户名已存在'
        }
    ,
        "password"
    :
        {
            required : ' 请输入密码',
                    minlength
        :
            '密码不能小于6位'
        }
    ,
        "retypePassword"
    :
        {
            required : '请再次输入密码',
                    minlength
        :
            '密码不能小于6位',
                    equalTo
        :
            '两次输入的密码不一致'
        }
    ,
        "email"
    :
        {
            required : '请输入邮箱',
                    email
        :
            '请输入正确格式的电子邮箱'
        }
    ,
        "phone"
    :
        {
            maxlength : '超出长度范围'
        }
    }
    ,
    errorPlacement : function (error, element) {
        console.log(error);
        error.appendTo(element.next());
    }
    });
    if($("#regForm").valid()){
        $.ajax({
            url: "/Resume/user/regUser.do",
            data: {
                username: $("#username").val(),
                password: $("#password").val(),
                email: $("#email").val(),
                age: $("#age").val(),
                birthday: $("#birthday").val(),
                nativePlace: $("#nativePlace").val(),
                phone: $("#phone").val(),
                webSite: $("#webSite").val(),
            },
            dataType: 'text',
            type:'POST',
            success:function (data) {
                alert(data);
                window.location.href = "<%=basePath%>login.jsp";
            }
        });
    }

    });
 });
</script>
</html>
