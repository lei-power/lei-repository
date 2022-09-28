### 常用方法

#### 获得结果和触发计算
##### 获得结果
1. get() 不见不散，会阻塞
2. get(long timeout,TimeUnit unit) 过时不候
3. getNow(T target) 立即获得*不阻塞*，算完了则返回结果，没算完返回替代品target
4. **join()**

##### 主动触发计算
1. public boolean complete(T value) get()没算完的话就打断返回value值*思考与getNow()的区别*
```java
    public static void main(String[] args) throws ExecutionException, InterruptedException{
        CompletableFuture<Integer> completableFuture = CompletableFuture.supplyAsync(() -> {
            try { TimeUnit.SECONDS.sleep(1); } catch (InterruptedException e) { e.printStackTrace(); }
            return 533;
        });
        //注释掉暂停线程，get还没有算完只能返回complete方法设置的444；暂停2秒钟线程，异步线程能够计算完成返回get
        try { TimeUnit.SECONDS.sleep(2); } catch (InterruptedException e) { e.printStackTrace(); }
        //当调用CompletableFuture.get()被阻塞的时候,complete方法就是结束阻塞并get()获取设置的complete里面的值.
        System.out.println(completableFuture.complete(444)+"\t"+completableFuture.get()); 
    }
```
#### 对计算结果进行处理
1. thenApply 计算结果存在依赖关系，将2个线程串行化；由于存在依赖关系，当前步错不会走下一步，异常叫停  *whenComplete((v,e)->{}).exceptionally(e->{})* 出现异常捕获like try/catch
```java
    //当一个线程依赖另一个线程时用 handle 方法来把这两个线程串行化,
    CompletableFuture.supplyAsync(() -> {
        //暂停几秒钟线程
        try { TimeUnit.SECONDS.sleep(1); } catch (InterruptedException e) { e.printStackTrace(); }
        System.out.println("111");
        return 1024;
    }).handle(f -> {
        System.out.println("222");
        return f + 1;
    }).handle(f -> {
        //int age = 10/0; // 异常情况：那步出错就停在那步。
        System.out.println("333");
        return f + 1;
    }).whenCompleteAsync((v,e) -> {
        System.out.println("*****v: "+v);
    }).exceptionally(e -> {
        e.printStackTrace();
        return null;
    });
    System.out.println("-----主线程结束，END");
    // 主线程不要立刻结束，否则CompletableFuture默认使用的线程池会立刻关闭:
    try { TimeUnit.SECONDS.sleep(2); } catch (InterruptedException e) { e.printStackTrace(); }
```
2. handle 有异常也可以往下走，根据异常参数进行进一步处理   异常不叫停  *whenComplete((v,e)->{}).exceptionally(e->{})* 出现异常捕获like try/finally
```java
        //当一个线程依赖另一个线程时用 handle 方法来把这两个线程串行化,
        // 异常情况：有异常也可以往下一步走，根据带的异常参数可以进一步处理
        CompletableFuture.supplyAsync(() -> {
            //暂停几秒钟线程
            try { TimeUnit.SECONDS.sleep(1); } catch (InterruptedException e) { e.printStackTrace(); }
            System.out.println("111");
            return 1024;
        }).handle((f,e) -> {
            int age = 10/0;
            System.out.println("222");
            return f + 1;
        }).handle((f,e) -> {
            System.out.println("333");
            return f + 1;
        }).whenCompleteAsync((v,e) -> {
            System.out.println("*****v: "+v);
        }).exceptionally(e -> {
            e.printStackTrace();
            return null;
        });
        System.out.println("-----主线程结束，END");

        // 主线程不要立刻结束，否则CompletableFuture默认使用的线程池会立刻关闭:
        try { TimeUnit.SECONDS.sleep(2); } catch (InterruptedException e) { e.printStackTrace(); }
```

**whenComplete():执行当前任务的线程继续执行whenComplete()**
**whenCompleteAsync():把whenCompleteAsync()提交给线程池来运行**

#### 对计算结果进行消费 （串行化执行）
1. thenAccept
2. thenRun
3. handle

#### 对计算速度进行选用
applyToEither 2个Completablefuture 哪个快用哪个,2个线程都执行的·
```java
completableFuture1 = new completableFuture();
completableFuture2 = new completableFuture();
CompletableFuture<Integer> thenCombineResult = completableFuture1.applyToEither(completableFuture2, f -> {return f + 1;});
```

#### 对计算结果进行合并 
1. thenCombine 先完成的等着其他分支完成任务
```java
 CompletableFuture<Integer> thenCombineResult = CompletableFuture.supplyAsync(() -> 10).thenCombine(CompletableFuture.supplyAsync(() -> 20), (x, y) -> x + y).thenCombine(CompletableFuture.supplyAsync(() -> 30), (a, b) -> a + b);
```


