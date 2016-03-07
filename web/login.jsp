<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/11/24
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title></title>
  <script src="<%=basePath%>js/jquery-2.1.3.js"></script>

  <script src="<%=basePath%>js/jquery.terminal-min.js"></script>

  <link href="<%=basePath%>css/jquery.terminal.css" rel="stylesheet"/>
  <style>
    body{
      background: #000000;
      overflow-x: hidden;
      overflow-y: hidden;
    }
    .div1{
      margin:0 auto;
      z-index: 1;
      position:absolute;
      background:rgba(0,0,0,0.8);
      color:#0F0 !important;
      font-family:Lucida Console !important;
      font-size:15px !important;
    }
  </style>
</head>
<body>
<div id="div1" class="div1">

</div>
<canvas id="q">

</canvas>
<script type="text/javascript" >


  $('#div1').terminal(function(command, term) {
            var loginStatus = 0;
            if(command === ""){

            }
            if (command === "login") {
              term.push(function(command,term){

              }, {
                greetings: "You are authenticated",
                login:function(user , passwd ){
                  term.pause();
                  $.ajax({
                    url : "/Resume/login",
                    data :{
                      username:user,
                      password:passwd
                    },
                    dataType: 'text',
                    type: 'POST',
                    success: function(data){
                      loginStatus = 1;
                        console.log(data);
                      if(data){
                          try{
                              var str = data;
                              var obj = $.parseJSON(str);
                              var json = $.parseJSON(obj);
                              if(json.title === "error"){
                                  term.exception(json.text);
                                  term.resume();
                                  term.pop();
                                  term.set_mask(false);
                              }
                          }catch(e){
                              window.location.href="user/login.do";
                              term.resume();
                          }
                      }else{
//                        term.echo("worng password or username");
                        term.exception("worng password or username ");
                        console.log(term.level());
                        term.resume();
                        term.pop();
                        term.set_mask(false);
                      }

                    },
                    error : function(data){
                        console.log("error:");
                      term.error("someting wrong");
                      term.pop();
                      term.set_mask(false);
                      term.resume();
                    }
                  });

                },
                name: 'login',
                exit: false
              });
            }
            if(command != "" && command != "login"){
              term.echo('Unknow command'+command);
            }
          }, { greetings: "My Resume \nKernel 3.10.0-123.el7.x86_64 on an x86_64 \nTips:  use command 'login' to logon my ResumeContext. \n \n" +
  "If you don't have account.\nYou can login with account:guest password:guest123. \n", prompt: '> ', name: "index",exit: false}
  );


  var s = window.screen;
  var width = q.width = s.availWidth;
  var height = q.height = s.availHeight;
  var letters = Array(256).join(1).split('');
  var draw = function () {
    q.getContext('2d').fillStyle='rgba(0,0,0,.05)';
    q.getContext('2d').fillRect(0,0,width,height);
    q.getContext('2d').fillStyle='#0F0';
    letters.map(function(y_pos, index){
      text = String.fromCharCode(34+Math.random()*33);
      x_pos = index * 10;
      q.getContext('2d').fillText(text, x_pos, y_pos);
      letters[index] = (y_pos > 758 + Math.random() * 1e4) ? 0 : y_pos + 10;
    });

  };
  setInterval(draw, 40);

  var div1 = document.getElementById('div1');
  div1.style.width=width/3+"px";
  div1.style.height=height/3+"px";
  div1.style.top = (height-height/3)/2+"px";
  div1.style.left = (width-width/3)/2+"px";

</script>
</body>
</html>
