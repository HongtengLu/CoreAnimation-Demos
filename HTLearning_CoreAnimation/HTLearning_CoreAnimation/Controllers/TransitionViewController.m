//
//  TransitionViewController.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/13.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "TransitionViewController.h"

@interface TransitionViewController ()
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, copy) NSArray *images;

@property (nonatomic, copy) NSArray *subtypes;

@property (nonatomic, strong) UIButton *subtypeButton;

@property (nonatomic, strong) UIImage *currentImage;

@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"过渡动画";
    self.images = @[
                    [UIImage imageNamed:@"pic.jpg"],
                    [UIImage imageNamed:@"pic2"],
                    [UIImage imageNamed:@"pic3"],
                    ];
    self.subtypes = @[
                      kCATransitionFromRight,
                      kCATransitionFromLeft,
                      kCATransitionFromTop,
                      kCATransitionFromBottom,
                      ];
    
    self.containerView.backgroundColor = [UIColor clearColor];
    [self.playingLayer removeFromSuperlayer];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100,200, 200, 200)];
    [self.view addSubview:self.imageView];
    self.imageView.image = [self.images firstObject];
    [self setCollectionViewHeight:200];
}

-(void)changeSubtype{
    NSString *currentSubtype = self.subtypeButton.titleLabel.text;
    NSUInteger index = [self.subtypes indexOfObject:currentSubtype];
    index = (index + 1) % [self.subtypes count];
    NSString *next = self.subtypes[index];
    [self.subtypeButton setTitle:[NSString stringWithFormat:@"%@",next] forState:UIControlStateNormal];
}

-(void)switchPicWithType:(NSString *)type{
    [self.imageView.layer removeAllAnimations];
    
    CATransition *transition = [CATransition animation];
    transition.type = type;
    transition.duration = 1;
    transition.subtype = self.subtypeButton.titleLabel.text;
    [self.imageView.layer addAnimation:transition forKey:nil];//如果使用 CATransition ,无论 -addAnimation:forKey: 的key参数传什么,内部都会自动使用 kCATransition .

    
    UIImage *currentImage = self.currentImage;
    NSUInteger index = [self.images indexOfObject:currentImage];
    index = (index + 1) % [self.images count];
    self.imageView.image = self.images[index];
    self.currentImage = self.imageView.image;
}

-(void)fade{
    [self switchPicWithType:kCATransitionFade];
}

-(void)push{
    [self switchPicWithType:kCATransitionPush];
}

-(void)moveIn{
    [self switchPicWithType:kCATransitionMoveIn];
}

-(void)reveal{
    [self switchPicWithType:kCATransitionReveal];
}
-(void)pageCurl{
    [self switchPicWithType:@"pageCurl"];
}
-(void)pageUnCurl{
    [self switchPicWithType:@"pageUnCurl"];
}
-(void)oglFlip{
    [self switchPicWithType:@"oglFlip"];
}
-(void)cube{
    [self switchPicWithType:@"cube"];
}
-(void)rippleEffect{
    [self switchPicWithType:@"rippleEffect"];
}
-(void)suckEffect{
    [self switchPicWithType:@"suckEffect"];
}
-(void)cameraIrisHollowOpen{
    [self switchPicWithType:@"cameraIrisHollowOpen"];
}

-(void)cameraIrisHollowClose{
    [self switchPicWithType:@"cameraIrisHollowClose"];
}


-(NSUInteger)itemsCount{
    return  13;
}

-(UIControl *)itemForIndex:(NSInteger)index{
    UIButton *button = [self normalButton];
    NSString *title = nil;
    SEL selector = nil;
    switch (index) {
        case 0:{
            self.subtypeButton = button;
            title = [NSString stringWithFormat:@"%@",[self.subtypes firstObject]] ;
            selector = @selector(changeSubtype) ;
            
            button.backgroundColor = [UIColor whiteColor];
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            
            break;
        }case 1:{
            title = @"fade";
            selector =  @selector(fade);
            break;
        }case 2:{
            title =@"push" ;
            selector = @selector(push);
            break;
        }case 3:{
            title =@"moveIn";
            selector =@selector(moveIn);
            break;
        }case 4:{
            title =@"reveal";
            selector =@selector(reveal);
            break;
        }case 5:{
            title =@"pageCurl";
            selector = @selector(pageCurl);
            break;
        }case 6:{
            title =@"pageUnCurl";
            selector = @selector(pageUnCurl);
            break;
        }case 7:{
            title =@"oglFlip";
            selector = @selector(oglFlip);
            break;
        }case 8:{
            title =@"cube";
            selector = @selector(cube);
            break;
        }case 9:{
            title =@"rippleEffect";
            selector = @selector(rippleEffect);
            break;
        }case 10:{
            title =@"suckEffect";
            selector = @selector(suckEffect);
            break;
        }case 11:{
            title =@"cameraIrisHollowOpen";
            selector = @selector(cameraIrisHollowOpen);
            break;
        }case 12:{
            title =@"cameraIrisHollowClose";
            selector = @selector(cameraIrisHollowClose);
            break;
        }
        default:
            break;
    }
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
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
