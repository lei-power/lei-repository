package sort;

import java.util.Arrays;

/***
 *@author wanglei
 *@Date 2022/3/28 15:24
 ***/


public class Matrix {

    public static void main(String[] args) {
        int[][] matrix = {
                {1, 1, 1, 1, 1, 1},
                {2, 2, 2, 2, 2, 2},
                {3, 3, 3, 3, 3, 3},
                {4, 4, 4, 4, 4, 4},
                {5, 5, 5, 5, 5, 5},
                {6, 6, 6, 6, 6, 6}
        };
        reverMatrix(matrix);
        System.err.println();
    }

    static void reverMatrix(int[][] matrix) {

        //数学方法、转至和翻转
        if (matrix == null || matrix.length != matrix[0].length) {
            System.err.println("输入正确的数组");
            return;
        }
        int m = matrix.length, n = matrix.length, tmp;
//        for (int i = 0; i < m; i++) {
//            for (int j = i; j < m; j++) {
//                tmp = matrix[i][j];
//                matrix[i][j] = matrix[j][i];
//                matrix[j][i] = tmp;
//            }
//        }
//        for (int i = 0; i < m; i++) {
//            for (int j = 0; j < m / 2; j++) {
//                tmp = matrix[i][j];
//                matrix[i][j] = matrix[i][m - 1-j];
//                matrix[i][m -1- j] = tmp;
//            }
//        }

        for (int i = 0; i < (n + 1) / 2; i++) {

            for (int j = i; j < n - i - 1; j++) {

                int temp = matrix[i][j];
                matrix[i][j] = matrix[n - j - 1][i];
                matrix[n - j - 1][i] = matrix[n - i - 1][n - j - 1];
                matrix[n - i - 1][n - j - 1] = matrix[j][n - i - 1];
                matrix[j][n - i - 1] = temp;

                for (int t = 0; t < m; t++) {
                    System.err.println(Arrays.toString(matrix[t]));
                }
                System.err.println();
            }

            System.err.println("-----------------------" + i + "-----------------------");
        }

        for (int i = 0; i < m; i++) {
            System.err.println(Arrays.toString(matrix[i]));
        }


    }
}
