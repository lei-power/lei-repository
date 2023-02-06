### 1.�����عˣ�5-10���ӣ�

1.������̺͸߲�����������
2.�����ճ������к�ʱ���õ���������ô��
3.������̳�����· 1.�߳� ���� ��Դ�� �����ھ۵���ϣ�2.�̼߳�ͨ�� �жϣ���ֹ��ٻ�����while�� �ɻ� ֪ͨ 3.volatile��־λflag����
4.����˵���ǣ�
������ö��CPU�ļ���������
�������ҵ���֣�����Ӧ������
5.���߳� ��ȫ������ ԭ���ԣ��ɼ��ԣ�������
��Ծ������ ��������������������
�������� ǰ�潲�����̰߳�ȫ��������������Щ�����Ӱ����߳�ִ�й��̣������Щ��û�з��������̲߳���һ���ȵ��̴߳���ִ�п��𣬴��ǲ�һ������Ϊ���߳���`�����߳�`��`�߳��������л�`�Ŀ�����

�����߳���ֱ����ϵͳ������Դ�ģ��Բ���ϵͳ��˵����һ���̵߳Ĵ�����ʮ�ְ���ģ���Ҫ���������ڴ桢������ȵȡ�

�̴߳�����֮�󣬻��������߳�`�������л�`��

���һ���߳��������쳣ȴ�ٳٲ��ܼ������У��ǻ����Ǵ��ڼ���״̬�ˡ�

�����������̶߳��ڵȴ��Է��ͷ���������������`����`����˼���߳�û���������������ء�

������̶߳������в����޸ĸ��Ե�״̬���������̱߳˴��������״̬�������κ�һ���̶߳��޷�����ִ�У�ֻ���ظ�������Ķ������޸������״̬�����ֳ������Ƿ����˻����������һ����ɻ������پ�һ�������е����ӣ����ƽʱ����·��ʱ��ӭ������һ���ˣ������˻�����·��������ͬʱ�ߵ���һ���������һֱ�����ظ��ű��ã������˾��Ƿ����˻�����ѧ���˰ɣ��ٺ١�

���һ���߳��������쳣ȴ�ٳٲ��ܼ������У��ǻ����Ǵ��ڼ���״̬�ˡ�

CPU�Ǻܱ������Դ�ٶ�Ҳ�ǳ��죬Ϊ�˱�֤��¶��մ��ͨ��Ϊ����ͬ���̷߳���`ʱ��Ƭ`����CPU��ִ��һ���߳��л���ִ����һ���߳�ʱ��CPU
��Ҫ���浱ǰ�̵߳ı������ݣ�����ָ���״̬����������һ��Ҫִ�е��̵߳ı������ݣ�����ָ��ȣ�������ر���Ϊ���������л�����

һ������������л��ķ����У�`�����������`��`CAS �㷨`��`ʹ��Э��`�ȡ�

IO�ܼ��ͣ���Ҫ�������̻���Զ�̵��ýӿ� ������Ϊ2N
CPU�ܼ��ͣ���Ҫ����һЩѭ�����ݹ����ȹ��ܣ�����ΪN+1

�������
��ʹ��CompletableFutureʱ�̳߳ؾܾ��������ʹ��AbortPolicy��ֱ���ж����̣߳��ﵽ����ʧ�ܵ�Ч����
��ʱ���첽�̺߳�CompletableFuture���߳����̳߳ظ��룬�ú�ʱ������Ӱ�����̵߳�ִ��

��Ȼ Future �Լ����ʹ�÷����ṩ���첽ִ����������������Ƕ��ڽ���Ļ�ȡȴ�Ǻܲ����㣬ֻ��ͨ������������ѯ�ķ�ʽ�õ�����Ľ���������ķ�ʽ��Ȼ�����ǵ��첽��̵ĳ�����Υ������ѯ�ķ�ʽ�ֻ�ķ���ν�� CPU
��Դ������Ҳ���ܼ�ʱ�صõ���������

�ܽ�
��ʹ��CompletableFuture��ʱ���̳߳ؾܾ��������ʹ��AbortPolicy������̳߳�����ֱ���׳��쳣�ж����̣߳��ﵽ����ʧ�ܵ�Ч��
��ʱ���첽�̺߳�CompletableFuture���߳����̳߳ظ��룬�ú�ʱ������Ӱ�����̵߳�ִ��
������ֱ��ʹ��CompletableFuture��get()����������ʹ��future.get(5, TimeUnit.SECONDS);����ָ����ʱʱ��
ֱ���ж����̣߳�Ҫ����

### 2.CompletableFuture�첽���ţ�30���ӣ�

1.ʵ�ʰ��������д��룬�Ż�����ôд���Ż���Ľӿ�ʵ�ʲ��ԶԱ�
�첽��ص�
future callable

