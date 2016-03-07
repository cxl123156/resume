/**
 * Created by chen9 on 2015/12/8.
 */
function deleteElement(obj){
    obj.parent().parent().parent().remove();
}

function newDeleteElement(obj){
    console.log( obj.prev());
    obj.parent().parent().remove();
}

function encodeParam(sourceParam,compareChar){
    var param ="";
    if(sourceParam!=null && sourceParam!=""){
        var paramArray = sourceParam.split("&");
        for(var i = 0; i<paramArray.length;i++){
            if(i>0 && i<paramArray.length-1 && paramArray[i+1].split("=")[0]===compareChar ||  i==paramArray.length-1){
                paramArray[i] =paramArray[i]+";";
                param=param+paramArray[i];
            }else {
                paramArray[i] = paramArray[i]+"@*@";
                param=param+paramArray[i];
            }
        }
    }
    return param;
}

var eduElementCount =1;
var workElementCount =1;
var projElementCount =1;
var rewardCount =1;
var foreignLanguageCount =1;
var certificationCount =1;
var skillsCount =1;
var inSchoolActiveCount = 1;
function add(element,obj){


    var eduElement = "<div style='margin: 25px 0; padding: 5px 5px; background: rgba(134, 245, 89, 0.41);'>"+
            "<div align='right'> <a title='删除' style=' cursor: pointer;' onclick='newDeleteElement($(this))'> <i class='fa fa-times' style='font-size: 23px;' ></i> </a> </div>"+
        "<ul id='"+eduElementCount+"' style='margin-bottom: 30px; border-bottom: solid 1px gray;'> " +
        "<li> <h5>学校名称：<input name='schoolName' type='text' value=''>"+
        "<span class='duration'>"+
        "<i class='fa fa-calendar'></i>"+
        "入学时间：<input name='startTime' type='text' value='' class='Wdate' onFocus='WdatePicker({isShowClear:false,readOnly:true})'>--毕业时间：<input name='endTime' type='text' value='' class='Wdate' onFocus='WdatePicker({isShowClear:false,readOnly:true})'>"+
        "</span>"+
        "</h5>"+
        "<h6 class='color'>"+
        "<span class='fa fa-book color'>"+
        "</span>"+
        "学历：<select name='degree'>"+
        "<option value=''>选择学历</option>"+
        "<option value='初中'>初中</option>"+
        "<option value='高中'>高中</option>"+
        "<option value='本科'>本科</option>"+
        "<option value='硕士'>硕士</option>"+
        "<option value='博士'>博士</option>"+
        "</select>"+
        "<span class='major'>专业：<input type='text' name='major' value=''/></span>"+
        "</h6>"+
        "<p>"+
        "专业介绍："+
        "<textarea name='majorReview' rows='5'></textarea>"+
        "</p>"+
        "</li>"+
        "</ul></div>";
    var workElement =  "<div style='margin: 25px 0; padding: 5px 5px; background: rgba(134, 245, 89, 0.41);'>"+
        "<div align='right'> <a title='删除' style=' cursor: pointer;' onclick='newDeleteElement($(this))'> <i class='fa fa-times' style='font-size: 23px;' ></i> </a> </div>"+
        "<ul id='"+workElementCount+"' style='margin-bottom: 30px; border-bottom: solid 1px gray;'>" +
        "<li> <h5>公司名称:<input type='text' name='company' value=''>"+
        "<span class='duration'><i class='fa fa-calendar'></i>"+
        "工作时间：<input type='text' name='startTime' value='' class='Wdate' onFocus='WdatePicker({isShowClear:false,readOnly:true})'>--<input type='text' name='endTime' value='' class='Wdate' onFocus='WdatePicker({isShowClear:false,readOnly:true})'>"+
        "</span></h5><h6 class='color'> <span class='fa fa-user color'> </span>"+
        "职位：<input name='job' type='text' value=''>"+
        "</h6><p>主要职责:<textarea name='duty' rows='5'></textarea> </p> </li> </ul></div>";

    var projElement = "<div style='margin: 25px 0; padding: 5px 5px; background: rgba(134, 245, 89, 0.41);'>"+
        "<div align='right'> <a title='删除' style=' cursor: pointer;' onclick='newDeleteElement($(this))'> <i class='fa fa-times' style='font-size: 23px;' ></i> </a> </div>"+
        "<ul id='"+projElementCount+"' style='margin-left: 0px; margin-bottom: 60px; border-bottom: solid 1px gray;'>"+
        "<li><h5> 项目名称：<input type='text' name='projName' value=''/>"+
        "<span class='duration'> <i class='fa fa-calendar'></i>"+
        "起始时间：<input type='text' name='startTime' value='' class='Wdate' onFocus='WdatePicker({isShowClear:false,readOnly:true})'>--<input type='text' name='endTime' value='' class='Wdate' onFocus='WdatePicker({isShowClear:false,readOnly:true})'>"+
        "</span> </h5> <h6 class='color'> <span class='fa fa-wrench color'> </span>"+
        "项目环境:<input value='' name='environment'> </h6> 项目描述："+
        "<p> <textarea name='projDescribe' rows='5'></textarea> </p> </li> </ul></div>";

    var reward ="<ul ul id='"+rewardCount+"' style='clear:both; margin-left: 0px; display: block; float:left'> <li> <p>"+
        "奖项名称：<input type='text' name='reward' value=''> "+
        "<a id='"+rewardCount+"' style='color: red; cursor: pointer;' onclick='deleteElement("+rewardCount+",$(this))'><i class='fa fa-times' style='margin-left: 10px;'></i></a> </p>"+
        "<span class='duration' style='float: left;'>"+
        " 获奖时间：<input type='text' name='rewardTime' value='' class='Wdate' onFocus='WdatePicker({isShowClear:false,readOnly:true})'>"+
        "</span> </li> </ul> ";

    var foreignLanguage = "<ul style='float:left;' id='"+foreignLanguageCount+"'> " +
        "<li style='float: left'> <p>证书名称：<input name='foreignLanguage' value='' type='text'><a title='删除' style=' cursor: pointer; margin-left: 20px' onclick='newDeleteElement($(this))'> <i class='fa fa-times' ></i> </a></p>  "+
        "<span class='duration' style='float: left'> "+
        "获得时间：<input type='text' name='getTime' value='' class='Wdate' onFocus='WdatePicker({isShowClear:false,readOnly:true})'>"+
        "</span> <p style='float: left'>证书介绍："+
        "<textarea name='describe' rows='5'></textarea>"+
        "</p> </li> </ul>";

    var certification ="<ul id='"+certificationCount+"'style='clear:both; margin-left: 0px; display: block; float:left'> <li> <p>"+
        "证书名称:<input type='text'' name='certification' value=''> " +
        "<a id='"+certificationCount+"' style='color: red; cursor: pointer;' onclick='deleteElement("+certificationCount+",$(this))'><i class='fa fa-times' style='margin-left: 10px;'></i></a> </p>"+
        "<span class='duration' style='float: left'>"+
        "获得时间:<input name='getTime' value='' type='text' class='Wdate' onFocus='WdatePicker({isShowClear:false,readOnly:true})'>"+
        "</span>  </li> </ul>";
    var skills = "<ul style='margin-left: 0px; display: inline-block;' id='"+skillsCount+"'> <li style='float: left'>"+
        "<span class='duration' style='float: left; margin-bottom: 10px;'>技能名称：<input type='text'' name='skillName' value=''> </span>"+
        "<a id='"+skillsCount+"' style='color: red; cursor: pointer;' onclick='deleteElement("+skillsCount+",$(this))'><i class='fa fa-times' style='margin-left: 10px;'></i></a>"+
        "<span class='duration' style='float: left; margin-bottom: 10px;'>熟练程度：<input type='text'' name='proficiency' value=''></span>"+
        "</li> </ul>";
    var inSchoolActive = "<div style='margin: 25px 0; padding: 5px 5px; background: rgba(134, 245, 89, 0.41);'>"+
        "<div align='right'> <a title='删除' style=' cursor: pointer;' onclick='newDeleteElement($(this))'> <i class='fa fa-times' style='font-size: 23px;' ></i> </a> </div>"+
        "<ul id='"+inSchoolActiveCount+"'> " +
        "<li> <h5>参加的活动或社团：<input type='text' name='activeName' value=''>"+
        "<span class='duration'> <i class='fa fa-calendar'></i>"+
        "起止时间：<input value='' name='startTime' type='text' class='Wdate' onFocus='WdatePicker({isShowClear:false,readOnly:true})'>--<input value='' name='endTime' type='text' class='Wdate' onFocus='WdatePicker({isShowClear:false,readOnly:true})'>"+
        "</span> </h5> 负责内容：<p>"+
        "<textarea rows='5' name='describe'></textarea>"+
        "</p> </li> </ul></div>";

    if(element === "eduExp"){
        $("#EduExp").find(".info").append(eduElement);
        eduElementCount++;
    }
    if(element === "workExp"){
        $("#WorkExp").find(".info").append(workElement);
        workElementCount++;
    }
    if(element === "projExp"){
        $("#ProjExp").find(".info").append(projElement);
        projElementCount++;
    }
    if(element === "reward"){
        obj.before(reward);
        rewardCount++;
    }
    if(element === "certification"){
        obj.before(certification);
        certificationCount++;
    }
    if(element === "foreignLanguage"){
        obj.before(foreignLanguage);
        foreignLanguageCount++;
    }
    if(element === "skills"){
        $(".skills").append(skills);
        skillsCount++;
    }
    if(element === "inSchoolActive"){
        $("#InSchoolActive").find(".info").append(inSchoolActive);
        inSchoolActiveCount++;
    }
}