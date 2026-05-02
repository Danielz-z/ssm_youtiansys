package system.common.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


public class DateConvertorChinese {
	public static void main(String[] args) {
		String issueDate = "2001-12-30";
//		System.out.println(getYearStr(formatStr(issueDate)));
		System.out.println(new Date().toLocaleString());
	}

	/**
	 * @param date
	 *            日期
	 * @return
	 */
	public static String getDateStr(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String datestr = sdf.format(date);
		return datestr;
	}

	/**
	 * @param date
	 *            日期+时间
	 * @return
	 */
	public static String getDateTimeStr(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String datestr = sdf.format(date);
		return datestr;
	}

	/**
	 * @param str
	 *            日期字符串
	 * @return
	 */
	public static String getYearStr(String str) {
		String yearStr = "";
		yearStr = str.substring(0, 4);
		return yearStr;
	}

	/**
	 * @param str日期字符串
	 * @return
	 */
	public static String getMonthStr(String str) {
		String dateStr;
		int startIndex = str.indexOf("年");
		int endIndex = str.indexOf("月");
		dateStr = str.substring(startIndex + 1, endIndex);
		return dateStr;
	}

	/**
	 *
	 * @param sign
	 *            源字符串中的字符
	 * @return
	 */
	public static char formatDigit(char sign) {
		if (sign == '0')
			sign = '〇';
		if (sign == '1')
			sign = '一';
		if (sign == '2')
			sign = '二';
		if (sign == '3')
			sign = '三';
		if (sign == '4')
			sign = '四';
		if (sign == '5')
			sign = '五';
		if (sign == '6')
			sign = '六';
		if (sign == '7')
			sign = '七';
		if (sign == '8')
			sign = '八';
		if (sign == '9')
			sign = '九';
		return sign;
	}

	/**
	 * @param str
	 *            待转换的源字符串
	 * @param pos1
	 *            第一个'-'的位置
	 * @param pos2
	 *            第二个'-'的位置
	 * @return
	 */
	public static int getMidLen(String str, int pos1, int pos2) {
		return str.substring(pos1 + 1, pos2).length();
	}

	/**
	 * @param str
	 *            待转换的源字符串
	 * @param pos2
	 *            第二个'-'的位置
	 * @return
	 */
	public static int getLastLen(String str, int pos2) {
		return str.substring(pos2 + 1).length();
	}

	/**
	 *
	 * @param str
	 *            日期字符串
	 * @return
	 */
	public static String getDayStr(String str) {
		String dayStr = "";
		int startIndex = str.indexOf("月");
		int endIndex = str.indexOf("日");
		dayStr = str.substring(startIndex + 1, endIndex);
		return dayStr;
	}

