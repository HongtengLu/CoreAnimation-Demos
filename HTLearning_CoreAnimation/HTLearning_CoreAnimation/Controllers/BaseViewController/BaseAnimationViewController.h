//
//  BaseAnimationViewController.h
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/9.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SCUtils.h"
#import "UIColor+Random.h"

@interface BaseAnimationViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>


@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) CALayer *playingLayer;

@property (nonatomic, strong) CALayer *helper;

@property (nonatomic, strong) UICollectionView *collectionView;

-(void)resetView;

-(NSUInteger)buttonsCount;
-(UIButton *)buttonForIndex:(NSInteger)index;

-(UIButton *)normalButton;

-(void)setCollectionViewHeight:(CGFloat)height;

@end
