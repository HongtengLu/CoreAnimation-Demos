//
//  ShipViewController.h
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/16.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "BaseAnimationViewController.h"

@interface ShipViewController : BaseAnimationViewController

@property (nonatomic, strong) CALayer *shipLayer;

-(CAShapeLayer *)shipPathLayer;


@end
