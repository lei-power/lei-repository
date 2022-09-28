package sort;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/***
 *@author wanglei
 *@Date 2022/3/25 14:49
 ***/


public class add {


    public static void main(String[] args) throws InterruptedException {
        long beginTime = System.currentTimeMillis();
//        threeSum();
        nextPermutation();
        long endTime = System.currentTimeMillis();

        // 获取请求消耗时长
        long time = (endTime - beginTime) / 1000;
        System.err.println(time + "s");

    }

    public static void add() {
        int[] array = {2, 7, 11, 15};
        List<Map> lists = new ArrayList<Map>();
        for (int i = 0; i < array.length - 1; i++) {
            for (int j = i + 1; j < array.length - 1; j++) {
                if (array[i] + array[j] == 9 && i != j) {
                    HashMap<Integer, Integer> map = new HashMap<>();
                    map.put(i, array[i]);
                    map.put(j, array[j]);
                    lists.add(map);
                }
            }
        }
        System.err.println(lists.toString());
    }

    public static void threeSum() {

        int[] nums = {-1, 0, 1, 2, -1, -4};
        Arrays.sort(nums);
        // int mid = L + ((R - L) >> 1)
        Set<List> lists = new HashSet<>();
        int S = nums.length - 2;
        for (int P = 0; P < S; P++) {
            int L = P + 1, R = nums.length - 1;

            while (nums[P] + nums[L] + nums[R] < 0 && L < R - 1) {
                L++;
            }
            while (nums[P] + nums[L] + nums[R] > 0 && L < R - 1) {
                R--;
            }

            if (nums[P] + nums[L] + nums[R] == 0) {
                List<Integer> integers = new ArrayList<>();
                integers.add(nums[P]);
                integers.add(nums[L]);
                integers.add(nums[R]);
                Collections.sort(integers);

                lists.add(integers);
            }
        }
        System.err.println(lists.toString());
    }


    public static void testDateStr(Long dateStr) {
        String TIME_FORMATER = "yyyy-MM-dd HH:mm:ss";
        Date date = new Date(dateStr);
        String normalDate = new SimpleDateFormat(TIME_FORMATER).format(date);
        System.out.println("时间戳 : " + dateStr);
        System.out.println("正常时间格式: " + normalDate);

    }

    public static void nextPermutation() {

    }

    public void twoSum(int[] nums, int target) {

        Map<Integer, Integer> map = new HashMap<>();
        // 遍历数组，全部保存到 hashmap中
        for (int i = 0; i < nums.length; i++) {
            map.put(nums[i], i);
        }
        // 遍历数组，挨个查找对应的“那个数”在不在map中
        for (int i = 0; i < nums.length; i++) {
            int thatNum = target - nums[i];
            if (map.containsKey(thatNum) && map.get(thatNum) != i) {
                int[] ints = {i, map.get(thatNum)};
                System.err.println(ints);
            }
        }
    }
}




