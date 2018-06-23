//
//  GamesRootController.h
//  project
//
//  Created by soldoros on 2017/3/29.
//  Copyright © 2017年 soldoros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoveTieldView.h"
#import "GameOverView.h"
#import "GameDefine.h"
#import "GameUserDefault.h"

/**
 滑动方向

 - UP: 向上
 - DOWN: 向下
 - LEFT: 向左
 - RIGHT: 向右
 */
typedef NS_ENUM(NSInteger, DirectionType){
    UP=0,
    DOWN,
    LEFT,
    RIGHT
};

@interface GamesRootController : UIViewController<GameOverViewDelegate>{
    
    //游戏界面用二位数组控制，每个个字里面有个数字来代表滑块
    NSInteger map[GAME_ROWS][GAME_COLS];
    
    //分数时间的背景
    UIView  *bringView[2];
    //分数时间lab
    UILabel *bringLabel[2];
    //分数时间显示的数字
    UILabel *numLabel[2];
}

//滑动方向
@property(nonatomic,assign)DirectionType directionType;

//游戏中心左边X轴
@property(nonatomic,assign)CGFloat gameX;
//游戏中心坐标Y轴
@property(nonatomic,assign)CGFloat gameY;
//游戏区域大小宽度
@property(nonatomic,assign)CGFloat tiledmapwidth;
//游戏区域大小高度
@property(nonatomic,assign)CGFloat tiledmapheight;


//计时是否开始
@property(nonatomic,assign)BOOL    startTime;
//时间对象
@property(nonatomic,strong)NSTimer *timer;
//计时
@property(nonatomic,assign)CGFloat time;
//每次增加的分数
@property(nonatomic,assign)NSInteger score;
//滑块数字
@property(nonatomic,assign)NSInteger numScore;
//是否开始移动
@property(nonatomic,assign)BOOL    startMove;
//是否正在移动
@property(nonatomic,assign)BOOL    isMove;
//数字总和
@property(nonatomic,assign)CGFloat sum;
//是否清空
@property(nonatomic,assign)BOOL    isMoveClearn;
//是否暂停
@property(nonatomic,assign)BOOL    isStopGame;
//音乐是否播放
@property(nonatomic,assign)BOOL    isAudioPlay;
//游戏区域背景
@property(nonatomic,strong)UIView  *colorZone;
//游戏滑块元素
@property(nonatomic,strong)NSMutableArray *allTiled;
//游戏结束界面
@property(nonatomic,strong)GameOverView *gameOver;




@end
