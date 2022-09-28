package sort;

import java.util.LinkedHashSet;

/***
 *@author wanglei
 *@Date 2022/4/6 11:16
 ***/


public class Remove {


    public static void main(String[] args) {
        String str1 = "bcabc";
        String str2 = "cbacdcbc";
        algorithm.strings.RemoveDuplicateLetters removeDuplicateLetters = new algorithm.strings.RemoveDuplicateLetters();

        System.out.println(removeDuplicateLetters.removeDuplicateLetters(str1));
        System.out.println(removeDuplicateLetters.removeDuplicateLetters(str2));
    }

    // 方法一：暴力法，贪心策略递归
    public String removeDuplicateLetters1(String s, String s1) {
        //找出最小的
        int left = 0;
        if (left >= s.length() - 1) {

        }
        for (int i = 0; i < s.length() - 1; i++) {
            if (i > 0 && s.charAt(i) > s.charAt(i - 1)) {
                left = i - 1;
            }
        }

        LinkedHashSet<String> set = new LinkedHashSet<>();
        for (int i = 0; i < left; i++) {
            set.add(String.valueOf(s.charAt(i)));
        }
        StringBuffer stringBuffer = new StringBuffer();
        for (String target : set) {
            stringBuffer.append(target);
        }
        String s2 = s1 + stringBuffer.toString();
        return s2;
    }
}