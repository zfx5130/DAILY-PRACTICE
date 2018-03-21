//
//  ViewController.m
//  JavaScriptCoreDemo
//
//  Created by admin on 2018/1/8.
//  Copyright © 2018年 thomas. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getJSVar];
    
    [self ocCallJSFunc];
    
    [self jsCallOCBlockWithArguments];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//通过OC修改JS中的变量
- (void)getJSVar {
    //js代码
    NSString *jsCode = @"var arr = [1,2,3]";
    
    //常见js运行环境
    JSContext *ctx = [[JSContext alloc] init];
    
    //执行js代码
    [ctx evaluateScript:jsCode];
    
    JSValue *jsArr = ctx[@"arr"];
    
    jsArr[4] = @5;

    
    NSLog(@"%@",jsArr);
    
}

//获取定义在JS中的方法并调用
- (void)ocCallJSFunc {
    
    NSString *jsCode = @"fmunction hello(say){"" return say; ""}";
    
    JSContext *ctx = [[JSContext alloc] init];
    
    [ctx evaluateScript:jsCode];
    
    JSValue *hello = ctx[@"hello"];
    
    JSValue *result = [hello callWithArguments:@[@"你好"]];
    NSLog(@"resul::::%@",result);
    
}

//想通过JS调用OC中带参数的BLOCK
- (void)jsCallOCBlockWithArguments {
    
    JSContext *ctx = [[JSContext alloc] init];
    
    ctx[@"eat"] = ^() {
        NSArray *arguments = [JSContext currentArguments];
        NSLog(@"吃%@",arguments[0]);
    };
    
    NSString *jsCode = @"eat('面包')";
    [ctx evaluateScript:jsCode];
    
}


@end
