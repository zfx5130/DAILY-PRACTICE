//
//  Calculator.h
//  Block(链式编程)
//
//  Created by admin on 2017/8/7.
//  Copyright © 2017年 fuxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Calculator;

//对象调用时的block
typedef void(^CalculatorBlock)(Calculator *make);

//返回对象本身的block
typedef Calculator * (^CalculateBlock)(NSInteger value);

@interface Calculator : NSObject

//计算结果
@property (assign, nonatomic) NSInteger result;

+ (NSInteger)makeCalculator:(CalculatorBlock)block;

//链式编程的核心，返回对象本身。
- (CalculateBlock)add;

- (CalculateBlock)sub;

- (Calculator *)printResult;

@end
