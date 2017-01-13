//
//  HomeViewController.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/9.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HomeViewController.h"

#import "CALayerViewController.h"
#import "ImplyAnimationViewController.h"
#import "CustomDrawViewController.h"
#import "PropertyAnimationViewController.h"
#import "TransitionViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *dataSource;

@end

@implementation HomeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(15, 64, [UIScreen mainScreen].bounds.size.width - 30, [UIScreen mainScreen].bounds.size.height -64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma  mark TableView

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    NSString *title = nil;
    switch (indexPath.row) {
        case 0:{
            title = @"layer属性:anchorPoint 和 position";
            break;
        }case 1:{
            title = @"隐式动画";
            break;
        }case 2:{
            title = @"显式属性动画";
            break;
        }
        case 3:{
            title = @"过渡动画";
            break;
        }
        default:
            break;
    }
    cell.textLabel.text = title;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = nil;
    switch (indexPath.row) {
        case 0:{
            vc = [[CALayerViewController alloc]init];
            break;
        }case 1:{
            vc = [[ImplyAnimationViewController alloc]init];
            break;
        }case 2:{
            vc = [[PropertyAnimationViewController alloc]init];
            break;
        }case 3:{
            vc = [[TransitionViewController alloc]init];
            break;
        }case 4:{
            vc = [[CALayerViewController alloc]init];
            break;
        }
            
        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
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
