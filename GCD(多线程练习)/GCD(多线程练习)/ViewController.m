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
    [self gcd_async_queue_call];
    
    //栅栏函数
    [self gcd_barrier_async_call];
    
    
    //正常gcd操作更新UI
    [self gcd_global_ui];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)gcd_async_queue_call {
    
    //创建队列组
    dispatch_group_t group = dispatch_group_create();
    
    //获取全局并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_async(group, queue, ^{
        //加载请求
    });
    
    dispatch_group_async(group, queue, ^{
        //加载请求
    });
    
    dispatch_group_async(group, queue, ^{
       //加载请求
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
       //合并请求操作处理
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


@end