	/**
	 * create date:2010-5-22下午03:32:46 描述：格式化日期
	 * @return
	 */
	public static String formatStr(String str) {
		StringBuffer sb = new StringBuffer();
		int pos1 = str.indexOf("-");
		int pos2 = str.lastIndexOf("-");
		for (int i = 0; i < 4; i++) {
			sb.append(formatDigit(str.charAt(i)));
		}
		sb.append('年');
		if (getMidLen(str, pos1, pos2) == 1) {
			sb.append(formatDigit(str.charAt(5)) + "月");
			if (str.charAt(7) != '0') {
				if (getLastLen(str, pos2) == 1) {
					sb.append(formatDigit(str.charAt(7)) + "日");
				}
				if (getLastLen(str, pos2) == 2) {
					if (str.charAt(7) != '1' && str.charAt(8) != '0') {
						sb.append(formatDigit(str.charAt(7)) + "十" + formatDigit(str.charAt(8)) + "日");
					} else if (str.charAt(7) != '1' && str.charAt(8) == '0') {
						sb.append(formatDigit(str.charAt(7)) + "十日");
					} else if (str.charAt(7) == '1' && str.charAt(8) != '0') {
						sb.append("十" + formatDigit(str.charAt(8)) + "日");
					} else {
						sb.append("十日");
					}
				}
			} else {
				sb.append(formatDigit(str.charAt(8)) + "日");
			}
		}
		if (getMidLen(str, pos1, pos2) == 2) {
			if (str.charAt(5) != '0' && str.charAt(6) != '0') {
				sb.append("十" + formatDigit(str.charAt(6)) + "月");
				if (getLastLen(str, pos2) == 1) {
					sb.append(formatDigit(str.charAt(8)) + "日");
				}
				if (getLastLen(str, pos2) == 2) {
					if (str.charAt(8) != '0') {
						if (str.charAt(8) != '1' && str.charAt(9) != '0') {
							sb.append(formatDigit(str.charAt(8)) + "十" + formatDigit(str.charAt(9)) + "日");
						} else if (str.charAt(8) != '1' && str.charAt(9) == '0') {
							sb.append(formatDigit(str.charAt(8)) + "十日");
						} else if (str.charAt(8) == '1' && str.charAt(9) != '0') {
							sb.append("十" + formatDigit(str.charAt(9)) + "日");
						} else {
							sb.append("十日");
						}
					} else {
						sb.append(formatDigit(str.charAt(9)) + "日");
					}
				}
			} else if (str.charAt(5) != '0' && str.charAt(6) == '0') {
				sb.append("十月");
				if (getLastLen(str, pos2) == 1) {
					sb.append(formatDigit(str.charAt(8)) + "日");
				}
				if (getLastLen(str, pos2) == 2) {
					if (str.charAt(8) != '0') {
						if (str.charAt(8) != '1' && str.charAt(9) != '0') {
							sb.append(formatDigit(str.charAt(8)) + "十" + formatDigit(str.charAt(9)) + "日");
						} else if (str.charAt(8) != '1' && str.charAt(9) == '0') {
							sb.append(formatDigit(str.charAt(8)) + "十日");
						} else if (str.charAt(8) == '1' && str.charAt(9) != '0') {
							sb.append("十" + formatDigit(str.charAt(9)) + "日");
						} else {
							sb.append("十日");
						}
					} else {
						sb.append(formatDigit(str.charAt(9)) + "日");
					}
				}
			} else {
				sb.append(formatDigit(str.charAt(6)) + "月");
				if (getLastLen(str, pos2) == 1) {
					sb.append(formatDigit(str.charAt(8)) + "日");
				}
				if (getLastLen(str, pos2) == 2) {
					if (str.charAt(8) != '0') {
						if (str.charAt(8) != '1' && str.charAt(9) != '0') {
							sb.append(formatDigit(str.charAt(8)) + "十" + formatDigit(str.charAt(9)) + "日");
						} else if (str.charAt(8) != '1' && str.charAt(9) == '0') {
							sb.append(formatDigit(str.charAt(8)) + "十日");
						} else if (str.charAt(8) == '1' && str.charAt(9) != '0') {
							sb.append("十" + formatDigit(str.charAt(9)) + "日");
						} else {
							sb.append("十日");
						}
					} else {
						sb.append(formatDigit(str.charAt(9)) + "日");
					}
				}
			}
		}
		return sb.toString();
	}

	/**
	 * date2比date1多的天数
	 * @param date1
	 * @param date2
	 * @return
	 */
	private static int differentDays(Date date1,Date date2) {
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(date1);

		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(date2);
		int day1= cal1.get(Calendar.DAY_OF_YEAR);
		int day2 = cal2.get(Calendar.DAY_OF_YEAR);

		int year1 = cal1.get(Calendar.YEAR);
		int year2 = cal2.get(Calendar.YEAR);
		if(year1 != year2) {//同一年
			int timeDistance = 0 ;
			for(int i = year1 ; i < year2 ; i ++)
			{
				if(i%4==0 && i%100!=0 || i%400==0)    //闰年
				{
					timeDistance += 366;
				}
				else    //不是闰年
				{
					timeDistance += 365;
				}
			}

			return timeDistance + (day2-day1) ;
		} else {// 不同年
			System.out.println("判断day2 - day1 : " + (day2-day1));
			return day2-day1;
		}
	}
}