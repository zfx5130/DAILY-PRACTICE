//
//  ViewController.m
//  GCD(多线程练习)
//
//  Created by admin on 2017/9/7.
//  Copyright © 2017年 fuxing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //GCD同步若干个异步调用
   // [self gcd_async_queue_call];
    
    //栅栏函数
   // [self gcd_barrier_async_call];
    
    //正常gcd操作更新UI
   // [self gcd_global_ui];
    
    //cgd延迟
    //[self cgd_after_handle];
    
    //[self dispatchApplyDemo];
    
    [self dispatchGroupNotifyDemo];
    [self dispatchGroupWaitDemo];
}

//GCD同步若干个异步调用
- (void)gcd_async_queue_call {
    
    //创建队列组
    dispatch_group_t group = dispatch_group_create();
    
    //获取全局并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_async(group, queue, ^{
        //加载请求
        NSLog(@"1");
    });
    
    dispatch_group_async(group, queue, ^{
        //加载请求
        NSLog(@"2");
    });
    
    dispatch_group_async(group, queue, ^{
       //加载请求
        NSLog(@"3");
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
       //合并请求操作处理
        NSLog(@"4");
    });
    
}


- (void)gcd_barrier_async_call {

    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        //任务1
    });
    
    dispatch_async(queue, ^{
       //任务2
    });
    
    dispatch_barrier_async(queue, ^{
       //栅栏函数， 任务1和任务2，任务3和任务4 是并行处理。
    });
    
    dispatch_async(queue, ^{
        //任务3
    });
    
    dispatch_async(queue, ^{
        //任务4
    });
    
}

- (void)gcd_global_ui {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //long-running task
        dispatch_async(dispatch_get_main_queue(), ^{
           //update ui
        });
    });
    
}

//GCD延迟
- (void)cgd_after_handle {
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t) (delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //[self updateUi];
    });
}


//因为可以并行执行，所以使用dispatch_apply可以运行的更快
- (void)dispatchApplyDemo {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.starming.gcddemo.concurrentqueue", DISPATCH_QUEUE_CONCURRENT);
    [self gcd_async_queue_call];
    dispatch_apply(10, concurrentQueue, ^(size_t i) {
        NSLog(@"-------%zu",i);
    });
    NSLog(@"The end"); //这里有个需要注意的是，dispatch_apply这个是会阻塞主线程的。这个log打印会在dispatch_apply都结束后才开始执行
    
    //dispatch_apply(10, dispatch_queue_create(@"", DISPATCH_QUEUE_CONCURRENT), ^(size_t) {
        
   // });
}

//dispatch_group_notify
- (void)dispatchGroupNotifyDemo {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.starming.gcddemo.concurrentqueue",DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, concurrentQueue, ^{
        NSLog(@"--1");
    });
    dispatch_group_async(group, concurrentQueue, ^{
        NSLog(@"--2");
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"end");
    });
    NSLog(@"can continue");
}

//dispatch_group_wait
- (void)dispatchGroupWaitDemo {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.starming.gcddemo.concurrentqueue",DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    //在group中添加队列的block
    dispatch_group_async(group, concurrentQueue, ^{
        [NSThread sleepForTimeInterval:5.f];
        NSLog(@"1");
    });
    dispatch_group_async(group, concurrentQueue, ^{
        NSLog(@"2");
    });
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@"can continue---------");
//    //设置DISPATCH_TIME_FOREVER会一直等到前面任务都完成
//    dispatch_block_wait(block, DISPATCH_TIME_FOREVER);
}

- (void)groupSync {
    //当调用enter时计数加1，调用leave时计数减1，当计数为0时会调用dispatch_group_notify并且dispatch_group_wait会停止等待；
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(5);
        NSLog(@"任务一完成"); dispatch_group_leave(group);
    });
    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(8);
        NSLog(@"任务二完成"); dispatch_group_leave(group);
    });
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"任务完成");
    });
}



@end
