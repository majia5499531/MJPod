//
//  MJSwizzleTool.m
//  复习App
//
//  Created by 马佳 on 2019/7/18.
//  Copyright © 2019 iBeseLove. All rights reserved.
//

#import "MJSwizzleTool.h"
#import "objc/runtime.h"

@implementation MJSwizzleTool

+(void)MJSwizzleWithClass:(Class)class OriginSel:(SEL)selectorOri NewSel:(SEL)selecotrNew
{
    //获取method的对象
    Method oringinMethod = class_getInstanceMethod(class, selectorOri);
    Method newMethod = class_getInstanceMethod(class, selecotrNew);
    
    
    //将新的method添加到对象中，如果添加成功，则将新SEL，指向原来的函数指针
    BOOL didAddMethod = class_addMethod(class, selecotrNew, class_getMethodImplementation(class, selecotrNew), method_getTypeEncoding(newMethod));
    if (didAddMethod)
    {
        
        class_replaceMethod(class, selecotrNew, class_getMethodImplementation(class, selectorOri), method_getTypeEncoding(oringinMethod));
    }
    
    
    //如果添加失败，则交换方法
    else
    {
        method_exchangeImplementations(oringinMethod, newMethod);
    }
    
    
    /*总结：
    <1>创建了一个新方法。它实际上指向了原来的方法的函数。
    <2>第一种方式，是把新方法添加到类里，然后它的实现依然同老方法
    <3>第二种方式，是直接将新房的实现，交换成老方法
    */
}

@end
