package sort;

/***
 *@author wanglei
 *@Date 2022/3/28 17:32
 ***/


public class binary {

    public static void main(String[] args) {
//        int[] array = {1, 23, 45, 6, 7, 17, 8, 8, 9, 99, 19, 0};
//        Arrays.sort(array);
//        System.err.println(binarySearch(array, 17, 0, array.length - 1));
        findDuplicate();
    }

    static int binarySearch(int[] array, int x, int from, int to) {
        if (array[from] > x || array[to] < x || from > to) {
            return -1;
        }
        int mid = (from + to) / 2;
        if (array[mid] > x) {
            return binarySearch(array, x, from, mid - 1);
        }
        else if (array[mid] < x) {
            return binarySearch(array, x, mid + 1, to);
        }
        else {
            return mid;
        }
    }

    public static void findDuplicate() {
        int[] nums = {1, 3, 4, 9, 11, 5, 6, 7, 8, 8, 8, 8};
        int slow = 0, fast = 0;
        for (; ; ) {
            slow = nums[slow];
            fast = nums[nums[fast]];
            if (slow == fast) {
                break;
            }
        }
        int init = 0, end = fast;
        while (init != end) {
            init = nums[init];
            end = nums[end];
        }
        System.err.println(init + "------" + nums[init]);
    }
}
