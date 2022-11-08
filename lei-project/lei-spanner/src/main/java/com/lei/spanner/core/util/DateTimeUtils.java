package com.lei.spanner.core.util;


import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * 时间、日期处理公共类
 *
 * @author Ivan Lee
 * @date 2017-12-11
 */

public class DateTimeUtils {

    /**
     * 默认的日期格
     */
    public static String DEFAULT_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";

    public static String FULL_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";

    public static String YYYY_MM_DD = "yyyy-MM-dd";
    public static String YYYY_MM = "yyyy-MM";
    public static String MM_DD = "MM月dd日";

    public static String Y_M_D = "yyyy年MM月dd日";

    public static String Y_M = "yyyy年MM月";

    public static String Y = "yyyy年";

    public static String YYYYMMDDSlantLine = "yyyy/MM/dd";

    SimpleDateFormat sDateFormat = new SimpleDateFormat("yyyy-MM-dd");

    SimpleDateFormat sFullFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static final String DATE_SEPARATOR = "-/";

    public final static String YYYY = "yyyy";

    /**
     * 取得当前日期
     *
     * @return Date 当前日期
     */
    public static Date getCurrentDate() {
        return new Date(System.currentTimeMillis());
    }

    /**
     * 返回当前日期对应的默认格式的字符，默认格式：yyyy-MM-dd HH:mm:ss
     *
     * @return String 当前日期对应的字符串，默认格式：yyyy-MM-dd HH:mm:ss
     */
    public static String getCurrentStringDate() {
        return convertDate2String(getCurrentDate(), DEFAULT_DATE_FORMAT);
    }

    public static Date formatDate(Date date, String pattern) {
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        String format1 = format.format(date);
        try {
            Date d = format.parse(format1);
            return d;
        }
        catch (ParseException px) {
            px.printStackTrace();
        }
        return date;
    }

    public static String getStrDate(Date date, String pattern) {
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        String format1 = format.format(date);
        return format1;
    }

    /**
     * 返回当前日期对应的指定格式的字符
     *
     * @param dateFormat - 日期格式
     * @return String 当前日期对应的字符串
     */
    public static String getCurrentStringDate(String dateFormat) {
        return convertDate2String(getCurrentDate(), dateFormat);
    }

    /**
     * 将日期转换成指定格式的字符串
     *
     * @param date       - 要转换的日期
     * @param dateFormat - 日期格式
     * @return String 日期对应的字符串
     */
    public static String convertDate2String(Date date, String dateFormat) {
        SimpleDateFormat sdf = null;
        if (dateFormat != null && !dateFormat.equals("")) {
            try {
                sdf = new SimpleDateFormat(dateFormat);
            }
            catch (Exception e) {
                e.printStackTrace();
                sdf = new SimpleDateFormat(DEFAULT_DATE_FORMAT);
            }
        }
        else {
            sdf = new SimpleDateFormat(DEFAULT_DATE_FORMAT);
        }
        return sdf.format(date);
    }

    public static String getFirstDayOfNextMonth(String dateStr, String format) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        try {
            Date date = sdf.parse(dateStr);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            calendar.set(Calendar.DAY_OF_MONTH, 1);
            calendar.add(Calendar.MONTH, 1);
            return sdf.format(calendar.getTime());
        }
        catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * 将日期转换成默认格式的字符串，默认格式：yyyy-MM-dd HH:mm:ss
     *
     * @param date - 要转换的日期
     * @return String 日期对应的字符串，格式yyyy-MM-dd HH:mm:ss
     */
    public static String convertDate2String(Date date) {
        SimpleDateFormat sdf = null;
        sdf = new SimpleDateFormat(DEFAULT_DATE_FORMAT);
        return sdf.format(date);
    }

    /**
     * 将字符串转换成日，使用默认格式转化，默认格式：yyyy-MM-dd HH:mm:ss
     *
     * @param stringDate - 要转换的字符串格式的日期
     * @return Date 字符串对应的日期
     */
    public static Date convertString2Date(String stringDate) {
        return convertString2Date(stringDate, DEFAULT_DATE_FORMAT);
    }

    /**
     * 将时间字符串按照指定的格式转换成日期
     *
     * @param stringDate - 要转换的字符串格式的日期
     * @param dateFormat - 要转换的字符串对应的日期格式
     * @return Date 字符串对应的日期
     */
    public static Date convertString2Date(String stringDate, String dateFormat) {
        SimpleDateFormat sdf = null;
        if (dateFormat != null && !dateFormat.equals("")) {
            try {
                sdf = new SimpleDateFormat(dateFormat);
            }
            catch (Exception e) {
                e.printStackTrace();
                sdf = new SimpleDateFormat(DEFAULT_DATE_FORMAT);
            }
        }
        else {
            sdf = new SimpleDateFormat(DEFAULT_DATE_FORMAT);
        }
        try {
            return sdf.parse(stringDate);
        }
        catch (ParseException pe) {
            pe.printStackTrace();
            return new Date(System.currentTimeMillis());
        }
    }

    /**
     * 将时间转化为 年-月-日 00:00:00    2020-6-12 12:12:12 转成 2020-6-12 00:00:00
     *
     * @param date
     * @return
     */
    public static Date convertDateToZero(Date date) {
        try {
            Calendar now = Calendar.getInstance();
            now.setTime(date);
            now.set(Calendar.HOUR_OF_DAY, 0);
            now.set(Calendar.MINUTE, 0);
            now.set(Calendar.SECOND, 0);
            now.set(Calendar.MILLISECOND, 0);
            return now.getTime();
        }
        catch (Exception e) {
            e.printStackTrace();
            return new Date();
        }
    }

    /**
     * 将一种格式的日期字符串转换成默认格式的日期字符串
     *
     * @param oldStringDate - 要格式化的日期字符串
     * @param oldFormat     - 要格式化的日期的格式
     * @return String 格式化后的日期字符串，格式yyyy-MM-dd HH:mm:ss
     */
    public static String formatStringDate(String oldStringDate, String oldFormat) {
        return convertDate2String(convertString2Date(oldStringDate, oldFormat), DEFAULT_DATE_FORMAT);
    }

    /**
     * 将一种格式的日期字符串转换成另一种格式的日期字符
     *
     * @param oldStringDate - 要格式化的日期字符串
     * @param oldFormat     - 要格式化的日期的格式
     * @param newFormat     - 格式化后的日期的格式
     * @return String 格式化后的日期字符串
     */
    public static String formatStringDate(String oldStringDate, String oldFormat, String newFormat) {
        return convertDate2String(convertString2Date(oldStringDate, oldFormat), newFormat);
    }


