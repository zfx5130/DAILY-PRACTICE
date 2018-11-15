//
//  ViewController.m
//  MethodSwizzlingDemo
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018年 thomas. All rights reserved.
//

#import "ViewController.h"
#import<objc/runtime.h>
#import "NSString+methodSwizzing.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self methodSwizzling];
}


//与系统大小写方法转换
- (void)methodSwizzling {
    //Method Swizzling的实现原理可以理解为”方法互换“。
    //假设我们将A和B两个方法进行互换，向A方法发送消息时执行的却是B方法，向B方法发送消息时执行的是A方法。
    //[testStr lowercaseString],执行的是myLowerString方法， 而调用[self myLowerString]执行的确实系统的lowercaseString方法
    Method originalMethod = class_getInstanceMethod([NSString class], @selector(lowercaseString));
    Method swapMethod = class_getInstanceMethod([NSString class], @selector(myLowerString));
    method_exchangeImplementations(originalMethod, swapMethod);
    NSString *testStr = @"thIs is THE Test STRING";
    NSLog(@"lowerString of testStr=%@", [testStr lowercaseString]); 
}

@end
