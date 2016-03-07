package com.resume.tool;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by chen9 on 2015/12/17.
 */
public class TextHandle {
    /**存放扩展参数，格式为: key1=value1@*@key2=value2 转换为map
     * @param repramas
     * @return
     */
    public Map<String,String> getRepramas(String repramas) {
        Map<String,String> pramasMap=new HashMap<String,String>();
        if (null!=repramas&&!"".equals(repramas)) {
            String[] param=repramas.split("@*@");
            for(String str:param){
                if (null!=str&&!"".equals(str)) {
                    String[] array_str=str.split("=");
                    if(null!=array_str&&array_str.length==2){
                        pramasMap.put(array_str[0], array_str[1]);
                    }
                }
            }
        }
        return pramasMap;
    }

//    public String encodeParams(String params){
//        String[] paramArray = params.split("&");
//        StringBuffer param = new StringBuffer();
//        for(int i=0;i<paramArray.length;i++){
//            String[] temp = paramArray[i].split("=");
//            if(i>0 && i<paramArray.length-1 && temp[0].equals("schoolName") ||  i==paramArray.length-1){
//                paramArray[i] =paramArray[i]+";";
//                param.append(paramArray[i]);
//            }else {
//                paramArray[i] = paramArray[i]+"@*@";
//                param.append(paramArray[i]);
//            }
//        }
//        return param.toString();
//    }
}
