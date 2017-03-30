//
//  RootController.m
//  2048
//
//  Created by soldoros on 2017/3/25.
//  Copyright © 2017年 soldoros. All rights reserved.
//

#import "RootController.h"

#import "OneController.h"
#import "TwoController.h"
#import "ThreeController.h"
#import "FourController.h"

@interface RootController ()

@end

@implementation RootController

-(instancetype)init{
    if(self  = [super init]){
        [self initData];
        self.frameworkStyle  = FrameworkDefault;
        self.normalColor     = [UIColor grayColor];
        self.selectedColor   = [UIColor blueColor];
        self.normalImages = @[@"",@"",@"",@"",@""];
        self.selectedImages = @[@"",@"",@"",@"",@""];
        self.titles = @[@"",@"",@"",@"",@""];
        self.controllers = @[@"",@"",@"",@"",@""];
    }
    return self;
}

-(void)initData{
    _index  = 0;
    _number = 100;
    
}

-(void)setFrameworkStyle:(FrameworkStyle)frameworkStyle{
    _frameworkStyle = frameworkStyle;
}

-(void)setNormalColor:(UIColor *)normalColor{
    _normalColor = normalColor;
}

-(void)setSelectedColor:(UIColor *)selectedColor{
    _selectedColor = selectedColor;
}

-(void)setNormalImages:(NSArray *)normalImages{
    _normalImages = normalImages;
    _number = [NSObject getMinNum:_number other:_normalImages.count];
}

-(void)setSelectedImages:(NSArray *)selectedImages{
    _selectedImages = selectedImages;
    _number = [NSObject getMinNum:_number other:_selectedImages.count];
}

-(void)setTitles:(NSArray *)titles{
    _titles = titles;
    _number = [NSObject getMinNum:_number other:_titles.count];
}

-(void)setControllers:(NSArray *)controllers{
    _controllers = controllers;
}


/**
 做登录判断
 
 @param animated 很多项目都是先加载的标签控制器 然后判断登录 再加载登录控制器 也有一些项目直接把登录控制器作为根控制器  这里测试了一下 如果在didLoad里面先加载标签控制器然后加载登录控制器 如果机器性能不是很好  会出现闪烁  这里在WillAppear里面做处理 如果第一次需要加载登录控制器 则整个项目启动时只会有root和loading 控制器 启动很快   也不会有闪烁现象  至于直接将loading作为跟控制器 我个人觉得后面处理退出的时候 不是很方便
 */
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTabBarController];

}

-(void)setTabBarController{
    
    _tabBarController = [[UITabBarController alloc]init];
    _tabBarController.delegate = self;
    
    if(_number<_controllers.count){
        _controllers = [_controllers getArrayWithNum:_number];
    }
    switch (self.frameworkStyle) {
            case FrameworkDefault:
            [self initFrameworkDefault];
            break;
            case FrameworkValue1:
            [self initFrameworkVaule1];
            break;
        default:
            break;
    }
}


//9.0新的方法  状态栏颜色设置
//-(UIStatusBarStyle)preferredStatusBarStyle{
////    [_tabBarController.tabBar setBackgroundImage:[UIImage imageFromColor:TitleColor]];
//     return UIStatusBarStyleDefault;
//}



-(void)initFrameworkDefault{
    _navGations = [NSMutableArray new];
    for(int i=0;i<_controllers.count;++i){
        Class class = NSClassFromString(_controllers[i]);
        BaseController *vc = [[class alloc]initWithTitle:_titles[i] andNormaImage:_normalImages[i] andSelectedImage:_selectedImages[i] andNomaColor:_normalColor andSelecetedColor:_selectedColor];
        [_navGations addObject:[[UINavigationController alloc]initWithRootViewController:vc]];
    }
    
    _tabBarController.viewControllers = _navGations;
    _tabBarController.customizableViewControllers = nil;
    
    [self addChildViewController:_tabBarController];
    [self.view addSubview:_tabBarController.view];
}


//上左下右   上下互为相反数 否则点击变形
-(void)initFrameworkVaule1{
    [self initFrameworkDefault];
    
    UITabBarItem *item = _tabBarController.tabBar.items [_navGations.count/2];
    item.imageInsets = UIEdgeInsetsMake(5, 5, -5, -5);
    
    
    item.image = [item.image getImgAtScaleSize:makeSize(33, 33)];
    item.image = [item.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item.selectedImage = [item.selectedImage getImgAtScaleSize:makeSize(33, 33)];
    item.selectedImage = [item.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


//配置是否可以切换到指定控制器页面
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    //计算当前的页面索引以及即将跳转的页面的索引
    NSInteger current = tabBarController.selectedIndex;
    NSInteger new = [[tabBarController viewControllers]indexOfObject:viewController];
    _index = new;
    current = new;
    return YES;
}


@end
