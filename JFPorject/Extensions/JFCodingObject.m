//
//  JFCodingObject.m
//  JFCore
//
//  Created by dujinfeng481 on 14-11-6.
//  Copyright (c) 2014年 djf. All rights reserved.
//

// class_copyIvarList获得的类成员变量不包括父类的成员变量

#import "JFCodingObject.h"
#import <objc/runtime.h>

@implementation JFCodingObject

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [self encodeWithCoder:aCoder withClass:[self class]];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        [self initWithCoder:aDecoder withClass:[self class]];
    }
    return self;
}

+ (void)sayHelloTwo
{
    NSLog(@"i want to make friend with you");
    
    
//    test1 *t = (test1*)[[test3 alloc] init];
//    
//    [t say];
//    [t say1];
    
}

#pragma mark - private method
- (void)encodeWithCoder:(NSCoder *)aCoder withClass:(Class)cls
{
    if (cls == [NSObject class]) {
        return;
    }
    
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(cls, &count);
    
    for (int i = 0; i<count; i++) {
        // 取出i位置对应的成员变量
        Ivar ivar = ivars[i];
        
        // 查看成员变量
        const char *name = ivar_getName(ivar);
        
        // 归档
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    
    free(ivars);
    
    
    Class supCls = class_getSuperclass(cls);
    [self encodeWithCoder:aCoder withClass:supCls];
}

- (void)initWithCoder:(NSCoder *)aDecoder withClass:(Class)cls
{
    if (cls == [NSObject class]) {
        return;
    }
    
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(cls, &count);
    
    for (int i = 0; i<count; i++) {
        // 取出i位置对应的成员变量
        Ivar ivar = ivars[i];
        
        // 查看成员变量
        const char *name = ivar_getName(ivar);
        
        // 归档
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [aDecoder decodeObjectForKey:key];
        
        // 设置到成员变量身上
        [self setValue:value forKey:key];
    }
    
    free(ivars);
    
    Class supCls = class_getSuperclass(cls);
    [self initWithCoder:aDecoder withClass:supCls];
}

@end
