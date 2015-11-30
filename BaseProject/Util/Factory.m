//
//  Factory.m
//  BaseProject
//
//  Created by apple-jd09 on 15/11/25.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "Factory.h"

@implementation Factory
/** 向某个控制器上，添加菜单按钮 */
+ (void)addMenuItemToVC:(UIViewController *)vc{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"Home_Icon"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"Home_Icon_Highlight"] forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(0, 0, 30, 30);
    [btn bk_addEventHandler:^(id sender) {
        [vc.sideMenuViewController presentLeftMenuViewController];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    spaceItem.width = -10;
    vc.navigationItem.leftBarButtonItems = @[spaceItem,menuItem];
}


/** 向某个控制器上，添加返回按钮 */
+ (void)addBackItemToVC:(UIViewController *)vc{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 45, 44);
    [btn setImage:[UIImage imageNamed:@"News_Navigation_Arrow"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"News_Navigation_Arrow_Highlight"] forState:UIControlStateHighlighted];
    [btn bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -16;
    vc.navigationItem.leftBarButtonItems = @[spaceItem,menuItem];
}
@end
