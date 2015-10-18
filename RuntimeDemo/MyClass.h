//
//  MyClass.h
//  RuntimeDemo
//
//  Created by lunarboat on 15/10/15.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject<NSCopying, NSCoding>

@property (nonatomic, copy) NSArray *array;
@property (nonatomic, copy) NSString *string;

- (void)method1;
- (void)method2;
+ (void)classMethod1;
- (void)method3WithArg1:(NSInteger)arg1 arg2:(NSString*)arg2;


@end
