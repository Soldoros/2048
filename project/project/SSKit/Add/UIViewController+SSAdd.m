//
//  UIViewController+DEAdd.m
//  Project
//
//  Created by soldoros on 16/6/27.
//  Copyright © 2016年 soldoros. All rights reserved.
//

#import "UIViewController+SSAdd.h"
#import "EXTSynthesize.h"

@implementation UIViewController (DEAdd)

@synthesizeAssociation(UIViewController,alertView);
@synthesizeAssociation(UIViewController,indicatorView);

//=========================================
//导航栏部分
//=========================================

//左侧图片按钮
-(void)setLeftOneBtnImg :(NSString *)str{
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithImage:makeImage(str) style:UIBarButtonItemStyleBordered target:self action:@selector(leftBtnCLick)];
    self.navigationItem.leftBarButtonItem = item;
    
}

//左侧文字按钮
-(void)setLeftOneBtnTitle :(NSString *)str{
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithTitle:str style:UIBarButtonItemStyleBordered target:self action:@selector(leftBtnCLick)];
    self.navigationItem.leftBarButtonItem = item;
    
}
//右侧图片按钮
-(void)setRightOneBtnImg:(NSString *)str{
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithImage:makeImage(str) style:UIBarButtonItemStyleBordered target:self action:@selector(rightBtnClick)];
    self.navigationItem.rightBarButtonItem = item;
    
}
//右侧文字按钮
-(void)setRightOneBtnTitle:(NSString *)str{
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithTitle:str style:UIBarButtonItemStyleBordered target:self action:@selector(rightBtnClick)];
    self.navigationItem.rightBarButtonItem = item;
}

//左侧图片按钮组
-(void)setLeftBtnImgArr :(NSArray *)arr{
    
}
//左侧文字按钮组
-(void)setLeftBtnTitleArr :(NSArray *)arr{
    
}
//右侧图片按钮组
-(void)setRightBtnImgArr:(NSArray *)arr{
    
    
    
}
//右侧文字按钮组
-(void)setRightBtnTitleArr:(NSArray *)arr{
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn1 setTitle:arr[0] forState:UIControlStateNormal];
    btn1.bounds = CGRectMake(0, 0, 40, 35);
    btn1.titleLabel.font = makeFont(18);
    btn1.tag = 10;
    [btn1 addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *refreshItem = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    
    // 分享
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn2 setTitle:arr[1] forState:UIControlStateNormal];
    btn2.bounds = CGRectMake(0, 0, 40, 35);
    btn2.titleLabel.font = makeFont(18);
    btn2.tag = 11;
    [btn2 addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithCustomView:btn2];
    
    // 显示在导航栏右侧
    self.navigationItem.rightBarButtonItems = @[refreshItem,  shareItem];
    
}



//设置导航栏背景色
-(void)setNavgationBarBackcolor:(UIColor *)color{
    self.navigationController.navigationBar.barTintColor = color;
}
//设置导航栏控件颜色
-(void)setNavgationBarTintcolor:(UIColor *)color{
    self.navigationController.navigationBar.tintColor = color;
}
//设置导航栏标题颜色
-(void)setNavgationBarTitlecolor:(UIColor *)color size:(double)size{
    self.navigationController.navigationBar.tintColor = color;
    
    NSDictionary *titleTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:size],NSForegroundColorAttributeName:color};
    self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
}

//设置导航栏的图片 用颜色设置
-(void)setNavgationBarImgAtColor:(UIColor *)color{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageFromColor:color] forBarMetrics:UIBarMetricsDefault];
    
}

//设置导航栏的图片 用本地图片设置
-(void)setNavgationBarImgAtString:(NSString *)string{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:string] forBarMetrics:UIBarMetricsDefault];
    
}

//用颜色设置工具栏的图片
-(void)setToorBarImgAtColor:(UIColor *)color{
    
    [self.navigationController.toolbar setBackgroundImage:[UIImage imageFromColor:color] forToolbarPosition:UIBarPositionBottom barMetrics:UIBarMetricsDefault];
}

//用本地图片设置工具栏的图片
-(void)setToorBarImgAtString:(NSString *)string{
    
    [self.navigationController.toolbar setBackgroundImage:[UIImage imageNamed:string] forToolbarPosition:UIBarPositionBottom barMetrics:UIBarMetricsDefault];
    
}

-(void)leftBtnCLick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightBtnClick{
    
}

-(void)leftBtnCLick:(UIButton *)sender{
    
}

-(void)rightBtnClick:(UIButton *)sender{
    
}


//=========================================
//标签栏部分
//=========================================

