package com.atguigu.juc.cf;


import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeoutException;

/**
 * @auther zzyy
 * @create 2021-03-02 11:19
 */
public class FutureTaskDemo {

    public static void main(String[] args) throws ExecutionException, InterruptedException, TimeoutException {
        String tx = "action";
        try {
            int i = 10 / 0;
            tx = "error";

        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(tx);
        }

    }


    }

