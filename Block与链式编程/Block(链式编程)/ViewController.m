//
//  ViewController.m
//  Block(链式编程)
//
//  Created by admin on 2017/8/6.
//  Copyright © 2017年 fuxing. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

typedef void(^test1Block)(NSString *testString);
typedef NSString* (^test2Block)(NSInteger testValue);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testBlock];
    
    [self testCalculator];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)testBlock {
    
    //声明block类型变量
    int (^test)(int) = ^(int a) {
        return a + 1;
    };

    NSLog(@"%d",test(1));
    
    
    NSString* (^testBlock)(NSString *name) = ^(NSString *name) {
        return [NSString stringWithFormat:@"张三%@",name];
    };
    
    NSLog(@"%@",testBlock(@"李四"));
    
}

- (void)testCalculator {
    NSInteger value = [Calculator makeCalculator:^(Calculator *make) {
        make.add(10).sub(5).add(2).sub(10);
    }];
    NSLog(@"result:::%@",@(value));
}

//block参数
- (void)testBlock:(test1Block)block {
    block(@"name");
}

//返回值block类型，且block有返回值
- (test2Block)blockTestWithValue:(NSInteger)value {
    
//这种定义一个temp的block，与直接返回block，，返回的block是两个不同的block块。
//    NSString* (^test4Block)(NSInteger) = ^(NSInteger value) {
//        return [NSString stringWithFormat:@"%@",@(value)];
//    };
//    NSLog(@":::::::%@",test4Block);
    
    return ^(NSInteger value) {
        return [NSString stringWithFormat:@"%@",@(value)];
    };
    
}

//返回值block类型，block无返回值
- (void (^)(NSString *))block {
    return ^(NSString *a) {
        NSLog(@"%@",a);
    };
}


@end
