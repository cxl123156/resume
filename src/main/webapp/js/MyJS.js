/**
 * Created by chen on 2015/11/4.
 */

 function getElementByClassname(sClass){
        var aEle=document.getElementsByTagName('*');
        var aResult=[];
        var re=new RegExp('\\b'+sClass+'\\b', 'i');
        var i=0;
        
        for(i=0;i<aEle.length;i++)
        {
                if(re.test(aEle[i].className))
                {
                        return aEle[i];
                }
        }
}

/*
 *  @params element,time,opacity
 *  elementԪ??id
 *  time????ʱ?䣨?룩
 *  opacity??????͸???Ȳ?????Χ0??100??????
 * */
function myFadeOut(element,time,target){
    var opacity = 100;
    function startFade(){
        return function(){ return opacity = opacity-1; } ;
    }
    var event = setInterval(function(){
        try{
            element.style.opacity=startFade()()/100;
            if(opacity<=0 || opacity<=target){
                if(opacity<=0){
                    element.style.display="none";
                }
                clearInterval(event);
            }
        }
        catch(e){
            clearInterval(event);
        }

    },time*10);
}

function myFadeIn(element,time,target){
    var opacity = 0;

    function startFade(){
        return function(){ return opacity = opacity+1; } ;
    }

    var event = setInterval(function(){
        try{
            element.style.opacity=startFade()()/100;
            element.style.display="block";
            if(opacity>=100 || opacity>=target){
                clearInterval(event);
            }
        }
        catch(e){
            clearInterval(event);
        }
    },time*10);
}