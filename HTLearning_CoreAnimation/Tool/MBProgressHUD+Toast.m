//
//  MBProgressHUD+Toast.m
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/3.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "MBProgressHUD+Toast.h"

@implementation MBProgressHUD (Toast)
+(void)toast:(NSString *)toast toView:(UIView *)view{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = toast;
    hud.mode = MBProgressHUDModeText;
    hud.removeFromSuperViewOnHide = YES;
    hud.offset = CGPointMake(0, 300);
    [hud hideAnimated:YES afterDelay:1.5];
}
@end
