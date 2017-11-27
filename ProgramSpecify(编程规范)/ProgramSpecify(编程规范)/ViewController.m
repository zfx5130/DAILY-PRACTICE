//
//  ViewController.m
//  ProgramSpecify(编程规范)
//
//  Created by admin on 2017/11/24.
//  Copyright © 2017年 fuxing. All rights reserved.
//

#import "ViewController.h"

const NSTimeInterval kAnimationDuration = 2.0;
NSString *const TestingClassStringName = @"StringName";

static const NSTimeInterval kTestime = 3.0f;
static NSString *const kTestString = @"test";

@interface ViewController ()

@property (assign, nonatomic) BOOL canHiden;  //是否隐藏

@end

@implementation ViewController

#pragma mark - Life Cycle Mehtods

#pragma mark - Override Methods

#pragma mark - Target Methods

#pragma mark - Private Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    //TODO: 标记一些未完成的或完成的不尽人意的地方
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)addTest {
    
//    if ([self canDelete]) {
//
//    }
//
//    - (BOOL)canDelete {
//        BOOL finalCondition1 = condition1 && condition2
//        BOOL finalCondition2 =  condition3 && condition4
//        return condition1 && condition2;
//    }
    
    
    //条件语句的判断应该是变量在右，。常量在左
    //推荐
//    if (6 == count) {
//    }
//    if (nil == object) {
//    }
//    if (!object) {
//    }
    
  //不推荐
//    if (count == 6) {
//    }
//    if (object == nil) {
//    }
    
}


@end
