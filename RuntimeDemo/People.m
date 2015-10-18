//
//  People.m
//  RuntimeDemo
//
//  Created by lunarboat on 15/10/14.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "People.h"

@implementation People

- (void)encodeWithCoder:(NSCoder *)aCoder{
    unsigned int count = 0;
//    遍历某个类的所有成员变量
    Ivar *ivars = class_copyIvarList([People class], &count);
    for (int i=0; i<count; i++) {
        //取出i对应的成员变量
        Ivar ivar = ivars[i];
        //查看成员变量
        const char *name = ivar_getName(ivar);
        //归档
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([People class], &count);
        for (int i=0; i<count; i++) {
            //取出i位置对应的成员变量
            Ivar ivar = ivars[i];
            //查看成员变量
            const char *name = ivar_getName(ivar);
            //归档
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:key];
            //设置到成员变量
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}
//相关的头文件和函数
//1> 头文件
//
//
//利用头文件，我们可以查看到runtime中的各个方法！
//2> 相关应用
//
//NSCoding(归档和解档, 利用runtime遍历模型对象的所有属性)
//字典 –> 模型 (利用runtime遍历模型对象的所有属性, 根据属性名从字典中取出对应的值, 设置到模型的属性上)
//KVO(利用runtime动态产生一个类)
//用于封装框架(想怎么改就怎么改)
//这就是我们runtime机制的只要运用方向
//3> 相关函数
//
//objc_msgSend : 给对象发送消息
//class_copyMethodList : 遍历某个类所有的方法
//class_copyIvarList : 遍历某个类所有的成员变量
//class_…..
//这是我们学习runtime必须知道的函数！
@end
