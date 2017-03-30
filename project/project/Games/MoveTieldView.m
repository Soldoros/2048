//
//  MoveTieldView.m
//  project
//
//  Created by soldoros on 2017/3/29.
//  Copyright © 2017年 soldoros. All rights reserved.
//

#import "MoveTieldView.h"



@implementation MoveTieldView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self){
        [self initMainView];
    }
    return self;
}

//创建新的块 tag值为110
-(void)initMainView
{
    int n = arc4random() % 10;
    _number = (n == 5)?4:2;
    
    
    _label = [[UILabel alloc]init];
    _label.frame = makeRect(0, 0, GAME_TILED_WIDTH, GAME_TILED_HEIGTH);
    _label.tag = 10;
    [_label setText:[NSString stringWithFormat:@"%d",_number]];
    _label.font = [UIFont boldSystemFontOfSize:30];
    _label.textColor = TILEDColor;
    _label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_label];

    self.backgroundColor = [UIColor setTiledColor:_number];
    self.tag = 110;

    if(_number>=1000){
        _label.font = [UIFont boldSystemFontOfSize:20];
    }
    
}

//让块显示的位置
-(void)showAtx:(int)r
       showAty:(int)w{
    
    _row = r;
    _col = w;
    
    self.frame = makeRect(_col*GAME_TILED_WIDTH+GAME_TILED_BOARD_WIDTH*(_col+1),
                      _row*GAME_TILED_HEIGTH+GAME_TILED_BOARD_WIDTH*(_row+1),
                      GAME_TILED_WIDTH,GAME_TILED_HEIGTH);
    [self changeBig];
}

//移动到
-(void)moveTox:(int)r
       moveToy:(int)c{
    _row = r;
    _col = c;
    [UIView animateWithDuration:0.1f animations:^
     {
         self.frame = makeRect(_col*GAME_TILED_WIDTH+GAME_TILED_BOARD_WIDTH*(_col+1),
                           _row*GAME_TILED_HEIGTH+GAME_TILED_BOARD_WIDTH*(_row+1),
                           GAME_TILED_WIDTH,GAME_TILED_HEIGTH);
     } completion:nil];
}

//数字翻倍
-(void)doubleNumber{

    _number *=2;
    _label.text = [NSString stringWithFormat:@"%d",_number];
    [self changeBig];
    
    int num=0;
    int k=_number;
    while(k!=1){
        num++;
        k=k/2;
    }
    self.backgroundColor = [UIColor setTiledColor:_number];
    _label.textColor = _number<=4?TILEDColor:makeColorRgb(248, 245, 245);
    if(num>=10){
        _label.font = [UIFont boldSystemFontOfSize:20];
    }
}

//变大动画
-(void)changeBig{
    [UIView animateWithDuration:0.2 animations:^{
         
         self.transform = CGAffineTransformMakeScale(1.2, 1.2);
         
     } completion:^(BOOL finished) {
         [self changeSmall];
     }];
}
//变小动画
-(void)changeSmall{
    [UIView animateWithDuration:0.2 animations:^{
         
         self.transform = CGAffineTransformIdentity;
         
    } completion:^(BOOL finished) {
    }];
}


@end
