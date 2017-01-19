//
//  FireworkViewController.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/19.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "FireworkViewController.h"
#import "FireWorkView.h"

@interface FireworkViewController ()

@end

@implementation FireworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *fire = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame), CGRectGetMaxY(self.view.frame) - 100, 50, 40)];
    [fire setTitle:@"fire" forState:UIControlStateNormal];
    [fire addTarget:self action:@selector(fire) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fire];
    
    FireWorkView *firework = [[FireWorkView alloc]initWithFrame:CGRectMake(15, 100, CGRectGetWidth(self.view.frame) - 30, 400)];
    firework.backgroundColor = [UIColor blackColor];
    [self.view addSubview:firework];
    
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
