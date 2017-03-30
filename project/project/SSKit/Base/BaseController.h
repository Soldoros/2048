//
//  BaseController.h
//  Project
//
//  Created by soldoros on 16/6/27.
//  Copyright © 2016年 soldoros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseController : UIViewController<UITextFieldDelegate>{
    
    //表单数据翻页 是否翻页  是否刷新
    NSInteger currPage ;
    NSInteger page ;
    BOOL isAddData ;
    BOOL isRef ;
}

//键盘弹起的高度 耗时
@property (assign, nonatomic) CGFloat changeHeight;
@property (assign, nonatomic) CGFloat changeTime;

-(instancetype)initWithTitle:(NSString *)title
               andNormaImage:(NSString *)normaimage
            andSelectedImage:(NSString *)seletedImage
                andNomaColor:(UIColor *)normaColor
           andSelecetedColor:(UIColor *)selectedColor;

//键盘显示监听事件
- (void)keyboardWillShow:(NSNotification *)noti;

//回收键盘的监听事件
- (void)keyboardWillHide:(NSNotification *)noti;




@end
