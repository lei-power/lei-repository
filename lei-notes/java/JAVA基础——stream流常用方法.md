#### 常用方法

```java
        //生成
        Stream<Integer> iterate=Stream.iterate(1,n->n*8).limit(xxx);
        Stream.generate(Math::random);

        //分组
        Map<String, List<T>>yearData=allData.stream().collect(Collectors.groupingBy(T::getYear));

        //过滤筛选(单条件)
        List<T> filterList=appleList.stream().filter(a->a.getName().equals("YC")).collect(Collectors.toList());

        //过滤筛选(多条件)
        List<T> filterList=dayVoList.
        stream().filter(a->a.getYEAR().equals(item)).collect(Collectors.toList())
        .stream().filter(a->a.getPrice()!="0"&&a.getPrice()!="0.0").collect(Collectors.toList());

        //合并List去重
        List<String> result=Stream.of(Lists.newArrayList("A","B","C"),Lists.newArrayList("A","B"))
        .flatMap(Collection::stream).distinct().collect(Collectors.toList());

        //合并List不去重
        List<String> result=Stream.of(Lists.newArrayList("A","B","C"),Lists.newArrayList("A","B"))
        .flatMap(Collection::stream).collect(Collectors.toList());

        //倒序
        List<T> api_list=apiData
        .stream().sorted(Comparator.comparing(T::getID).reversed()).collect(Collectors.toList());

        //正序
        List<T> api_list=apiData
        .stream().sorted(Comparator.comparing(T::getID).collect(Collectors.toList());

        //List去重
        List<T> primaryFilterData=apiData.stream().collect(
        Collectors.collectingAndThen(
        Collectors.toCollection(()->new TreeSet<>(Comparator.comparing(T::getName))),ArrayList::new));

        //分页+条件筛选
        List<T> handeList=reportVoList
        .stream().filter(s->s.getCode()<code_conditon).collect(Collectors.toList())
        .stream().skip((reqDTO.getCurPage()-1)*reqDTO.getPageSize()).limit(reqDTO.getPageSize()).
        collect(Collectors.toList());

```

#### 中间操作

    多个中间操作可以连接起来形成一个流水线，除非流水线上触发终止操作，否则中间操作不会执行任何的处理！而在终止操作时一次性全部处理，称为“惰性求值”。

| 方法                             | 描述                                                 |
|------------------------------------|--------------------------------------------------------|
| filter(Predicate p)            | 接收 Lambda ， 从流中排除某些元素                                  |
| distinct()                     | 筛选，通过流所生成元素的equals() 去除重复元素                            |
| limit(long maxSize)            | 截断流，使其元素不超过给定数量                                        |
| skip(long n)                   | 跳过元素，返回一个扔掉了前 n 个元素的流。若流中元素不足 n 个，则返回一个空流。与 limit(n) 互补 |
| peek(Consumer action)      | 接收Lambda，对流中的每个数据执行Lambda体操作                           |
| sorted()                       | 产生一个新流，其中按自然顺序排序                                       |
| sorted(Comparator com)         | 产生一个新流，其中按比较器顺序排序                                      |
| map(Function f)                | 接收一个函数作为参数，该函数会被应用到每个元素上，并将其映射成一个新的元素。                 |
| mapToDouble(ToDoubleFunction f) | 接收一个函数作为参数，该函数会被应用到每个元素上，产生一个新的 DoubleStream。          |
| mapToInt(ToIntFunction f)      | 接收一个函数作为参数，该函数会被应用到每个元素上，产生一个新的 IntStream。             |
| mapToLong(ToLongFunction f)    | 接收一个函数作为参数，该函数会被应用到每个元素上，产生一个新的 LongStream。            |
| flatMap(Function f)            | 接收一个函数作为参数，将流中的每个值都换成另一个流，然后把所有流连接成一个流                 |

#### 终端操作

    终端操作会从流的流水线生成结果。其结果可以是任何不是流的值，例如：List、Integer，甚至是 void。流进行了终止操作后，不能再次使用。

| 方法                                     | 描述                                           |
|--------------------------------------------|--------------------------------------------------|
| boolean allMatch(Predicate p)      | 检查是否匹配所有元素                                       |
| boolean anyMatch(Predicate p)  | 检查是否至少匹配一个元素                                     |
| boolean noneMatch(Predicate p)     | 检查是否没有匹配所有元素                                     |
| Optional<T> findFirst()            | 返回第一个元素                                          |
| Optional<T> findAny()              | 返回当前流中的任+意元素                                     |
| long count()                       | 返回流中元素总数                                         |
| Optional<T> max(Comparator c)      | 返回流中最大值                                          |
| Optional<T> min(Comparator c)      | 返回流中最小值                                          |
| void forEach(Consumer c)           | 迭代                                               |
| T reduce(T iden, BinaryOperator b) | 可以将流中元素反复结合起来，得到一个值。返回 T                         |
| U reduce(BinaryOperator b)         | 可以将流中元素反复结合起来，得到一个值。返回 Optional<T>               |
| R collect(Collector c)             | 将流转换为其他形式。接收一个 Collector接口的实现，用于给Stream中元素做汇总的方法 |
