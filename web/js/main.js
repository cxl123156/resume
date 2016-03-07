var temp ="personalInfo";

// jQuery(document).ready(function($){

// 	$(window).load(function(){
// 		$('.personalInfo').fadeIn(400);
// 		$('.toolbar').fadeIn(400);
// 	});
// });

//function load(){
//	myFadeIn(document.getElementById("personalInfo"),0.5);
//	myFadeIn(getElementByClassname("toolbar"),0.5);
//	autoFix();
//}

function inChangeColor(e){
	// console.log(e);
	e.style.backgroundColor="#FFFFFF";
	var i = e.childNodes[1];
	i.style.backgroundColor="#3B5998";
	i.style.color="#FFFFFF";
}
function outChangeColor(e){
	e.setAttribute("style", "");
	var i = e.childNodes[1];
	i.setAttribute("style", "");
}
function fadeout(e){
	var element = document.getElementById(temp);
	myFadeOut(element,0.3);
	temp = e.getAttribute("data-subject");
	setTimeout("myFadeIn(document.getElementById(temp),0.3)",600);

}

function autoFix(){

	var child = getElementByClassname("contentPanel");
	var height = child.offsetHeight;
	var width = child.offsetWidth;
	getElementByClassname("mainContent").style.height=height+"px";
	getElementByClassname("mainContent").style.width=width+"px";
}

jQuery(document).ready(function($){
	$(window).load(function(){
		$('#personalInfo').fadeIn(400);
		$('.toolbar').fadeIn(400);
		autoFix();
	});
	$('.tabs-resume').click(function() {

		$('.skillbar').each(function() {
			$(this).find('.skillbarBar').width(0);
		});

		$('.skillbar').each(function() {
			$(this).find('.skillbarBar').animate({
				width: $(this).attr('data-percent')+"%"
			}, 2000);
		});
	});

});

	function AutoResizeImage(maxWidth,maxHeight,objImg){
		var img = new Image();
		img.src = objImg.src;
		console.log(img.src);
		console.log(img.width);
		var hRatio;
		var wRatio;
		var Ratio = 1;
		var w = img.width;
		var h = img.height;
		wRatio = maxWidth / w;
		hRatio = maxHeight / h;
		if (maxWidth ==0 && maxHeight==0){
			Ratio = 1;
		}else if (maxWidth==0){//
			if (hRatio<1) Ratio = hRatio;
		}else if (maxHeight==0){
			if (wRatio<1) Ratio = wRatio;
		}else if (wRatio<1 || hRatio<1){
			Ratio = (wRatio<=hRatio?wRatio:hRatio);
		}
		if (Ratio<1){
			w = w * Ratio;
			h = h * Ratio;
		}
		objImg.height = h;
		objImg.width = w;
	}

function submit(compareChar,formId,url,targetElementId){
	var projExp = $("#"+formId).serialize();
	var param = encodeParam(projExp,compareChar);
	$.ajax({
		url : url,
		data : {"param" : param},
		type : "POST",
		success:function(data){
			$("#"+targetElementId).html(data);
		}
	})
}