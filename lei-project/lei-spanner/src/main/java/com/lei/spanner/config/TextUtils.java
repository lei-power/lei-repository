package com.lei.spanner.config;

import java.math.BigDecimal;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.lang3.StringUtils;


/**
 * 字符串操作工具类，默认从该类方法中选择
 */
public class TextUtils {


    /**
     * 讲一个list列表转换成用分隔符separator分割的字符串，列表支持的类型：int,long,double,float,String
     *
     * @param valueList 待转换的列表
     * @param separator 分隔符
     * @param <T>       列表支持的类型：int,long,double,float,String
     * @return 分隔符串联的字符串
     */
    public static <T> String listToString(List<T> valueList, String separator) {
        if (valueList == null || valueList.isEmpty()) {
            return null;
        }
        StringBuffer result = new StringBuffer();
        int len = valueList.size();
        for (int i = 0; i < len; i++) {
            T index = valueList.get(i);
            if (index == null) {
                continue;
            }
            result.append(index);

            if (i != len - 1) {
                result.append(separator);
            }
        }
        return result.toString();
    }


    /**
     * 将字符串列表转换成用逗号","分割的字符串。
     *
     * @param valueList 字符串列表
     * @return 分隔符串联的字符串
     */
    public static String listToString(List<String> valueList) {
        return TextUtils.listToString(valueList, ",");
    }


    /**
     * string转list集合，使用指定的分隔符separator进行分隔
     *
     * @param strs      需要分割的字符串
     * @param separator 分隔符
     * @return 分隔后的list
     */
    public static List<String> stringToList(String strs, String separator) {
        String str[] = strs.split(",");
        return Arrays.asList(str);
    }

    /**
     * 判断是否为手机号
     *
     * @param phoneNo
     * @return
     */
    public static boolean isPhoneNo(String phoneNo) {
        String regex = "1\\d{10}$";
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(phoneNo);
        return m.matches();
    }

    /**
     * 判断密码是否大小写加字母，长度范围
     *
     * @param password
     * @return
     */
    public static boolean isPassword(String password) {
//        String regex = "^(?![0-9]+$)(?![a-zA-Z]+$)(?![0-9!@#$%^&*]+$)(?![0-9\\u4e00-\\u9fa5]+$)(?![a-zA-Z!@#$%^&*]+$)(?![a-zA-Z\\u4e00-\\u9fa5]+$)[0-9A-Za-z!@#$%^&*\\u4e00-\\u9fa5]{6,30}$";
        String regex = "^(?![a-zA-z]+$)(?!\\d+$)(?![!@#$%^&*]+$)(?![a-zA-z\\d]+$)(?![a-zA-z!@#$%^&*]+$)(?![\\d!@#$%^&*]+$)[a-zA-Z\\d!@#$%^&*]{8,30}$";
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(password);
        return m.matches();
    }

    /**
     * 邮箱校验
     *
     * @param email
     * @return
     */
    public static boolean isEmail(String email) {
        String regex = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        return !TextUtils.isEmpty(email);
    }

    /**
     * 身份证正则校验
     *
     * @param idCardNo 身份证号
     * @return
     */
    public static boolean isIDCard(String idCardNo) {
        Pattern pattern1 = Pattern.compile("^(\\d{6})(19|20)(\\d{2})(1[0-2]|0[1-9])(0[1-9]|[1-2][0-9]|3[0-1])(\\d{3})(\\d|X|x)?$"); //粗略的校验
        Matcher matcher = pattern1.matcher(idCardNo);
        return matcher.matches();
    }


    /**
     * 判断一个字符串是不是yyyy-MM-dd格式的日期
     *
     * @param dateStr
     * @return
     */
    public static boolean isYearMonthDay(String dateStr) {
        String str = "(17|18|19|20|21)[0-9][0-9]-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])";
        Pattern pattern = Pattern.compile(str);
        Matcher matcher = pattern.matcher(dateStr);
        return matcher.matches();
    }


    /**
     * 判断一个字符串是不是yyyy-MM格式的日期
     *
     * @param monthStr
     * @return
     */
    public static boolean isYearMonth(String monthStr) {
        String str = "(17|18|19|20|21)[0-9][0-9]-(0[1-9]|1[0-2])";
        Pattern pattern = Pattern.compile(str);
        Matcher matcher = pattern.matcher(monthStr);
        return matcher.matches();
    }

    /**
     * 校验验证位合法性
     *
     * @param front_17
     * @param verify
     * @return
     * @throws Exception
     */
    public static boolean checkVerify(String front_17, String verify) {
        int[] wi = {7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1};
        String[] vi = {"1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2"};
        int s = 0;
        for (int i = 0; i < front_17.length(); i++) {
            int ai = Integer.parseInt(front_17.charAt(i) + "");
            s += wi[i] * ai;
        }
        int y = s % 11;
        String v = vi[y];
        return verify.toUpperCase().equals(v);
    }