-(void)setItemImg1:(NSString *)imgStr1 img2:(NSString *)imgStr2 title:(NSString *)titleStr color1:(UIColor *)color1 color2:(UIColor *)color2{
    
    UIImage *nomImg = [UIImage imageNamed:imgStr1];
    UIImage *secImg = [UIImage imageNamed:imgStr2];
    nomImg = [nomImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    secImg = [secImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *Item = [[UITabBarItem alloc]initWithTitle:titleStr image:nomImg  selectedImage:secImg];
    self.tabBarItem = Item;
    
    
    //配置tabBarItem文字在普通状态和选中状态下的颜色
    [UITabBarItem.appearance setTitleTextAttributes:@{NSForegroundColorAttributeName:color1} forState:UIControlStateNormal];
    
    [UITabBarItem.appearance setTitleTextAttributes:@{NSForegroundColorAttributeName:color2} forState:UIControlStateSelected];
    
}

//设置底部一个大按钮
-(void)setToolBtnTitle:(NSString *)title{
    
    
    UIBarButtonItem *toolBarBtn = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(toolBarBtnClick)];
    toolBarBtn.tintColor = [UIColor whiteColor];
    
    // 空间延展控件
    UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:NULL];
    
    // 在工具栏上添加按钮  所有的按钮之间用延展控件隔开
    self.toolbarItems = @[flexibleItem,toolBarBtn,flexibleItem];
    
}


//底部两个按钮
-(void)setBottomBtnTwo:(NSArray *)array
{
    UIView *bottomView = [[UIView alloc]initWithFrame:makeRect(0, SCREEN_Height-44-64, SCREEN_Width, 44)];
    bottomView.backgroundColor = BackGroundColor;
    [self.view addSubview:bottomView];
    
    NSArray *colors = @[BlueTitleColor,RedTitleColor];
    for(int i=0;i<2;++i){
        UIButton  *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = makeRect(i*bottomView.width/2,0 , bottomView.width/2, bottomView.height);
        btn.backgroundColor = colors[i];
        btn.tag = 10+i;
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(bottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [bottomView addSubview:btn];
    }
    
}


-(void)toolBarBtnClick{
    
}

-(void)bottomBtnClick:(UIButton *)sender{
    
}

-(void)leftToolBarBtnClick{
    
}
-(void)rightToolBarBtnClick{
    
}


//=========================================
//显示部分
//=========================================


//默认选择了系统的 时间为1秒
-(void)showTime:(NSString *)message{
    [self showTimeAlert:message];
}



//显示一个提示信息 停留两秒
-(void)showTimeMsg:(NSString *)msg{
    CGFloat padding = 10;
    
//    UILabel *label = [UILabel new];
//    label.text = msg;
//    label.font = [UIFont systemFontOfSize:16];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.textColor = [UIColor whiteColor];
//    label.backgroundColor =  BlueTitleColor;
//    label.width = self.view.width;
//    label.textContainerInset = UIEdgeInsetsMake(padding, padding, padding, padding);
//    label.height = [msg heightForFont:label.font width:label.width] + 2*padding;
//    label.numberOfLines = 0;
//    
//    label.bottom = (kiOS7Later ? 64 : 0);
//    [self.view addSubview:label];
//    [UIView animateWithDuration:0.3 animations:^{
//        label.top = (kiOS7Later ? 64 : 0);
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:0.2 delay:1.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//            label.bottom = (kiOS7Later ? 64 : 0);
//        } completion:^(BOOL finished) {
//            [label removeFromSuperview];
//        }];
//    }];
}

-(void)showTimeAlert:(NSString *)msg{

    self.alertView =  [[UIAlertView alloc] initWithTitle:@"" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil ];
    self.alertView.tintColor = BlueTitleColor;
    [self.alertView show];

    double time = 1.0;
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [self.alertView dismissWithClickedButtonIndex:0 animated:YES];
    });
}

-(void)showTimeAlert:(NSString *)title message:(NSString *)msg{
    self.alertView =  [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil ];
    self.alertView.tintColor = [UIColor whiteColor];
    self.alertView.backgroundColor = BlueTitleColor;
    [self.alertView show];
}



-(void)showAlert:(NSString *)msg{
    
    self.alertView =  [[UIAlertView alloc] initWithTitle:@"" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil ];
    self.alertView.tintColor = BlueTitleColor;
    self.indicatorView = [[UIActivityIndicatorView alloc] init];
    self.indicatorView .bounds = makeRect(0, 0, 40, 40);
    self.indicatorView .activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    self.indicatorView.color = BlueTitleColor;
    
    [self.alertView setValue:self.indicatorView  forKey:@"accessoryView"];
    
    [self.alertView show];
    [self.indicatorView  startAnimating];
}

-(void)closeAlert{
    [self.alertView dismissWithClickedButtonIndex:0 animated:NO];
    [self.indicatorView stopAnimating];
   
}


-(void)showAction:(NSString *)title
        cancel:(NSString *)cancel
      destruct:(NSString *)btn
      otherBtn:(NSString *)otherBtn
btnClick:(ActionBtnClick)actionBtnClick{
    
    
}



//打电话
-(void)callPhone:(NSString *)number{
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",number]];
    if ( !self.phoneCallWebView ){
        self.phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
    }
    [self.phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
}




@end
