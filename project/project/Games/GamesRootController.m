//
//  GamesRootController.m
//  project
//
//  Created by soldoros on 2017/3/29.
//  Copyright © 2017年 soldoros. All rights reserved.
//

#import "GamesRootController.h"

@interface GamesRootController ()

@end

@implementation GamesRootController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initMainView];
}

-(void)initData{
    _timer = nil;
    _startTime = false;
    _time = 0.00;
    _score = 0;
    _numScore = 2;
    _startMove = NO;
    _isMove = NO;
    _sum = 0;
    _allTiled = [[NSMutableArray alloc]init];
    _isMoveClearn = NO;
    _isStopGame = NO;
    _isAudioPlay = YES;
    
    for(int row=0;row<GAME_ROWS;++row){
        for(int col=0;col<GAME_COLS;++col){
            map[row][col] = _sum;
        }
    }
}

-(void)initMainView{
    self.view.backgroundColor = GAMEBACKCOLOR;
    NSInteger sizeF    = SCREEN_Width==320?14:(SCREEN_Width==375?16:17);
    NSInteger distence = SCREEN_Width==320?20:(SCREEN_Width==375?25:30);
    
    //设置游戏主题
    UILabel *title = [[UILabel alloc]initWithFrame:makeRect(25, 35, 120, 50)];
    title.text = @"#2048";
    title.font = [UIFont systemFontOfSize:35];
    title.textColor = [UIColor whiteColor];
    title.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview: title];
    
    //分数和时间
    NSArray *array = @[@"SCORE",@"TIME"];
    NSArray *numArray = @[[NSString stringWithFormat:@"%ld",(long)_score],
                          [NSString stringWithFormat:@"%0.2lf",_time]];
    for(int i=0;i<2;++i)
    {
        //承载视图
        bringView[i] = [[UIView alloc]initWithFrame:makeRect(155+i*80, 35, 70, 50)];
        bringView[i].backgroundColor = SCORECOLOR;
        bringView[i].layer.cornerRadius = 5;
        [self.view addSubview:bringView[i]];
        
        //分数和时间主题
        bringLabel[i] = [[UILabel alloc]initWithFrame:makeRect(0, 0, 70, 25)];
        bringLabel[i].text = array[i];
        bringLabel[i].font = [UIFont systemFontOfSize:13];
        bringLabel[i].textAlignment = NSTextAlignmentCenter;
        bringLabel[i].textColor = makeColorRgb(193, 223, 245);
        [bringView[i] addSubview:bringLabel[i]];
        
        //分数和时间
        numLabel[i] = [[UILabel alloc]initWithFrame:makeRect(0, 25, 70, 20)];
        numLabel[i].text = numArray[i];
        numLabel[i].font = [UIFont systemFontOfSize:17];
        numLabel[i].textAlignment = NSTextAlignmentCenter;
        numLabel[i].textColor = makeColorRgb(193, 223, 245);
        [bringView[i] addSubview:numLabel[i]];
    }
    
    
    
    //背景块的尺寸
    _tiledmapwidth=GAME_TILED_WIDTH*GAME_COLS+GAME_TILED_BOARD_WIDTH*(GAME_COLS+1);
    _tiledmapheight=GAME_TILED_HEIGTH*GAME_ROWS+GAME_TILED_BOARD_WIDTH*(GAME_ROWS+1);
    
    //灰色的背景
    _colorZone = [[UIView alloc]init];
    _gameX = self.view.centerX;
    _gameY = bringView[1].bottom+distence+_tiledmapheight/2;
    _colorZone.center = CGPointMake(_gameX, _gameY);
    _colorZone.bounds = makeRect(0, 0,_tiledmapwidth , _tiledmapheight);
    _colorZone.backgroundColor = GAMEBACKCOLOR;
    _colorZone.alpha = 1;
    [self.view addSubview:_colorZone];
    
    //重新调整标题、时间和分数的位置
    title.left = _colorZone.left+8;
    bringView[1].right = _colorZone.right-8;
    bringView[0].right = bringView[1].left-10;
    
    //设置背景块
    for(int row=0;row<GAME_ROWS;++row)
    {
        for(int col=0;col<GAME_COLS;++col)
        {
            UIView *tiledView = [[UIView alloc]init];
            tiledView.frame = makeRect(GAME_TILED_WIDTH*col+GAME_TILED_BOARD_WIDTH*(col+1)
                                   , GAME_TILED_HEIGTH*row+GAME_TILED_BOARD_WIDTH*(row+1)
                                   , GAME_TILED_WIDTH, GAME_TILED_HEIGTH);
            tiledView.backgroundColor = TILEDCOLOR;
            [_colorZone addSubview:tiledView];
            
        }
    }
    
    //下面的三个按钮
    NSArray *btnNoArr = @[@"Close",@"Again", @"Play"];
    NSArray *btnSeArr = @[@"Open" ,@"Again", @"Stop"];
    NSArray *labArr   = @[@"Power"  ,@"Start Again",@"Audio"];
   
    for(int i=0;i<3;++i)
    {
        
        UIButton *playPauseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        playPauseBtn.bounds = makeRect(0,0, BTN_SIZE, BTN_SIZE);
        playPauseBtn.top = _colorZone.bottom+distence;
        playPauseBtn.tag = 10+i;
        playPauseBtn.backgroundColor = SCORECOLOR;
        playPauseBtn.layer.cornerRadius = BTN_SIZE/2;
        [playPauseBtn setTitle:btnNoArr[i] forState:UIControlStateNormal];
        [playPauseBtn setTitle:btnSeArr[i] forState:UIControlStateSelected];
        [playPauseBtn setTintColor:[UIColor whiteColor]];
        playPauseBtn.selected = NO;
        [playPauseBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:playPauseBtn];
        
        
        UILabel *playPauseLab = [[UILabel alloc]init];
        playPauseLab.bounds = makeRect(0,0, LAB_WIDTH, 40);
        playPauseLab.top = playPauseBtn.bottom+5;
        playPauseLab.text = labArr[i];
        playPauseLab.font = makeFont(sizeF);
        playPauseLab.textColor = [UIColor whiteColor];
        playPauseLab.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:playPauseLab];
        
        if(i==0)playPauseBtn.left = _colorZone.left+8;
        else if(i==1)playPauseBtn.centerX = self.view.centerX;
        else playPauseBtn.right = _colorZone.right-8;
        playPauseLab.centerX = playPauseBtn.centerX;
        
    }
    
    
    UILabel *soldoros = [[UILabel alloc]initWithFrame:makeRect(10, SCREEN_Height-40, SCREEN_Width-20, 40)];
    soldoros.text = @"    我希望有一盏灯，有魔力的灯，探清前方的桥，照亮世间的路；我希望有一盏灯，有魔力的灯，让我看清楚自己，让我看清楚未来。欢迎来到魔灯2048！       soldoros";
    soldoros.numberOfLines = 2;
    soldoros.font = [UIFont systemFontOfSize:8];
    soldoros.textColor = SCORECOLOR;
    soldoros.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview: soldoros];
    
    
    [self newMoveTiled];
}

