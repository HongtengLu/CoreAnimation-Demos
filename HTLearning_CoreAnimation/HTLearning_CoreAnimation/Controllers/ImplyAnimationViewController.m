//
//  ImplyAnimationViewController.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/12.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "ImplyAnimationViewController.h"
#import "UIColor+Random.h"
@interface ImplyAnimationViewController ()

@end

@implementation ImplyAnimationViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)backGroundColor{
    [self resetView];
    self.playingLayer.backgroundColor = [UIColor randomColor].CGColor;
}

-(void)customTransaction{
    [self resetView];
    [self.containerView.layer addSublayer:self.helper];
    self.helper.backgroundColor = [UIColor randomColor].CGColor;
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0];//设置当前事务的动画时间
    self.playingLayer.backgroundColor = [UIColor randomColor].CGColor;
    [CATransaction commit];
    
}

-(void)customTransactionWithCompletion{
    
    [self resetView];
    self.view.userInteractionEnabled = NO;
    [self.containerView.layer addSublayer:self.helper];
    self.helper.backgroundColor = [UIColor randomColor].CGColor;
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0];//设置当前事务的动画时间
    [CATransaction setCompletionBlock:^{
        self.playingLayer.affineTransform = CGAffineTransformMakeRotation(M_PI_4);
        self.view.userInteractionEnabled = YES;
    }];
    self.playingLayer.backgroundColor = [UIColor randomColor].CGColor;
    [CATransaction commit];
}

-(void)customTransition{
    //创建行为
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    
    self.playingLayer.actions = @{@"backgroundColor":transition};
    
    [self backGroundColor];
}

-(void)presentationLayer{
    [self resetView];
    [CATransaction setAnimationDuration:5];
    
    self.playingLayer.frame = CGRectMake(self.playingLayer.frame.origin.x + 100, self.playingLayer.frame.origin.y, self.playingLayer.frame.size.width, self.playingLayer.frame.size.height);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self.containerView];
    CALayer *presentaion = self.playingLayer.presentationLayer;
    CALayer *hitLayer = [presentaion hitTest:point];
    if (hitLayer ) {
        self.playingLayer.backgroundColor = [UIColor randomColor].CGColor;
        self.playingLayer.frame = CGRectMake(self.playingLayer.frame.origin.x - 200, self.playingLayer.frame.origin.y, self.playingLayer.frame.size.width, self.playingLayer.frame.size.height);
    }
}

-(void)frame{
    [self resetView];
    self.playingLayer.frame = CGRectMake(0, 0, 75, 75);
    
}

-(NSUInteger)buttonsCount{
    return 6;
}


-(UIButton *)buttonForIndex:(NSInteger)index{
    UIButton *button = [self normalButton];
    switch (index) {
        case 0:{
            [button setTitle:@"颜色" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(backGroundColor) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        case 1:{
            [button setTitle:@"frame" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(frame) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        case 2:{
            [button setTitle:@"动画时间" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(customTransaction) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        case 3:{
            [button setTitle:@"完成回调" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(customTransactionWithCompletion) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        case 4:{
            [button setTitle:@"自定义行为(颜色)" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(customTransition) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        case 5:{
            [button setTitle:@"呈现图层" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(presentationLayer) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        default:
            return nil;
            break;
    }
    
    return button;
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
