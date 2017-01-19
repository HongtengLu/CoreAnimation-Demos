//
//  HomeViewController.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/9.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HomeViewController.h"

#import "CALayerViewController.h"
#import "ImplyAnimationViewController.h"
#import "CustomDrawViewController.h"
#import "PropertyAnimationViewController.h"
#import "TransitionViewController.h"
#import "MediaTimingViewController.h"

@interface HomeViewController ()



@end

@implementation HomeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.titles = @[@"layer属性:anchorPoint 和 position",@"工具图层",@"隐式动画",@"显式属性动画",@"过渡动画",@"图层时间",@"综合案例"];
    self.controllers =@[@"CALayerViewController",@"LayersViewController",@"ImplyAnimationViewController",@"PropertyAnimationViewController",@"TransitionViewController",@"MediaTimingViewController",@"ComprehensiveCasesViewController"];
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
