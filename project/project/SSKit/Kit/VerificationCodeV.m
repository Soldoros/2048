//
//  VerificationCodeV.m
//  BJLT
//
//  Created by chou on 15/8/6.
//  Copyright (c) 2015年 Soldoros. All rights reserved.
//




#import "VerificationCodeV.h"

@interface VerificationCodeV ()
{
    
    
    NSTimer *_timer;
    int  time;
    BOOL startTime;
    NSString *_sendBtnString;
    NSString *phoneString;
    
}

@end

@implementation VerificationCodeV



-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        
    }
    return self;
}

-(void)initMainView
{
    
    [self initData];
    
    self.userInteractionEnabled = YES;
    //获取验证码
    _mBtnLab = [[UILabel alloc]initWithFrame:self.bounds];
    _mBtnLab.text = @"获取验证码";
    _mBtnLab.backgroundColor = [UIColor clearColor];
    _mBtnLab.font = makeFont(14);
    _mBtnLab.userInteractionEnabled = YES;
    _mBtnLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_mBtnLab];
    
    
    _mGetPassBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _mGetPassBtn.frame = makeRect(0, 0, self.width, self.height);
    _mGetPassBtn.backgroundColor = [UIColor clearColor];
    [_mGetPassBtn addTarget:self action:@selector(btnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_mGetPassBtn];
    

}



-(void)initData
{
    _timer = nil;
    startTime = false;
    time = TIMER;
    _sendBtnString =  [self setSend:time];
}




//设置重发时间
-(NSString *)setSend:(int)theTime
{
     NSString *str = [NSString stringWithFormat:@"倒计时%d秒",theTime];
    return str;
}




-(void)btnPressed
{
    if(_delegate && [_delegate respondsToSelector:@selector(phoneNum)])
    {
        phoneString = [_delegate phoneNum];
        
        if([phoneString isEqualToString:@""]){
            [[self getViewController] showTime:@"请输入手机号"];
        }
        else if(![NSString shoujihao:phoneString]){
            [[self getViewController] showTime:@"请输入合法手机号"];
        }
        else if(![SSUserDefault shareCKUserDefault].canNetWorking){
            [[self getViewController] showTime:@"当前网络不可用！"];
        }else{
            _mBtnLab.text = [self setSend:TIMER];
            [self btnBeginTimer];
            [self getCodeNetWorking];
        }
        
    }
    
}


-(void)btnBeginTimer
{
    _mGetPassBtn.enabled = NO;
    [self startTimer];
}


//时间挑战
- (void)startTimer
{
    if (!_timer)
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self selector:@selector(addTimer) userInfo:nil repeats:YES];
    }
}


//时间进度
-(void)addTimer
{
    if(time>0)
    {
        _mBtnLab.text = [self setSend:time];
        time -=1;
    }
    else{
        
        [self chushihua];
    }
    
}


//时间数字 timer lab btn 全部归位
-(void)chushihua
{
    time = TIMER-1;
    
    [_timer invalidate];
    _timer?_timer = nil:nil;
    
    _mBtnLab.text = @"获取验证码";
    _mGetPassBtn.enabled = YES;
}


//获取短信验证码
-(void)getCodeNetWorking
{
   
    
            if(_delegate && [_delegate respondsToSelector:@selector(netResultError:dataNumber:)]){
                
                [_delegate netResultError:nil dataNumber:makeStrWithInt(12222)];
            }
    

}





@end
