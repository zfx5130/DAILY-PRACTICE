//
//  UIViewController+methodSwizzing.m
//  MethodSwizzlingDemo
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018年 thomas. All rights reserved.
//

#import "UIViewController+methodSwizzing.h"
#import <objc/runtime.h>
@implementation UIViewController (methodSwizzing)

+ (void)load {
    
    NSLog(@"初始化方法，在viewDidLoad之前调用");
    // 通过class_getInstanceMethod()函数从当前对象中的method list获取method结构体，如果是类方法就使用class_getClassMethod()函数获取。
    Method fromMethod = class_getInstanceMethod([self class], @selector(viewDidLoad));
    Method toMethod = class_getInstanceMethod([self class], @selector(swizzlingViewDidLoad));
    /**
     *  我们在这里使用class_addMethod()函数对Method Swizzling做了一层验证，如果self没有实现被交换的方法，会导致失败。
     *  而且self没有交换的方法实现，但是父类有这个方法，这样就会调用父类的方法，结果就不是我们想要的结果了。
     *  所以我们在这里通过class_addMethod()的验证，如果self实现了这个方法，class_addMethod()函数将会返回NO，我们就可以对其进行交换了。
     */
    if (!class_addMethod([self class], @selector(swizzlingViewDidLoad), method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
        method_exchangeImplementations(fromMethod, toMethod);
    }
    
    
}

// 我们自己实现的方法，也就是和self的viewDidLoad方法进行交换的方法。
- (void)swizzlingViewDidLoad {
    NSString *str = [NSString stringWithFormat:@"%@", self.class];
    // 我们在这里加一个判断，将系统的UIViewController的对象剔除掉
    if(![str containsString:@"UI"]){
        NSLog(@"统计打点 : %@", self.class);
    }
    [self swizzlingViewDidLoad];
}

//系统调用UIViewController的viewDidLoad方法时，实际上执行的是我们实现的swizzlingViewDidLoad方法。而我们在swizzlingViewDidLoad方法内部调用[self swizzlingViewDidLoad];时，执行的是UIViewController的viewDidLoad方法。

@end
