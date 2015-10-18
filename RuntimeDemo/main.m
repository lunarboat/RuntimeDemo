//
//  main.m
//  RuntimeDemo
//
//  Created by lunarboat on 15/10/14.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "People.h"
#import "MyClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        /**
         *  这一段是在文章里写的那个例子，我编译下面的东西时候把这个反编译的源文件删了，想看的话，用
            clang -rewrite-objc main.m
            命令，就可以看到生成的.cpp，然后拉到最后面就能看见
         */
//        People *p = [[People alloc]init];
//        NSString *str = @"zhangSan";
//        p.name = str;
//        p.age = 20;
//        NSLog(@"Hello, World!");
        
        
        
        /**
         *  下面是一个基本上常用的方法的demo
         */
        MyClass *myClass = [MyClass new];
        unsigned int outCount = 0;
        Class cls = myClass.class;
        //类名
        NSLog(@"class name: %s",class_getName(cls));
        NSLog(@"====================================================");
        
        //父类
        NSLog(@"super class name :%s", class_getName(class_getSuperclass(cls)));
        NSLog(@"====================================================");
        
        //是否是元类
        NSLog(@"is meta_class:%@",class_isMetaClass(cls) ? @"yes":@"no");
        NSLog(@"====================================================");
        Class meta_class = objc_getMetaClass(class_getName(cls));
        NSLog(@"%s 的 元类 %s", class_getName(cls), class_getName(meta_class));
        
        //变量实例大小
        NSLog(@"instance size: %zu", class_getInstanceSize(cls));
        NSLog(@"====================================================");

        //成员变量
        //遍历cls类的成员变量
        Ivar *ivars = class_copyIvarList(cls, &outCount);
        for (int i=0; i<outCount; i++) {
            Ivar ivar = ivars[i];
            NSLog(@"成员变量名：%s 索引index：%d", ivar_getName(ivar), i);
        }
        //记得释放
        free(ivars);
        
        //取一个已知的成员变量
        Ivar string = class_getInstanceVariable(cls, "_string");
        if (string != NULL) {
            NSLog(@"cls 类的一个_string成员变量：%s", ivar_getName(string));
        }
        NSLog(@"====================================================");

        //属性操作
        objc_property_t *properties = class_copyPropertyList(cls, &outCount);
        for (int i=0; i<outCount; i++) {
            objc_property_t property = properties[i];
            NSLog(@"property 的名字:%s",property_getName(property));
        }
        free(properties);
        //取一个已知的属性
        objc_property_t array = class_getProperty(cls, "array");
        if (array != NULL) {
            NSLog(@"cls 类中的一个属性array:%s",property_getName(array));
        }
        
        NSLog(@"====================================================");
        
        //方法操作
        Method *methods = class_copyMethodList(cls, &outCount);
        for (int i=0; i<outCount; i++) {
            Method method = methods[i];
             NSLog(@"method's 名称： %s",sel_getName(method_getName(method)));
        }
        free(methods);
        
        Method method1 = class_getInstanceMethod(cls, @selector(method1));
        if (method1 != NULL) {
            NSLog(@"method: %s",sel_getName(method_getName(method1)));
        }
        
        Method classMethod = class_getClassMethod(cls, @selector(classMethod1));
        if (classMethod != NULL) {
            NSLog(@"class method: %s",sel_getName(method_getName(classMethod)));
        }
        
        NSLog(@"MyClass responsd to selector: method3WithArg1:arg2:  %@", class_respondsToSelector(cls, @selector(method3WithArg1:arg2:)) ? @"yes": @"no");
//        的到方法实现，然后调用
        IMP imp = class_getMethodImplementation(cls, @selector(method1));
        imp();
        
        NSLog(@"====================================================");

        // 协议
        Protocol * __unsafe_unretained * protocols = class_copyProtocolList(cls, &outCount);
        Protocol * protocol;
        for (int i = 0; i < outCount; i++) {
            protocol = protocols[i];
            NSLog(@"protocol name: %s", protocol_getName(protocol));
        }
        
        NSLog(@"MyClass is%@ responsed to protocol %s", class_conformsToProtocol(cls, protocol) ? @"" : @" not", protocol_getName(protocol));
        NSLog(@"====================================================");

    }
    return 0;
}


