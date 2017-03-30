//
//  NSTimer+DEAdd.h
//  Project
//
//  Created by soldoros on 16/6/27.
//  Copyright © 2016年 soldoros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (DEAdd)

//获取当前时间 格式自己定
+(NSString *)getLocationTime;

//时间戳转换成时间
+ (NSString *)getTimeWithTimeStamp:(long long)timeStamp;

//时间戳转换成时间  并且能设置格式
+ (NSString *)getTimeWithStamp:(NSString *)stamp  forMat:(NSString *)forMat;


//聊天时间显示
+ (NSString *)getChatTimeStr:(long long)timestamp;

+ (NSString *)changeTheDateString:(NSString *)Str;


+ (NSTimeInterval)compareTwoTime:(long long)time1 time2:(long long)time2;



@end
