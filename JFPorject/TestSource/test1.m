//
//  test1.m
//  JFPorject
//
//  Created by dujinfeng481 on 14-11-6.
//  Copyright (c) 2014年 djf. All rights reserved.
//

#import "test1.h"

@implementation test1

-(id) init
{
    self = [super init];
    if (self) {
        self.name = @"test1";
        self.age = 10;
    }
    
    return self;
}

-(void) test
{
    NSData *data02 = [NSKeyedArchiver archivedDataWithRootObject: self];//通过归档对NSArray进行转码，保存了数组的序列一句代码就完成了！而且还保存了数组的有序性。转换回去也同样是一句话哦：），eg：
    
    test1 *t = [NSKeyedUnarchiver unarchiveObjectWithData:data02];//通过发归档进行NSData反转码，返回有序列的数组
    
    NSLog(@"t:%@", t);
    NSLog(@"name:%@, age:%ld", t.name, (long)t.age);
}

-(void) say
{
    NSLog(@"test1::say");
}

-(void) say1
{
    NSLog(@"test1::say1");
}

@end
