### 远程调用的异常处理（左岸方式）

```java
//统一结果返回类BaseResp处理了异常封装
        BaseResp<List<String>>resp=produceFacadeClient.getListOfGisDkidByFarmId(snFarmId);
        if(!resp.isSuccess()){
        return BaseResp.returnResp(resp); //将异常信息层层返回
        }
```

### 集合非空判断

```java
// map 类型只判断是否为null list要判断size>0
        if(HashMap!=null){}
                if(landList!=null&&landList.size>0){}
```

#### 大数据量分批插入

```java
//方法一：stream流 利用分页方法
        if(result.size()>0){
                //一次500条
                int totalsize=500;
                int count=(result.size()+totalsize-1)/totalsize;
                //分成limit次发请求到数据库，in（）操作时   可以把多条数据分割成多组请求
                Stream.iterate(0,n->n+1).limit(count).forEach(i->{
                //获取 skip 跳过前面n个元素拿limit（xxx）xxx 个
                //doSomething();
                landMange.insetBatch(result.stream().skip(i*totalsize).limit(totalsize).collect(Collectors.toList()))
                });
                }

                // 方法二：传统循环
                //6、批量插入数据
                int listSize=insertList.size();
                int toIndex=1000;
                for(int i=0;i<insertList.size();i+=1000){ //每次加1000 就只循环想要的 批量1000个
        if(i+1000>listSize){        //作用为toIndex最后没有toIndex条数据则剩余几条newList中就装几条
        toIndex=listSize-i;
        }
        List<Land> landList=insertList.subList(i,i+toIndex);
        produceFacadeClient.insertBatch(landList);
        }
```

### 加锁的写法（左岸方式）

```java
String key=LockCons.gisSyncLandToSn+gisfarmId;// key命名规范化，统一放入常量类里
        try{
        RLock lock=redissonClient.getLock(key);// redisson 分布式锁用法
        boolean locked=lock.isLocked();        //  先判断是否已加锁，做相应操作
        log.info("syncLand--locked:{} -- key:{} ",locked,key);
        if(locked){
        log.error("syncLand--请勿频繁操作");
        return BaseResp.failByParamError("请勿频繁操作");
        }
        //trylock 1s,自旋重试获取锁，5s释放锁时间，防止死锁 
        lock.tryLock(1,5,TimeUnit.SECONDS);
        log.info("syncLand--locked--加锁成功--5秒-key:{}",key);
        /**
         * 任务流程
         * 1.xxx 
         * 2.xxxx 
         * return xxx;
         */
        }catch(Exception e){
        log.error("gis主体同步地块失败",e);  //打印异常
        return BaseResp.failByParamError("gis主体同步地块失败");
        }finally{
        //释放锁
        RLock lock=redissonClient.getLock(key);
        // 解锁判断比较复杂 锁可能为空，锁可能已经释放，锁可能被其他人锁定
        //  lock.isHeldByCurrentThread() 判断当前线程是否持有锁
        if(lock!=null&&lock.isLocked()&&lock.isHeldByCurrentThread()){
        lock.unlock();
        }
        log.info("syncLand--locked--解锁成功--key:{}",key);
        }
        }
```

### AOP获取日志写法（左岸方式）

```java
@Pointcut("execution(public * com.za.*.biz.gov.controller..*.*(..))") public void logPointCut(){}
    @Around("logPointCut()") public Object around(ProceedingJoinPoint point)throws Throwable{
        // 执行方法
        // 环绕通知在此处调用proceed()后,如果子服务有业务异常会直接步入这里并结束.所以需要捕获异常并抛出
        try{
        responseBody=point.proceed();
        }catch(Throwable throwable){
        exception=throwable;
        exceptionFlag=true;
        }
        // 执行时长(毫秒)
        int platformType=RequestUtils.getPlatformType(); // todo RequestUtils 请求工具类封装了很多方法，注意使用
        CurGovUser user=GovUserUtils.getUser();// 使用ThreadLocal 保证线程安全
        // 获取请求url
        HttpServletRequest request=RequestUtils.getRequest();
        String requestUrl=request.getRequestURI();
        // 获取请求ip
        String requestIp=RequestUtils.getIpAddress();
        // 获取请求方法
        String requestMethod=request.getMethod();
        // 获取请求参数;open服务接口都是使用json传参的post请求
        Object reqModel=RequestUtils.getRequestBodyParam(point);
        String requestBody=JsonUtils.toJson(reqModel);
        // 正常响应
        if(responseBody instanceof BaseResp){ // todo 神农口袋接口统一返回类 ，通过是否是其子类来判断是否是正常返回？？？ return BaseResp.fairParamError()???
        }
        List<String> filterRequestList=getFilterRequestUrlList(); // 过滤某些不需要记录的url，其实也拦截了，只是不写入数据库
        if(filterRequestList.contains(requestUrl)){// 存字符串数组
        if(exceptionFlag)throw exception; // 出异常了也要记录，所以前面抓了异常，这里抛
        return responseBody;
        }
        saveLog(responseCode,governmentSubjectId,requestUrl,requestIp,requestMethod,requestBody,responseBody,requestTime,platformType,accessToken,userId,loginName,respDesc); // todo 出异常了也要记录，所以前面抓了异常，这里抛
        if(exceptionFlag)throw exception;
        return responseBody;
        }
    }
```

### 输入流从classPath获取

```java
ClassPathResource resource=new ClassPathResource("beans.xml");
        InputStream inputStream=resource.getInputStream();
```

### spring el表达式取值

```java
@Value("#{'${gov.zagis.refdomain.list}'.split(',')}") //可以用字符串函数
        private List<String> refDomainList;
```

### 递归案例一
![](https://lei-repository.oss-cn-hangzhou.aliyuncs.com/images/JAVA基础——常用代码归纳及踩坑记录/1675665739114.png?x-oss-process=image/auto-orient,1/interlace,1/quality,q_50/format,jpg)

### 挂载lib减少jar体积
1. 拷贝lib目录文件
2. 打包排除jar包
```xml
<plugin>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-maven-plugin</artifactId>
    <configuration>
        <fork>true</fork>
        <layout>ZIP</layout>
        <includes>
            <include>
                <!-- 排除所有Jar -->
                <groupId>nothing</groupId>
                <artifactId>nothing</artifactId>
            </include>
        </includes>
    </configuration>
</plugin>
```




### 踩坑实录
- 存储数据到redis需要参数完整，少了时间的单位会变成二进制文件（显示为乱码）
- controller,service,mapper是spring的ioc容器管理 <br>servlet，filter ，listener是tomcat容器管理
- **bin、userbin、userlocalbin、sbin、usersbin、userlocalsbin** linux下这些目录都可以直接执行
- touch 创建一个文件 {touch test1.txt test2.txt 同时创建两个文件} **{touch test{0001..2000}.txt 批量创建文件（如创建2000个文件）}**

