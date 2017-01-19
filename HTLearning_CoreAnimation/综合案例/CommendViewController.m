//
//  CommendViewController.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/18.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "CommendViewController.h"
#import "CommendButton.h"
#import "UIView+EmptyView.h"


@interface CommendViewController ()
@property (nonatomic, strong) CommendButton *commendButton;
@end

@implementation CommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.commendButton = [[CommendButton alloc]initWithFrame:[UIView centerFrameOfScreenWithWidth:40 andHeight:30]];
    [self.commendButton setImage: [UIImage imageNamed:kCommendButtonDefaultImageName] forState:UIControlStateNormal];
    [self.view addSubview:self.commendButton];
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
