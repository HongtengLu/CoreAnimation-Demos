//
//  CAEmitterLayerController.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/17.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "CAEmitterLayerController.h"

@interface CAEmitterLayerController ()

@end

@implementation CAEmitterLayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //create particle emitter layer
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:emitter];
    
    //configure emitter
    emitter.renderMode = kCAEmitterLayerAdditive;//渲染模式,additive 效果是重叠粒子更亮.
    emitter.emitterPosition = CGPointMake(emitter.frame.size.width / 2.0, emitter.frame.size.height / 2.0);
    
    //创建粒子模型
    CAEmitterCell *starCell = [[CAEmitterCell alloc] init];
    starCell.contents = (__bridge id)[UIImage imageNamed:@"star.png"].CGImage;//粒子图片
    starCell.birthRate = 20;//每秒粒子个数
    starCell.lifetime = 5.0;//粒子存活时间(秒)
    starCell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;//粒子将会被渲染的颜色
    starCell.alphaSpeed = -0.2;//每过一秒透明度减少1;
    starCell.velocity = 20;//期望的平均速度
    starCell.velocityRange = 50;//速度的范围,会随机发射粒子,速度在该范围内;
    starCell.emissionRange = M_PI * 2.0;
    
    
    CAEmitterCell *moonCell = [[CAEmitterCell alloc] init];
    moonCell.contents = (__bridge id)[UIImage imageNamed:@"moon.png"].CGImage;
    moonCell.birthRate = 20;
    moonCell.lifetime = 5.0;
    moonCell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;
    moonCell.alphaSpeed = -0.2;
    moonCell.velocity = 20;
    moonCell.velocityRange = 50;
    moonCell.emissionRange = M_PI * 2.0;
    
    //添加粒子模板到 emitter
    emitter.emitterCells = @[moonCell,starCell];//可以创建多个 cell 来达到不同粒子的目的.
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
