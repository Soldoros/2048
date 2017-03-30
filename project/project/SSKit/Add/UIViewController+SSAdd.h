//
//  UIViewController+DEAdd.h
//  Project
//
//  Created by soldoros on 16/6/27.
//  Copyright © 2016年 soldoros. All rights reserved.
//

#import <UIKit/UIKit.h>



//系统提示框点击按钮回调
typedef void (^ActionBtnClick)(NSInteger index);



@interface UIViewController (DEAdd)

@property(nonatomic,strong)UIAlertView *alertView;
@property(nonatomic,strong)UIActivityIndicatorView *indicatorView;



//=========================================
//导航栏部分
//=========================================

//左侧图片按钮 左侧文字按钮
-(void)setLeftOneBtnImg :(NSString *)str;
-(void)setLeftOneBtnTitle :(NSString *)str;
-(void)leftBtnCLick;
//右侧图片按钮
-(void)setRightOneBtnImg:(NSString *)str;
-(void)setRightOneBtnTitle:(NSString *)str;
-(void)rightBtnClick;

//左侧图片按钮组 文字按钮组
-(void)setLeftBtnImgArr :(NSArray *)arr;
-(void)setLeftBtnTitleArr :(NSArray *)arr;
-(void)leftBtnCLick:(UIButton *)sender;

//右侧图片按钮组 文字按钮组
-(void)setRightBtnImgArr:(NSArray *)arr;
-(void)setRightBtnTitleArr:(NSArray *)arr;
-(void)rightBtnClick:(UIButton *)sender;

//设置导航栏背景色 控件颜色
-(void)setNavgationBarBackcolor:(UIColor *)color;
-(void)setNavgationBarTintcolor:(UIColor *)color;

//设置导航栏标题颜色 字体大小
-(void)setNavgationBarTitlecolor:(UIColor *)color size:(double)size;

//设置导航栏的图片
-(void)setNavgationBarImgAtColor:(UIColor *)color;
-(void)setNavgationBarImgAtString:(NSString *)string;

//设置工具栏的图片
-(void)setToorBarImgAtString:(NSString *)string;
-(void)setToorBarImgAtColor:(UIColor *)color;

//=========================================
//标签栏部分
//=========================================

//设置当前标签栏按钮的图片和文字 以及颜色
-(void)setItemImg1:(NSString *)imgStr1 img2:(NSString *)imgStr2 title:(NSString *)titleStr color1:(UIColor *)color1 color2:(UIColor *)color2;

//设置底部一个大按钮
-(void)setToolBtnTitle:(NSString *)title;
//底部两个按钮
-(void)setBottomBtnTwo:(NSArray *)array;
-(void)toolBarBtnClick;
-(void)bottomBtnClick:(UIButton *)sender;
-(void)leftToolBarBtnClick;
-(void)rightToolBarBtnClick;

//=========================================
//其他 提示框
//=========================================
-(void)showTimeMsg:(NSString *)msg;
-(void)showAlert:(NSString *)msg;
-(void)closeAlert;
-(void)showTimeAlert:(NSString *)msg;
-(void)showTime:(NSString *)message;
-(void)showTimeAlert:(NSString *)title message:(NSString *)msg;

//系统的提示框
-(void)showAction:(NSString *)title
           cancel:(NSString *)cancel
         destruct:(NSString *)btn
         otherBtn:(NSString *)otherBtn
         btnClick:(ActionBtnClick)actionBtnClick;


//打电话
-(void)callPhone:(NSString *)number;








@end
