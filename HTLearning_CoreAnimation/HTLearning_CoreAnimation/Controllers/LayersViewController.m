//
//  LayersViewController.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/17.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "LayersViewController.h"
#import "GradientLayerController.h"

@interface LayersViewController ()

@end

@implementation LayersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titles = @[@"CAGradientLayer-渐变",@"CAReplicatorLayer-重复",@"CAEmitterLayer-粒子效果"];
    self.controllers = @[@"GradientLayerController",@"ReplicatorLayerController",@"CAEmitterLayerController"];
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
