//
//  DERequest.h
//  Project
//
//  Created by soldoros on 16/6/27.
//  Copyright © 2016年 soldoros. All rights reserved.
//

#import <Foundation/Foundation.h>

#define org_name         @"doros"
#define app_name         @"hello"
#define UrlString        @"https://a1.easemob.co/doros/hello/users"




/**
 *  提供对AFN的封装
 *
 *  @param object 返回的数据
 *  @param error  请求报错
 */
typedef void (^Result)(id object,NSError *error);

/**
 *  提供对AFN返回的网络状态封装
 *
 *  @param status 返回网络状态是否可用
 */
typedef void (^Status)(NSInteger status);

@interface DERequest : NSObject


/**
 设置地址

 @return 返回公共请求地址
 */
+(NSString *)path;



/**
 *  没有表头的post请求
 *
 *  @param dic    请求传入的参数
 *  @param method 求情公共地址
 *  @param result 返回的结果 block类型
 */
+(void)postWith:(NSDictionary *)dic methodNoheader:(NSString *)method
         result:(Result)result;

//pragma mark - POST请求
+(void)postWith:(NSDictionary *)dic method:(NSString *)method
         result:(Result)result;






//pragma mark - 检测网络连接
+(void)startCheckNetStatus:(Status)netStatus;
+(void)stopCheckNetStatus;

//pragma mark - Session 下载
+(void)downloadWithUrlString:(NSString *)method;

//pragma mark - 随机文件名上传
+(void)postUpload;

//pragma mark - POST上传
+(void)postUploadn;

//pragma mark - XML格式返回 的请求
- (void)XMLData;

@end
