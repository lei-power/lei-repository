package com.atguigu.juc.jichu.d3;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author mqx
 * @date 2021-4-7 10:24:31
 */
public class StreamDemo {

    //  主入口
    public static void main(String[] args) {
        //  消费型：
        //  Consumer    void accept(T t);
        //  复制小括号，写死右箭头，落地大括号！
        //        Consumer<String> consumer = (t)->{
        //            System.out.println(t);
        //        };
        //        consumer.accept("hello");
        //
        //        //  供给型
        //        //  Supplier T get();
        //        Supplier<String> supplier = ()->{
        //            return UUID.randomUUID().toString();
        //        };
        //        System.out.println(supplier.get());
        //
        //        //  函数式接口
        //        //  Function<T, R> R apply(T t)
        //        Function<Integer,Integer> function =(t)->{
        //            return t*2;
        //        };
        //        System.out.println(function.apply(6));
        //
        //        //  断定型接口
        //        //  Predicate<T> boolean test(T t);
        //        Predicate<String> predicate = (t)->{
        //            return t.startsWith("f");
        //        };
        //        System.out.println(predicate.test("atguigu"));
        //        System.out.println(predicate.test("full outer join"));

        //  用流操作数据源！ {集合，数组}
        List<User> userList = new ArrayList<>();
        userList.add(new User(1, 22, "zhang3"));
        userList.add(new User(2, 23, "li4"));
        userList.add(new User(3, 20, "wang5"));
        userList.add(new User(4, 22, "zhao6"));
        userList.add(new User(5, 26, "tian7"));

        //  进行流式编程
        userList.stream().forEach((t) -> {
            System.out.println(t);
        });
        System.out.println("----------------------------------");
        //  过滤，排序，限制，数据转换，分组
        userList.stream().filter((user) -> {
            //  跟2 取模
            return user.getAge() % 2 == 0;
        }).sorted((o1, o2) -> {
            return o1.getAge() - o2.getAge();
        }).limit(2).forEach(System.out::println);

        System.out.println("========================================");
        //  数据转换的第一种操作
        Set<User> userSet = userList.stream().filter((user) -> {
            //  跟2 取模
            return user.getAge() % 2 == 0;
        }).sorted((o1, o2) -> {
            return o1.getAge() - o2.getAge();
        }).limit(2).collect(Collectors.toSet());

        //  数据转换的第二种操作
        List<Integer> ageList = userList.stream().map(User::getAge).collect(Collectors.toList());
        System.out.println(ageList);

        System.out.println("----------------------------------");
        //  使用年龄做分组
        //  map 的key = age, value = List<User>
        Map<Integer, List<User>> ageMap = userList.stream().collect(Collectors.groupingBy(User::getAge));

        //  迭代器
        Iterator<Map.Entry<Integer, List<User>>> iterator = ageMap.entrySet().iterator();
        while (iterator.hasNext()) {
            //  获取集合中的数据
            Map.Entry<Integer, List<User>> entry = iterator.next();
            //  获取age
            Integer age = entry.getKey();

            //  获取value
            List<User> users = entry.getValue();

            //            List<User> collect = users.stream().filter(user -> {
            //                return user.getId() % 2 == 0;
            //            }).collect(Collectors.toList());

            //  System.out.println(collect);

            users.stream().filter(user -> {
                return user.getId() % 2 == 0;
            }).forEach(System.out::println);
            System.out.println(age + "\t" + users);
        }
    }
}