FutureTask������

1. �޷�����ִ�ж������: ����get������������, ���ֻ�ܵȴ���������ִ�����.
2. �޷���϶������: �����Ҫ�Զ�������ִ�н�����в���, ֻ��һ��һ������.
3. û���쳣����: Future�ӿ���û�ж��쳣���д���ķ���.
4. ʹ�ò�������: �����ִ������������һЩ����, �ͱ����ڵ���get()�����������������ȥд.

ǰ����ܵ�FutureTask��CompletionService, ��ֻ���ڴ���򵥵������ʱ��, ���ֱȽϺ�, �����漰��������ϲ�, ������������, �������е������ӱ��ŵ����, ������ֻ���ֶ�������.
��CompletableFuture�����Ϊ�˽�������������ֵ�.
CompletableFuture��Future�ӿڵ���չ, CompletableFutureʵ����Future�ӿ�, ���ڴ˻�����������Future�Ĳ���֮��, ʵ���˶�����ı�������, ����CompletableFuture,
���ǿ������ɵĽ��ж�����ı���, ������Ҫ����ʹ��CountDownLatch�ȹ�����������Ҫ���д�������������.

˼ά�߼�: ÿһ���߳̿���һ��������, ÿһ���߳���ִ�к�������, Ȼ�������ݿ�io����ͣ�߳�,�ȴ������߳�ȫ��ִ����, ����һһ���̴߳����쳣(has a),
����Ҫ����ȫ���߳̽�������ع�.�������ύȫ���̵߳�����.

### 3.ThreadLocal�ճ�ʹ�òȿ����ܽᣨ30���ӣ�

���������������Ҫִ��һ�������߼���������һ���̴߳����������������ת�������ִ�д�ӡ��������ô��������أ�һ����ʹ��Future.get��ȡ��������ִ��ת���߼������ִ�д�ӡ��������û����stream�����Ĵ���ʽ�أ�����CompletableFuture�Ļ���ʵ�ִ�������

CompletableFuture.supplyAsync(() -> "000")
.thenApply(s -> s.length()) // Function
.whenComplete((integer, throwable) -> System.out.println(integer));

Future �Լ����ʹ�÷����ṩ���첽ִ����������������Ƕ��ڽ���Ļ�ȡȴ�Ǻܲ����㣬ֻ��ͨ������������ѯ�ķ�ʽ�õ�����Ľ���������ķ�ʽ��Ȼ�����ǵ��첽��̵ĳ�����Υ������ѯ�ķ�ʽ�ֻ�ķ���ν�� CPU
��Դ������Ҳ���ܼ�ʱ�صõ�������

Future �ӿڵľ�����
Future�ӿڿ��Թ����첽Ӧ�ã�����Ȼ��������ԡ�������ֱ�ӱ������Future ���֮��������ԡ�ʵ�ʿ����У����Ǿ�����Ҫ�������Ŀ�ģ�

������첽����Ľ���ϲ���һ��

�ȴ�Future�����е������������

Future����¼���������������Ժ󴥷�ִ�ж�����

1�����б任

public <U> CompletionStage<U> thenApply(Function<? super T,? extends U> fn);
public <U> CompletionStage<U> thenApplyAsync(Function<? super T,? extends U> fn);
public <U> CompletionStage<U> thenApplyAsync(Function<? super T,? extends U> fn,Executor executor);
����˵��һ����Async��β�ķ������ǿ����첽ִ�еģ����ָ�����̳߳أ�����ָ�����̳߳���ִ�У����û��ָ����Ĭ�ϻ���ForkJoinPool.commonPool()

