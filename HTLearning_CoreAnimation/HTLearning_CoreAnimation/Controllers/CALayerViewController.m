//
//  ViewController.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/3.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "CALayerViewController.h"

#import <QuartzCore/QuartzCore.h>

#import "UIView+EmptyView.h"
#import "MBProgressHUD+Toast.h"
#import "CALayer+ShowDetail.h"

#import "StepManager.h"

#define DEFAULT_WIDTH_BLUELAYER 10


@interface CALayerViewController ()<CALayerDelegate>

@property (nonatomic, strong) UIView *layerView;

@property (nonatomic, strong) NSMutableArray *sels;

@end

@implementation CALayerViewController{
    StepManager *_stepManager;
    CALayer *_blueLayer;
    CALayer *_glossLayer;
    CALayer *_positionLayer;
}

-(NSMutableArray *)sels{
    if (!_sels) {
        _sels = [NSMutableArray arrayWithObjects:
                 NSStringFromSelector(@selector(addLayerView)),
//                 NSStringFromSelector(@selector(addQuartzCore)),
                 NSStringFromSelector(@selector(addBlueLayer)),
                 NSStringFromSelector(@selector(moveAnchorPoint)),
                 NSStringFromSelector(@selector(moveSecond)),
                 NSStringFromSelector(@selector(movePosition)),
                 NSStringFromSelector(@selector(newOrigin)),
                 NSStringFromSelector(@selector(newBounds)),
                 NSStringFromSelector(@selector(testzPosition)),
                 
//                 NSStringFromSelector(@selector(scaleTransform)),
//                 NSStringFromSelector(@selector(rotaionTransform)),
//                 NSStringFromSelector(@selector(translationTransform)),
                 
//                 NSStringFromSelector(@selector(transformContinuation_wrong)),
                 NSStringFromSelector(@selector(transformContinuation_right)),
                 nil];
    }
    return _sels;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _stepManager = [StepManager managerWithSEL:self.sels target:self resetBlock:^{
        [_layerView removeFromSuperview];
        _layerView = nil;
    }];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}

-(void)addLayerView{
    _layerView = [UIView emptyViewWidth:200 height:200];
    [self.view addSubview:_layerView];
}

-(void)addQuartzCore{
    [MBProgressHUD toast:@"添加QuartzCore库文件" toView:self.view];
}

-(void)addBlueLayer{
    
    
    _blueLayer = [CALayer layer];
    _blueLayer.frame = [self.layerView centerFrameOfViewWithWidth:DEFAULT_WIDTH_BLUELAYER andHeight:DEFAULT_WIDTH_BLUELAYER];
    _blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer addSublayer:_blueLayer];
    
    _positionLayer = [CALayer layer];
    
    _positionLayer.frame =CGRectMake(_blueLayer.position.x, _blueLayer.position.y, 3, 3);
    _positionLayer.cornerRadius = 1.5;
    _positionLayer.backgroundColor = [UIColor redColor].CGColor;
    [_layerView.layer addSublayer:_positionLayer];
    
    _glossLayer = [CALayer layer];
    _glossLayer.delegate = self;
    CGPoint position = _blueLayer.position;
    CGFloat width = _blueLayer.frame.origin.x - position.x + _blueLayer.bounds.size.width;
    CGFloat height = _blueLayer.frame.origin.y - position.y + _blueLayer.bounds.size.height;
    _glossLayer.frame = CGRectMake(position.x, position.y, width, height);
    _glossLayer.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.5].CGColor;
    [self.layerView.layer addSublayer:_glossLayer];
    
    
}

-(void)moveAnchorPointTo:(CGPoint)point{
    _blueLayer.anchorPoint = point;
    [self display];
}

-(void)moveAnchorPoint{
    [self moveAnchorPointTo:CGPointMake(0, 0)];
    [self display];
}

-(void)moveSecond{
    [self moveAnchorPointTo:CGPointMake(-0.5, -0.5)];
    [self display];
}

-(void)movePosition{
    _blueLayer.position = CGPointMake(_blueLayer.position.x +50, _blueLayer.position.y+50);
    [self display];
}

-(void)testzPosition{
    
    
    _blueLayer.zPosition = 1;
    
}

-(void)newOrigin{
    _blueLayer.frame = CGRectMake(0, 0, DEFAULT_WIDTH_BLUELAYER, DEFAULT_WIDTH_BLUELAYER);
    [self display];
}
-(void)newBounds{
    _blueLayer.frame = CGRectMake(0, 0, DEFAULT_WIDTH_BLUELAYER *2, DEFAULT_WIDTH_BLUELAYER *2);
    [self display];
}

#pragma mark AffineTransform

-(void)scaleTransform{
    CGAffineTransform affineTransform = CGAffineTransformMakeScale(1.2, 1.2);
    _blueLayer.affineTransform = affineTransform;
    [self display];
}

-(void)rotaionTransform{
    CGAffineTransform affineTransform = CGAffineTransformMakeRotation(M_PI_2);
    _blueLayer.affineTransform = affineTransform;
    [self display];
}

-(void)translationTransform{
    CGAffineTransform affineTransform = CGAffineTransformMakeTranslation(10, 0);
    _blueLayer.affineTransform = affineTransform;
    [self display];
}

-(void)transformContinuation_wrong{
    [self scaleTransform];
    [self rotaionTransform];
    [self translationTransform];
}

-(void)transformContinuation_right{
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformScale(transform, 0.5, 1);
    transform = CGAffineTransformRotate(transform, M_PI_2/3);
    transform = CGAffineTransformTranslate(transform, 50, 0);
    self.layerView.layer.affineTransform = transform;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark display

-(void)display{
    [_glossLayer display];
    [self newPosition];
    [self logInfo];
}

-(void)newPosition{
    [_positionLayer removeFromSuperlayer];
    _positionLayer = [CALayer layer];
    _positionLayer.frame =CGRectMake(_blueLayer.position.x, _blueLayer.position.y, 3, 3);
    _positionLayer.cornerRadius = 1.5;
    _positionLayer.backgroundColor = [UIColor redColor].CGColor;
    [_layerView.layer addSublayer:_positionLayer];
}



-(void)displayLayer:(CALayer *)layer{
    if (layer == _glossLayer) {
        CGPoint position = _blueLayer.position;
        CGFloat width = _blueLayer.frame.origin.x - position.x + _blueLayer.bounds.size.width;
        CGFloat height = _blueLayer.frame.origin.y - position.y + _blueLayer.bounds.size.height;
        _glossLayer.frame = CGRectMake(position.x, position.y, width, height);
    }
}

-(void)logInfo{
   
    NSLog(@"\n\n _glossLayer.frame:%@ \n\n _blueLayer.position:%@ \n\n _blueLayer.anchorPoint:%@ \n\n _blueLayer.frame:%@ \n",
          NSStringFromCGRect(_glossLayer.frame),
          NSStringFromCGPoint(_blueLayer.position),
          NSStringFromCGPoint(_blueLayer.anchorPoint),
          NSStringFromCGRect(_blueLayer.frame)
          );
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    CALayer *layer = [self.view.layer hitTest:point];
    if (layer == _blueLayer) {
        NSLog(@"blue");
    }else if (layer == _positionLayer){
        NSLog(@"position");
    }else if (layer == _glossLayer){
        NSLog(@"gloss");
    }else if (layer == self.layerView.layer){
        NSLog(@"layerView.layer");
    }
}

@end
