//
//  CALayer+ShowDetail.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/10.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "CALayer+ShowDetail.h"
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

#import "UIColor+Random.h"

@implementation CALayer (ShowDetail)
-(void)showDetail:(ShowDetail)item{
    switch (item) {
        case ShowDetailPosition:{
            [self drawPoint:self.position];
            break;
        }
        case ShowDetailAnchorPoint:{
            CGPoint absolutPoint = CGPointMake(self.anchorPoint.x * self.bounds.size.width, self.bounds.size.height);
            [self drawPoint:absolutPoint];
            break;
        }
        case ShowDetailFrame:{
            
            break;
        }
        case ShowDetailLengthOfSide:{
            
            break;
        }
        case ShowDetailBorder:{
            
            break;
        }
        default:
            break;
    }
}

-(void)drawPoint:(CGPoint)point{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, CGRectMake(point.x, point.y, 10,10));
    [[UIColor randomColor] set];
    CGContextFillPath(ctx);
    
}

@end
