//
//  NSObject+DEProperty.h
//  Project
//
//  Created by soldoros on 16/6/27.
//  Copyright © 2016年 soldoros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GamesRootController.h"
#import "RootController.h"
@class BaseModel;

@interface NSObject (SSProperty)

//传值 一般是 cell view 之间通过属性传值
@property(nonatomic, strong)   id             object;
@property(nonatomic, copy)     NSString       *string;
@property(strong,nonatomic)    BaseModel      *model;
@property(strong,nonatomic)    NSDictionary   *dataDic;
@property(nonatomic,  strong)  NSIndexPath    *indexPath;
@property(nonatomic,assign)    NSInteger      section;

//将cell与（header+footer）的数据分开传递
@property(nonatomic,strong)    NSMutableArray *dataSource;
@property(nonatomic,strong)    NSMutableArray *hfDataSource;

/**
 打电话
 */
@property(nonatomic,strong)UIWebView *phoneCallWebView;


/**
 跟控制器
 */
@property(nonatomic,strong)GamesRootController *gamesRootVc;
@property(nonatomic,strong)RootController *root;




@end
