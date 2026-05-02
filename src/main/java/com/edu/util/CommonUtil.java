package com.edu.util;

import org.apache.commons.lang3.StringUtils;

import java.util.Comparator;
import java.util.Map;
import java.util.TreeMap;

public class CommonUtil {

    public static Map<String, Integer> sortMapByKey(Map<String, Integer> map) {
        if (map == null || map.isEmpty()) {
            return null;
        }
        Map<String, Integer> sortMap = new TreeMap<String, Integer>(new Comparator<String>() {
            @Override
            public int compare(String o1,String o2) {
                return ((String)o1).compareTo((String) o2);
            }
        });
        sortMap.putAll(map);
        return sortMap;
    }

    public static String styleString(String str){//当查询数据的时候，如果数据的长度超过10，可能会让表格不够存放，做一个截取
        if(StringUtils.isEmpty(str)||str.length()<20){
            return str;
        }
        String temp = str.substring(0,20) + "...";
        return temp;
    }

}
