//
//  BaseAnimationViewController.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/9.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "BaseAnimationViewController.h"
#import "UIView+EmptyView.h"

@interface BaseAnimationViewController ()

@end

@implementation BaseAnimationViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpViews];
}

-(void)resetView{
    self.containerView.frame = [UIView centerFrameOfScreenWithWidth:300 andHeight:300];
    self.containerView.backgroundColor = [UIColor greenColor];
    
    self.playingLayer.frame = [self.containerView centerFrameOfViewWithWidth:50 andHeight:50];
    self.playingLayer.backgroundColor = [UIColor blueColor].CGColor;
    self.playingLayer.affineTransform = CGAffineTransformIdentity;//空
    self.playingLayer.actions = nil;
    
    
    self.helper.backgroundColor = [UIColor orangeColor].CGColor;
    self.helper.frame = CGRectMake(125, 25, 50, 50);
    
    
}

-(void)setUpViews{
    self.containerView = [[UIView alloc]initWithFrame:[UIView centerFrameOfScreenWithWidth:300 andHeight:300]];
    self.containerView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.containerView];
    
    
    self.playingLayer = [CALayer layer];
    self.playingLayer.frame = [self.containerView centerFrameOfViewWithWidth:50 andHeight:50];
    self.playingLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.containerView.layer addSublayer:self.playingLayer];
    
    self.helper = [CALayer layer];
    self.helper.frame = self.playingLayer.frame;
    self.helper.backgroundColor = [UIColor orangeColor].CGColor;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 100, [UIScreen mainScreen].bounds.size.width, 100) collectionViewLayout:[[UICollectionViewFlowLayout alloc]init]];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.collectionView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;

}

-(void)setCollectionViewHeight:(CGFloat)height{
    
    self.collectionView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - height, [UIScreen mainScreen].bounds.size.width, height);
}

-(UIButton *)normalButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 5;
    button.titleLabel.font = [UIFont systemFontOfSize:11];
    button.clipsToBounds = YES;
    return button;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UIButton *button = [self buttonForIndex:indexPath.row];
    button.frame = cell.bounds;
    [cell addSubview:button];
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self buttonsCount];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return CGSizeMake(80, 40);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
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
