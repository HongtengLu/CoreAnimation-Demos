//
//  ListViewController.h
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/17.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,copy) NSArray *titles;

@property (nonatomic,copy) NSArray *controllers;

@end
