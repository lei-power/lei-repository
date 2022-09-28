package sort;

import java.util.ArrayDeque;
import java.util.PriorityQueue;

/***
 *@author wanglei
 *@Date 2022/4/8 17:01
 ***/


public class SlidingWindow {

    public static void main(String[] args) {
        int[] input = {1, 3, -1, -3, 5, 3, 6, 7};
        int k = 3;

        int[] output = twoSearch(input, k);

        for (int max : output) { System.out.print(max + "\t"); }
    }

    private static int[] maxSlidingWindow(int[] input, int k) {
        int[] output = new int[input.length - k + 1];
        PriorityQueue<Integer> Maxheap = new PriorityQueue<>((o1, o2) -> o2 - o1);
        for (int i = 0; i < k; i++) { Maxheap.add(input[i]); }
        output[0] = Maxheap.peek();
        for (int i = 1; i <= input.length - k; i++) {
            Maxheap.remove(input[i - 1]);
            Maxheap.add(input[i + k - 1]);
            output[i] = Maxheap.peek();
        }
        return output;
    }

    //双端队列
    public static int[] maxSlidingWindowDeque(int[] input, int k) {
        int[] outint = new int[input.length - k + 1];
        ArrayDeque<Integer> deque = new ArrayDeque<>();
        for (int i = 0; i < k; i++) {
            while (!deque.isEmpty() && deque.getLast() < input[i]) {
                deque.removeLast();
            }
            deque.addLast(i);
        }
        outint[0] = deque.getFirst();
        for (int i = k; i < input.length; i++) {
            if (!deque.isEmpty() && deque.getFirst() == i - k) {

            }
            while (!deque.isEmpty() && deque.getLast() < input[i]) {
                deque.removeLast();
            }
            deque.addLast(i);
        }

        return outint;
    }

    //双向扫描
    public static int[] twoSearch(int[] input, int k) {
        int[] left = new int[input.length];
        int[] right = new int[input.length];
        int[] result = new int[input.length - k + 1];
        for (int i = 0; i < input.length; i++) {
            if (i % k == 0) {
                left[i] = input[i];
            }
            else {
                left[i] = Math.max(input[i], input[i - 1]);
            }
        }

        for (int i = input.length - 1; i >= 0; i--) {
            if (i + 1 % k == 0 || i - 1 <= 0) {
                right[i] = input[i];
            }
            else {
                right[i] = Math.max(input[i], input[i - 1]);
            }
        }
        for (int i = 0; i < input.length - k + 1; i++) {
            result[i] = Math.max(right[i], left[i + k - 1]);
        }
        return result;
    }
}