    /**
     * 根据年份和月份判断该月有几天
     *
     * @param year  - 年份
     * @param month - 月份
     * @return int 指定年月的天数
     */
    public static int days(int year, int month) {
        int total = 30;
        switch (month) {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                total = 31;
                break;
            case 2:
                if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) { total = 29; }
                else { total = 28; }
                break;
            default:
                break;
        }
        return total;
    }

    private static final String datePattern1 = "\\d{4}\\d{2}\\d{2}";

    private static final String datePattern3 = "^((((1[6-9]|[2-9]\\d)\\d{2})(0?[13578]|1[02])(0?[1-9]|[12]\\d|3[01]))|(((1[6-9]|[2-9]\\d)\\d{2})(0?[13456789]|1[012])(0?[1-9]|[12]\\d|30))|(((1[6-9]|[2-9]\\d)\\d{2})0?2(0?[1-9]|1\\d|2[0-8]))|(((1[6-9]|[2-9]\\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))0?2-29))$";

    /**
     * 判断是否是有效的日期 1.位数8 2.年份大于1900 3.格式yyyyMMdd
     */
    public static boolean isValidDate(String sDate) {
        if ((sDate != null)) {
            if (sDate.trim().length() != 8) { return false; }
            Pattern pattern = Pattern.compile(datePattern1);
            Matcher match = pattern.matcher(sDate);
            if (match.matches()) {
                pattern = Pattern.compile(datePattern3);
                match = pattern.matcher(sDate);
                return match.matches();
            }
            else {
                return false;
            }
        }
        return false;
    }


    /**
     * 判断是否是有效的日期 1.位数8 2.年份大于1900 3.格式yyyy-MM-dd HH:mm
     */
    private static final String datePattern2 = "^[1-2][0-9][0-9][0-9]-([1][0-2]|0?[1-9])-([12][0-9]|3[01]|0?[1-9]) ([01][0-9]|[2][0-3]):[0-5][0-9]$";

    public static boolean validateTime(String sDate) {
        if ((sDate != null)) {
            Pattern pattern = Pattern.compile(datePattern2);
            Matcher match = pattern.matcher(sDate);
            if (match.matches()) {
                return match.matches();
            }
            else {
                return false;
            }
        }
        return false;
    }

    /**
     * /**
     * 得到指定日期的前后日  +为后 -为前
     *
     * @param dateStr 字符串格式的时间
     * @param day_i   偏移量 +为后 -为前
     * @param format  用于进行字符串转时间的格式
     * @return 偏移后的日期字符串
     */
    public static final String getOffsetDateString(String dateStr, int day_i, String format) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat(format);
            Date date = sdf.parse(dateStr);
            Calendar day = Calendar.getInstance();
            day.setTime(date);
            day.add(Calendar.DATE, day_i);
            return sdf.format(day.getTime());
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 得到指定日期的前后日期
     *
     * @param day_i 偏移量 +为后 -为前
     * @param date  指定日期
     * @return
     */
    public static final String getOffsetDateString(Date date, int day_i) {
        try {
            Calendar day = Calendar.getInstance();
            day.setTime(date);
            day.add(Calendar.DATE, day_i);
            return String.valueOf(day.getTime().getTime());
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 得到指定日期的前后日期
     *
     * @param day_i 偏移量 +为后 -为前
     * @param date  指定日期
     * @return
     */
    public static final Date getOffsetDate(Date date, int day_i) {
        Calendar day = Calendar.getInstance();
        day.setTime(date);
        day.add(Calendar.DATE, day_i);
        return day.getTime();
    }


    /**
     * 得到指定秒的前后日期
     *
     * @param second_i 偏移量 +为后 -为前
     * @param date     指定日期
     * @return
     */
    public static final Date getOffsetSecond(Date date, int second_i) {
        Calendar day = Calendar.getInstance();
        day.setTime(date);
        day.add(Calendar.SECOND, second_i);
        return day.getTime();
    }


    /**
     * 得到指定日期的前后日期
     *
     * @param day_i 偏移量 +为后 -为前
     * @param date  指定日期
     * @return
     */
    public static final Date getOffMonthsetDate(Date date, int day_i) {
        Calendar day = Calendar.getInstance();
        day.setTime(date);
        day.add(Calendar.MONTH, day_i);
        return day.getTime();
    }

    /**
     * 得到指定日期的前后日期
     *
     * @param day_i 偏移量 +为后 -为前
     * @param date  指定日期
     * @return
     */
    public static final Date getOffYearsetDate(Date date, int day_i) {
        Calendar day = Calendar.getInstance();
        day.setTime(date);
        day.add(Calendar.YEAR, day_i);
        return day.getTime();
    }

    public static final Date getOffMonthAndDaySetDate(Date date, int month, int dayOfMonth) {
        Calendar day = Calendar.getInstance();
        day.setTime(date);
        day.add(Calendar.MONTH, month);
        day.add(Calendar.DAY_OF_MONTH, dayOfMonth);
        return day.getTime();
    }

    /**
     * 获取当前时间与给定的时间戳时间之间相差的秒数
     *
     * @param begintime 指定的时间戳
     * @return 秒数，单位秒
     */
    public static long getRuntime(long begintime) {
        return ((System.currentTimeMillis() - begintime)) / 1000;
    }


    /**
     * 取当前小时数 24
     *
     * @return
     */
    public static int getCurrentHour24() {
        Calendar cal = Calendar.getInstance();
        return cal.get(Calendar.HOUR_OF_DAY);
    }

    /**
     * 取当前系统分钟数
     *
     * @return
     */
    public static int getCurrentMin() {
        Calendar cal = Calendar.getInstance();
        return cal.get(Calendar.MINUTE);
    }


    /**
     * 检查time是否在start和end之间
     *
     * @param start
     * @param end
     * @param time
     * @return 在两者之间为ture，否则为false
     */
    public static boolean isInPeriod(Date start, Date end, Date time) {
        if (start == null || end == null) { return true; }
        if (start.after(time)) { return false; }
        return !time.after(end);
    }

    /**
     * 计算两个日期之间相差的月数，date2要大于date1
     *
     * @param date1 <String>
     * @param date2 <String>
     * @return int
     *
     * @throws ParseException
     */
    public static int monthsBetween(Date date1, Date date2) {

        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();
        c1.setTime(date1);
        c2.setTime(date2);
        int year1 = c1.get(Calendar.YEAR);
        int year2 = c2.get(Calendar.YEAR);
        int month1 = c1.get(Calendar.MONTH);
        int month2 = c2.get(Calendar.MONTH);
        int day1 = c1.get(Calendar.DAY_OF_MONTH);
        int day2 = c2.get(Calendar.DAY_OF_MONTH);
        // 获取年的差值 
        int yearInterval = year1 - year2;
        // 如果 d1的 月-日 小于 d2的 月-日 那么 yearInterval-- 这样就得到了相差的年数
        if (month1 < month2 || month1 == month2 && day1 < day2) { yearInterval--; }
        // 获取月数差值
        int monthInterval = (month1 + 12) - month2;
        if (day1 < day2) { monthInterval--; }
        monthInterval %= 12;
        int monthsDiff = Math.abs(yearInterval * 12 + monthInterval);
        return monthsDiff;
    }


    /**
     * 计算两个日期之间相差的天数，date2要大于date1
     *
     * @param date1
     * @param date2
     * @return
     */
    public static int daysBetween(Date date1, Date date2) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            date1 = dateFormat.parse(dateFormat.format(date1));
            date2 = dateFormat.parse(dateFormat.format(date2));
        }
        catch (ParseException e) {
            e.printStackTrace();
        }

        Calendar cal = Calendar.getInstance();
        cal.setTime(date1);
        long time1 = cal.getTimeInMillis();
        cal.setTime(date2);
        long time2 = cal.getTimeInMillis();
        long between_days = (time2 - time1) / (1000 * 3600 * 24);

        return Integer.parseInt(String.valueOf(between_days));
    }


    /**
     * 两个日期之间相差的小时数
     *
     * @param date1
     * @param date2
     * @return
     */
    public static int hoursBetween(Date date1, Date date2) {
        long time1 = date1.getTime();
        long time2 = date2.getTime();
        long between_hours = (time2 - time1) / (1000 * 3600);

        return Integer.parseInt(String.valueOf(between_hours));
    }

    /**
     * 两个日期之间相差的分钟数
     *
     * @param date1
     * @param date2
     * @return
     */
    public static long minsBetween(Date date1, Date date2) {
        long time1 = date1.getTime();
        long time2 = date2.getTime();
        long between_mins = (time2 - time1) / (1000 * 60);
        return between_mins;
    }


    /**
     * 获取当月的第一天
     *
     * @param year            年，取值如2018
     * @param month，月份，取值1-12
     * @return 当月第一天，格式yyyy-MM-dd
     */
    public static String getFirstDayOfMonth(int year, int month) {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month - 1);
        cal.set(Calendar.DAY_OF_MONTH, cal.getMinimum(Calendar.DATE));
        return new SimpleDateFormat("yyyy-MM-dd ").format(cal.getTime());
    }


    /**
     * 获取当月的第一天
     *
     * @param year            年，取值如2018
     * @param month，月份，取值1-12
     * @return 当月第一天，格式yyyy-MM-dd
     */
    public static String getFirstDayStringOfMonth(int year, int month) {
        Date firstDayDate = getFirstDayDateOfMonth(year, month);
        return new SimpleDateFormat("yyyy-MM-dd ").format(firstDayDate);
    }


    /**
     * 获取当月的第一天
     *
     * @param year            年，取值如2018
     * @param month，月份，取值1-12
     * @return 当月第一天，格式为时间
     */
    public static Date getFirstDayDateOfMonth(int year, int month) {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month - 1);
        cal.set(Calendar.DAY_OF_MONTH, cal.getMinimum(Calendar.DATE));
        return cal.getTime();
    }

    /**
     * 获取当月的最后一天
     *
     * @param year  年，取值如2018
     * @param month 月份，取值1-12
     * @return 当月最后一天，格式yyyy-MM-dd
     */
    public static String getLastDayStringOfMonth(int year, int month) {
        Date lastDayDate = getLastDayDateOfMonth(year, month);
        return new SimpleDateFormat("yyyy-MM-dd").format(lastDayDate);
    }

    /**
     * 获取当月的最后一天
     *
     * @param year  年，取值如2018
     * @param month 月份，取值1-12
     * @return 当月最后一天，时间格式
     */
    public static Date getLastDayDateOfMonth(int year, int month) {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month - 1);
        cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DATE));
        return cal.getTime();
    }


    /**
     * 两个时间段startDate1-endDate1 和startDate2-endDate2，是否存在相交可能
     *
     * @param startDate1
     * @param endDate1
     * @param startDate2
     * @param endDate2
     * @return 相交则返回true，否则false
     */
    public static boolean checkTwoTimeIntersect(Date startDate1, Date endDate1, Date startDate2, Date endDate2) {
        long startTime1 = startDate1.getTime();
        long startTime2 = startDate2.getTime();
        long endTime1 = endDate1.getTime();
        long endTime2 = endDate2.getTime();

        if (startTime2 > startTime1 && startTime2 < endTime1) {
            return true;
        }
        if (startTime1 > startTime2 && startTime1 < endTime2) {
            return true;
        }

        if (startTime2 < startTime1 && endTime2 > endTime1) {
            return true;
        }

        return startTime1 < startTime2 && endTime1 > endTime2;
    }


    /**
     * 格式化时间startTime和endTime的 时间差，用于朋友圈等地方显示发布时间。例如“45分前”等
     *
     * @param endTime ：发布时间
     * @return 格式化的时间显示字符
     */
    public static String getFriendlyTime(Date startTime, Date endTime) {
        long betweenTime = (endTime.getTime() - startTime.getTime()) / 1000;
        if (betweenTime < 0) {
            //return startTimeStr.toLocaleString();
            return DateTimeUtils.convertDate2String(startTime, "yyyy年MM月dd日");
        }
        if (betweenTime / (60 * 60 * 24 * 365) > 0) {
            //大于1年
            return DateTimeUtils.convertDate2String(startTime, "yyyy年MM月dd日");
        }
        if (betweenTime / (60 * 60 * 24) > 0) {
            //大于一天
            return DateTimeUtils.convertDate2String(startTime, "MM月dd日");
        }
        if (betweenTime / (60 * 60) > 0) {
            //大于1小时
            return betweenTime / (60 * 60) + "小时前";
        }
        if (betweenTime / (60) > 0) {
            //大于一分钟
            return betweenTime / (60) + "分钟前";
        }
        //小于一分钟
        return "刚刚";
    }

    /**
     * 格式化date时间与当前时间差，用于朋友圈等地方显示发布时间。例如“45分前”等
     *
     * @param date ：发布时间
     * @return 格式化的时间显示字符
     */
    public static String getFriendlyTime(Date date) {
        return getFriendlyTime(date, new Date());
    }

    /**
     * 判断某个时间是否已过期
     *
     * @param d1           需要比较的时间
     * @param expireSecond 过期时间，s
     * @return
     */
    public static boolean isExpire(Date d1, int expireSecond) {

        Calendar cal = Calendar.getInstance();
        cal.setTime(d1);
        cal.add(Calendar.SECOND, expireSecond);
        Date d2 = cal.getTime();

        return new Date().compareTo(d2) > 0;
    }

    /**
     * 判断当前日期是星期几
     *
     * @param pTime 修要判断的时间
     * @return dayForWeek 判断结果
     *
     * @Exception 发生异常
     */
    public static int dayForWeek(Date pTime) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String str = format.format(pTime);
        Calendar c = Calendar.getInstance();
        try {
            c.setTime(format.parse(str));
        }
        catch (ParseException e) {
            e.printStackTrace();
        }
        int dayForWeek = 0;
        if (c.get(Calendar.DAY_OF_WEEK) == 1) {
            dayForWeek = 7;
        }
        else {
            dayForWeek = c.get(Calendar.DAY_OF_WEEK) - 1;
        }
        return dayForWeek;
    }

    /**
     * 格式化时间的小时（24小时制），分钟默认为0分，秒默认为0秒
     *
     * @param date 时间
     * @param hour 要修改的小时（24小时制）
     * @return
     */
    public static Date resetTimeForHour(Date date, int hour) {
        Calendar instance = Calendar.getInstance();
        instance.setTime(date);
        instance.set(Calendar.HOUR_OF_DAY, hour);
        instance.set(Calendar.MINUTE, 0);
        instance.set(Calendar.SECOND, 0);
        return instance.getTime();
    }


    /**
     * 格式化时间的小时（24小时制）秒默认为0秒
     *
     * @param date 时间
     * @param hour 要修改的小时（24小时制）
     * @param min  要修改的分钟
     * @return
     */
    public static Date resetTimeForHourAndMin(Date date, int hour, int min) {
        Calendar instance = Calendar.getInstance();
        instance.setTime(date);
        instance.set(Calendar.HOUR_OF_DAY, hour);
        instance.set(Calendar.MINUTE, min);
        instance.set(Calendar.SECOND, 0);
        return instance.getTime();
    }


    /**
     * date2比date1多的天数
     *
     * @param date1
     * @param date2
     * @return
     */
    public static int differentDays(Date date1, Date date2) {
        int days = (int) ((date2.getTime() - date1.getTime()) / (1000 * 3600 * 24));
        return days;
    }


    /**
     * 时间外扩工具类，（按周外扩），
     * type:1时间减少外扩，例如 2019-1-4日是星期五， 向前推4天变成周一
     * type:2,时间新增外扩，例如 2019-1-4日是星期五， 向后推2天变成周日
     */

    public static Date dateWeekIncreaseOrReduce(Date date, Integer type) {
        Calendar instance = Calendar.getInstance();
        instance.setTime(date);
        int dayForWeek = 0;
        if (instance.get(Calendar.DAY_OF_WEEK) == 1) {
            dayForWeek = 7;
        }
        else {
            dayForWeek = instance.get(Calendar.DAY_OF_WEEK) - 1;
        }
        if (type == 1) {
            instance.add(Calendar.DATE, (1 - dayForWeek));
        }
        if (type == 2) {
            instance.add(Calendar.DATE, (7 - dayForWeek));
        }
        return instance.getTime();
    }


    /**
     * 获取两个日期之间的所有日期列表
     *
     * @param startDate
     * @param endDate
     * @return
     */
    public static List<Date> getDayStrListBetweenDates(Date startDate, Date endDate) {
        List<Date> result = new ArrayList<>();
        Calendar cal = Calendar.getInstance();
        cal.setTime(startDate);
        while (startDate.getTime() <= endDate.getTime()) {
            result.add(startDate);
            cal.add(Calendar.DAY_OF_YEAR, 1);
            startDate = cal.getTime();
        }

        return result;
    }


    public static List<Date> getMonthStrListBetweenDates(Date startDate, Date endDate) {
        List<Date> result = new ArrayList<>();
        Calendar cal = Calendar.getInstance();
        cal.setTime(startDate);
        while (startDate.getTime() <= endDate.getTime()) {
            result.add(startDate);
            cal.add(Calendar.MONTH, 1);
            startDate = cal.getTime();
        }

        return result;
    }


    /**
     * 根据指定的日期date获取当月第一天
     *
     * @param date
     * @return
     */
    public static Date getFirstMonthDayByDate(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.DAY_OF_MONTH, 1);
        return cal.getTime();
    }

    /**
     * 根据指定的日期date获取当月最后天
     *
     * @param date
     * @return
     */
    public static Date getLastMonthDayByDate(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.MONTH, 1);
        cal.set(Calendar.DAY_OF_MONTH, 0);
        return cal.getTime();
    }

    /**
     * 根据指定的日期date获取上一周最后一天日期
     *
     * @param date
     * @return
     */
    public static Date getLastWeekDayByDate(Date date) {
        LocalDate now = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        // 求这个日期上一周的周日
        LocalDate todayOfLastWeek = now.minusDays(7);
        LocalDate sunday = todayOfLastWeek.with(TemporalAdjusters.next(DayOfWeek.MONDAY)).minusDays(1);
        ZonedDateTime zonedDateTime = sunday.atStartOfDay(ZoneId.systemDefault());
        return Date.from(zonedDateTime.toInstant());
    }

    /**
     * 根据指定的日期date获取上一周第一天日期
     *
     * @param date
     * @return
     */
    public static Date getFirstWeekDayByDate(Date date) {
        LocalDate now = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        // 求这个日期上一周的周日
        LocalDate todayOfLastWeek = now.minusDays(7);
        LocalDate monday = todayOfLastWeek.with(TemporalAdjusters.previous(DayOfWeek.SUNDAY)).plusDays(1);
        ZonedDateTime zonedDateTime = monday.atStartOfDay(ZoneId.systemDefault());
        return Date.from(zonedDateTime.toInstant());
    }


    /**
     * 昨日所在周第一天
     * list index:0 开始时间；1：结束时间
     */
    public static List<Date> getFirstWeekDayByDateByYesterDay() {
        Date offsetDate = DateTimeUtils.getOffsetDate(new Date(), -1);
        Calendar cal = Calendar.getInstance();
        cal.setTime(offsetDate);
        int d = 0;
        if (cal.get(Calendar.DAY_OF_WEEK) == 1) {
            d = -6;
        }
        else {
            d = 2 - cal.get(Calendar.DAY_OF_WEEK);
        }
        cal.add(Calendar.DAY_OF_WEEK, d);
        List<Date> list = new ArrayList<>();
        // 所在周开始日期
        list.add(cal.getTime());
        cal.add(Calendar.DAY_OF_WEEK, 6);
        // 所在周结束日期
        list.add(cal.getTime());
        return list;
    }


    /**
     * 获取date日期所在年份的第几周，默认按照星期一作为一周开始
     *
     * @param date
     * @return
     */
    public static int weekOfYear(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.setFirstDayOfWeek(Calendar.MONDAY);//设置星期一为一周开始的第一天
        cal.setMinimalDaysInFirstWeek(4);//一个星期所需的给定最少天数
        int weekOfYear = cal.get(Calendar.WEEK_OF_YEAR);//获得当前日期属于今年的第几周
        return weekOfYear;
    }

    /**
     * 获得某天最大时间 2020-6-8 23:59:59
     */
    public static Date getEndOfDay(Date date) {
        LocalDateTime localDateTime = LocalDateTime.ofInstant(Instant.ofEpochMilli(date.getTime()), ZoneId.systemDefault());
        LocalDateTime endOfDay = localDateTime.with(LocalTime.MAX);
        return Date.from(endOfDay.atZone(ZoneId.systemDefault()).toInstant());
    }

    /**
     * 获得某天最小时间 2020-6-8 00:00:00
     */
    public static Date getStartOfDay(Date date) {
        LocalDateTime localDateTime = LocalDateTime.ofInstant(Instant.ofEpochMilli(date.getTime()), ZoneId.systemDefault());
        LocalDateTime startOfDay = localDateTime.with(LocalTime.MIN);
        return Date.from(startOfDay.atZone(ZoneId.systemDefault()).toInstant());
    }

    /**
     * v3.1.0版本添加
     * 比较时间与现在系统时间比较
     * 比较时间 大于 现在时间  返回：true , 已过期
     * 比较时间 等于 现在时间  返回：false ， 没有过期
     * 比较时间 小于 现在时间  返回：false ，没有过期
     *
     * @param date 比较的日期
     * @return
     */
    public static boolean compareDate(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String compareDate = sdf.format(date);
        String newDate = sdf.format(new Date());

        int result = newDate.compareTo(compareDate);

        if (result > 0) {
            return true;
        }
        else if (result == 0) {
            return false;
        }
        else {
            return false;
        }
    }

    /**
     * 比较时间与现在目标时间比较
     * 比较时间 大于 目标时间  返回：true
     * 比较时间 等于 目标时间  返回：true
     * 比较时间 小于 目标时间  返回：false
     *
     * @param date 比较的日期
     * @return
     */
    public static boolean compareDate(Date date, Date targetDate) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String compareDate = sdf.format(date);
        String newDate = sdf.format(targetDate);

        int result = newDate.compareTo(compareDate);

        if (result > 0) {
            return true;
        }
        else { return result == 0; }
    }

    /**
     * Date类型格式化
     *
     * @param date       时间
     * @param dateFormat 格式化条件
     * @return
     */
    public static Date dateToFormatDate(Date date, String dateFormat) {
        SimpleDateFormat format = new SimpleDateFormat(dateFormat);
        String dateStr = format.format(date);
        Date formatDate = convertString2Date(dateStr, YYYY_MM_DD);
        return formatDate;

    }

    /**
     * 获取本年第一天日期 例如 ：2020-01-01 00:00:00
     *
     * @return
     */
    public static Date getCurrYearFirst() {
        Calendar currCal = Calendar.getInstance();
        int currentYear = currCal.get(Calendar.YEAR);
        return getYearFirst(currentYear);
    }

    /**
     * 获取某年第一天日期
     *
     * @param year 年份
     * @return Date
     */
    public static Date getYearFirst(int year) {
        Calendar calendar = Calendar.getInstance();
        calendar.clear();
        calendar.set(Calendar.YEAR, year);
        Date currYearFirst = calendar.getTime();
        return currYearFirst;
    }

    /**
     * 判断传入的时间和当前时间差是否在规定的范围内
     *
     * @param dateStr 时间
     * @param day     天数
     * @return
     */
    public static boolean checkBetweenDateIsSpecified(Date dateStr, int day) {
        // 相差天数
        int differDay = daysBetween(dateStr, new Date());
        return differDay <= day && differDay >= 0;
    }


    /**
     * 获取当前时间的上个月日期
     *
     * @return yyyy-MM
     */
    public static String getLastMonthAndFormat() {
        Date now = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(now);
        calendar.add(Calendar.MONTH, -1);
        Date lastMonthDate = calendar.getTime();
        return DateTimeUtils.getStrDate(lastMonthDate, YYYY_MM);
    }

    /**
     * 获取当前日期指定前后天数所在月份的指定前后月份(用于凌晨统计的定时器)
     *
     * @param day_i   positive is after,negative is before
     * @param month_i positive is after,negative is before
     * @return yyyy-MM
     */
    public static String getSpecifyMonth(int day_i, int month_i) {
        return DateTimeUtils.getSpecifyDateWithFormat(day_i, month_i, YYYY_MM);
    }

    public static String getSpecifyDateWithFormat(int day_i, int month_i, String format) {
        Date now = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(now);
        calendar.add(Calendar.DAY_OF_MONTH, day_i);
        calendar.add(Calendar.MONTH, month_i);
        Date lastMonthDate = calendar.getTime();
        return DateTimeUtils.getStrDate(lastMonthDate, format);
    }


    /**
     * 获取当前时间的上个月日期
     *
     * @return yyyy-MM
     */
    public static String getLastMonthAndFormat(String str) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
        Date date = null;
        try {
            date = sdf.parse(str);
        }
        catch (ParseException e) {
            e.printStackTrace();
        }
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.MONTH, -1);
        Date lastMonthDate = calendar.getTime();
        return DateTimeUtils.getStrDate(lastMonthDate, YYYY_MM);
    }

    /**
     * 往后推迟三年
     *
     * @return yyyy-MM
     */
    public static String getDateOfDelayDay(Date date, int delayYeay) {

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.YEAR, delayYeay);
        Date delayDate = calendar.getTime();
        return DateTimeUtils.getStrDate(delayDate, YYYY_MM_DD);
    }


    /**
     * 获取两个字符串日期间的天数集合
     *
     * @param startTime 开始日期 yyyy-MM-dd
     * @param endTime   结束日期 yyyy-MM-dd
     * @return 之间的字符串日期列表 yyyy-MM-dd
     */
    public static List<String> getDays(String startTime, String endTime) {

        // 返回的日期集合
        List<String> days = new ArrayList<String>();

        DateFormat dateFormat = new SimpleDateFormat(DateTimeUtils.YYYY_MM_DD);
        try {
            Date start = dateFormat.parse(startTime);
            Date end = dateFormat.parse(endTime);

            Calendar tempStart = Calendar.getInstance();
            tempStart.setTime(start);

            Calendar tempEnd = Calendar.getInstance();
            tempEnd.setTime(end);
            tempEnd.add(Calendar.DATE, +1);// 日期加1(包含结束)
            while (tempStart.before(tempEnd)) {
                days.add(dateFormat.format(tempStart.getTime()));
                tempStart.add(Calendar.DAY_OF_YEAR, 1);
            }

        }
        catch (ParseException e) {
            e.printStackTrace();
        }

        return days;
    }


    /**
     * 获取两个时间节点之间的月份列表
     *
     * @param minDate 开始日期
     * @param maxDate 结束日期
     * @return
     */
    public static List<String> getMonthBetween(String minDate, String maxDate) {
        ArrayList<String> result = new ArrayList<String>();
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");//格式化为年月

            Calendar min = Calendar.getInstance();
            Calendar max = Calendar.getInstance();
            min.setTime(sdf.parse(minDate));
            min.set(min.get(Calendar.YEAR), min.get(Calendar.MONTH), 1);

            max.setTime(sdf.parse(maxDate));
            max.set(max.get(Calendar.YEAR), max.get(Calendar.MONTH), 2);

            Calendar curr = min;
            while (curr.before(max)) {
                result.add(sdf.format(curr.getTime()));
                curr.add(Calendar.MONTH, 1);
            }
        }
        catch (ParseException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }

        return result;
    }

    /**
     * 获取周的开始日期
     *
     * @param year 年份 2021
     * @param week 周  30
     * @return
     */
    public static LocalDate parseWeekBegin(int year, int week) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        calendar.set(Calendar.YEAR, year);
        calendar.set(Calendar.WEEK_OF_YEAR, week);
        calendar.setMinimalDaysInFirstWeek(4);//一个星期所需的给定最少天数
        String time = dateFormat.format(calendar.getTime());
        return DateTimeUtils.convertString2Date(time, DateTimeUtils.YYYY_MM_DD).toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }

    /**
     * 获取周的结束日期
     *
     * @param begin 周的开始日期
     * @return
     */
    public static LocalDate parseWeekEnd(LocalDate begin) {
        return begin.with(TemporalAdjusters.next(DayOfWeek.SUNDAY));
    }

    /**
     * LocalDate转Date
     *
     * @param localDate
     * @return Date
     */
    public static Date localDateToDate(LocalDate localDate) {
        Objects.requireNonNull(localDate, "localDate");
        return Date.from(localDate.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
    }


    /**
     * 计算某一年有多少周
     *
     * @param year 年份
     * @return
     */
    public static int getAllWeekOfYear(int year) {
        Calendar cal = Calendar.getInstance();
        cal.setFirstDayOfWeek(Calendar.MONDAY);
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, 11);// 11表示的是12月
        cal.set(Calendar.DATE, 31);
        cal.setMinimalDaysInFirstWeek(4);
        int week = cal.get(Calendar.WEEK_OF_YEAR);
        if (week != 53) {
            week = 52;
        }
        return week;
    }

    // 获取当天的开始时间
    public static Date getDayBegin() {
        Calendar cal = new GregorianCalendar();
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }

    // 获取当天的结束时间
    public static Date getDayEnd() {
        Calendar cal = new GregorianCalendar();
        cal.set(Calendar.HOUR_OF_DAY, 23);
        cal.set(Calendar.MINUTE, 59);
        cal.set(Calendar.SECOND, 59);
        return cal.getTime();
    }

    // 获取昨天的开始时间
    public static Date getBeginDayOfYesterday() {
        Calendar cal = new GregorianCalendar();
        cal.setTime(getDayBegin());
        cal.add(Calendar.DAY_OF_MONTH, -1);
        return cal.getTime();
    }

    // 获取昨天的结束时间
    public static Date getEndDayOfYesterDay() {
        Calendar cal = new GregorianCalendar();
        cal.setTime(getDayEnd());
        cal.add(Calendar.DAY_OF_MONTH, -1);
        return cal.getTime();
    }

    // 获取明天的开始时间
    public static Date getBeginDayOfTomorrow() {
        Calendar cal = new GregorianCalendar();
        cal.setTime(getDayBegin());
        cal.add(Calendar.DAY_OF_MONTH, 1);
        return cal.getTime();
    }

    // 获取明天的结束时间
    public static Date getEndDayOfTomorrow() {
        Calendar cal = new GregorianCalendar();
        cal.setTime(getDayEnd());
        cal.add(Calendar.DAY_OF_MONTH, 1);
        return cal.getTime();
    }

    // 获取本周的开始时间
    @SuppressWarnings("unused")
    public static Date getBeginDayOfWeek() {
        Date date = new Date();
        if (date == null) {
            return null;
        }
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int dayofweek = cal.get(Calendar.DAY_OF_WEEK);
        if (dayofweek == 1) {
            dayofweek += 7;
        }
        cal.add(Calendar.DATE, 2 - dayofweek);
        return getDayStartTime(cal.getTime());
    }

    // 获取本周的结束时间
    public static Date getEndDayOfWeek() {
        Calendar cal = Calendar.getInstance();
        cal.setTime(getBeginDayOfWeek());
        cal.add(Calendar.DAY_OF_WEEK, 6);
        Date weekEndSta = cal.getTime();
        return getDayEndTime(weekEndSta);
    }

    // 获取上周的开始时间
    @SuppressWarnings("unused")
    public static Date getBeginDayOfLastWeek() {
        Date date = new Date();
        if (date == null) {
            return null;
        }
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int dayofweek = cal.get(Calendar.DAY_OF_WEEK);
        if (dayofweek == 1) {
            dayofweek += 7;
        }
        cal.add(Calendar.DATE, 2 - dayofweek - 7);
        return getDayStartTime(cal.getTime());
    }

    // 获取上周的结束时间
    public static Date getEndDayOfLastWeek() {
        Calendar cal = Calendar.getInstance();
        cal.setTime(getBeginDayOfLastWeek());
        cal.add(Calendar.DAY_OF_WEEK, 6);
        Date weekEndSta = cal.getTime();
        return getDayEndTime(weekEndSta);
    }

    // 获取本月的开始时间
    public static Date getBeginDayOfMonth() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(getNowYear(), getNowMonth() - 1, 1);
        return getDayStartTime(calendar.getTime());
    }

    // 获取本月的结束时间
    public static Date getEndDayOfMonth() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(getNowYear(), getNowMonth() - 1, 1);
        int day = calendar.getActualMaximum(5);
        calendar.set(getNowYear(), getNowMonth() - 1, day);
        return getDayEndTime(calendar.getTime());
    }

    // 获取上月的开始时间
    public static Date getBeginDayOfLastMonth() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(getNowYear(), getNowMonth() - 2, 1);
        return getDayStartTime(calendar.getTime());
    }

    // 获取上月的结束时间
    public static Date getEndDayOfLastMonth() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(getNowYear(), getNowMonth() - 2, 1);
        int day = calendar.getActualMaximum(5);
        calendar.set(getNowYear(), getNowMonth() - 2, day);
        return getDayEndTime(calendar.getTime());
    }

    // 获取本年的开始时间
    public static Date getBeginDayOfYear() {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, getNowYear());
        cal.set(Calendar.MONTH, Calendar.JANUARY);
        cal.set(Calendar.DATE, 1);
        return getDayStartTime(cal.getTime());
    }

    // 获取本年的结束时间
    public static Date getEndDayOfYear() {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, getNowYear());
        cal.set(Calendar.MONTH, Calendar.DECEMBER);
        cal.set(Calendar.DATE, 31);
        return getDayEndTime(cal.getTime());
    }

    // 获取某个日期的开始时间
    public static Timestamp getDayStartTime(Date d) {
        Calendar calendar = Calendar.getInstance();
        if (null != d) { calendar.setTime(d); }
        calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return new Timestamp(calendar.getTimeInMillis());
    }

    // 获取某个日期的结束时间
    public static Timestamp getDayEndTime(Date d) {
        Calendar calendar = Calendar.getInstance();
        if (null != d) { calendar.setTime(d); }
        calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH), 23, 59, 59);
        calendar.set(Calendar.MILLISECOND, 999);
        return new Timestamp(calendar.getTimeInMillis());
    }

    // 获取今年是哪一年
    public static Integer getNowYear() {
        Date date = new Date();
        GregorianCalendar gc = (GregorianCalendar) Calendar.getInstance();
        gc.setTime(date);
        return Integer.valueOf(gc.get(1));
    }

    // 获取本月是哪一月
    public static int getNowMonth() {
        Date date = new Date();
        GregorianCalendar gc = (GregorianCalendar) Calendar.getInstance();
        gc.setTime(date);
        return gc.get(2) + 1;
    }

    // 两个日期相减得到的天数
    public static int getDiffDays(Date beginDate, Date endDate) {
        if (beginDate == null || endDate == null) {
            throw new IllegalArgumentException("getDiffDays param is null!");
        }
        long diff = (endDate.getTime() - beginDate.getTime()) / (1000 * 60 * 60 * 24);
        int days = new Long(diff).intValue();
        return days;
    }

    // 两个日期相减得到的毫秒数
    public static long dateDiff(Date beginDate, Date endDate) {
        long date1ms = beginDate.getTime();
        long date2ms = endDate.getTime();
        return date2ms - date1ms;
    }

    // 获取两个日期中的最大日期
    public static Date max(Date beginDate, Date endDate) {
        if (beginDate == null) {
            return endDate;
        }
        if (endDate == null) {
            return beginDate;
        }
        if (beginDate.after(endDate)) {
            return beginDate;
        }
        return endDate;
    }

    // 获取两个日期中的最小日期
    public static Date min(Date beginDate, Date endDate) {
        if (beginDate == null) {
            return endDate;
        }
        if (endDate == null) {
            return beginDate;
        }
        if (beginDate.after(endDate)) {
            return endDate;
        }
        return beginDate;
    }

    // 返回某月该季度的第一个月
    public static Date getFirstSeasonDate(Date date) {
        final int[] SEASON = {1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4};
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int sean = SEASON[cal.get(Calendar.MONTH)];
        cal.set(Calendar.MONTH, sean * 3 - 3);
        return cal.getTime();
    }

    // 返回某个日期下几天的日期
    public static Date getNextDay(Date date, int i) {
        Calendar cal = new GregorianCalendar();
        cal.setTime(date);
        cal.set(Calendar.DATE, cal.get(Calendar.DATE) + i);
        return cal.getTime();
    }

    // 返回某个日期前几天的日期
    public static Date getFrontDay(Date date, int i) {
        Calendar cal = new GregorianCalendar();
        cal.setTime(date);
        cal.set(Calendar.DATE, cal.get(Calendar.DATE) - i);
        return cal.getTime();
    }

    // 获取某年某月到某年某月按天的切片日期集合(间隔天数的集合)
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static List getTimeList(int beginYear, int beginMonth, int endYear, int endMonth, int k) {
        List list = new ArrayList();
        if (beginYear == endYear) {
            for (int j = beginMonth; j <= endMonth; j++) {
                list.add(getTimeList(beginYear, j, k));
            }
        }
        else {
            {
                for (int j = beginMonth; j < 12; j++) {
                    list.add(getTimeList(beginYear, j, k));
                }
                for (int i = beginYear + 1; i < endYear; i++) {
                    for (int j = 0; j < 12; j++) {
                        list.add(getTimeList(i, j, k));
                    }
                }
                for (int j = 0; j <= endMonth; j++) {
                    list.add(getTimeList(endYear, j, k));
                }
            }
        }
        return list;
    }

    // 获取某年某月按天切片日期集合(某个月间隔多少天的日期集合)
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static List getTimeList(int beginYear, int beginMonth, int k) {
        List list = new ArrayList();
        Calendar begincal = new GregorianCalendar(beginYear, beginMonth, 1);
        int max = begincal.getActualMaximum(Calendar.DATE);
        for (int i = 1; i < max; i = i + k) {
            list.add(begincal.getTime());
            begincal.add(Calendar.DATE, k);
        }
        begincal = new GregorianCalendar(beginYear, beginMonth, max);
        list.add(begincal.getTime());
        return list;
    }

    /**
     * 获取当前时间到第二天凌晨共多长时间（单位：秒）
     *
     * @return
     */
    public static Long getSecondsNextEarlyMorning() {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_YEAR, 1);
        // 改成这样就好了
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return (cal.getTimeInMillis() - System.currentTimeMillis()) / 1000;


    }

    /**
     * 校验时间是否相等
     *
     * @return
     */
    public static boolean isLatestWeek(Date addtime, int amount) {
        Calendar calendar = Calendar.getInstance();  //得到日历
        calendar.setTime(new Date());//把当前时间赋给日历
        calendar.add(Calendar.DAY_OF_MONTH, -amount);  //设置为30天前
        Date before7days = calendar.getTime();   //得到7天前的时间
        return before7days.getTime() < addtime.getTime();
    }

    /**
     * @param sDate     当前日期
     * @param nextMonth 间隔月数
     * @return
     */
    public static Date nextDate(Date sDate, int nextMonth) {
        if (sDate == null) {
            return null;
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(sDate);
        calendar.add(Calendar.MONTH, nextMonth);
        return calendar.getTime();
    }

    /**
     * 获取当前时间前六个月的月份列表
     *
     * @return
     */
    public static List<String> getSixMonthByCurrent() {
        String min = LocalDate.now().minusMonths(5).format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String max = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        List<String> monthBetween = getMonthBetween(min, max);
        return monthBetween;
    }

    /**
     * 获取自定义日期，前几个月的月份列表
     *
     * @param dateStr 日期
     * @param i       偏移量
     * @return
     */
    public static List<String> getListMonthByCurrent(String dateStr, int i) {
        Date date1 = convertString2Date(dateStr);
        LocalDate localDate = date1.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        String min = localDate.minusMonths(i - 1).format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String max = localDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        List<String> monthBetween = getMonthBetween(min, max);
        return monthBetween;
    }

    public static String getFirstDayOfYear(int year) {
        Calendar calendar = Calendar.getInstance();
        calendar.clear();
        calendar.set(Calendar.YEAR, year);
        Date currYearFirst = calendar.getTime();
        return DateTimeUtils.convertDate2String(currYearFirst, YYYY_MM_DD);
    }

    /**
     * 获取当前年份字符串
     *
     * @return
     */
    public static String getCurrentYear() {
        return LocalDate.now().format(DateTimeFormatter.ofPattern(YYYY));
    }

    /**
     * 获取上一年份字符串
     *
     * @return
     */
    public static String getLastYear() {
        return LocalDate.now().minusYears(1).format(DateTimeFormatter.ofPattern(YYYY));
    }

    public static String getCurrentMonthStr() {
        return LocalDate.now().format(DateTimeFormatter.ofPattern(YYYY_MM));
    }

    public static String getIndexMonthStr(int month) {
        return LocalDate.now().minusMonths(month).format(DateTimeFormatter.ofPattern("yyyy-MM"));
    }

    public static String getLastYearByCurrentYear(String currentYear) {
        String currentStr = currentYear + "-01-01";
        LocalDate localDate = LocalDate.parse(currentStr);
        return localDate.minusYears(1).format(DateTimeFormatter.ofPattern("yyyy"));
    }

    public static String getPreMonth(String str) {
        LocalDate localDate = LocalDate.parse(str);
        return localDate.minusMonths(1).format(DateTimeFormatter.ofPattern(YYYY_MM));
    }

    public static String getLastMonth(String str) {
        LocalDate localDate = LocalDate.parse(str);
        return localDate.minusYears(1).format(DateTimeFormatter.ofPattern(YYYY_MM));
    }

    public static int getMonthDesc(String str) {
        LocalDate localDate = LocalDate.parse(str);
        return localDate.getMonth().getValue();
    }

    public static String getYesterdayYearStr() {
        return LocalDate.now().minusDays(1).format(DateTimeFormatter.ofPattern(YYYY));
    }

    /**
     * 获取指定日期的本月第一天 2022-09-01 00:00:00
     *
     * @param date
     * @return
     */
    public static String getFirstDayOfMonth(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
        Date time = calendar.getTime();
        String strDate = getStrDate(time, DEFAULT_DATE_FORMAT);
        return strDate;
    }

    /**
     * 获取指定日期的本月最后一天 2022-09-01 23:59:59
     *
     * @param date
     * @return
     */
    public static String getLastDayOfMonth(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
        Date time = calendar.getTime();
        String strDate = getStrDate(time, DEFAULT_DATE_FORMAT);
        return strDate;
    }

    /**
     * 获取指定日期的开始时间 2022-09-01 00:00:00
     *
     * @param date
     * @return
     */
    public static String getStartOfDayStr(Date date) {
        Date startOfDay = getStartOfDay(date);
        String strDate = getStrDate(startOfDay, DEFAULT_DATE_FORMAT);
        return strDate;
    }

    /**
     * 获取指定日期的结束时间 2022-09-01 23:59:59
     *
     * @param date
     * @return
     */
    public static String getEndOfDayStr(Date date) {
        Date endOfDay = getEndOfDay(date);
        String strDate = getStrDate(endOfDay, DEFAULT_DATE_FORMAT);
        return strDate;
    }

    /**
     * 获取指定日期的本年第一天 2022-01-01 00:00:00
     *
     * @param date
     * @return
     */
    public static String getFirstDayOfYear(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.clear(Calendar.MONDAY);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date time = calendar.getTime();
        String strDate = getStrDate(time, DEFAULT_DATE_FORMAT);
        return strDate;
    }

    /**
     * 获取指定日期的本年最后一天 2022-12-31 23:59:59
     *
     * @param date
     * @return
     */
    public static String getLastDayOfYear(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int year = calendar.get(Calendar.YEAR);
        calendar.clear();
        calendar.set(Calendar.YEAR, year);
        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        calendar.roll(Calendar.DAY_OF_YEAR, -1);
        Date time = calendar.getTime();
        String strDate = getStrDate(time, DEFAULT_DATE_FORMAT);
        return strDate;
    }

    public static String getDateStr(String str, String inPattern, String onPattern) {
        SimpleDateFormat sdf = new SimpleDateFormat(inPattern);
        Date date = null;
        try {
            date = sdf.parse(str);
        }
        catch (ParseException e) {
            e.printStackTrace();
        }
        return DateTimeUtils.getStrDate(date, onPattern);
    }


    public static void main(String[] args) throws ParseException {
        String firstDayOfYear = getFirstDayOfYear(2022);
        System.out.println(firstDayOfYear);

        String s = convertDate2String(new Date(), YYYY_MM_DD);
        System.out.println(s);

        LocalDate n = LocalDate.now().minusDays(1);
        LocalDate localDate = n.minusMonths(3);
        System.out.println(localDate.toString());
        System.out.println(n.toString());
        List<String> days = getDays(localDate.toString(), n.toString());
        System.out.println(days);
    }
}

