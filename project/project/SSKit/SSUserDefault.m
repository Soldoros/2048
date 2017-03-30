//
//  SSUserDefault.m
//  2048
//
//  Created by soldoros on 2017/3/25.
//  Copyright © 2017年 soldoros. All rights reserved.
//

#import "SSUserDefault.h"

static SSUserDefault* user = nil;

@implementation SSUserDefault

+(SSUserDefault *)shareCKUserDefault
{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        
        user = [[SSUserDefault alloc]init];
        [user initData];
        
    });
    return user;
}

-(void)initData{
    user.titleColor    = makeColorRgb(227, 236, 235);
    user.netStatus     = 2;
    user.canNetWorking = YES;
}


@end
