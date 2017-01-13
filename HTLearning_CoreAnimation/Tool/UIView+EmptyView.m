//
//  UIView+EmptyView.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/3.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "UIView+EmptyView.h"
#define DEFAULT_COLOR [UIColor greenColor]

@implementation UIView (EmptyView)
+ (instancetype)emptyView:(CGRect)frame backgroundColor:(UIColor *)color{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = color?:DEFAULT_COLOR;
    return view;
}
+(instancetype)emptyView:(CGRect)frame{
    return [self emptyView:frame backgroundColor:DEFAULT_COLOR];
}
+(instancetype)emptyView{
    return [self emptyView:[self centerFrameOfScreenWithWidth:100 andHeight:100]];
}

+(instancetype)emptyViewWidth:(CGFloat)width height:(CGFloat)height{
    return [self emptyViewWidth:width height:height backgroundColor:nil];
}

+(instancetype)emptyViewWidth:(CGFloat)width height:(CGFloat)height backgroundColor:(UIColor *)color{
    CGRect frame = [self centerFrameOfScreenWithWidth:width andHeight:height];
    return [self emptyView:frame backgroundColor:color];
}

+(CGRect)centerFrameOfScreenWithWidth:(CGFloat)width andHeight:(CGFloat)height{
    CGFloat x = ([UIScreen mainScreen].bounds.size.width - width) /2;
    CGFloat y = ([UIScreen mainScreen].bounds.size.height - height)/2;
    CGRect centerFrame = CGRectMake(x, y, width, height);
    return centerFrame;
}

-(CGRect)centerFrameOfViewWithWidth:(CGFloat)width andHeight:(CGFloat)height{
    CGFloat x = self.frame.size.width/2 - width/2;
    CGFloat y = self.frame.size.height/2 - height/2;
    CGRect centerFrame = CGRectMake(x,y,width,height);
    return centerFrame;
}
@end