//一个新的可移动的块
-(void)newMoveTiled{
    MoveTieldView *tiled = [[MoveTieldView alloc]initWithFrame:
                            makeRect(0, 0, GAME_TILED_WIDTH, GAME_TILED_HEIGTH)];
    
    int freeCount=16-(int)[_allTiled count];
    if(!freeCount){
        return;
    }
    int num= arc4random() % freeCount;
    int row=0;
    int col=0;
    int count=-1;
    bool find=false;
    
    for(;row<GAME_ROWS;++row)
    {
        for(col=0;col<GAME_COLS;++col)
        {
            if(map[row][col]==0)
            {
                ++count;
                if(count==num)
                {
                    find=true;
                    break;
                }
            }
        }
        if(find)
        {
            break;
        }
    }
    
    [_colorZone addSubview:tiled];
    [tiled showAtx:row showAty:col];
    [_allTiled addObject:tiled];
    map[row][col] = ++_sum;
}


//确认滑动开始
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if(_isStopGame == NO){
        _startMove = YES;
    }
    else{
        _startMove = NO;
    }
    
}
// 触摸移动
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if(!_startTime){
        _startTime = NO;
        [self startTimer];
    }
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    
    CGPoint previousLocation = [touch previousLocationInView:self.view];
    CGPoint currentLocation = [touch locationInView:self.view];
    
    int x = currentLocation.x - previousLocation.x;
    int y = currentLocation.y - previousLocation.y;
    int ax = x>0?x:0-x;
    int ay = y>0?y:0-y;
    
    //对开始点击屏幕的位置判断是否在游戏区域
    if(currentLocation.y<(_gameY-_tiledmapheight/2) ||
       currentLocation.y>(_gameY+_tiledmapheight/2) ||
       currentLocation.x<(_gameX-_tiledmapwidth/2)||
       currentLocation.x>(_gameX+_tiledmapwidth/2)){
        _startMove = NO;
    }
    
    //移动像素大于5  则滑动成功 判断方向
    if(_startMove && ( ax>5 || ay>5)){
        _startMove = NO;
        if(ax>ay){
            if(x>0){
                _directionType = RIGHT;
            }else{
                _directionType = LEFT;
            }
        }else{
            if(y<0){
                _directionType = UP;
            }else{
                _directionType = DOWN;
            }
        }
        [self moveAllTiled:_directionType];
    }
}

