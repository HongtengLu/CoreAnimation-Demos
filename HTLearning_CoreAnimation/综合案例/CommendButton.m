//
//  CommendButton.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/18.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "CommendButton.h"
#import "UIImage+Color.h"


@interface CommendButton ()<CAAnimationDelegate>

@end

@implementation CommendButton{
    CAEmitterLayer *_emitter;

}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUp];
    }
    return self;
}

-(void)setUp{
    [self addTarget:self action:@selector(scaleAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self creatEmitterLayer];
}


#pragma mark - 核心动画

-(void)creatEmitterLayer{
    _emitter = [CAEmitterLayer layer];
    _emitter.renderMode = kCAEmitterLayerOldestFirst;
    _emitter.emitterShape = kCAEmitterLayerCircle;
    _emitter.emitterSize = CGSizeMake(30, 0);
    _emitter.emitterMode = kCAEmitterLayerOutline;
    _emitter.frame = self.layer.bounds;
    _emitter.emitterPosition = CGPointMake(self.layer.bounds.size.width/2, self.layer.bounds.size.height/2 +3);
    _emitter.birthRate = 1;
    
    CAEmitterCell *cell = [self emitterCellWith:@"emitterCell" contents:(__bridge id)[UIImage imageWithColor:[UIColor colorWithRed:0.86 green:0.38 blue:0.57 alpha:1.0] size:CGSizeMake(60, 60)].CGImage];
    _emitter.emitterCells = @[cell];
    
    [self.layer insertSublayer:_emitter atIndex:0];
}

-(CAEmitterCell *)emitterCellWith:(NSString *)name contents:(id)contents{
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.name = name;
    cell.contents = contents;
    cell.birthRate = 0;
    cell.lifetime = 0.7;
    cell.alphaSpeed = -0.1;
    cell.velocity = 40;
    cell.scale = 0.03;
    
    return cell;
}

-(void)scaleAnimation{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.2,@0.8,@1];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    animation.delegate = self;
    animation.duration = 0.3;
    [self.layer addAnimation:animation forKey:nil];
}

-(void)bomb{
    _emitter.beginTime = CACurrentMediaTime();
    [_emitter setValue:@500 forKeyPath:@"emitterCells.emitterCell.birthRate"];
    [self performSelector:@selector(stop) withObject:nil afterDelay:0.1];
}

-(void)stop{
    [_emitter setValue:@0 forKeyPath:@"emitterCells.emitterCell.birthRate"];
}

#pragma mark - setter getter

-(void)setBombImage:(UIImage *)bombImage{
    _bombImage = bombImage;
    for (CAEmitterCell *cell in _emitter.emitterCells) {
        cell.contents = (__bridge id)bombImage.CGImage;
    }
}

-(void)setBombImageScale:(CGFloat)bombImageScale{
    _bombImageScale = bombImageScale;
    for (CAEmitterCell *cell in _emitter.emitterCells) {
        cell.scale = bombImageScale;
    }
}

#pragma mark AnimationDelegate

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self bomb];
}

@end
