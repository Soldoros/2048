//
//  GameUserDefault.h
//  project
//
//  Created by soldoros on 2017/3/29.
//  Copyright © 2017年 soldoros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameUserDefault : NSObject


/**
 初始化单例

 @return 返回单例对象
 */
+(GameUserDefault *)shareGameUserDefault;


/**
 是否震动
 */
@property(nonatomic,assign) BOOL isVibrate;


/**
 游戏的数据
 */
@property(nonatomic,strong) NSArray *dataArr;

@end
