package com.lei.spanner.core.util;

import java.util.regex.Pattern;

/**
 * 代替此类功能 xssEncode(s);
 */
public class XssUtils {

    public static final String REPLACE_STRING = "*";

    /**
     * xss校验
     *
     * @param s
     * @return
     */
    public static String xssEncode(String s) {
        if (TextUtils.isEmpty(s)) {
            return s;
        }

        StringBuilder sb = new StringBuilder(s.length() + 16);
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            switch (c) {
                case '>':
                    //// 转义大于号
                    sb.append("＞");
                    break;
                case '<':
                    // 转义小于号
                    sb.append("＜");
                    break;
                //                case '\'':
                //                    // 转义单引号
                //                    sb.append("＇");
                //                    break;
                //                case '\"':
                //                    // 转义双引号
                //                    sb.append("＂");
                //                    break;
                //                case '&':
                //                    // 转义&
                //                    sb.append("＆");
                //                    break;
                //                case '#':
                //                    // 转义#
                //                    sb.append("＃");
                //                    break;
                default:
                    sb.append(c);
                    break;
            }
        }
        return sb.toString();
    }

    /**
     * xss校验
     *
     * @param value
     * @return
     */
    public static String stripXSSAndSql(String value) {
        if (!TextUtils.isEmpty(value)) {
            // Avoid null characters
            value = value.replaceAll(" ", REPLACE_STRING);
            // Avoid anything between script tags
            Pattern scriptPattern = Pattern.compile("<[\r\n| | ]*script[\r\n| | ]*>(.*?)</[\r\n| | ]*script[\r\n| | ]*>", Pattern.CASE_INSENSITIVE);
            value = scriptPattern.matcher(value).replaceAll(REPLACE_STRING);
            // Avoid anything in a src="http://www.yihaomen.com/article/java/..." type of e-xpression
            scriptPattern = Pattern.compile("src[\r\n| | ]*=[\r\n| | ]*[\\\"|\\\'](.*?)[\\\"|\\\']",
                    Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
            value = scriptPattern.matcher(value).replaceAll(REPLACE_STRING);
            // Remove any lonesome </script> tag
            scriptPattern = Pattern.compile("</[\r\n| | ]*script[\r\n| | ]*>", Pattern.CASE_INSENSITIVE);
            value = scriptPattern.matcher(value).replaceAll(REPLACE_STRING);
            // Remove any lonesome <script ...> tag
            scriptPattern = Pattern.compile("<[\r\n| | ]*script(.*?)>", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
            value = scriptPattern.matcher(value).replaceAll(REPLACE_STRING);
            // Avoid eval(...) expressions
            scriptPattern = Pattern.compile("eval\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
            value = scriptPattern.matcher(value).replaceAll(REPLACE_STRING);
            // Avoid e-xpression(...) expressions
            scriptPattern = Pattern.compile("e-xpression\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
            value = scriptPattern.matcher(value).replaceAll(REPLACE_STRING);
            // Avoid javascript:... expressions
            scriptPattern = Pattern.compile("javascript[\r\n| | ]*:[\r\n| | ]*", Pattern.CASE_INSENSITIVE);
            value = scriptPattern.matcher(value).replaceAll(REPLACE_STRING);
            // Avoid vbscript:... expressions
            scriptPattern = Pattern.compile("vbscript[\r\n| | ]*:[\r\n| | ]*", Pattern.CASE_INSENSITIVE);
            value = scriptPattern.matcher(value).replaceAll(REPLACE_STRING);
            // Avoid onload= expressions
            scriptPattern = Pattern.compile("onload(.*?)=", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
            value = scriptPattern.matcher(value).replaceAll(REPLACE_STRING);
            // Avoid /r /n:... expressions
            scriptPattern = Pattern.compile("\"\\\\s*|\\t|\\r|\\n\"", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
            value = scriptPattern.matcher(value).replaceAll("");
        }
        return value;
    }

    public static void main(String[] args) {
        System.out.println(xssEncode("<"));
        System.out.println(xssEncode(">"));
        System.out.println(xssEncode("\""));
        System.out.println(xssEncode(":"));
        System.out.println(xssEncode("\'"));
        System.out.println(xssEncode(","));
        System.out.println(xssEncode("="));
        System.out.println(xssEncode("我"));
    }
}
