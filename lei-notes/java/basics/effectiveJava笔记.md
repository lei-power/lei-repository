# effectiveJava笔记
[TOC]


## 1.引言
- 代码应该被复用，而非拷贝
- 四种类型：接口（含@interface）、类（含enum)、数组、基本数据集类型
- 数组是对象，而基本类型值不是对象
- 方法的签名(signature)由名称、入参类型组成、**签名不包括方法的返回类型，联想到构成方法重载的约束**; 
- 类、接口、构造器、成员以及序列化形式被统称为API元素，API由所有在该API的包的API元素组成。
  
     
## 2.创建和销毁对象
### 1.用静态工厂方法代替构造器
1. 优点
- 与构造方法不同，它们是有名字的；
- 与构造方法不同，它们不需要每次调用时都创建一个新对象；
- 与构造方法不同，它们可以返回其返回类型的任何子类型的对象；
- 返回对象的类可以根据输入参数的不同而不同；
- 在编写包含该方法的类时，返回的对象的类不需要存在这构成了服务提供者框架的基础；

>服务提供者框架中有三个重要的组件：服务接口(Service Interface)，这是提供者实现的；提供者注册API ( Provider Registration API)，这是提供者用来注册实现的；服务访问API (Service Access API
) ，这是客户端用来获取服务的实例。服务访问API 是客户端用来指定某种选择实现的条件。如果没有这样的规定， API 就会返回默认实现的一个实例，或者允许客户端遍历所有可用的实现。
>
>服务提供者

2. 缺点
- 只提供静态工厂方法的主要限制是，没有公共或受保护构造方法的类不能被子类化；
- 静态工厂方法的第二个缺点是，程序员很难找到它们；
- 常用名称示例：
    - from ——  类型转换方法，它接受单个参数并返回此类型的相应实例，例如：**Date d = Date.from(instant)**;
    - of —— 聚合方法，接受多个参数并返回该类型的实例，并把他们合并在一起，例如：**Set\<Rank\> faceCards = EnumSet.of(JACK, QUEEN, KING)**;
    - valueOf —— from 和 to 更为详细的替代 方式，例如：**BigInteger prime = BigInteger.valueOf(Integer.MAX_VALUE)**;
    - instance 或 getinstance —— 返回一个由其参数 (如果有的话) 描述的实例，但不能说它具有相同的值，例如：**StackWalker luke = StackWalker.getInstance(options)**;
    - create 或 newInstance —— 与 instance 或 getInstance 类似，除此之外该方法保证每次调用返回一个新的实例，例如：**Object newArray = Array.newInstance(classObject, arrayLen)**;
    - getType —— 与 getInstance 类似，但是在工厂方法处于不同的类中的时候使用。**getType** 中的 **Type** 是工厂方法返回的对象类型，例如：**FileStore fs = Files.getFileStore(path)**;
    - newType —— 与 newInstance 类似，但是在工厂方法处于不同的类中的时候使用。**newType**中的 **Type** 是工厂方法返回的对象类型，例如：**BufferedReader br = Files.newBufferedReader(path)**;
    - type —— getType 和 newType 简洁的替代方式，例如：**List\<Complaint\> litany = Collections.list(legacyLitany)**;

      ​      
### 2.当构造方法参数过多时使用 builder 模式
- 多重叠构造器具有安全性，**javaBeans模式构建实例缺乏安全性**
- 类不包含显式的构造器时，编译器会生成缺省的构造器，因此只要让这个类**包含一个私有构造器**，它就不能被实例化。
```java
    // Noninstantiable utility class
    public class UtilityClass {

        // Suppress default constructor for noninstantiability
        private UtilityClass() {
            throw new AssertionError();
        }
        ... // Remainder omitted
    }
```
- 除了重用不可变的对象之外，也可以重用那些已知不会被修改的可变对象。
- 正则表达式优化：先创建一个final pattern，复用
```java
    public class RomanNumerals {

        private final static Pattern ROMAN = Pattern.compile("xxx---xxx---xxxx");
        public static isRomanNumeral(String s) {
            return ROMAN.matcher(s).matches();
        }

    }
  
```
- 注意，在提倡使用**保护性拷贝**的时候重用对象付出的代价要远大于创建重复对象而付出的代价。必要时如果没能实施保护性拷贝，将会导致潜在的Bug和安全漏洞；而不必要地创建对象则只会影响程序的风格和性能。

