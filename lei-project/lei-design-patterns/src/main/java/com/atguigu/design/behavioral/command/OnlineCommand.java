package com.atguigu.design.behavioral.command;

/**
 * 线上课命令
 * <p>
 * Controller { xxService aaService
 * <p>
 * <p>
 * //宏命令 order(){ //结账 //扣库存 //出账单 .... }
 * <p>
 * }
 */
public class OnlineCommand implements Command {

    //Dao
    private LeiReceiver receiver = new LeiReceiver();

    @Override
    public void execute() {
        System.out.println("要去上（吹）课（牛）....");
        receiver.online();
    }
}
