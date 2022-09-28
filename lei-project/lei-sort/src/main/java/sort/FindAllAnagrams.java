package sort;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/***
 *@author wanglei
 *@Date 2022/4/25 16:27
 ***/


public class FindAllAnagrams {

    public static void main(String[] args) {
        String s = "aabcaaaaacbaaabcaadfdfas";
        String p = "abc";
        List allAnagrams = findAllAnagrams(s, p);
        System.err.println(allAnagrams.toString());
    }

    public static List findAllAnagrams(String s, String p) {
        Map<Character, Integer> count = new HashMap<>();
        ArrayList<Integer> result = new ArrayList<>();
        for (int t = 0; t < p.length(); t++) {
            Integer curser = count.get(p.charAt(t));
            if (null != curser) {
                count.put(p.charAt(t), ++curser);
            }
            count.put(p.charAt(t), 1);
        }

        for (int i = 0; i < (s.length() - p.length()); i++) {
            Map<Character, Integer> old = new HashMap<>();
            for (int j = 0; j < p.length(); j++) {
                Integer curser2 = old.get(s.charAt(i + j));
                if (null != curser2) {
                    old.put(s.charAt(i + j), ++curser2);
                }
                old.put(s.charAt(i + j), 1);
            }
            boolean isEqual = true;
            for (Entry<Character, Integer> entry : count.entrySet()) {
                Character key = entry.getKey();
                Integer value = entry.getValue();
                if (value != old.get(key)) {
                    isEqual = false;
                }
            }
            if (isEqual == true) {
                result.add(i + 1);
            }
        }
        return result;
    }

}