### 7.消除过期的对象引用
- 内存泄漏
    - 在极端的情况下，这种内存泄漏会导致磁盘交换(Disk Paging)，甚至导致程序失败(OutOfMemoryError 错误
    - 只要类是自己管理内存，程序员就应该警惕内存泄漏问题;
    - 内存泄漏的另一个常见来源是缓存;
    - 内存泄漏的第三个常见来源是监昕器和其他回调。
        - 确保回调立即被当作垃圾回收的最佳方法是只保存它们的弱引用(weakreference) ，例如，只将它们保存成WeakHashMap 中的键。

### 8.避免使用 Finalizer 和 Cleaner 机制
- 从一个对象不可达，到它的终结方法被执行，时间是任意长的,注重时间的任务不应该由终结方法或者清除方法来完成；
- 使用终结方法的另一个问题是，在终结过程中抛出的未被捕获的异常，终结过程会终止。
- 构造器或者它的序列化时**抛出异常**，恶意子类的终结方法就可以在构造了一部分的应该已经半途夭折的对象上运行。这个终结方法会将对该对象的引用记录在一个静态域中，阻止它被垃圾回收。一旦记录到异常的对象，就可以轻松地在这个对象上调用任何原本永远不允许在这里出现的方法。构造器抛出的异常，应该足以防止对象继续存在；有了终结方法的存在，这一点就做不到了。这种攻击可能造成致命的后果。final类不会受到终结方法攻击，因为没有人能够编写出final类的恶意子类。为了防止非final类受到终结方法攻击，要编写一个空的final的finalize方法。
- 那么，如果类的对象中封装的资源（例如文件或者线程）确实需要终止，应该怎么做才能不用编写终结方法或者清除方法呢？只需让类实现AutoCloseable，并要求其客户端在每个实例不再需要的时候调用close方法，一般是利用try-with-resources确保终止，即使遇到异常也是如此（详见第9条）。
  
### 9. 使用 try-with-resources 语句替代 try-finally 语句
```java 
 // try-finally - No longer the best way to close resources!
 static String firstLineOfFile(String path) throws IOException {
     BufferedReader br = new BufferedReader(new FileReader(path));
     try {
         return br.readLine();
     } finally {
         br.close();
     }
 }
```
- try-with-resources 块和 finally 块中的代码都可以抛出异常。第二个异常会覆盖第一个异常导致无法追踪；
```java
 static void copy(String src, String dst) throws IOException {
     try (InputStream   in = new FileInputStream(src);
          OutputStream out = new FileOutputStream(dst)) {
         byte[] buf = new byte[BUFFER_SIZE];
         int n;
         while ((n = in.read(buf)) >= 0)
             out.write(buf, 0, n);
     }
 }
```

### 10. 重写 equals 方法时遵守通用约定
- ？？？ 类是私有的或包级私有的，可以确定它的 equals 方法永远不会被调用。如果你非常厌恶风险，可以重写 equals 方法，以确保不会被意外调用
```java
 @Override 
 public boolean equals(Object o) {
     throw new AssertionError(); // Method is never called
 }
```
- 重写equals约定：
     - **自反性：** 对于任何非空引用 x，`x.equals(x)` 必须返回 true。
     - **对称性：** 对于任何非空引用 x 和 y，如果且仅当 `y.equals(x)` 返回 true 时 `x.equals(y)` 必须返回 true。
     - **传递性：** 对于任何非空引用 x、y、z，如果 `x.equals(y)` 返回 true，`y.equals(z)` 返回 true，则 `x.equals(z)` 必须返回 true。
     - **一致性：** 对于任何非空引用 x 和 y，如果在 equals 比较中使用的信息没有修改，则 `x.equals(y)` 的多次调用必须始终返回 true 或始终返回 false。
     - 对于任何非空引用 x，`x.equals(null)` 必须返回 false。

- 没有令人满意的方法来继承一个可实例化的类并添加一个值组件，可以采用“组合而不是继承”；在 ColorPoint 类中定义一个私有 Point 属性，和一个公共的视图（view）方法，用来返回具有相同位置的 ColorPoint 对象。
```java
 public class ColorPoint {
     private final Point point;
     private final Color color;
 
     public ColorPoint(int x, int y, Color color) {
         point = new Point(x, y);
         this.color = Objects.requireNonNull(color);
     }
     
     /**
      * Returns the point-view of this color point.
      */
     public Point asPoint() {
         return point;
     }
 
     @Override 
     public boolean equals(Object o) {
         if (!(o instanceof ColorPoint))
             return false;
         ColorPoint cp = (ColorPoint) o;
         return cp.point.equals(point) && cp.color.equals(color);
     }
     
     ...    // Remainder omitted
 }
```
- 对于类型为非 float 或 double 的基本类型，使用 == 运算符进行比较；对于对象引用属性，递归地调用 equals 方法；对于 float 基本类型的属性，使用静态 `Float.compare(float, float)` 方法；对于 double 基本类型的属性，使用 `Double.compare(double, double)` 方法。

### 11. 重写 equals 方法时同时也要重写 hashcode 方法


### 10. 重写 equals 方法时遵守通用约定




## 3.对所有对象都通用的方法



## 4.类和接口
## 5.泛型
## 6.枚举和注解
## 7.函数式和流
## 8.方法
## 9.通用编程
## 10.异常
## 11.并发
## 12.序列化