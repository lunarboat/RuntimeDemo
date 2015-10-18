//
//  MyClass.m
//  RuntimeDemo
//
//  Created by lunarboat on 15/10/15.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "MyClass.h"

@interface MyClass (){
    NSInteger _instance1;
    NSString *_instance2;
}

@property (nonatomic, assign)NSInteger integer;

@end

@implementation MyClass

+ (void)classMethod1{
    
}

- (void)method1{
    NSLog(@"调用实例方法1");
}

- (void)method2{
    
}

- (void)method3WithArg1:(NSInteger)arg1 arg2:(NSString *)arg2{
    NSLog(@"arg1: %ld, arg2:%@",arg1, arg2);
}
@end
