//
//  VerificationCodeV.h
//  BJLT
//
//  Created by chou on 15/8/6.
//  Copyright (c) 2015年 Soldoros. All rights reserved.
//

#import <UIKit/UIKit.h>

#define  TIMER 60
#define  BmobSMSTemplate @"HelloAPP通讯"

/**
 区分是注册还是其他
 */
typedef NS_ENUM(NSInteger, getCodeStyle) {
    /**
     *  注册
     */
    GetCodeWithRegister,
    /**
     *  其他
     */
    GetCodeWithOther,
    
};


@protocol VerificationCodeVDelegate <NSObject>



-(NSString *)phoneNum;
-(void)netResultError:(NSError *)error  dataNumber:(NSString *)number;

@end


@interface VerificationCodeV : UIView

@property(nonatomic,assign)getCodeStyle getCodeStyle;

-(void)initMainView;

//获取验证码
@property(nonatomic,strong)UILabel *mBtnLab;
@property(nonatomic,strong)UIButton *mGetPassBtn;


@property(nonatomic,copy)NSString *urlString;
@property(nonatomic,strong)NSDictionary *dic;


@property(nonatomic,assign)id<VerificationCodeVDelegate>delegate;

@end
