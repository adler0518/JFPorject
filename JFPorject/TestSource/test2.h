//
//  test2.h
//  JFPorject
//
//  Created by dujinfeng481 on 14-11-6.
//  Copyright (c) 2014年 djf. All rights reserved.
//

#import "JFCodingObject.h"
#import "test1.h"

@interface test2 : JFCodingObject     //NSObject <NSCoding> //JFCodingObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, assign) NSInteger  age;
@property(nonatomic, strong) test1      *t1;

-(void) test;

@end
