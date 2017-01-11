//
//  NSObjectSupperCoding.swift
//  JFCore
//
//  Created by dujinfeng481 on 14-11-6.
//  Copyright (c) 2014年 djf. All rights reserved.
//

import Foundation

class NSObjectSupperCoding: NSObject, NSCoding {

    func encodeWithCoder(aCoder: NSCoder) {
        var count:UInt32 = 0;
        var ivars:UnsafeMutablePointer<Ivar> = class_copyIvarList(NSObject.self, &count);
        
        for index in 1...count {
            // 取出i位置对应的成员变量
            let ivar:Ivar = ivars[Int(index)];
            
            // 查看成员变量
            let name = ivar_getName(ivar);
            
            // 归档
            let key = "\(name)"
            let value: AnyObject! = self.valueForKey(key);
            aCoder.encodeObject(value, forKey: key);
        }
        
        free(ivars);
    }
    
    required init(coder aDecoder: NSCoder) {
        
        var count:UInt32 = 0;
        var ivars:UnsafeMutablePointer<Ivar> = class_copyIvarList(NSObject.self, &count);
        
        for index in 1...count {
            // 取出i位置对应的成员变量
            let ivar:Ivar = ivars[Int(index)];
            
            // 查看成员变量
            let name = ivar_getName(ivar);
            
            // 归档
            let key = "\(name)"
            let value: AnyObject! = aDecoder.decodeObjectForKey(key);
            
            // 设置到成员变量身上
//            self.setValue(value, forKey: key);
        }
        
        free(ivars);
    }
    
    convenience override init() {
        self.init()
    }
}


//extension CALayer {
//    func ocb_applyAnimation(animation: CABasicAnimation) {
//        let copy = animation.copy() as CABasicAnimation
//        
////        if !copy.fromValue {
////            copy.fromValue = self.presentationLayer().valueForKeyPath(copy.keyPath)
////        }
//        
//        self.addAnimation(copy, forKey: copy.keyPath)
//        self.setValue(copy.toValue, forKeyPath:copy.keyPath)
//    }
//}




/*
-(void)encodeWithCoder:(NSCoder )encoder
{
    unsigned int count = 0;
    Ivar ivars = class_copyIvarList([PYPerson class], &count);
    
    for (int i = 0; i<count; i++) {
        // 取出i位置对应的成员变量
        Ivar ivar = ivars[i];
        
        // 查看成员变量
        const char *name = ivar_getName(ivar);
        
        // 归档
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [encoder encodeObject:value forKey:key];
    }
    
    free(ivars);
}

-(id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([PYPerson class], &count);
        
        for (int i = 0; i<count; i++) {
            // 取出i位置对应的成员变量
            Ivar ivar = ivars[i];
            
            // 查看成员变量
            const char *name = ivar_getName(ivar);
            
            // 归档
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [decoder decodeObjectForKey:key];
            
            // 设置到成员变量身上
            [self setValue:value forKey:key];
        }
        
        free(ivars);
    } 
    return self; 
}
*/
