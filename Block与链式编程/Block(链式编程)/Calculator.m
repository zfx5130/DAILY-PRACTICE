//
//  Calculator.m
//  Block(链式编程)
//
//  Created by admin on 2017/8/7.
//  Copyright © 2017年 fuxing. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

+ (NSInteger)makeCalculator:(CalculatorBlock)block {
    Calculator *calculator = [[Calculator alloc] init];
    block(calculator);
    return calculator.result;
}

- (CalculateBlock)add {
    return ^(NSInteger temp) {
        self.result += temp;
        return self;
    };
}

- (CalculateBlock)sub {
    return ^(NSInteger temp) {
        self.result -= temp;
        return self;
    };
}

- (Calculator *)printResult {
    NSLog(@"%@",@(self.result));
    return self;
}

@end
