//
//  GameUserDefault.m
//  project
//
//  Created by soldoros on 2017/3/29.
//  Copyright © 2017年 soldoros. All rights reserved.
//

#import "GameUserDefault.h"

static GameUserDefault* gameUser = nil;

@implementation GameUserDefault

+(GameUserDefault *)shareGameUserDefault
{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        
        gameUser = [[GameUserDefault alloc]init];
        
    });
    return gameUser;
}

@end
