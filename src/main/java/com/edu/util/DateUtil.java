package com.edu.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

public class DateUtil {
    private static Date getDateAdd(int days){
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DAY_OF_MONTH, -days);
        return c.getTime();
    }
    public static List<String> getDaysBetwwen(int days){ //最近几天日期
        List<String> dayss = new ArrayList<String>();
        Calendar start = Calendar.getInstance();
        start.setTime(getDateAdd(days));
        Long startTIme = start.getTimeInMillis();
        Calendar end = Calendar.getInstance();
        end.setTime(new Date());
        Long endTime = end.getTimeInMillis();
        Long oneDay = 1000 * 60 * 60 * 24l;
        Long time = startTIme;
        while (time <= endTime) {
            Date d = new Date(time);
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            dayss.add(df.format(d));
            time += oneDay;
        }
        return dayss;
    }

    public static String[] getDaysBetwwenShuzu(int days){ //最近几天日期
        String[] dates = new String[days];
        Calendar start = Calendar.getInstance();
        start.setTime(getDateAdd(days));
        Long startTIme = start.getTimeInMillis();
        Calendar end = Calendar.getInstance();
        end.setTime(new Date());
        Long endTime = end.getTimeInMillis();
        Long oneDay = 1000 * 60 * 60 * 24l;
        Long time = startTIme;
        int i = 0;
        while (time + 1000 <= endTime) {
            time += oneDay;
            Date d = new Date(time);
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            dates[i] = df.format(d);
            i++;
        }
        return dates;
    }

    /**
     * 获取最近12个月月份
     */
    public static String[] getOneMonth() {
        String[] months = new String[12];
        List<String> monthList = new ArrayList<String>();
        Calendar calendar = Calendar.getInstance();
        //1号就从上个月开始算
        int num = 1;
        if (isFirstDayOfMonth(calendar)){
            num = 0;
        }
        calendar.set(Calendar.MONTH,calendar.get(Calendar.MONTH)+num);
        for (int i = 0; i < 12; i++) {
            calendar.add(Calendar.MONTH, -1);//1个月前
            String month = calendar.get(Calendar.YEAR)+"-"+fillZero(calendar.get(Calendar.MONTH)+1);
            monthList.add(month);
        }
        int i = 0;
        Collections.reverse(monthList);
        for(String month : monthList){
            months[i] = month;
            i++;
        }
        return months;
    }

    /**
     * 判断今天是否是1号
     * @param calendar  日历对象
     * @return          是否第一天
     */
    public static boolean isFirstDayOfMonth(Calendar calendar){
        calendar.setTime(new Date());
        calendar.set(Calendar.DATE,calendar.get(Calendar.DATE)+1);
        if(calendar.get(Calendar.DAY_OF_MONTH) == 2){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 格式化月份
     */
    public static String fillZero(int i){
        String month = "";
        if(i<10){
            month = "0" + i;
        }else{
            month = String.valueOf(i);
        }
        return month;
    }

    public static void main(String[] args) {
        System.out.println(getOneMonth());
    }
}
