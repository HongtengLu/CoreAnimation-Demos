//
//  CALayer+ShowDetail.h
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/10.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
typedef NS_ENUM(NSInteger,ShowDetail){
    ShowDetailAnchorPoint = 0,
    ShowDetailPosition,
    ShowDetailBorder,
    ShowDetailFrame,
    ShowDetailLengthOfSide,
};

@interface CALayer (ShowDetail)
-(void)showAllDetail;
-(void)showDetail:(ShowDetail)item;
@end
