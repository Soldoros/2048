//
//  AppDelegate+DEAdd.h
//  Project
//
//  Created by soldoros on 16/6/27.
//  Copyright © 2016年 soldoros. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate (SSAdd)

/**
 初始化根控制器
 */
-(void)initRootController;

/**
 初始化游戏根控制器
 */
-(void)initGamesRootController;

/**
 获取单例
 @return 返回delegate单例
 */
+(AppDelegate *)sharedAppDelegate;


/**
 检测网络状态
 */
-(void)checkNetWorkStatus;





@end
