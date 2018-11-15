//
//  NSString+methodSwizzing.m
//  MethodSwizzlingDemo
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018年 thomas. All rights reserved.
//

#import "NSString+methodSwizzing.h"

@implementation NSString (methodSwizzing)

- (NSString *)myLowerString {
    NSString *lowerString = [self myLowerString];
    NSLog(@"%@ => %@", self, lowerString);
    return  lowerString;
}

@end
