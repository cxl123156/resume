<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'changePic.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="<%=basePath%>css/jquery.Jcrop.css" type="text/css" />
<script src="<%=basePath%>js/jquery-2.1.3.js" type="text/javascript"></script>
<script src="<%=basePath%>js/jquery.Jcrop.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/main.js" type="text/javascript"></script>
<script type="text/javascript">
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
			setSelect:[0,200,200,0],
			aspectRatio : 1
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
				var rx1 = 200 / c.w;
				var ry1 = 200 / c.h;
				var rx2 = 100 / c.w;
				var ry2 = 100 / c.h;
				$('#preview1').css({
					width : Math.round(rx1 * boundx) + 'px',
					height : Math.round(ry1 * boundy) + 'px',
					marginLeft : '-' + Math.round(rx1 * c.x) + 'px',
					marginTop : '-' + Math.round(ry1 * c.y) + 'px'
				});
				$('#preview2').css({
					width : Math.round(rx2 * boundx) + 'px',
					height : Math.round(ry2 * boundy) + 'px',
					marginLeft : '-' + Math.round(rx2 * c.x) + 'px',
					marginTop : '-' + Math.round(ry2 * c.y) + 'px'
				});
				$('#width').val(c.w); //c.w 裁剪区域的宽
				$('#height').val(c.h); //c.h 裁剪区域的高
				$('#x').val(c.x); //c.x 裁剪区域左上角顶点相对于图片左上角顶点的x坐标
				$('#y').val(c.y); //c.y 裁剪区域顶点的y坐标</span>
			}
		}
		alert(c.w);
	});


</script>

</head>

<body>
<div class="contentPanel">
	<div id="head">
		<div id="sourceImg">
			<img id="target" src="<%=basePath%>${fileUrl}" onload="AutoResizeImage(400,300,this)">
		</div>

		<div class="preview">
			<img id="preview1"  src="<%=basePath%>${fileUrl}"/>
		</div>
	</div>
	<form id="ulform"  action="<%=basePath%>resumeContext/uploadPic.do" enctype="multipart/form-data" method="post">
		<input type="file" name="file" id="file" value="选择图片" />
		<input id="button" type="submit" class="btn btn-primary" value="点击上传" />
	</form>
	<form action="cutPic.action" method="post">
		点击
		<input type="hidden" name="x" id="x" />
		<input type="hidden" name="y" id="y" />
		<input type="hidden" name="width" id="width" />
		<input type="hidden" name="height" id="height" />
		<input type="hidden" name="sourceFile" value="${fileUrl}">
		<input type="submit" value="确定" class="btn btn-primary" /> ，设置完成。
	</form>
</div>

</body>
</html>
