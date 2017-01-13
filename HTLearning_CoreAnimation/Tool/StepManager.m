//
//  StepManager.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/3.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "StepManager.h"
#import <objc/objc-runtime.h>
#import "AppDelegate.h"
#define kSEL @"SEL"
#define kTarget @"target"
@interface StepManager ()
@property (nonatomic, assign)NSInteger stepIndex;
@property (nonatomic, assign)SEL stepSEL;
@property (nonatomic, strong)id target ;
@end

@implementation StepManager

+(instancetype)manager{
    return [self managerWithSEL:nil target:nil resetBlock:nil];
}

+(instancetype)managerWithSEL:(NSArray *)SELS target:(id)target resetBlock:(StepManagerResetBlock)block{
    return [[[self class] alloc] initWithSEL:SELS target:target resetBlock:block];
}

-(instancetype)initWithSEL:(NSArray *)SELS target:(UIViewController *)target resetBlock:(StepManagerResetBlock)block{
    if (self = [super init]) {
        [self resetTarget:target SelectorStrings:SELS];
        _stepBtn = [self setUpStepBtn];
        [target.view addSubview:_stepBtn];
        _stepIndex = 0;
        
        _resetable = YES;
        _resetBlock = [block copy];
    }
    return self;
}

-(void)resetTarget:(id)target SelectorStrings:(NSArray *)selectorStrings{
    _SELS = [NSMutableDictionary dictionary];
    [_SELS setObject:selectorStrings forKey:kSEL];
    [_SELS setObject:target forKey:kTarget];
    
    if ([target isKindOfClass:[UIViewController class]]) {
        UIViewController *vc = (UIViewController *)target;
        _target = vc.view;
    }else if ([target isKindOfClass:[UIView class]]){
        target = target;
    }else{
        NSAssert(0, @"target 类型错误,应该为UIView或者UIViewController");
    }
}

-(UIButton *)setUpStepBtn{
    
    UIButton *stepBtn  = [[UIButton alloc]initWithFrame:CGRectMake(20, 100, 100, 60)];
    [stepBtn setTitle:@"第1步" forState:UIControlStateNormal];
    [stepBtn addTarget:self action:@selector(step:) forControlEvents:UIControlEventTouchUpInside];
    [stepBtn addTarget:self action:@selector(reset:) forControlEvents:UIControlEventTouchDragExit];
    [stepBtn setBackgroundColor:[UIColor lightGrayColor]];
    [stepBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    return stepBtn;
}




-(void)step:(UIButton *)button{
    _stepIndex ++;
    NSString *title = [NSString stringWithFormat:@"第%ld步",_stepIndex];
    [button setTitle:title forState:UIControlStateNormal];
    NSString *selString = [self getStepSELString];
    if ([_target isKindOfClass:[UIViewController class]]) {
        UIViewController *vc = (UIViewController *)_target;
        vc.title = selString;
    }
    if (!selString) {
        [self reset:_stepBtn];
        return;
    }
    SEL step = NSSelectorFromString([self getStepSELString]);
    _stepSEL = step;
    [[self getTarget] performSelectorOnMainThread:step withObject:nil waitUntilDone:NO];
}

-(void)reset:(UIButton *)button{
    [button removeFromSuperview];
    button = nil;
    _stepBtn = [self setUpStepBtn];
    
    UIView *target = _target;
    [target addSubview:_stepBtn];
    
    _stepIndex = 0;
    
    if (self.resetable && self.resetBlock   ) {
        self.resetBlock();
    }
}

-(NSString *)getStepSELString{
    NSArray *sels = [self.SELS objectForKey:kSEL];
    if (_stepIndex  > sels.count ) {
        
        return nil;
    }
    NSString * step = [[self.SELS objectForKey:kSEL] objectAtIndex:_stepIndex -1];
    return [step copy];
}

-(id)getTarget{
    id target = [self.SELS objectForKey:kTarget];
    return target;
}


@end
