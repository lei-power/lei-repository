package algorithm.arrays;

import java.util.HashMap;

public class TwoSum {

    public static void main(String[] args) {
        String s = "123456789";
    }

    // 方法一：暴力法，穷举所有两数组合
    public int[] twoSum1(int[] nums, int target) {
        int n = nums.length;
        // 双重for循环
        for (int i = 0; i < n - 1; i++) {
            System.err.println("--------run----------");
            for (int j = i + 1; j < n; j++) {
                if (nums[i] + nums[j] == target) {
                    return new int[]{i, j};
                }
            }
        }
        // 如果找不到，抛出异常
        throw new IllegalArgumentException("no solution");
    }

    // 方法二：哈希表保存所有数的信息
    public int[] twoSum2(int[] nums, int target) {
        int n = nums.length;

        // 定义一个哈希表
        HashMap<Integer, Integer> map = new HashMap<>();

        // 1. 遍历数组，将数据全部保存入hash表
        for (int i = 0; i < n; i++) {
            map.put(nums[i], i);
        }

        // 2. 再次遍历数组，寻找每个数对应的那个数是否存在
        for (int i = 0; i < n; i++) {
            int thatNum = target - nums[i];
            // 如果那个数存在，并且不是当前数自身，就直接返回结果
            if (map.containsKey(thatNum) && map.get(thatNum) != i) { return new int[]{i, map.get(thatNum)}; }
        }

        // 如果找不到，抛出异常
        throw new IllegalArgumentException("no solution");
    }

    // 方法三：改进，遍历一次哈希表
    public int[] twoSum(int[] nums, int target) {
        int n = nums.length;

        // 定义一个哈希表
        HashMap<Integer, Integer> map = new HashMap<>();

        // 遍历数组，寻找每个数对应的那个数是否存在（只向前寻找）
        for (int i = 0; i < n; i++) {
            int thatNum = target - nums[i];
            // 如果那个数存在，并且不是当前数自身，就直接返回结果
            if (map.containsKey(thatNum)) { return new int[]{map.get(thatNum), i}; }

            map.put(nums[i], i);
        }

        // 如果找不到，抛出异常
        throw new IllegalArgumentException("no solution");
    }
}
