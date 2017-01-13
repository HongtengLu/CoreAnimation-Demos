//
//  UIView+Common.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/9.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "UIView+Common.h"

@implementation UIView (Common)
-(void)removeAllSubViews{
    NSArray *subviews = self.subviews;
    if (subviews.count > 0) {
        for (int i = 0; i < subviews.count; i ++) {
            UIView *view = subviews[i];
            [view removeAllSubViews];
        }
    }else{
        [self removeFromSuperview];
    }
}
@end
