//
//  BaseController.m
//  Project
//
//  Created by soldoros on 16/6/27.
//  Copyright © 2016年 soldoros. All rights reserved.
//

#import "BaseController.h"

@interface BaseController ()


@end

@implementation BaseController

-(instancetype)initWithTitle:(NSString *)title andNormaImage:(NSString *)normaimage andSelectedImage:(NSString *)seletedImage andNomaColor:(UIColor *)normaColor andSelecetedColor:(UIColor *)selectedColor{
    if(self = [super init]){
        self.title = title;
        [self setItemImg1:normaimage img2:seletedImage title:title color1:normaColor color2:selectedColor];
    }
    
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.tabBarController.tabBar.hidden = YES;
    
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.tabBarController.tabBar.translucent = YES;
    
    //[self setNavgationBarImgAtColor:[UIColor whiteColor]];
    [self setNavgationBarBackcolor:[UIColor whiteColor]];
    [self setNavgationBarTitlecolor:BlueTitleColor size:18];
    
    _changeHeight = 0;
    _changeTime   = 2.5;
    NSNotificationCenter *nc =[NSNotificationCenter defaultCenter];
    //监听键盘弹出
    [nc addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //监听键盘收起
    [nc addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    


}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

//键盘显示监听事件
- (void)keyboardWillShow:(NSNotification *)noti{
    
    NSDictionary *userInfo = [noti userInfo];
    _changeTime = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    NSValue* value1 = userInfo[UIKeyboardFrameBeginUserInfoKey];
    NSValue* value2 = userInfo[UIKeyboardFrameEndUserInfoKey];
    CGFloat height1 = [value1 CGRectValue].size.height;
    CGFloat height2 = [value2 CGRectValue].size.height;
    
    if(height1 !=0 || height2 != 0){
        _changeHeight = height1>=height2?height1:height2;
    }
}

//回收键盘的监听事件
- (void)keyboardWillHide:(NSNotification *)noti{
    
    NSDictionary *userInfo = [noti userInfo];
    _changeTime = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    NSValue* value2 = userInfo[UIKeyboardFrameEndUserInfoKey];
    _changeHeight = [value2 CGRectValue].size.height;
    
}




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

////回车键回收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return  YES;
}

@end
