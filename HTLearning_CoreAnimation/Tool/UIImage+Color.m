//
//  UIImage+Color.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/18.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size{
    return [self createImageWithColor:color size:size];
    
}

+ (UIImage *) createImageWithColor: (UIColor *) color size:(CGSize )size
{
    CGRect rect= CGRectMake(0, 0, size.width, size.width);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
