//
//  UIImageView+methodExchange.m
//  038-- Runtime方法交换（黑魔法）改变图片的尺寸
//
//  Created by 顾雪飞 on 16/12/22.
//  Copyright © 2016年 顾雪飞. All rights reserved.
//

#import "UIImageView+methodExchange.h"
#import <objc/runtime.h>

@implementation UIImageView (methodExchange)

+ (void)load {
    
    Method originalMethod = class_getInstanceMethod(self, @selector(setImage:));
    
    Method exchageMethod = class_getInstanceMethod(self, @selector(gxf_setImage:));
    
    method_exchangeImplementations(originalMethod, exchageMethod);
}

- (void)gxf_setImage:(UIImage *)image {
    
    // 绘制生成新的和self大小一样的图片
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    [image drawInRect:self.bounds];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    // 在这里才调用系统的方法，不然图片无法显示
    [self gxf_setImage:newImage];
}

@end
