//
//  UIView+Corner.h
//  正确圆角设置方式
//
//  Created by apple on 16/3/2.
//  Copyright © 2016年 kun. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (Corner)

- (void)dr_cornerWithRadius:(CGFloat)radius backgroundColor:(UIColor *)bgColor;

//- (BOOL)hasDRCornered;

@end
