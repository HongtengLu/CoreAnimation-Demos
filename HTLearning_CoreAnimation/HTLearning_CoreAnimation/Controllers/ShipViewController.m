//
//  ShipViewController.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/16.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "ShipViewController.h"

@interface ShipViewController ()

@end

@implementation ShipViewController{
    CAShapeLayer *_pathLayer;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.containerView.backgroundColor = [UIColor clearColor];
    self.playingLayer.backgroundColor = [UIColor clearColor].CGColor;
    [self addShip];
    
}

-(void)addShip{
    if (!_shipLayer) {
        //add the ship
        CALayer *shipLayer = [CALayer layer];
        shipLayer.frame = CGRectMake(0, 0, 64, 64);
        shipLayer.position = CGPointMake(0, 150);
        shipLayer.contents = (__bridge id)[UIImage imageNamed: @"ship.png"].CGImage;
        _shipLayer = shipLayer;
        [self.containerView.layer addSublayer:shipLayer];
    }
    
}

-(CAShapeLayer *)shipPathLayer{
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    
    //draw the path using a CAShapeLayer
    if (!_pathLayer) {
        _pathLayer = [CAShapeLayer layer];
        _pathLayer.path = bezierPath.CGPath;
        _pathLayer.fillColor = [UIColor clearColor].CGColor;
        _pathLayer.strokeColor = [UIColor redColor].CGColor;
        _pathLayer.lineWidth = 3.0f;
    }
    
    return _pathLayer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
