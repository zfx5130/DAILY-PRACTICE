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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)gcd_async_queue_call {
    
    //创建队列组
    dispatch_group_t group = dispatch_group_create();
    
    //获取全局并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    
    
    
}

@end
