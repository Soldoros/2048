//
//  GameDefine.h
//  project
//
//  Created by soldoros on 2017/3/29.
//  Copyright © 2017年 soldoros. All rights reserved.
//


#import "AudioTool.h"

#ifndef GameDefine_h
#define GameDefine_h


//游戏的颜色
#define GAMEBACKCOLOR makeColorRgb(62, 78, 91)
#define SCORECOLOR    makeColorRgb(39, 55, 67)
#define TILEDCOLOR    makeColorRgb(128, 141, 146)

#define TILEDColor    makeColorRgb(90, 111, 127)

//游戏音效  移动音效  撞击音效
#define MOVEAUDIO         [AudioTool setAudioMove:@"move" setFormatMove:@"wav"]
#define HITAUDIO          [AudioTool setAudioHit:@"hit" setFormatHit:@"wav"]
#define STOVAUDIIO        [AudioTool setAudioStOv:@"dis" setFormatStOv:@"wav"]


//游戏区域滑块的尺寸
#define GAME_TILED_WIDTH        60 *SCREEN_Width/320
#define GAME_TILED_HEIGTH       GAME_TILED_WIDTH

//游戏滑动区域的边框宽度
#define GAME_TILED_BOARD_WIDTH  10

//游戏区域的间隙
#define GAME_ROWS               4
#define GAME_COLS               4

//游戏界面下方按钮和lab的尺寸
#define BTN_SIZE                60 *SCREEN_Width/320
#define LAB_WIDTH               100 *SCREEN_Width/320

//游戏结束弹出框的尺寸
#define ALERT_WIDTH             260 *SCREEN_Width/320
#define ALERT_HEIGHT            360 *SCREEN_Width/320





#endif /* GameDefine_h */
