//
//  PropertyAnimationViewController.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/13.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "PropertyAnimationViewController.h"

@interface PropertyAnimationViewController ()<CAAnimationDelegate>

@end

@implementation PropertyAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)basicAnimation{
    CABasicAnimation *basic = [CABasicAnimation animation];
    basic.keyPath = @"backgroundColor";
    basic.toValue = (__bridge id)[UIColor randomColor].CGColor;
    basic.delegate = self;
    basic.duration = 2;
    
    [self.playingLayer addAnimation:basic forKey:nil];
}

-(void)keyframeAnimation{
    CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animation];
    keyframe.keyPath = @"backgroundColor";
    keyframe.duration = 2;
    keyframe.values = @[
                        
                        (__bridge id)[UIColor blueColor].CGColor,
                        (__bridge id)[UIColor randomColor].CGColor,
                        (__bridge id)[UIColor randomColor].CGColor,
                        (__bridge id)[UIColor blueColor].CGColor,
                        ];
    [self.playingLayer addAnimation:keyframe forKey:nil];
}
-(void)keyframe_path_animation{
    [self resetView];
    if (![self.containerView.layer.sublayers containsObject:self.shipLayer]) {
        [self.containerView.layer addSublayer:self.shipLayer];
    }
    CAShapeLayer *pathLayer = [self shipPathLayer];
    [self.containerView.layer addSublayer:pathLayer];
    
    [CATransaction begin];
    
    //create the keyframe animation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4.0;
    animation.path = pathLayer.path;
    animation.rotationMode = kCAAnimationRotateAuto;
    
    [self.shipLayer addAnimation:animation forKey:nil];
    
    [CATransaction setCompletionBlock:^{
        [pathLayer removeFromSuperlayer];
        [self.shipLayer removeFromSuperlayer];
    }];
    [CATransaction commit];
}

-(void)groupAnimation{
    
    //create a path
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    //draw the path using a CAShapeLayer
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0f;
    [self.containerView.layer addSublayer:pathLayer];
    //add a colored layer
    CALayer *colorLayer = [CALayer layer];
    colorLayer.frame = CGRectMake(0, 0, 64, 64);
    colorLayer.position = CGPointMake(0, 150);
    colorLayer.backgroundColor = [UIColor greenColor].CGColor;
    [self.containerView.layer addSublayer:colorLayer];
    //create the position animation
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animation];
    animation1.keyPath = @"position";
    animation1.path = bezierPath.CGPath;
    animation1.rotationMode = kCAAnimationRotateAuto;
    //create the color animation
    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath = @"backgroundColor";
    animation2.toValue = (__bridge id)[UIColor redColor].CGColor;
    //create group animation
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[animation1, animation2];
    groupAnimation.duration = 4.0;
    //add the animation to the color layer
    [colorLayer addAnimation:groupAnimation forKey:nil];
}

-(void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"动画开始");
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];//禁用掉隐式动画,不然会出现两次动画效果
    CABasicAnimation *baisc = (CABasicAnimation *)anim;
    self.playingLayer.backgroundColor = (__bridge CGColorRef _Nullable)(baisc.toValue);
    [CATransaction commit];
}



-(NSUInteger)itemsCount{
    return 4;
}



-(UIControl *)itemForIndex:(NSInteger)index{
    UIButton *button = [self normalButton];
    switch (index) {
        case 0:{
            [button setTitle:@"基础动画" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(basicAnimation) forControlEvents:UIControlEventTouchUpInside];
            break;
        }case 1:{
            [button setTitle:@"关键帧" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(keyframeAnimation) forControlEvents:UIControlEventTouchUpInside];
            break;
        }case 2:{
            [button setTitle:@"关键帧运动" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(keyframe_path_animation) forControlEvents:UIControlEventTouchUpInside];
            break;
        }case 3:{
            [button setTitle:@"组动画" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(groupAnimation) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        default:
            break;
    }
    return button;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
