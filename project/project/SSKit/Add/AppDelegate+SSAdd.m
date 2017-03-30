//
//  AppDelegate+DEAdd.m
//  Project
//
//  Created by soldoros on 16/6/27.
//  Copyright © 2016年 soldoros. All rights reserved.
//

#import "AppDelegate+SSAdd.h"



@implementation AppDelegate (SSAdd)


//初始化游戏根控制器
-(void)initGamesRootController{
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.gamesRootVc = [[GamesRootController alloc]init];
    
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:self.gamesRootVc];
    [self.window makeKeyAndVisible];
}

//初始化根控制器
-(void)initRootController{
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.root = [[RootController alloc]init];
    self.root.frameworkStyle  = FrameworkDefault;
    self.root.normalImages    = @[@"Tab_bar_icon_xiaoxi",
                              @"Tab-bar_icon_lianxiren",
                              @"Tab_bar_icon_center"];
    self.root.selectedImages  = @[@"Tab_bar_icon_xiaox_1",@"Tab_bar_icon_lianxiren_1",@"Tab_bar_icon_center_1"];
    self.root.titles          = @[@"消息",@"联系人",@"个人中心"];
    self.root.controllers     = @[@"TwoController",
                              @"ThreeController",@"MineController"];
    self.root.selectedColor   = BlueTitleColor;
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:self.root];
    [self.window makeKeyAndVisible];
}



+(AppDelegate *)sharedAppDelegate{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    return appDelegate;
}

//监测网络状态
-(void)checkNetWorkStatus{
    
    SSUserDefault *udf = [SSUserDefault shareCKUserDefault];
    [DERequest startCheckNetStatus:^(NSInteger status) {
        udf.netStatus = (NSInteger)status;
        switch (status) {
            case -1:
                udf.canNetWorking = NO;
                break;
            case 0:
                udf.canNetWorking = NO;
                break;
            case 1:
                udf.canNetWorking = YES;
                break;
            case 2:
                udf.canNetWorking = YES;
                break;
            default:
                udf.canNetWorking = NO;
                break;
        }
    }];
    
}

@end
