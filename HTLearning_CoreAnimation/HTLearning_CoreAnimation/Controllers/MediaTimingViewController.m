//
//  MediaTimingViewController.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/16.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "MediaTimingViewController.h"
#import "UIView+SCUtils.h"

#define TAG_TIMEOFFSET 65
#define TAG_SPEED 66

@interface MediaTimingViewController ()<CAAnimationDelegate,UITextFieldDelegate>

@end

@implementation MediaTimingViewController{
    UITextField *_durationField;
    UITextField *_repeatField;
    
    UISlider *_timeOffSet;
    UILabel *_offsetLabel;
    UISlider *_speed;
    UILabel *_speedLabel;
    
    UIButton *_startButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpViewss];
    
    [self.containerView.layer addSublayer:[self shipPathLayer]];
}

-(void)setUpViewss{
    //timeOffset
    _timeOffSet = [[UISlider alloc]initWithFrame:CGRectMake(65, self.collectionView.y - 50, self.view.width-130, 40)];
    _timeOffSet.maximumValue = 1;
    _timeOffSet.minimumValue = 0;
    [_timeOffSet addObserver:self forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:NULL];
    _timeOffSet.tag = TAG_TIMEOFFSET;
    [self.view addSubview:_timeOffSet];
    
    UILabel *descriptionOffset = [[UILabel alloc]initWithFrame:CGRectMake(15, _timeOffSet.centerY -20, 50, 40)];
    descriptionOffset.textColor = [UIColor blueColor];
    descriptionOffset.text = @"timeOffset";
    descriptionOffset.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:descriptionOffset];
    
    _offsetLabel = [[UILabel alloc]initWithFrame:CGRectMake(_timeOffSet.right +10, _timeOffSet.centerY - 20, 50, 40)];
    _offsetLabel.text = @"0.0~1.0";
    _offsetLabel.textColor = [UIColor blueColor];
    _offsetLabel.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:_offsetLabel];
    
    //speed
    _speed = [[UISlider alloc]initWithFrame:CGRectMake(_timeOffSet.x, _timeOffSet.y - 50, _timeOffSet.width, 40)];
    _speed.minimumValue = 0;
    _speed.maximumValue = 10.0;
    [_speed addObserver:self forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:NULL];
    _speed.tag = TAG_SPEED;
    [self.view addSubview:_speed];
    
    UILabel *descriptionSpeed = [[UILabel alloc]initWithFrame:CGRectMake(15, _speed.centerY - 20, 50, 40)];
    descriptionSpeed.textColor = [UIColor blueColor];
    descriptionSpeed.text = @"speed";
    descriptionSpeed.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:descriptionSpeed];
    
    _speedLabel = [[UILabel alloc]initWithFrame:CGRectMake(_speed.right +10, _speed.centerY - 20, 50, 40)];
    _speedLabel.textColor = [UIColor blueColor];
    _speedLabel.text = @"min 0.0";
    _speedLabel.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:_speedLabel];
    
//    //暂停,倒回和快进
//    UIButton *pause = [self normalButton];
//    [pause setTitle:@"暂停" forState:UIControlStateNormal];
//    [pause addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
//    pause.frame = CGRectMake(15, _speedLabel.centerY - 55, 60, 40);
//    
//    UIButton *forward = [self normalButton];
//    [forward setTitle:@"快进" forState:UIControlStateNormal];
//    [forward addTarget:self action:@selector(foward) forControlEvents:UIControlEventTouchUpInside];
//    forward.frame = CGRectMake(pause.right + 15, pause.y, 60, 40);
//    
//    UIButton *backward = [self normalButton];
//    [backward setTitle:@"倒回" forState:UIControlStateNormal];
//    [backward addTarget:self action:@selector(backward) forControlEvents:UIControlEventTouchUpInside];
//    backward.frame = CGRectMake(forward.right + 15, pause.y, 60, 40);
//    
//    [self.view addSubview:pause];
//    [self.view addSubview:forward];
//    [self.view addSubview:backward];

}

#pragma mark start

-(void)start{
    
    CFTimeInterval duration = _durationField.text.doubleValue;
    float repeatCount = _repeatField.text.floatValue;
    CFTimeInterval timeOffSet = _timeOffSet.value;
    float speed = _speed.value;
    if (!duration) {
        duration = 1;
    }
    if (!repeatCount) {
        repeatCount = 1;
    }
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.path = [self shipPathLayer].path;
    animation.duration = duration;
    animation.repeatCount = repeatCount;
    animation.speed = speed;
    animation.timeOffset = timeOffSet;
    animation.keyPath = @"position";
    animation.delegate = self;
    animation.removedOnCompletion = NO;
    [self.shipLayer addAnimation:animation forKey:@"rotateAnimation"];

    [self setEnabled:NO];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self setEnabled:YES];
}

-(void)setEnabled:(BOOL)enabled{
    for (UIControl * control in @[_durationField,_repeatField,_startButton]) {
        control.enabled = enabled;
        control.alpha = enabled? 1.0f: 0.25f;
    }
}

//#pragma mark 暂停,倒回和快进
//
//-(void)pause{
//    self.shipLayer.speed = 0;
//    
//}
//
//-(void)foward{
//    self.shipLayer.speed = 1.5;
//}
//
//-(void)backward{
//    self.shipLayer.speed = -0.5;
//}

#pragma mark -

-(UIControl *)itemForIndex:(NSInteger)index{
    if (index == 0) {
        _durationField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
        _durationField.returnKeyType = UIReturnKeyDone;
        _durationField.textColor = [UIColor blueColor];
        _durationField.placeholder = @"duration";
        _durationField.delegate = self;
        return _durationField;
    }else if(index == 1){
        _repeatField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, _durationField.width, _durationField.height)];
        _repeatField.returnKeyType = UIReturnKeyDone;
        _repeatField.textColor = [UIColor blueColor];
        _repeatField.placeholder = @"repeatCount";
        _repeatField.delegate = self;
        return _repeatField;
    }else{
        _startButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
        [_startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        [_startButton setTitle:@"开始" forState:UIControlStateNormal];
        [_startButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        return _startButton;
    }
}

-(NSUInteger)itemsCount{
    return 3;
}


#pragma mark -


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    UISlider *slider = (UISlider *)object;
    if ([slider isKindOfClass:[UISlider class]]) {
        float new = [[change valueForKey:NSKeyValueChangeNewKey] floatValue];
        NSLog(@"new : %.2f",new);
        if (slider.tag == TAG_TIMEOFFSET) {
            _offsetLabel.text = [NSString stringWithFormat:@"%.2f",new];
        }else if (slider.tag == TAG_SPEED){
            _speedLabel.text = [NSString stringWithFormat:@"%.2f",new];
        }
    }
}
#pragma mark -
-(void)dealloc{
    [_timeOffSet removeObserver:self forKeyPath:@"value"];
    [_speed removeObserver:self forKeyPath:@"value"];
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