    /**
     * 检查一个字符串是否为空
     *
     * @param str
     * @return
     */
    public static boolean isEmpty(String str) {
        if (str == null) {
            return true;
        }
        return "".equals(str.trim());
    }


    /**
     * 判断两个字符串是否相等
     *
     * @param str1
     * @param str2
     * @return
     */
    public static boolean equals(String str1, String str2) {
        return StringUtils.equals(str1, str2);
    }

    /**
     * 判断一个字符串的长度是否在指定的minLen~maxLen之间，在之间，则返回true，否则返回false
     *
     * @param str
     * @param minLen 允许的汉字最小长度（一个汉字=2个英文字符）
     * @param maxLen 允许的汉字最大长度
     * @return
     */
    public static boolean lenInRange(String str, int minLen, int maxLen) {
        int length = TextUtils.length(str);
        if (length < 2 * minLen) {
            return false;
        }
        return length <= 2 * maxLen;
    }


    /**
     * 获取一个字符串长度，单位为英文字符长度，一个汉字=2个英文字符，例如“哈哈abc”的长度为7
     *
     * @param str
     * @return 字符串长度
     */
    public static int length(String str) {
        if (TextUtils.isEmpty(str)) {
            return 0;
        }
        int valueLength = 0;
        String chinese = "[\u4e00-\u9fa5]";
        for (int i = 0; i < str.length(); i++) {
            String temp = str.substring(i, i + 1);
            if (temp.matches(chinese)) {
                valueLength += 2;
            } else {
                valueLength += 1;
            }
        }
        return valueLength;
    }


    /**
     * 生成UUID
     *
     * @return uuid 返回UUID字符串
     */
    public static String uuid() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    /**
     * 获取指定位数n的数字随机字符串，
     *
     * @param n 位数
     * @return n位随机字符串
     */
    public static String getNbitRandomNum(int n) {
        int maxNum = (int) Math.pow(10, n);
        Random rand = new Random();
        int num = rand.nextInt(maxNum);
        String str = String.valueOf((maxNum + num)).substring(1);
        return str;
    }

    /**
     * 将一个数字转化成指定位数n的字符串，如果位数不够，则在改数字前面补0，例如数字21，n=4，则转化为0021
     *
     * @param n      位数
     * @param number 需要转化的数字
     * @return
     */
    public static String getNbitNum(int n, int number) {
        int maxNum = (int) Math.pow(10, n);
        String str = String.valueOf((maxNum + number)).substring(1);
        return str;
    }


    /**
     * 从字符串中找出符合上海地块gis中的地块唯一编码的字段
     * 上海gis地块的编码格式为：(310112114247000619028)。包含括号
     * 如果有多组符合条件的，取最靠后面的一组
     *
     * @param str
     * @return
     */
    public static String getShangHaiGisDKID(String str) {

        //上海gis地块的编码格式为：(310112114247000619028)。包含括号
        //现将中文货号替换成英文括号
        String formatStr = str.replaceAll("（", "(").replaceAll("）", ")");


        String patterStr = "\\(\\d{21}\\)";
        Pattern pattern = Pattern.compile(patterStr);
        Matcher matcher = pattern.matcher(formatStr);

        String result = null;
        while (matcher.find()) {
            result = matcher.group();
        }

        if (TextUtils.isEmpty(result)) {
            return result;
        }

        return result.replaceAll("\\(", "").replaceAll("\\)", "");
    }

    /**
     * @Title: clearNoUseZeroForBigDecimal
     * @Description: 去掉BigDecimal尾部多余的0，通过stripTrailingZeros().toPlainString()实现
     * @param str
     * @return BigDecimal
     */
    public static BigDecimal clearNoUseZeroForBigDecimal(String str){
        BigDecimal decimal = new BigDecimal(BigDecimal.valueOf(Double.parseDouble(str)).stripTrailingZeros().toPlainString());
        return decimal;
    }

    /**
     * 获取一个length位的安全随机字符串，字符串的每一个字符由0~9，a~z组成
     * 用户获取token
     * @return
     */
    public static String getSecureRandom(Integer length) throws NoSuchProviderException, NoSuchAlgorithmException {
        StringBuilder str = new StringBuilder();
        char[] chars = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
                'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
        SecureRandom random = SecureRandom.getInstance("SHA1PRNG", "SUN");
        for (int i = 0; i < length; i++) {
            str.append(chars[random.nextInt(36)]);
        }
        return str.toString();
    }
}
