//
//  ReplicatorLayerController.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/17.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "ReplicatorLayerController.h"

@interface ReplicatorLayerController ()

@end

@implementation ReplicatorLayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView removeFromSuperview];
    [self.playingLayer removeFromSuperlayer];
    
    self.containerView.backgroundColor = [UIColor clearColor];
    self.containerView.y = 100;
    
    
    //创建 replicator 图层
    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:replicator];
    
    //创建一个复制的原型 layer 添加到 replicator 中.所有的 instance layers 都会按照这个原型复制变换
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(100.0f, 100.0f, 100.0f, 100.0f);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [replicator addSublayer:layer];
    
    //设置 instance layers 的数量.包括被复制的原型本身.
    replicator.instanceCount = 10;
    
    //添加变换,变换的基准以上一个 isntance layer 为准.
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 200, 0);
    transform = CATransform3DRotate(transform, M_PI / 5.0, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -200, 0);
    replicator.instanceTransform = transform;
    
    //颜色偏移量,正数代表增量,负数代表减量,增减的基准以上一个 instance layer 为准,所以会呈现递减或激增的情况.
    replicator.instanceBlueOffset = -0.1;
    replicator.instanceGreenOffset = -0.1;
    
    
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
