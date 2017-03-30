//
//  BaseModel.h
//  Project
//
//  Created by soldoros on 16/6/27.
//  Copyright © 2016年 soldoros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

@property(nonatomic,strong) id currentKey;
-(id)initWithDic:(NSDictionary *)dic;
-(NSMutableArray *)modelsWithArray:(NSArray *)array;

@end
