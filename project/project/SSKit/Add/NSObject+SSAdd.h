//
//  NSObject+DEAdd.h
//  Project
//
//  Created by soldoros on 16/6/27.
//  Copyright © 2016年 soldoros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DEAdd)


//输出对象
-(void)cout;

//判断字符串是否为空
-(BOOL)isEmptyStr;
-(BOOL)isNUllStr;

//返回两个数中较大的数
+(NSInteger)getMaxNum:(NSInteger)one other:(NSInteger)two;
//返回两个数中较小的数
+(NSInteger)getMinNum:(NSInteger)one other:(NSInteger)two;

//发送通知
-(void)sendNotifCation:(NSString *)key;

//发送携带信息的通知
-(void)sendNotifCation:(NSString *)key data:(NSDictionary *)dic;

//释放通知
-(void)deleteNotifCation;

//返回日期的时间差 (单位:天)
+(double)FromTheNumberOfDaysOne:(NSString *)string1
                        daysTwo:(NSString *)string2;




/**
 根据字符串 限制宽度 字号 行距 得到自适应面积
 
 @param string 布局用的字符串
 @param font 限制了字体大小
 @param spacing 限制了行距
 @return 返回自适应面积
 */
+(CGRect)getRectWith:(NSString *)string width:(CGFloat)width font:(CGFloat)font spacing:(CGFloat)spacing Row:(CGFloat)row;

//获取可变字体
+(NSAttributedString *)getAtString:(NSString *)string Spacing:(CGFloat)spacing Row:(CGFloat)row Font:(CGFloat)font;







@end
