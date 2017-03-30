//
//  DEDefine.h
//  Project
//
//  Created by soldoros on 16/6/27.
//  Copyright © 2016年 soldoros. All rights reserved.
//

#import <Foundation/Foundation.h>


//登陆key  登陆判断
extern NSString *const USER_Login;

//用户名 手机号 密码
extern NSString *const USER_Name;
extern NSString *const USER_Mobile;
extern NSString *const USER_Password;


//key 图片 手机号 性别 昵称 头像
extern NSString *const USER_Key;
extern NSString *const USER_Img;
extern NSString *const USER_Sex;
extern NSString *const USER_Nickname;
extern NSString *const USER_Avator;

//定位信息
extern NSString *const USER_Dingwei;
extern NSString *const USER_DingweiDatas;
extern NSString *const USER_Jingdu;
extern NSString *const USER_Weidu;


//固定高度
extern CGFloat const NAV_Height;
extern CGFloat const TOOLBAR_Height;
extern CGFloat const TABBAR_Height;


//输入框限制输入信息
extern NSString *const NUMERIC_CHARACTERS;
//搜索历史
extern NSString *const SEARCHHISTORY;



#ifndef IOS_Soldoros__Define
#define IOS_Soldoros__Define



//打印
#define MESSAGE     NSLog(@"响应了")
#define debugLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)



//普通的灰色背景
#define BackGroundColor  makeColorRgb(245, 245, 245)
//加深的灰色
#define GrayColor makeColorRgb(137, 148, 160)
//主题玫红色
#define RedTitleColor makeColorRgb(245, 75, 130)
//主题浅蓝
#define BlueTitleColor makeColorRgb(35, 69, 96)
//主题橙色
#define OrangeTitleColor makeColorRgb(252, 154, 40)
//主题色
#define TitleColor  [DEUserDefault shareCKUserDefault].titleColor
//线条颜色
#define LineColor  makeColorRgb(212, 211, 215)


//app名称
#define app_Name  [[[NSBundle mainBundle] [[NSBundle mainBundle] infoDictionary]] \
objectForKey:@"CFBundleDisplayName"];

//app版本
#define app_Version  [[[NSBundle mainBundle] [[NSBundle mainBundle] infoDictionary]] \
objectForKey:@"CFBundleShortVersionString"];

//app bulid版本
#define app_build  [[[NSBundle mainBundle] [[NSBundle mainBundle] infoDictionary]] \
objectForKey:@"CFBundleVersion"];


//当前屏幕的尺寸
#define SCREENBounds [[UIScreen mainScreen ] bounds];
//当前窗口的高度 宽度
#define SCREEN_Height [[UIScreen mainScreen] bounds].size.height
#define SCREEN_Width  [[UIScreen mainScreen] bounds].size.width
//主视图的高度 宽度
#define MAINVIEW_Height (SCREEN_Height - NAV_Height - TAB_Height)
#define MAINVIEW_Width  [[UIScreen mainScreen] bounds].size.width


//判断版本
#define IS_IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)
#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
#define IOS7_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending)

//根视图
#define NAVIGATION (UINavigationController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController]


//沙盒路径
#define  DOCUMENTSDIRECTORYPATH  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];

//得到选择后沙盒中图片的完整路径
#define FILEPATH [[NSString alloc]initWithFormat:@"%@%@",[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"],  @"/image.png"]


#endif
