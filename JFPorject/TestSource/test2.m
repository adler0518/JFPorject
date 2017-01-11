//
//  test2.m
//  JFPorject
//
//  Created by dujinfeng481 on 14-11-6.
//  Copyright (c) 2014年 djf. All rights reserved.
//

#import "test2.h"

@implementation test2

-(id) init
{
    self = [super init];
    if (self) {
        self.name = @"test2";
        self.age = 20;
        self.t1 = [[test1 alloc] init];
        self.t1.name = @"test2.t1";
        self.t1.age = 50;
    }
    
    return self;
}

-(void) test
{
    NSData *data02 = [NSKeyedArchiver archivedDataWithRootObject: self];//通过归档对NSArray进行转码，保存了数组的序列一句代码就完成了！而且还保存了数组的有序性。转换回去也同样是一句话哦：），eg：
    
    test2 *t = [NSKeyedUnarchiver unarchiveObjectWithData:data02];//通过发归档进行NSData反转码，返回有序列的数组
    
    NSLog(@"t:%@", t);
    NSLog(@"name:%@, age:%ld, t2.t1.name:%@", t.name, (long)t.age, t.t1.name);
}


-(void) say
{
    NSLog(@"test2::say");
}


//- (void)encodeWithCoder:(NSCoder *)aCoder
//{
//    
//    unsigned int count = 0;
//    Ivar *ivars = class_copyIvarList([test2 class], &count);
//    
//    for (int i = 0; i<count; i++) {
//        // 取出i位置对应的成员变量
//        Ivar ivar = ivars[i];
//        
//        // 查看成员变量
//        const char *name = ivar_getName(ivar);
//        
//        // 归档
//        NSString *key = [NSString stringWithUTF8String:name];
//        id value = [self valueForKey:key];
//        [aCoder encodeObject:value forKey:key];
//    }
//    
//    free(ivars);
//}
//
//- (id)initWithCoder:(NSCoder *)aDecoder
//{
//    if (self = [super init]) {
//        unsigned int count = 0;
//        Ivar *ivars = class_copyIvarList([test2 class], &count);
//        
//        for (int i = 0; i<count; i++) {
//            // 取出i位置对应的成员变量
//            Ivar ivar = ivars[i];
//            
//            // 查看成员变量
//            const char *name = ivar_getName(ivar);
//            
//            // 归档
//            NSString *key = [NSString stringWithUTF8String:name];
//            id value = [aDecoder decodeObjectForKey:key];
//            
//            // 设置到成员变量身上
//            [self setValue:value forKey:key];
//        }
//        
//        free(ivars);
//    }
//    return self;
//}

@end
