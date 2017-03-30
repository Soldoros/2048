//
//  MoveTieldView.h
//  project
//
//  Created by soldoros on 2017/3/29.
//  Copyright © 2017年 soldoros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameDefine.h"

@interface MoveTieldView : UIView

@property(nonatomic,assign)int row;
@property(nonatomic,assign)int col;

@property(nonatomic,strong)UILabel *label;
@property(nonatomic,assign)int number;


/**
 让滑块显示的位置

 @param r 纵坐标
 @param w 横坐标
 */
-(void)showAtx:(int)r showAty:(int)w;



/**
 滑块移动的位置

 @param r 纵坐标
 @param c 横坐标
 */
-(void)moveTox:(int)r moveToy:(int)c;



/**
 数字翻倍
 */
-(void)doubleNumber;




@end
