---
layout:  post
title:   解决CompletableFuture异常阻塞
date:   0-12-24 17:12:55 发布
author:  'zhangtao'
header-img: 'img/post-bg-2015.jpg'
catalog:   false
tags:
-java

---



先说一下场景，为什么使用异步处理：

博主的项目有一块功能是暴露RPC接口，调用方调用后需要立即返回，同时接口被调用后需要去做其他任务。

一开始是同步进行，**先做任务再返回值给调用方**，这在生产环境上就出了问题：

- 数据太多导致同步调用耗时总共9分钟，导致调用方一直等待我方服务返回，无法进行后续操作

为了解决同步调用问题，因此引入了CompletableFuture异步执行任务，关于CompletableFuture的用法这里就不再详细描述了，网上都能搜索到。
在任务中执行到某一步后发生了异常，遍不再有日志打印和报错，程序就直接阻塞了。下面贴上代码

```java
CompletableFuture<Void> future=CompletableFuture.supplyAsync(()->{
        int a=0;
        int b=100;
        int c=b/a;
        return true;
        },new ThreadPoolExecutor(5,5,5L,
        TimeUnit.SECONDS,new ArrayBlockingQueue<>(50)))
        .thenAccept(result->System.out.println("result:"+result));
```

我们可以看到 int c = b / a; 这一行本该会抛出异常byZero，可是事实是运行调试至这一行就不再往下运行了，也没有任何的报错，经过排查了一天终于查出问题所在。

Future不同于Runnable需要获取返回值，才能获取异常信息，而Runnable可以直接抛出异常。所以可以使用

```java
future.get();
```

来获取异步调用的返回值，但是该方法会阻塞等待，如果这个任务执行了9分钟，那么接口调用方还是会等待很长时间，不推荐使用。

经查询资料可以修改为如下代码，捕获异常

```java
CompletableFuture<Void> future=CompletableFuture.supplyAsync(()->{
        int a=0;
        int b=100;
        int c=b/a;
        return true;
        },new ThreadPoolExecutor(5,5,5L,
        TimeUnit.SECONDS,new ArrayBlockingQueue<>(50)))
        .exceptionally(ex->{
        System.out.println(ex);
        return false;
        })
        .thenAccept(result->System.out.println("result:"+result));
```

下面就可以正常捕获到异步任务中的异常了 ![img](https://img-blog.csdnimg.cn/20201224170008438.png) 不过博主最后的做法是在异步任务中进行try
catch捕获了异常，因为任务中有foreach循环，所以一个异常会中断整个任务所以没有使用上面的方法，类似如下代码

```java
CompletableFuture<Boolean> future=CompletableFuture.supplyAsync(()->{
        for(int i=0;i< 2;i++){
        try{
        int a=0;
        int b=100;
        int c=b/a;
        }catch(Exception e){
        System.out.println("Error in task: "+e);
        }
        }
        return true;
        },new ThreadPoolExecutor(5,5,5L,
        TimeUnit.SECONDS,new ArrayBlockingQueue<>(50)));
        future.thenAccept(result->System.out.println("result:"+result));
```

这样就可以正常处理任务中的循环了，推荐在异步任务中用try catch将重要代码包裹起来，防止出现阻塞的情况 ![img](https://img-blog.csdnimg.cn/20201224171010803.png)

### Tips

如果不追求线程池异步任务的返回值的话，使用线程池的execute方法而不是submit方法，可以自动抛出得到异常，不用手动调用回调函数去得到异常。

