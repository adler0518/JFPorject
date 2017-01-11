//
//  test1.h
//  JFPorject
//
//  Created by dujinfeng481 on 14-11-6.
//  Copyright (c) 2014年 djf. All rights reserved.
//

#import "JFCodingObject.h"
#import <objc/runtime.h>

@interface test1 : JFCodingObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, assign) NSInteger  age;

-(void) test;

-(void) say;
-(void) say1;
@end
