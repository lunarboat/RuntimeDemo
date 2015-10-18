//
//  People.h
//  RuntimeDemo
//
//  Created by lunarboat on 15/10/14.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface People : NSObject<NSCoding>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) int height;
@property (nonatomic, assign) int age2;
@property (nonatomic, assign) int height2;
@property (nonatomic, assign) int age3;
@property (nonatomic, assign) int height3;
@property (nonatomic, assign) int age4;
@property (nonatomic, assign) int height4;

@end
