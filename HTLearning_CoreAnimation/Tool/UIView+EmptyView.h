//
//  UIView+EmptyView.h
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/3.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (EmptyView)

+ (instancetype)emptyView;
+ (instancetype)emptyView:(CGRect)frame;
+ (instancetype)emptyView:(CGRect)frame backgroundColor:(UIColor *)color;
+ (instancetype)emptyViewWidth:(CGFloat)width height:(CGFloat)height;
+ (instancetype)emptyViewWidth:(CGFloat)width height:(CGFloat)height backgroundColor:(UIColor *)color;

+(CGRect)centerFrameOfScreenWithWidth:(CGFloat)width andHeight:(CGFloat)height;
-(CGRect)centerFrameOfViewWithWidth:(CGFloat)width andHeight:(CGFloat)height;
@end
