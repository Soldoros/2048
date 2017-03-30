//
//  NSString+NetWorking.m
//  Project
//
//  Created by soldoros on 2016/12/19.
//  Copyright © 2016年 soldoros. All rights reserved.
//

#import "NSString+NetWorking.h"

@implementation NSString (NetWorking)

+(NSString *)EMErrorWith:(EMErrorCode)errorCode{
    
    NSString *errorString = @"";
    switch (errorCode) {
        case EMErrorGeneral:
            errorString = @"网络异常!";
            break;
        case EMErrorNetworkUnavailable:
            errorString = @"网络不可用!";
            break;
        case EMErrorDatabaseOperationFailed:
            errorString = @"数据库操作失败!";
            break;
        case EMErrorInvalidAppkey:
            errorString = @"APPKEY无效!";
            break;
        case EMErrorInvalidUsername:
            errorString = @"无效的用户名!";
            break;
        case EMErrorInvalidPassword:
            errorString = @"无效的密码!";
            break;
        case EMErrorInvalidURL:
            errorString = @"无效的URL地址!";
            break;
        case EMErrorUserAlreadyLogin:
            errorString = @"用户已登录!";
            break;
        case EMErrorUserNotLogin:
            errorString = @"用户未登录!";
            break;
        case EMErrorUserAuthenticationFailed:
            errorString = @"密码验证失败!";
            break;
        case EMErrorUserAlreadyExist:
            errorString = @"用户已存在!";
            break;
        case EMErrorUserNotFound:
            errorString = @"用户不存在!";
            break;
        case EMErrorUserIllegalArgument:
            errorString = @"请求参数不合法!";
            break;
        case EMErrorUserLoginOnAnotherDevice:
            errorString = @"当前用户在另一台设备登录!";
            break;
        case EMErrorUserRemoved:
            errorString = @"用户数据被物理删除!";
            break;
        case EMErrorUserRegisterFailed:
            errorString = @"用户注册失败!";
            break;
        case EMErrorUpdateApnsConfigsFailed:
            errorString = @"更新推送设置失败!";
            break;
        case EMErrorUserPermissionDenied:
            errorString = @"用户没有权限做该操作!";
            break;
        case EMErrorServerNotReachable:
            errorString = @"服务器未连接!";
            break;
        case EMErrorServerTimeout:
            errorString = @"请求服务超时!";
            break;
        case EMErrorServerBusy:
            errorString = @"服务器繁忙!";
            break;
        case EMErrorServerUnknownError:
            errorString = @"未知服务错误!";
            break;
        case EMErrorServerGetDNSConfigFailed:
            errorString = @"获取DNS设置失败!";
            break;
        case EMErrorServerServingForbidden:
            errorString = @"服务被禁用!";
            break;
        case EMErrorFileNotFound:
            errorString = @"文件没有找到!";
            break;
        case EMErrorFileInvalid:
            errorString = @"文件无效!";
            break;
        case EMErrorFileUploadFailed:
            errorString = @"上传文件失败!";
            break;
        case EMErrorFileDownloadFailed:
            errorString = @"下载文件失败!";
            break;
        case EMErrorMessageInvalid:
            errorString = @"消息无效!";
            break;
        case EMErrorMessageIncludeIllegalContent:
            errorString = @"消息包含非法信息!";
            break;
        case EMErrorMessageTrafficLimit:
            errorString = @"单位时间发送消息超过上限!";
            break;
        case EMErrorMessageEncryption:
            errorString = @"加密错误!";
            break;
        case EMErrorGroupInvalidId:
            errorString = @"群组ID无效!";
            break;
        case EMErrorGroupAlreadyJoined:
            errorString = @"已加入群组!";
            break;
        case EMErrorGroupNotJoined:
            errorString = @"未加入群组!";
            break;
        case EMErrorGroupPermissionDenied:
            errorString = @"没有权限进行该操作!";
            break;
        case EMErrorGroupMembersFull:
            errorString = @"群成员数已达到上限!";
            break;
        case EMErrorGroupNotExist:
            errorString = @"群组不存在!";
            break;
        case EMErrorChatroomInvalidId:
            errorString = @"聊天室ID无效!";
            break;
        case EMErrorChatroomAlreadyJoined:
            errorString = @"已加入聊天室!";
            break;
        case EMErrorChatroomNotJoined:
            errorString = @"未加入聊天室!";
            break;
        case EMErrorChatroomPermissionDenied:
            errorString = @"没有权限进行该操作!";
            break;
        case EMErrorChatroomMembersFull:
            errorString = @"聊天室成员个数达到上限!";
            break;
        case EMErrorChatroomNotExist:
            errorString = @"聊天室不存在!";
            break;
        case EMErrorCallInvalidId:
            errorString = @"实时通话ID无效!";
            break;
        case EMErrorCallBusy:
            errorString = @"已经在进行实时通话了!";
            break;
        case EMErrorCallRemoteOffline:
            errorString = @"对方不在线!";
            break;
        case EMErrorCallConnectFailed:
            errorString = @"实时通话建立连接失败!";
            break;
        default:
            break;
    }
    
    return errorString;
}

@end
