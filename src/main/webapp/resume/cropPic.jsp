
<%--
  Created by IntelliJ IDEA.
  User: chen9
  Date: 2015/12/21
  Time: 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<c:choose>
  <c:when test="${fileUrl == 'false'}">
    <script>alert("文件格式有误，请上传jpg格式文件！")</script>
  </c:when>
  <c:otherwise>

    <html>
    <head>
      <link rel="stylesheet" href="<%=basePath%>css/jquery.Jcrop.css" type="text/css" />
      <script src="../js/jquery-2.1.3.js" type="text/javascript"></script>
      <script src="../js/jquery.Jcrop.js" type="text/javascript"></script>
      <script src="../js/jquery.form.js" type="text/javascript"></script>

      <script type="text/javascript">
        var img = new Image();
        img.src = "<%=basePath%>${fileUrl}";
        var hRatio;
        var wRatio;
        var Ratio = 1;
        $("#target").onload=function(){
          AutoResizeImage(400,300,$("#target"));
          var w = img.width;
          var h = img.height;
          wRatio = 400 / w;
          hRatio = 300 / h;
          if (wRatio<1 || hRatio<1){
            Ratio = (wRatio<=hRatio?wRatio:hRatio);
          }
          if (Ratio<1){
            w = w * Ratio;
            h = h * Ratio;
          }
          console.log("widht:"+w);
          console.log("height"+h);
          $("#target").height = h;
          $("#target").width = w;
        }
      </script>


    </head>

<body>
<div id="sourceImg">
  <img id="target" src="<%=basePath%>${fileUrl}" onload="">
</div>

<div class="preview">
  <img id="preview1"  src="<%=basePath%>${fileUrl}" />
</div>
<form id="cropedPhotoForm">
  <input type="hidden" name="x" id="x" />
  <input type="hidden" name="y" id="y" />
  <input type="hidden" name="width" id="width" />
  <input type="hidden" name="height" id="height" />
  <input type="hidden" name="sourceFile" id="sourceFile" value="${fileUrl}">
</form>


<script>



  jQuery(document).ready(function($){
    var x;
    var y;
    var width;
    var height;
    $(function() {

      var jcrop_api, boundx, boundy;
      //使原图具有裁剪功能</span>
      $('#target').Jcrop({
        onChange : updatePreview,
        onSelect : updatePreview,
        setSelect:[0,200,200,0]
//      aspectRatio : 1
      }, function() {
        // Use the API to get the real image size
        var bounds = this.getBounds();
        boundx = bounds[0];
        boundy = bounds[1];
        // Store the API in the jcrop_api variable
        jcrop_api = this;
      });
      //裁剪过程中，每改变裁剪大小执行该函数</span>
      function updatePreview(c) {
        if (parseInt(c.w) > 0) {
          var rx1 = 300 / c.w;
          var ry1 = 400 / c.h;
          $('#preview1').css({
            width : Math.round(rx1 * boundx) + 'px',
            height : Math.round(ry1 * boundy) + 'px',
            marginLeft : '-' + Math.round(rx1 * c.x) + 'px',
            marginTop : '-' + Math.round(ry1 * c.y) + 'px'
          });
          $('#width').val(c.w); //c.w 裁剪区域的宽
          $('#height').val(c.h); //c.h 裁剪区域的高
          $('#x').val(c.x); //c.x 裁剪区域左上角顶点相对于图片左上角顶点的x坐标
          $('#y').val(c.y); //c.y 裁剪区域顶点的y坐标</span>
        }
      }
//    alert(c.w);
    });
  });
</script>

</body>
    </html>
  </c:otherwise>
</c:choose>


