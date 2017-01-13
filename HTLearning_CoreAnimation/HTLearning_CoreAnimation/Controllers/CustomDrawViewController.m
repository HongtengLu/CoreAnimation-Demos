//
//  CustomDrawViewController.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/9.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "CustomDrawViewController.h"
#import "UIView+EmptyView.h"
#import "UIView+Common.h"
#import "StepManager.h"

@interface CustomDrawViewController ()<CALayerDelegate>

@end

@implementation CustomDrawViewController
{
    StepManager *_stepManager;
    CALayer *_wrapper;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *sels = @[NSStringFromSelector(@selector(addWrapperLayer)),
                      NSStringFromSelector(@selector(redrawLayer))];
    __weak typeof(self) weakSelf = self;
    _stepManager = [StepManager managerWithSEL:sels target:self resetBlock:^{
        [weakSelf.view removeAllSubViews];
    }];
}

-(void)addWrapperLayer{
    _wrapper = [CALayer layer];
    _wrapper.frame = [UIView centerFrameOfScreenWithWidth:100 andHeight:100];
    _wrapper.backgroundColor = [UIColor blueColor].CGColor;
    _wrapper.delegate = self;
    
    _wrapper.contentsScale = [UIScreen mainScreen].scale;
    [self.view.layer addSublayer:_wrapper];
}

-(void)redrawLayer{
    [_wrapper display];
}

#pragma mark CALayerDelegate

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
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
