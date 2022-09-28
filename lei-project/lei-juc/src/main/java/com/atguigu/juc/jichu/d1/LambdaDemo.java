package com.atguigu.juc.jichu.d1;

/**
 * @author mqx
 * @date 2021-4-2 10:38:41
 */
@FunctionalInterface
interface Foo {

    static int div(int x, int y) {
        return x / y;
    }

//    void sayHello2();

//    int add(int x,int y);

    static int mul(int x, int y) {
        return x * y;
    }

    //  打招呼！
    void sayHello();

    default int add(int x, int y) {
        return x + y;
    }

    default int sub(int x, int y) {
        return x - y;
    }

}

class T1 implements Foo {

    @Override
    public void sayHello() {

    }
}

public class LambdaDemo {

    public static void main(String[] args) {
        //  这是多态么？ 最好不要这么理解！
        Foo foo = () -> {
            System.out.println("hello ,word");
        };
        foo.sayHello();

        //  调用接口中的add();
        System.out.println(foo.add(4, 8));

        //  调用div();
        System.out.println(Foo.div(6, 2));

    }

}
