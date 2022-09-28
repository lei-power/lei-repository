package com.atguigu.juc.cf;

/**
 * @auther zzyy
 * @create 2021-03-02 11:56
 */
//public class CompletableFutureDemo {
//
//    public static void main(String[] args) throws Exception {
//        ThreadPoolExecutor threadPoolExecutor =
//            new ThreadPoolExecutor(1, 20, 1L, TimeUnit.SECONDS, new LinkedBlockingQueue<>(50), Executors.defaultThreadFactory(),
//                new ThreadPoolExecutor.AbortPolicy());
//        CompletableFuture<java.lang.String> future1 = CompletableFuture.supplyAsync(() -> { return "12"; });
//        CompletableFuture<java.lang.String> future2 = CompletableFuture.supplyAsync(() -> { return "23"; });
//        CompletableFuture<java.lang.String> future3 = CompletableFuture.supplyAsync(() -> { return "45"; });
//        CompletableFuture<java.lang.String> future4 = CompletableFuture.supplyAsync(() -> { return "56"; });
//        List<CompletableFuture> list = new ArrayList<>();
//        list.add(future1);
//        list.add(future2);
//        list.add(future3);
//        list.add(future4);
//        CompletableFuture<Void> allOf = CompletableFuture.allOf(list.toArray(new CompletableFuture[list.size()]));
//        allOf.join();
//
//        List<java.lang.String> collect = list.stream().map(CompletableFuture::join).collect(Collectors.toList());
//
//        threadPoolExecutor.shutdown();
//    }
//}
//    @Autowired
//    private DataSourceTransactionManager transactionManager;
//
//    public BaseResp<ApplyCancel> audit(Long applyFlowId, String processStatus, String remark, Long userId) {
//
//        //1.1.自定义一个线程池
//        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(100, 200, 10, TimeUnit.SECONDS, new LinkedBlockingQueue<>());
//        //1.2.存放合同、权证、登记簿等临时结果容器
//        Map<String, Object> map = new HashMap<>(10);
//        //1.3.自定义错误信息集合
//        List<String> errorList = Collections.synchronizedList(new ArrayList<>());
//        //1.4.开启新事务的线程集合
//        List<Thread> threadList = Collections.synchronizedList(new ArrayList<>());
//        //1.5.异步任务集合，便于统一执行
//        List<Future> futureList = new ArrayList<>();
//        //1.6.回滚标志位
//        AtomicBoolean rollbackFlag = new AtomicBoolean(false);
//        //1.7.开启新事务的线程数量
//        AtomicInteger totalCount = new AtomicInteger(9);
//        //1.8.定义子线程事务为开启一个新事务
//        DefaultTransactionDefinition definition = new DefaultTransactionDefinition();
//        definition.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRES_NEW);
//
//        log.info("===============================================开始参数校验========================================================");
//        //2.1查询审核流程是否存在及是否是待审核状态，否的话不可以审核
//        CompletableFuture<ApplyCancel> applyCancelFuture = CompletableFuture.supplyAsync(() -> {
//            ApplyFlow applyFlow = applyFlowManage.getById(applyFlowId);
//            if (applyFlow == null) {
//                errorList.add("当前登记流程记录不存在");
//            } else {
//                if (!applyFlow.getProcessStatus().equals(ProcessStatus.pending_review)) {
//                    errorList.add("当前登记状态不是待审核状态");
//                }
//            }
//            map.put("applyFlow", applyFlow);
//            return applyFlow;
//        }, threadPoolExecutor).thenApply((applyFlow) -> {
//            //查询当前登记是否存在
//            ApplyCancel po = this.getById(applyFlow.getRelationRegisterId());
//            if (po == null) {
//                errorList.add("当前登记不存在");
//                return new ApplyCancel();
//            }
//            map.put("applyCancel", po);
//            log.info("参数校验------------------2.1.执行完毕");
//            return po;
//        });
//        //2.2.校验用户信息是否合法
//        CompletableFuture<Void> userFuture = CompletableFuture.runAsync(() -> {
//            BaseResp<GovernmentUser> governmentUserBaseResp = governmentUserFacadeClient.get(userId);
//            if (!governmentUserBaseResp.isSuccess()) {
//                errorList.add(governmentUserBaseResp.getRespDesc());
//            } else {
//                if (governmentUserBaseResp.getObj() == null) {
//                    errorList.add("用户不存在");
//                }
//            }
//            log.info("参数校验------------------2.2.执行完毕");
//        }, threadPoolExecutor);
//        //2.3.检查承包方是否存在，且未被注销
//        CompletableFuture<Void> cbfFuture = applyCancelFuture.thenAcceptAsync((po) -> {
//            Cbf cbf = cbfManage.getByCbfbm(po.getCbfbm());
//            if (cbf == null) {
//                errorList.add("承包方不存在");
//            } else {
//                if (cbf.getCancelFlag().equals(CancelFlag.YES)) {
//                    errorList.add("承包方已注销");
//                }
//            }
//            map.put("cbf", cbf);
//            log.info("参数校验------------------2.3.执行完毕");
//        }, threadPoolExecutor);
//        //2.4.检查承包合同是否存在，且未被注销
//        CompletableFuture<Void> cbhtFuture = applyCancelFuture.thenAcceptAsync((po) -> {
//            Cbht cbht = cbhtManage.getByCbfbm(po.getCbfbm());
//            if (cbht == null) {
//                errorList.add("承包方未生成承包合同");
//            } else {
//                if (cbht.getCancelFlag().equals(CancelFlag.YES)) {
//                    errorList.add("承包方承包合同已注销");
//                }
//            }
//            map.put("cbht", cbht);
//            log.info("参数校验------------------2.4.执行完毕");
//        }, threadPoolExecutor);
//        //2.5.检查是否已经生成登记簿
//        CompletableFuture<Void> cbjyqzdjbFuture = applyCancelFuture.thenAcceptAsync((po) -> {
//            Cbjyqzdjb cbjyqzdjb = cbjyqzdjbManage.getByCbfbm(po.getCbfbm());
//            if (cbjyqzdjb == null) {
//                errorList.add("承包方未登记入簿，无法进行互换登记，请重新选择登记方式");
//            } else {
//                if (cbjyqzdjb.getCancelFlag().equals(CancelFlag.YES)) {
//                    errorList.add("承包方登记簿已注销");
//                }
//            }
//            map.put("cbjyqzdjb", cbjyqzdjb);
//            log.info("参数校验------------------2.5.执行完毕");
//        }, threadPoolExecutor);
//        //2.6.检查是否已经生成登记权证
//        CompletableFuture<Void> cbjyqzFuture = applyCancelFuture.thenAcceptAsync((po) -> {
//            Cbjyqz cbjyqz = cbjyqzManage.getByCbfbm(po.getCbfbm());
//            if (cbjyqz == null) {
//                errorList.add("承包方未生成登记簿权证，无法进行互换登记，请重新选择登记方式");
//            } else {
//                if (cbjyqz.getCancelFlag().equals(CancelFlag.YES)) {
//                    errorList.add("承包方登记簿登记簿权证已注销");
//                }
//            }
//            map.put("cbjyqz", cbjyqz);
//            log.info("参数校验------------------2.6.执行完毕");
//        }, threadPoolExecutor);
//
//        //2.7将异步任务放入集合统一执行
//        futureList.add(applyCancelFuture);
//        futureList.add(userFuture);
//        futureList.add(cbfFuture);
//        futureList.add(cbhtFuture);
//        futureList.add(cbjyqzdjbFuture);
//        futureList.add(cbjyqzFuture);
//
//        //2.8等待参数校验异步任务全部执行完成后获取结果
//        CompletableFuture<Void> allFuture =
//            CompletableFuture.allOf(futureList.toArray(new CompletableFuture[futureList.size()])).exceptionally((e) -> {
//                e.printStackTrace();
//                log.error("参数校验异步任务执行失败------------------{}", e.getMessage());
//                errorList.add("程序运行异常，请稍后重试！");
//                return null;
//            });
//        allFuture.join();
//        AtomicReference<ApplyCancel> applyCancel = null;
//        allFuture.thenRun(() -> {
//            applyCancel.set(applyCancelFuture.join());
//        })
//
//        if (errorList != null && !errorList.isEmpty()) {
//            log.error("===============================================数据校验未通过========================================================\r\n{}",
//                errorList.toString());
//            return BaseResp.failByParamError(errorList.get(0));
//        }
//
//        //清空工作任务列表和取出map容器里的数据
//        futureList.clear();
//        Cbf cbf = (Cbf)map.get("cbf");
//        Cbht cbht = (Cbht)map.get("cbht");
//        Cbjyqz cbjyqz = (Cbjyqz)map.get("cbjyqz");
//        Cbjyqzdjb cbjyqzdjb = (Cbjyqzdjb)map.get("cbjyqzdjb");
//        ApplyFlow applyFlow = (ApplyFlow)map.get("applyFlow");
//        ApplyCancel applyCancel = (ApplyCancel)map.get("applyCancel");
//
//        //判断审核状态是通过还是驳回
//        //3.审核驳回
//        if (processStatus.equals(DictCons.ProcessStatus.reject)) {
//            //3.1更新流程审批表和新增日志记录
//            BaseResp<ApplyFlow> applyFlowBaseResp = applyFlowManage
//                .editApplyFlowAndCreateApplyFlowOperatorLog(applyFlowId, applyFlow.getCbfbm(), applyFlow.getCbfmc(), processStatus,
//                    processStatus.equals(DictCons.ProcessStatus.reject) ? DictCons.ProcessActionType.reject : DictCons.ProcessActionType.success,
//                    remark, userId);
//            if (!applyFlowBaseResp.isSuccess()) {
//                return BaseResp.returnResp(applyFlowBaseResp);
//            }
//            //3.2承包方编码解锁
//            applyCbfbmLockRecordManage.deleteByCbfbm(applyCancel.getCbfbm());
//            return BaseResp.success();
//        }
//
//        //4.审核通过
//        log.info("===============================================审核通过，更新相关表========================================================");
//        //4.1.更新流程审批表和新增日志记录、承包登记簿变更明细表
//        CompletableFuture<Void> applyFlowtesk = CompletableFuture.runAsync(() -> {
//            TransactionStatus status = transactionManager.getTransaction(definition);
//            try {
//                BaseResp<ApplyFlow> applyFlowBaseResp = applyFlowManage
//                    .editApplyFlowAndCreateApplyFlowOperatorLog(applyFlowId, applyFlow.getCbfbm(), applyFlow.getCbfmc(), processStatus,
//                        processStatus.equals(ProcessStatus.reject) ? DictCons.ProcessActionType.reject : DictCons.ProcessActionType.success, remark,
//                        userId);
//                if (applyFlowBaseResp.isSuccess() && applyFlowBaseResp.getObj() != null) {
//                    ApplyFlow flow = applyFlowBaseResp.getObj();
//                    String desc = "承包方（" + cbf.getCbfmc() + " " + cbf.getCbfzjhm() + "）注销";
//                    registerChangeRecordManage
//                        .createRegisterChangeRecord(cbjyqzdjb.getId(), flow.getRelationType(), flow.getApplyUserId(), flow.getApplyUserFullName(),
//                            flow.getApplyTime(), flow.getAuditUserId(), flow.getAuditUserFullName(), flow.getAuditTime(), desc,
//                            applyCancel.getImgIds(), applyCancel.getFileIds(), userId);
//                }
//                //添加到没有执行结束的线程集合
//                threadList.add(Thread.currentThread());
//                log.error("4.1线程放入集合");
//                //每个线程都在悬停前开启唤醒检查
//                log.info("4.1即将悬停线程{},当前悬停线程数量{}", Thread.currentThread(), threadList.size());
//                this.notifyAll(threadList, totalCount, false);
//                LockSupport.park();
//                //根据回滚标志位,确定各个线程是提交还是回滚事务
//                if (rollbackFlag.get()) {
//                    log.error("出现异常，4.1线程回滚事务");
//                    transactionManager.rollback(status);
//                } else {
//                    log.info("执行成功，4.1线程提交事务");
//                    transactionManager.commit(status);
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//                log.error("4.1线程运行异常{}，开始回滚并唤醒其他悬停线程", e.getMessage());
//                //修改回滚标志位
//                rollbackFlag.set(true);
//                //当前线程回滚并唤醒其他悬停线程
//                transactionManager.rollback(status);
//                this.notifyAll(threadList, totalCount, true);
//            }
//        }, threadPoolExecutor);
//        // 4.2、承包方表：注销承包方记录
//        CompletableFuture<Void> updateCbf = CompletableFuture.runAsync(() -> {
//            TransactionStatus status = transactionManager.getTransaction(definition);
//            try {
//                cbf.setUpdateBy(userId);
//                cbf.setUpdateTime(new Date());
//                cbf.setCancelFlag(CancelFlag.YES);
//                cbfManage.update(cbf);
//                //添加到没有执行结束的线程集合
//                threadList.add(Thread.currentThread());
//                log.error("4.2线程放入集合");
//                //每个线程都在悬停前开启唤醒检查
//                log.info("4.2即将悬停线程{},当前悬停线程数量{}", Thread.currentThread(), threadList.size());
//                this.notifyAll(threadList, totalCount, false);
//                LockSupport.park();
//                //根据回滚标志位,确定各个线程是提交还是回滚事务
//                if (rollbackFlag.get()) {
//                    log.error("出现异常，4.2线程回滚事务");
//                    transactionManager.rollback(status);
//                } else {
//                    log.info("执行成功，4.2线程提交事务");
//                    transactionManager.commit(status);
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//                log.error("4.2线程运行异常{}，开始回滚并唤醒其他悬停线程", e.getMessage());
//                //修改回滚标志位
//                rollbackFlag.set(true);
//                //当前线程回滚并唤醒其他悬停线程
//                transactionManager.rollback(status);
//                this.notifyAll(threadList, totalCount, true);
//            }
//        }, threadPoolExecutor);
//        // 4.3、承包合同表：注销承包合同记录
//        CompletableFuture<Void> updateCbht = CompletableFuture.runAsync(() -> {
//            TransactionStatus status = transactionManager.getTransaction(definition);
//            try {
//                cbht.setUpdateBy(userId);
//                cbht.setUpdateTime(new Date());
//                cbht.setCancelFlag(CancelFlag.YES);
//                cbhtManage.update(cbht);
//                //添加到没有执行结束的线程集合
//                threadList.add(Thread.currentThread());
//                log.error("4.3线程放入集合");
//                //每个线程都在悬停前开启唤醒检查
//                log.info("4.3即将悬停线程{},当前悬停线程数量{}", Thread.currentThread(), threadList.size());
//                this.notifyAll(threadList, totalCount, false);
//                LockSupport.park();
//                //根据回滚标志位,确定各个线程是提交还是回滚事务
//                if (rollbackFlag.get()) {
//                    log.error("出现异常，4.3线程回滚事务");
//                    transactionManager.rollback(status);
//                } else {
//                    log.info("执行成功，4.3线程提交事务");
//                    transactionManager.commit(status);
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//                log.error("4.3线程运行异常{}，开始回滚并唤醒其他悬停线程", e.getMessage());
//                //修改回滚标志位
//                rollbackFlag.set(true);
//                //当前线程回滚并唤醒其他悬停线程
//                transactionManager.rollback(status);
//                this.notifyAll(threadList, totalCount, true);
//            }
//        }, threadPoolExecutor);
//        // 4.4、承包地块表：删除被注销的承包合同的地块记录
//        CompletableFuture<Void> delCbdkxx = CompletableFuture.runAsync(() -> {
//            TransactionStatus status = transactionManager.getTransaction(definition);
//            try {
//                cbdkxxManage.delBatch(userId, applyCancel.getCbfbm());
//                //添加到没有执行结束的线程集合
//                threadList.add(Thread.currentThread());
//                log.error("4.4线程放入集合");
//                //每个线程都在悬停前开启唤醒检查
//                log.info("4.4即将悬停线程{},当前悬停线程数量{}", Thread.currentThread(), threadList.size());
//                this.notifyAll(threadList, totalCount, false);
//                LockSupport.park();
//                //根据回滚标志位,确定各个线程是提交还是回滚事务
//                if (rollbackFlag.get()) {
//                    log.error("出现异常，4.4线程回滚事务");
//                    transactionManager.rollback(status);
//                } else {
//                    log.info("执行成功，4.4线程提交事务");
//                    transactionManager.commit(status);
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//                log.error("4.4线程运行异常{}，开始回滚并唤醒其他悬停线程", e.getMessage());
//                //修改回滚标志位
//                rollbackFlag.set(true);
//                //当前线程回滚并唤醒其他悬停线程
//                transactionManager.rollback(status);
//                this.notifyAll(threadList, totalCount, true);
//            }
//        }, threadPoolExecutor);
//        // 4.5、登记簿表：注销承包方的登记簿记录
//        CompletableFuture<Void> updateCbjyqzdjb = CompletableFuture.runAsync(() -> {
//            TransactionStatus status = transactionManager.getTransaction(definition);
//            try {
//                cbjyqzdjb.setUpdateBy(userId);
//                cbjyqzdjb.setUpdateTime(new Date());
//                cbjyqzdjb.setCancelFlag(CancelFlag.YES);
//                cbjyqzdjbManage.update(cbjyqzdjb);
//                //添加到没有执行结束的线程集合
//                threadList.add(Thread.currentThread());
//                log.error("4.5线程放入集合");
//                //每个线程都在悬停前开启唤醒检查
//                log.info("4.5即将悬停线程{},当前悬停线程数量{}", Thread.currentThread(), threadList.size());
//                this.notifyAll(threadList, totalCount, false);
//                LockSupport.park();
//                //根据回滚标志位,确定各个线程是提交还是回滚事务
//                if (rollbackFlag.get()) {
//                    log.error("出现异常，4.5线程回滚事务");
//                    transactionManager.rollback(status);
//                } else {
//                    log.info("执行成功，4.5线程提交事务");
//                    transactionManager.commit(status);
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//                log.error("4.5线程运行异常{}，开始回滚并唤醒其他悬停线程", e.getMessage());
//                //修改回滚标志位
//                rollbackFlag.set(true);
//                //当前线程回滚并唤醒其他悬停线程
//                transactionManager.rollback(status);
//                this.notifyAll(threadList, totalCount, true);
//            }
//        }, threadPoolExecutor);
//        //4.6、承包权证表：注销承包方的承包权证记录
//        CompletableFuture<Void> updateCbjyqz = CompletableFuture.runAsync(() -> {
//            TransactionStatus status = transactionManager.getTransaction(definition);
//            try {
//                cbjyqz.setUpdateBy(userId);
//                cbjyqz.setUpdateTime(new Date());
//                cbjyqz.setCancelFlag(CancelFlag.YES);
//                cbjyqzManage.update(cbjyqz);
//                //添加到没有执行结束的线程集合
//                threadList.add(Thread.currentThread());
//                log.error("4.6线程放入集合");
//                //每个线程都在悬停前开启唤醒检查
//                log.info("4.6即将悬停线程{},当前悬停线程数量{}", Thread.currentThread(), threadList.size());
//                this.notifyAll(threadList, totalCount, false);
//                LockSupport.park();
//                //根据回滚标志位,确定各个线程是提交还是回滚事务
//                if (rollbackFlag.get()) {
//                    log.error("出现异常，4.6线程回滚事务");
//                    transactionManager.rollback(status);
//                } else {
//                    log.info("执行成功，4.6线程提交事务");
//                    transactionManager.commit(status);
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//                log.error("4.6线程运行异常{}，开始回滚并唤醒其他悬停线程", e.getMessage());
//                //修改回滚标志位
//                rollbackFlag.set(true);
//                //当前线程回滚并唤醒其他悬停线程
//                transactionManager.rollback(status);
//                this.notifyAll(threadList, totalCount, true);
//            }
//        }, threadPoolExecutor);
//        //4.7、权证注销表：新增新记录
//        CompletableFuture<Void> createCbjyqzQzzx = CompletableFuture.runAsync(() -> {
//            TransactionStatus status = transactionManager.getTransaction(definition);
//            try {
//                cbjyqzQzzxManage
//                    .createCbjyqzQzzx(cbjyqz.getCbjyqzbm(), applyCancel.getCancelRemark(), new Date(), CancelFlag.NO, userId, userId, null,
//                        new Date(), new Date(), null);
//                //添加到没有执行结束的线程集合
//                threadList.add(Thread.currentThread());
//                log.error("4.7线程放入集合");
//                //每个线程都在悬停前开启唤醒检查
//                log.info("4.7即将悬停线程{},当前悬停线程数量{}", Thread.currentThread(), threadList.size());
//                this.notifyAll(threadList, totalCount, false);
//                LockSupport.park();
//                //根据回滚标志位,确定各个线程是提交还是回滚事务
//                if (rollbackFlag.get()) {
//                    log.error("出现异常，4.7线程回滚事务");
//                    transactionManager.rollback(status);
//                } else {
//                    log.info("执行成功，4.7线程提交事务");
//                    transactionManager.commit(status);
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//                log.error("4.7线程运行异常{}，开始回滚并唤醒其他悬停线程", e.getMessage());
//                //修改回滚标志位
//                rollbackFlag.set(true);
//                //当前线程回滚并唤醒其他悬停线程
//                transactionManager.rollback(status);
//                this.notifyAll(threadList, totalCount, true);
//            }
//        }, threadPoolExecutor);
//        //4.8 修改权属来源资料附件表
//        CompletableFuture<Void> updateQslyzlfj = CompletableFuture.runAsync(() -> {
//            TransactionStatus status = transactionManager.getTransaction(definition);
//            try {
//                Qslyzlfj qslyzlfj = qslyzlfjManage.getByCbjyqzbm(cbjyqzdjb.getCbjyqzbm());
//                qslyzlfj.setImgIds(applyCancel.getImgIds());
//                qslyzlfj.setFileIds(applyCancel.getFileIds());
//                qslyzlfj.setUpdateBy(userId);
//                qslyzlfj.setUpdateTime(new Date());
//                qslyzlfjManage.update(qslyzlfj);
//                //添加到没有执行结束的线程集合
//                threadList.add(Thread.currentThread());
//                log.error("4.8线程放入集合");
//                //每个线程都在悬停前开启唤醒检查
//                log.info("4.8即将悬停线程{},当前悬停线程数量{}", Thread.currentThread(), threadList.size());
//                this.notifyAll(threadList, totalCount, false);
//                LockSupport.park();
//                //根据回滚标志位,确定各个线程是提交还是回滚事务
//                if (rollbackFlag.get()) {
//                    log.error("出现异常，4.8线程回滚事务");
//                    transactionManager.rollback(status);
//                } else {
//                    log.info("执行成功，4.8线程提交事务");
//                    transactionManager.commit(status);
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//                log.error("4.8线程运行异常{}，开始回滚并唤醒其他悬停线程", e.getMessage());
//                //修改回滚标志位
//                rollbackFlag.set(true);
//                //当前线程回滚并唤醒其他悬停线程
//                transactionManager.rollback(status);
//                this.notifyAll(threadList, totalCount, true);
//            }
//        }, threadPoolExecutor);
//        //4.8 修改权属来源资料附件表
//        CompletableFuture<Void> updateQslyzlfj2 = CompletableFuture.runAsync(() -> {
//            TransactionStatus status = transactionManager.getTransaction(definition);
//            try {
//                Qslyzlfj qslyzlfj = qslyzlfjManage.getByCbjyqzbm(cbjyqzdjb.getCbjyqzbm());
//                qslyzlfj.setImgIds(applyCancel.getImgIds());
//                qslyzlfj.setFileIds(applyCancel.getFileIds());
//                qslyzlfj.setUpdateBy(userId);
//                qslyzlfj.setUpdateTime(new Date());
//                qslyzlfjManage.update(qslyzlfj);
//                //添加到没有执行结束的线程集合
//                threadList.add(Thread.currentThread());
//                log.error("4.8线程放入集合");
//                //每个线程都在悬停前开启唤醒检查
//                log.info("4.8即将悬停线程{},当前悬停线程数量{}", Thread.currentThread(), threadList.size());
//                this.notifyAll(threadList, totalCount, false);
//                LockSupport.park();
//                //根据回滚标志位,确定各个线程是提交还是回滚事务
//                if (rollbackFlag.get()) {
//                    log.error("出现异常，4.8线程回滚事务");
//                    transactionManager.rollback(status);
//                } else {
//                    log.info("执行成功，4.8线程提交事务");
//                    transactionManager.commit(status);
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//                log.error("4.8线程运行异常{}，开始回滚并唤醒其他悬停线程", e.getMessage());
//                //修改回滚标志位
//                rollbackFlag.set(true);
//                //当前线程回滚并唤醒其他悬停线程
//                transactionManager.rollback(status);
//                this.notifyAll(threadList, totalCount, true);
//            }
//        }, threadPoolExecutor);
//        //4.9 承包方编码解锁
//        CompletableFuture<Void> deleteLock = CompletableFuture.runAsync(() -> {
//            TransactionStatus status = transactionManager.getTransaction(definition);
//            try {
//                //承包方编码解锁
//                applyCbfbmLockRecordManage.deleteByCbfbm(applyCancel.getCbfbm());
//                //添加到没有执行结束的线程集合
//                threadList.add(Thread.currentThread());
//                log.error("4.9线程放入集合");
//                //每个线程都在悬停前开启唤醒检查
//                log.info("4.9即将悬停线程{},当前悬停线程数量{}", Thread.currentThread(), threadList.size());
//                this.notifyAll(threadList, totalCount, false);
//                LockSupport.park();
//                //根据回滚标志位,确定各个线程是提交还是回滚事务
//                if (rollbackFlag.get()) {
//                    log.error("出现异常，4.9线程回滚事务");
//                    transactionManager.rollback(status);
//                } else {
//                    log.info("执行成功，4.9线程提交事务");
//                    transactionManager.commit(status);
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//                log.error("4.9线程运行异常{}，开始回滚并唤醒其他悬停线程", e.getMessage());
//                //修改回滚标志位
//                rollbackFlag.set(true);
//                //当前线程回滚并唤醒其他悬停线程
//                transactionManager.rollback(status);
//                this.notifyAll(threadList, totalCount, true);
//            }
//        }, threadPoolExecutor);
//
//        //4.10 TODO 对gis服务确权地块图层的操作
//
//        //4.11将异步任务放入集合统一执行
//        futureList.add(updateCbf);
//        futureList.add(updateCbht);
//        futureList.add(delCbdkxx);
//        futureList.add(deleteLock);
//        futureList.add(updateCbjyqz);
//        futureList.add(applyFlowtesk);
//        futureList.add(updateQslyzlfj);
//        futureList.add(updateCbjyqzdjb);
//        //        futureList.add(createCbjyqzQzzx);
//
//        //4.12等待参数校验异步任务全部执行完成后获取结果
//        CompletableFuture.allOf(futureList.toArray(new CompletableFuture[futureList.size()])).exceptionally((e) -> {
//            e.printStackTrace();
//            log.error("参数校验异步任务执行失败------------------{}", e.getMessage());
//            rollbackFlag.set(true);
//            return null;
//        }).join();
//
//        //5.执行结束，关闭线程，返回结果
//        threadPoolExecutor.shutdown();
//        if (rollbackFlag.get()) {
//            return BaseResp.failByParamError("程序运行异常，请稍后重试！");
//        } else {
//            return BaseResp.success();
//        }
//    }
//
//    private void notifyAll(List<Thread> unFinishedThread, AtomicInteger totalCount, boolean isForce) {
//        // 当手动悬停的线程与开启的线程数相同时, 证明全部线程都已经开启并手动悬停, 故而可以唤醒全部手动悬停的线程, 并处理提交与回滚逻辑
//        if (isForce || unFinishedThread.size() == totalCount.get()) {
//            unFinishedThread.forEach(thread -> {
//                log.info("唤醒线程-------------------{}", thread);
//                LockSupport.unpark(thread);
//            });
//        }
//    }