������ʱ�������쳣������ͨ��exceptionally���в���
public void exceptionally() {
String result = CompletableFuture.supplyAsync(() -> {
try {
Thread.sleep(3000);
} catch (InterruptedException e) {
e.printStackTrace();
}
if (1 == 1) {
throw new RuntimeException("����һ���쳣���");
}
return "s1";
}).exceptionally(e -> {
System.out.println(e.getMessage());
return "hello world";
}).join();
System.out.println(result);
}

       @Test
        public void whenComplete() {
            String result = CompletableFuture.supplyAsync(() -> {
                try {
                    Thread.sleep(3000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                if (1 == 1) {
                    throw new RuntimeException("����һ���쳣���");
                }
                return "s1";
            }).whenComplete((s, t) -> {
                System.out.println(s);
                System.out.println(t.getMessage());
            }).exceptionally(e -> {
                System.out.println(e.getMessage());
                return "hello world";
            }).join();
            System.out.println(result);
        }
    ���Ϊ��
    
    null
    java.lang.RuntimeException: ����һ���쳣���
    java.lang.RuntimeException: ����һ���쳣���

    ����Ҳ���Կ��������ʹ����exceptionally���ͻ�����յĽ������Ӱ�죬��û�п��ӷ������û���쳣ʱ����ȷ��ֵ����Ҳ��������������Ҫ���ܵ�handle��
    
    
    
    Future��Java5��ӵ��࣬��������һ���첽����Ľ����������isDone�������������Ƿ���ɣ�����ʹ��get����ס�����̣߳�ֱ��������ɷ��ؽ����Ҳ������cancel������ֹͣ�����ִ�С�
    
    Future�Լ����ʹ�÷����ṩ���첽ִ������������������ڽ���Ļ�ȡȴ�ǲ����㣬ֻ��ͨ����������ѯ�ķ�ʽ�õ��������������ķ�ʽ�����������첽�����ʵ����Υ���ģ�����ѯ�ֻ����ν��CPU��Դ�����һ����ܼ�ʱ�õ���������Ϊʲô�����ù۲������ģʽ����������ɼ�ʱ֪ͨ�������أ�
    
    Java8������������һ������50���������ҵ��ࣺCompletableFuture. �ṩ�˷ǳ�ǿ���Future����չ���ܣ����԰������첽��̵ĸ����ԣ��ṩ�˺���ʽ�������������ͨ���ص��ķ�ʽ���㴦�����������ṩ��ת������֯CompletableFuture�ķ�����
    
    
    CompletableFuture ��ʵ����CompletionStage��Future�ӿڣ����Ի��ǿ�������ǰһ��ͨ����������ѯ�ķ�ʽ��ý�����������ַ�ʽ���Ƽ�ʹ�á�
    
    public T get()
    public T get(long timeout, TimeUnit unit)
    public T getNow(T valueIfAbsent)
    public T join()
    ���е�getNow�е����⣬�������Ѿ��������򷵻ؽ�������쳣�����򷵻ظ�����valueIfAbsent��ֵ��
    
    join���ؼ���Ľ�����׳�һ��uncheckd�쳣��
    
    
    �����ĸ���̬��������Ϊһ���첽ִ�еĴ��봴��CompletableFuture����
    
    public static CompletableFuture<Void> runAsync(Runnable runnable)
     
    public static CompletableFuture<Void> runAsync(Runnable runnable, Executor executor)
     
    public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)
     
    public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier, Executor executor)
    
    �첽����
    ��ν�첽������ʵ����ʵ��һ��������ȴ������ú����ķ���ֵ���ò����������еķ������� Java �����У��򵥵Ľ���������һ���߳�����ɵ����еĲ��ּ��㣬ʹ���ü������л򷵻أ�������Ҫ�ȴ���������������������Ҫȡ�̵߳ļ�������
    
    
    ��Java8�У�CompletableFuture�ṩ�˷ǳ�ǿ���Future����չ���ܣ����԰������Ǽ��첽��̵ĸ����ԣ������ṩ�˺���ʽ��̵�����������ͨ���ص��ķ�ʽ�����������Ҳ�ṩ��ת������� CompletableFuture �ķ�����
    �����ܴ���һ����ȷ��ɵ�Future��Ҳ�п��ܴ���һ����ɽ׶Σ� CompletionStage ������֧���ڼ�������Ժ󴥷�һЩ������ִ��ĳЩ������
    ��ʵ����Future��CompletionStage�ӿ�

���Կ�����thenAccept��thenRun�����޷���ֵ�ġ����˵thenApply�ǲ�ͣ����������Ľ�����������ôthenAccept��thenRun�����ڽ������ġ������������������������׶Ρ�

��ʵ�ϣ����ÿ���������ܼ򵥵Ļ������磺����������а���idȥ�飩û�б�Ҫ�����ֶ��߳��첽�ķ�ʽ����Ϊ�����̻߳���Ҫʱ�䣬������ֱ��ͬ��ִ�����ÿ졣

��ʵ֤����ֻ�е�ÿ�������ܸ�����Ҫ������Ժܳ���ʱ�䣨���磬���ö��������ϵͳ�Ľӿڣ����磬��Ʒ����ҳ��������Ҫ�Ӷ��ϵͳ�в�������ʾ�ģ���ʱ����CompletableFuture�ź��ʣ���Ȼ������Ĳ��󣬻�����˳��ͬ��ִ�С�

CompletableFuture �������� CompletionStage �ӿڣ�CompletionStage �ӿ�ʵ�����ṩ��ͬ�����첽���м������̨���������ǿ���ͨ��ʵ�ֶ�� CompletionStage
������ҽ���Щ�������һ��ķ�ʽʵ�ֶ������֮��Ĵ�����

��������������˵�һ���������Ѿ���ɵ�CompletableFuture�������������ɵ��ַ�������������ַ�����д��

static void thenApplyExample() {
CompletableFuture cf = CompletableFuture.completedFuture("message").thenApply(s -> {
assertFalse(Thread.currentThread().isDaemon());
return s.toUpperCase();
});
assertEquals("MESSAGE", cf.getNow(null));
}
����Ĺؼ�����thenApply��

then��ָ�ڵ�ǰ�׶�����ִ����ɺ�����ִ����ָû���׳��쳣�����еĲ������ڱ����У���ǰ�׶��Ѿ���ɲ��õ�ֵmessage��
Apply��ָ��һ��Function������֮ǰ�׶εó��Ľ��
Function�������ģ�����ζ��ֻ�е���д����ִ�����֮��Ż�ִ��getNow()������

Futrue
FutureTask
CompletionService
CompletableFuture
ԭ��
Futrue�ӿ�

�ӿ�RunnableFuture��Ψһʵ���࣬RunnableFuture�ӿڼ̳���Future<V>+Runnable:    �ڲ�ͨ����������+FutureTask�ӿ� JDK8ʵ����Future<T>, CompletionStage<T>2���ӿ�
�����񲢷�ִ�� ֧�� ֧�� ֧�� ֧��
��ȡ��������˳��
�����ύ˳���ȡ���

δ֪ ֧��������ɵ��Ⱥ�˳�� ֧��������ɵ��Ⱥ�˳��
�쳣��׽ �Լ���׽ �Լ���׽ �Լ���׽ Դ��API֧�֣�����ÿ��������쳣
���� CPU������ѯ������Դ������ʹ�ã������Ƽ� ���ܲ��Կڣ�����������һ�����һ�㣬���Ƽ�ʹ�á� �Ƽ�ʹ�ã�û��JDK8CompletableFuture֮ǰ��õķ�����û������
API���˷ḻ�������ʽ��̣��ٶȷ����Ƽ�ʹ�ã�

CompletableFuture�ܹ����ص��ŵ�������ͬ���߳���ִ�У�Ҳ�ܽ��ص���Ϊ����ִ�е�ͬ������������������ͬ���߳���ִ�С��������˴�ͳ�ص��������⣬�Ǿ����ܹ������������뵽��ͬ���¼���������

CompletableFuture�ľ�̬��������

������ ����
runAsync(Runnable runnable)    ʹ��ForkJoinPool.commonPool()��Ϊ�����̳߳�ִ���첽���롣
runAsync(Runnable runnable, Executor executor)    ʹ��ָ����thread poolִ���첽���롣
supplyAsync(Supplier<U> supplier)    ʹ��ForkJoinPool.commonPool()��Ϊ�����̳߳�ִ���첽���룬�첽�����з���ֵ
supplyAsync(Supplier<U> supplier, Executor executor)    ʹ��ָ����thread poolִ���첽���룬�첽�����з���ֵ

���Կ���future����complete(T t)������ִ�С�����complete(T t)ֻ�ܵ���һ�Σ��������ظ����û�ʧЧ��

���future�Ѿ�ִ������ܹ����ؽ������ʱ�ٵ���complete(T t)�����Ч��

CompletableFutureͬʱ��һ����Ϻ�һ����ܣ����д�Լ50�ֲ�ͬ�Ĺ��ɣ���ϣ�ִ���첽���㲽��ʹ������

����Ӵ��API���ܻ����������мܣ����Ľ���һЩ��Ҫ�����ص���ܡ�

��������������һ��CompletableFuture������Ӧ���ڼ���������thenCompose��flatMap����������һ���������ú���������ͬ���͵���һ��CompletableFuture���󡣴˹��ܽṹ������Щ���ʵ������������ϼ��㡣

���򵥵�����ǣ�������Ҫʹ������Future���ʱ��������Ҫ���κν��ֵ���з���ʱ��������thenAcceptBoth������ʾ�����Ĵ�����Ҫ����ֵ���� thenCombine ��ʾ��Ҫ����ֵ��

thenApply()
�˷������ڴ�����ǰ���õĽ�������ǣ�Ҫ��ס��һ���ؼ����Ƿ���������ת�������е����ͣ���ͬһ��CompletableFuture��

��ˣ���������Ҫת��CompletableFuture ���õĽ��ʱ��Ч���������� ��

CompletableFuture<Integer> finalResult = compute().thenApply(s-> s + 1);

��ע�⣬CompletableFuture.allOf()�ķ���������CompletableFuture
�����ַ����ľ��������������᷵������������ۺϽ�����෴��������ֶ���Futures��ȡ��������˵��ǣ�CompletableFuture.join()������Java 8 Streams API���Խ����

String combined = Stream.of(future1, future2, future3)
.map(CompletableFuture::join)
.collect(Collectors.joining(" "));

assertEquals("Hello Beautiful World", combined);
  