//移动所有块
-(void)moveAllTiled:(int)index{
    _isMoveClearn = NO;
    if([self isGameOver]){
        [self gotoGameOver];
        return;
    }
    if(_isMove)return;

    _isMove = YES;
    switch(_directionType){
        case UP   :     [self moveUp];     break;
        case DOWN :     [self moveDown];   break;
        case LEFT :     [self moveLeft];   break;
        case RIGHT:     [self moveRight];  break;
        default   :     break;
    }
    //播放音乐
    if(_isAudioPlay){
        if(_isMoveClearn) HITAUDIO;
        else MOVEAUDIO;
    }
    //屏幕振动
    GameUserDefault *user = [GameUserDefault shareGameUserDefault];
    if(user.isVibrate){
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
    
    //移动完毕更新分数 产生新块
    numLabel[0].text = [NSString stringWithFormat:@"%ld",(long)_score];
    [self newMoveTiled];
    _isMove = NO;
}


- (void)startTimer{
    if (!_timer){
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.02
                                                  target:self selector:@selector(addTimer) userInfo:nil repeats:YES];
    }
}

//游戏时间进度
-(void)addTimer{
    if(_time > 9999.97){
        _timer.fireDate = [NSDate distantFuture];
        UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"提示" message:@"游戏超时,请重玩或退出!" delegate:self cancelButtonTitle:@"再玩一次" otherButtonTitles:@"退出", nil];
        alt.tag = 101;
        [alt show];
    }
    _time +=0.02;
    numLabel[1].text = [NSString stringWithFormat:@"%0.2lf",_time];
}

