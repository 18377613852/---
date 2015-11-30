//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "ViewController.h"
#import "LeftViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    self.window.rootViewController = self.RESideMenu;

    [self configGlobalUIStyle];
    return YES;
}

- (UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}

- (RESideMenu *)RESideMenu{
    if (!_RESideMenu) {
        _RESideMenu = [[RESideMenu alloc]initWithContentViewController:[ViewController standardNavi] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
//        _RESideMenu.backgroundImage = [UIImage imageNamed:@"Dark_Account_Info_Base"];
        _RESideMenu.bouncesHorizontally = NO;
    }
    return _RESideMenu;
}
/** 配置全局UI的样式 */
-(void)configGlobalUIStyle{
    /** 设置导航栏透明 */
    [[UINavigationBar appearance] setTranslucent:YES];
    /** 设置导航栏背景图 */
//    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"Action_Button_Highlight"] forBarMetrics:UIBarMetricsDefault];
    /** 配置导航栏题目的样式 */
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18], NSForegroundColorAttributeName: [UIColor whiteColor]}];
}

@end












