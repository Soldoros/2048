//
//  RootController.h
//  2048
//
//  Created by soldoros on 2017/3/25.
//  Copyright © 2017年 soldoros. All rights reserved.
//

#import <UIKit/UIKit.h>




/**
 *  构建不同的标签控制器类型
 */
typedef NS_ENUM(NSInteger, FrameworkStyle) {
    /**
     *  默认的系统自带标签栏
     */
    FrameworkDefault=0,
    /**
     *  自定义标签栏
     */
    FrameworkValue1
};
@interface RootController : UIViewController<UITabBarControllerDelegate>

@property (strong, nonatomic) NSUserDefaults *user;


/**
 *  框架样式
 */
@property(nonatomic,assign)FrameworkStyle frameworkStyle;

/**
 *  标题选中和未选中时候的颜色
 */
@property(nonatomic,strong)UIColor *normalColor;
@property(nonatomic,strong)UIColor *selectedColor;


/**
 *  标签栏选中和未选中时候的图片
 */
@property(nonatomic,strong)NSArray *normalImages;
@property(nonatomic,strong)NSArray *selectedImages;

/**
 *  标签栏题目
 */
@property(nonatomic,strong)NSArray *titles;


/**
 *  控制器容器
 */
@property(nonatomic,strong) NSArray  *controllers;



/**
 统计标签栏按钮个数
 */
@property(nonatomic,assign)NSInteger number;


/**
 导航控制器容器
 */
@property(nonatomic,strong) NSMutableArray  *navGations;

/**
 当前处于哪个控制器
 */
@property(nonatomic,assign) NSInteger index;

/**
 标签控制器
 */
@property(nonatomic,strong) UITabBarController *tabBarController;

/**
 标签按钮
 */
@property(nonatomic,strong) UITabBar *tabBar;




@end
