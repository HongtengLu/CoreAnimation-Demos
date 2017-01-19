//
//  FireWorkView.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/19.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "FireWorkView.h"
#import "UIImage+Color.h"
#import "UIColor+Random.h"

@implementation FireWorkView{
    CAEmitterLayer *_emitter;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}

-(void)setUp{
    _emitter = [CAEmitterLayer layer];
    _emitter.frame = self.bounds;
    
    _emitter.emitterMode = kCAEmitterLayerOutline;
    _emitter.emitterSize = CGSizeMake(CGRectGetWidth(self.frame) - 20, 0);
    _emitter.emitterShape = kCAEmitterLayerLine;
    _emitter.birthRate = 1;
    _emitter.emitterPosition = CGPointMake(CGRectGetMidX(self.frame) - 10, CGRectGetHeight(self.frame));
    _emitter.emitterCells = @[[self emitterCellWithName:@"cell" contents:(__bridge id)[UIImage imageWithColor:[UIColor orangeColor] size:CGSizeMake(2, 2)].CGImage]];
    _emitter.masksToBounds = YES;
    
    [self.layer addSublayer:_emitter];
}

-(CAEmitterCell *)emitterCellWithName:(NSString *)name contents:(id)contents{
    
    
    
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.name = name;
    cell.birthRate = 1;
    cell.velocity = 200;
    cell.lifetime = 1.5;
    cell.yAcceleration = 40;
    CAEmitterCell *fireTailCell1 = [self fireTailCellWithName:@"fireTail_1" contents:(__bridge id)[UIImage imageWithColor:[UIColor orangeColor] size:CGSizeMake(1, 1)].CGImage];
    CAEmitterCell *fireTailCell2 = [self fireTailCellWithName:@"fireTail_2" contents:(__bridge id)[UIImage imageWithColor:[UIColor redColor] size:CGSizeMake(1, 1)].CGImage];
    CAEmitterCell *explodeCell = [self explodeCellWithName:@"explode"];
    cell.emitterCells = @[fireTailCell1,fireTailCell2,explodeCell];
    cell.contents = contents;
    
    return cell;

}

-(CAEmitterCell *)explodeCellWithName:(NSString *)name{
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.name = name;
    cell.birthRate = 1/1.45;
    cell.velocity = 0;
    cell.lifetime = 0.5;
    
    
    cell.emitterCells = @[[self fireWorkCellWithName:@"firwork" contents:(__bridge id)[UIImage imageNamed:@"star"].CGImage]];
    return cell;
}

-(CAEmitterCell *)fireWorkCellWithName:(NSString *)name contents:(id)contents{
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.name = name;
    cell.birthRate = 500;
    cell.velocity = 100;
    cell.lifetime = 2;
    cell.emissionRange = M_PI * 2;
    cell.yAcceleration = 80;
    cell.scale = 0.5;
    cell.alphaSpeed = -1;
    cell.contents = contents;
    return cell;
}

-(CAEmitterCell *)fireTailCellWithName:(NSString *)name contents:(id)contents{
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.name = name;
    cell.birthRate = 100;
    cell.velocity = 40;
    cell.velocityRange = cell.velocity + 50;
    cell.emissionRange = M_PI;
    cell.alphaSpeed = -1;
    cell.yAcceleration = 80;
    cell.lifetimeRange = 3;
    cell.contents = contents;
    
    return cell;
}


-(void)fire{
    
}













@end
