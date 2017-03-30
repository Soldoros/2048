//
//  SSUserDefault.h
//  2048
//
//  Created by soldoros on 2017/3/25.
//  Copyright © 2017年 soldoros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSUserDefault : NSObject


+(SSUserDefault *)shareCKUserDefault;
-(void)initData;

//主题色
@property(nonatomic, strong)UIColor   *titleColor;
//网络状态
@property(nonatomic, assign)NSInteger netStatus;
@property(nonatomic, assign)BOOL      canNetWorking;

@end