//重启定时器
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(alertView.tag == 101){
        if(buttonIndex == 0){
            [self startAgainGame];
        }else{
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

//刷新游戏界面再来
-(void)startAgainGame{
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self viewDidLoad];
}


//响应over的代理方法
-(void)gotoGame:(int)index{
    if(index == 0){
        [self startAgainGame];
    }
    if(index == 1){
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


-(void)moveUp{
    for(int col=0;col<GAME_COLS;++col){
        int hit=0;
        for(int row=0;row<GAME_ROWS;++row){
            if(map[row][col]>0)
            {
                for(int row1=row;row1>0;--row1)
                {
                    if(map[row1-1][col]==0)
                    {
                        map[row1-1][col]=map[row1][col];
                        map[row1][col]=0;
                        [[_allTiled objectAtIndex:(map[row1-1][col]-1)] moveTox:row1-1 moveToy:col];
                    }
                    else
                    {
                        MoveTieldView *tiledObj = [_allTiled objectAtIndex:(map[row1-1][col]-1)];
                        int numObj = tiledObj.number;
                        MoveTieldView *tiledNow = [_allTiled objectAtIndex: (map[row1][col]-1)];
                        int numNow = tiledNow.number;
                        if(numObj==numNow && hit%2==0)
                        {
                            //消除音乐播放
                            _isMoveClearn = YES;
                            ++hit;
                            _score +=numObj*2;
                            [tiledObj doubleNumber];
                            [tiledNow removeFromSuperview];
                            [_allTiled removeObjectAtIndex:(map[row1][col]-1)];
                            _sum--;
                            NSInteger index = map[row1][col];
                            for(int r=0;r<GAME_ROWS;++r)
                            {
                                for(int c=0;c<GAME_COLS;++c)
                                {
                                    if(map[r][c]>index)
                                    {
                                        map[r][c]--;
                                    }
                                }
                            }
                            map[row1][col]=0;
                        }
                        else if(hit!=0)
                        {
                            ++hit;
                        }
                        break;
                    }
                }
            }
        }
    }
}

-(void)moveDown
{
    for(int col=0;col<GAME_COLS;++col)
    {
        int hit=0;
        for(int row=GAME_ROWS-1;row>=0;--row)
        {
            if(map[row][col]>0)
            {
                for(int row1=row;row1<GAME_ROWS-1;++row1)
                {
                    if(map[row1+1][col]==0)
                    {
                        map[row1+1][col]=map[row1][col];
                        map[row1][col]=0;
                        [[_allTiled objectAtIndex:(map[row1+1][col]-1)] moveTox:row1+1 moveToy:col];
                    }
                    else
                    {
                        MoveTieldView *tiledObj = [_allTiled objectAtIndex:(map[row1+1][col]-1)] ;
                        int numObj = tiledObj.number;
                        MoveTieldView *tiledNow = [_allTiled objectAtIndex:(map[row1][col]-1)];
                        int numNow = tiledNow.number;
                        
                        if(numObj==numNow && hit%2==0)
                        {
                            //消除音乐播放
                            _isMoveClearn = YES;
                            ++hit;
                            _score +=numObj*2;
                            hit=true;
                            [tiledObj doubleNumber];
                            [tiledNow removeFromSuperview];
                            [_allTiled removeObjectAtIndex:(map[row1][col]-1)];
                            _sum--;
                            NSInteger index = map[row1][col];
                            for(int r=0;r<GAME_ROWS;++r)
                            {
                                for(int c=0;c<GAME_COLS;++c)
                                {
                                    if(map[r][c]>index)
                                    {
                                        map[r][c]--;
                                    }
                                }
                            }
                            map[row1][col]=0;
                        }
                        else if(hit!=0)
                        {
                            ++hit;
                        }
                        break;
                    }
                }
            }
        }
    }
    
}

-(void)moveLeft
{
    for(int row=0;row<GAME_ROWS;++row)
    {
        int hit=0;
        for(int col=0;col<GAME_COLS;++col)
        {
            if(map[row][col]>0)
            {
                for(int col1=col;col1>0;--col1)
                {
                    if(map[row][col1-1]==0)
                    {
                        map[row][col1-1]=map[row][col1];
                        map[row][col1]=0;
                        [[_allTiled objectAtIndex:(map[row][col1-1]-1)] moveTox:row moveToy:col1-1];
                    }
                    else
                    {
                        MoveTieldView *tiledObj = [_allTiled objectAtIndex:(map[row][col1-1]-1)];
                        int numObj = tiledObj.number;
                        MoveTieldView *tiledNow = [_allTiled objectAtIndex:(map[row][col1]-1)];
                        int numNow = tiledNow.number;
                        if(numObj==numNow && hit%2==0)
                        {
                            //消除音乐播放
                            _isMoveClearn = YES;
                            ++hit;
                            _score +=numObj*2;
                            [tiledObj doubleNumber];
                            [tiledNow removeFromSuperview];
                            [_allTiled removeObjectAtIndex:(map[row][col1]-1)];
                            _sum--;
                            NSInteger index = map[row][col1];
                            for(int r=0;r<GAME_ROWS;++r)
                            {
                                for(int c=0;c<GAME_COLS;++c)
                                {
                                    if(map[r][c]>index)
                                    {
                                        map[r][c]--;
                                    }
                                }
                            }
                            map[row][col1]=0;
                        }
                        else if(hit!=0)
                        {
                            ++hit;
                        }
                        break;
                    }
                }
            }
        }
    }
}
-(void)moveRight
{
    for(int row=0;row<GAME_ROWS;++row)
    {
        int hit=0;
        for(int col=GAME_COLS-1;col>=0;--col)
        {
            if(map[row][col]>0)
            {
                for(int col1=col;col1<GAME_COLS-1;++col1)
                {
                    if(map[row][col1+1]==0)
                    {
                        map[row][col1+1]=map[row][col1];
                        map[row][col1]=0;
                        [[_allTiled objectAtIndex:(map[row][col1+1]-1)] moveTox:row moveToy:col1+1];
                    }
                    else
                    {
                        MoveTieldView *tiledObj = [_allTiled objectAtIndex:(map[row][col1+1]-1)];
                        int numObj =  tiledObj.number;
                        MoveTieldView *tiledNow = [_allTiled objectAtIndex:(map[row][col1]-1)];
                        int numNow = tiledNow.number;
                        if(numObj==numNow && hit%2==0)
                        {
                            //消除音乐播放
                            _isMoveClearn = YES;
                            ++hit;
                            _score +=numObj*2;
                            [tiledObj doubleNumber];
                            [tiledNow removeFromSuperview];
                            [_allTiled removeObjectAtIndex:(map[row][col1]-1)];
                            _sum--;
                            NSInteger index = map[row][col1];
                            for(int r=0;r<GAME_ROWS;++r)
                            {
                                for(int c=0;c<GAME_COLS;++c)
                                {
                                    if(map[r][c]>index)
                                    {
                                        map[r][c]--;
                                    }
                                }
                            }
                            map[row][col1]=0;
                        }
                        else if(hit!=0)
                        {
                            ++hit;
                        }
                        break;
                    }
                }
            }
        }
    }
}

//判断游戏是否结束
-(BOOL)isGameOver
{
    bool isGameOver=true;
    int freeCount=16-(int)[_allTiled count];
    if(freeCount!=0)
    {
        isGameOver=false;
    }
    if(freeCount==0)
    {
        for(int r=0;r<GAME_ROWS;++r)
        {
            for(int c=0;c<GAME_COLS;++c)
            {
                MoveTieldView *tiled = [_allTiled objectAtIndex:(map[r][c]-1)];
                NSInteger num    = tiled.number;
                NSInteger objNum = 0;
                if(r+1<GAME_ROWS)
                {
                    objNum=
                    ((MoveTieldView *)[_allTiled objectAtIndex:(map[r+1][c]-1)]).number;
                    if(num==objNum)
                    {
                        isGameOver=false;
                    }
                }
                
                if(r-1>=0)
                {
                    objNum= ((MoveTieldView *)[_allTiled objectAtIndex:(map[r-1][c]-1)]).number;
                    if(num==objNum)
                    {
                        isGameOver=false;
                    }
                }
                if(c-1>=0)
                {
                    objNum= ((MoveTieldView *)[_allTiled objectAtIndex:(map[r][c-1]-1)]).number;
                    if(num==objNum)
                    {
                        isGameOver=false;
                    }
                }
                
                if(c+1<GAME_COLS)
                {
                    objNum= ((MoveTieldView *)[_allTiled objectAtIndex:(map[r][c+1]-1)]).number;
                    if(num==objNum)
                    {
                        isGameOver=false;;
                    }
                }
                if(!isGameOver)
                {
                    break;
                }
            }
            if(!isGameOver)
            {
                break;
            }
        }
    }
    return isGameOver;
}

//游戏结束 跳转  280*340
//phv.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
//_publishView.transform = CGAffineTransformIdentity;
-(void)gotoGameOver
{
    [_timer invalidate];
    for(int i=0;i<[_allTiled count];++i){
        if(_numScore < ((MoveTieldView *)_allTiled[i]).number){
            _numScore = ((MoveTieldView *)_allTiled[i]).number;
        }
    }
    NSString *str1 = numLabel[1].text;
    NSString *str2 = numLabel[0].text;
    NSString *str3 = [NSString stringWithFormat:@"%ld",(long)_numScore];
    GameUserDefault *user = [GameUserDefault shareGameUserDefault];
    user.dataArr = @[str1,str2,str3];
    
    
    _gameOver = [[GameOverView alloc]initWithFrame:makeRect(0,0,SCREEN_Width, SCREEN_Height)];
    _gameOver.delegate = self;
    [self.view addSubview:_gameOver];
}

//底部三个按钮响应 10 11 12
-(void)buttonPressed:(UIButton *)sender{
    
     sender.selected = !sender.selected;
    if(sender.tag == 10){
        GameUserDefault *user = [GameUserDefault shareGameUserDefault];
        user.isVibrate = sender.selected;
    }
    //重新开始
    if(sender.tag == 11){
        [_timer invalidate];
        [self startAgainGame];
    }
    //开启/关闭   音乐
    if(sender.tag == 12){
        _isAudioPlay = !sender.selected;
    }

}



@end
