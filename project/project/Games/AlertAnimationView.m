

//==================================================


//游戏结束界面的封装视图


//==================================================



#import "AlertAnimationView.h"
#import "GameUserDefault.h"

@interface AlertAnimationView ()
{
    CGPoint previousLocation;
    CGPoint currentLocation;
}

@property(nonatomic,strong) UILabel *titleLabel;

@end

@implementation AlertAnimationView

-(instancetype)init{
    if(self == [super init]){
        [self initUserInterFace];
    }
    return self;
}

//初始化主界面
-(void)initUserInterFace{
    self .bounds = makeRect(0,0, ALERT_WIDTH, ALERT_HEIGHT);
    self.centerX = SCREEN_Width/2;
    self.centerY = SCREEN_Height/2;
    self.layer.borderColor = [makeColorRgb(227, 228, 231) CGColor];
    self.layer.shadowColor = [[UIColor blackColor]CGColor];
    self.layer.borderWidth = 2;
    self.layer.cornerRadius = 10;
    
    [self initMainView];
}


-(void)initMainView
{
    
    GameUserDefault *user = [GameUserDefault shareGameUserDefault];
    //游戏最后的信息 时间 分数 最大数字
    NSArray *Num1 = @[@"Time:",user.dataArr[0]];
    NSArray *Num2 = @[@"Score:",user.dataArr[1]];
    NSArray *Num3 = @[@"MaxNum:",user.dataArr[2]];
    NSArray *array = @[Num1,Num2,Num3];
    int score = [Num3[1] intValue];
    
  
    
    //胜利  失败
    UIImageView *alertBgImage = [[UIImageView alloc] init];
    alertBgImage.frame = makeRect(-4, -1, ALERT_WIDTH+8, 50);
    alertBgImage.image = [UIImage imageNamed:@"MLTableAlertBackground"];
    [self addSubview:alertBgImage];
    
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    if(score>=2048) self.titleLabel.textColor = [UIColor yellowColor];
    else self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:0.75];
    self.titleLabel.shadowOffset = CGSizeMake(0, -1);
    self.titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
    self.titleLabel.frame = makeRect(0,0,ALERT_WIDTH, 50);
    self.titleLabel.text = score>=2048? @"恭喜你!":@"加油!";
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
    
    
    //中间部分的遮罩层
    UIView *detailView = [[UIView alloc]init];
    detailView.frame = makeRect(0, 38, ALERT_WIDTH, ALERT_HEIGHT-38);
    detailView.backgroundColor = makeColorRgb(52, 63, 95);
    detailView.alpha = 0.8;
    [self addSubview:detailView];
    
    
    NSInteger sizeF    = SCREEN_Width==320?18:(SCREEN_Width==375?20:22);
    NSInteger distence = SCREEN_Width==320?40:(SCREEN_Width==375?50:60);
    //显示详细信息
    for(int i=0;i<3;++i)
    {
        for(int j =0;j<2;++j)
        {
            UILabel *detail = [[UILabel alloc] initWithFrame:CGRectZero];
            detail.backgroundColor = [UIColor clearColor];
            if(score>=2048) detail.textColor = [UIColor yellowColor];
            else  detail.textColor = [UIColor whiteColor];
            detail.shadowColor = [[UIColor blackColor]
                                  colorWithAlphaComponent:0.75];
            
            detail.shadowOffset = CGSizeMake(0, -1);
            detail.font = [UIFont boldSystemFontOfSize:sizeF];
            detail.frame = makeRect(25+100*j*SCREEN_Width/320, 120+distence*i,120, 20);
            detail.text = array[i][j];
            detail.textAlignment =  j%2==0? NSTextAlignmentLeft:
            NSTextAlignmentRight;
            [self addSubview:detail];
        }
    }
    
    //重新开始 退出
    NSArray *animation = @[@"New Game",@"Quit Game"];
    for(int i=0;i<1;++i)
    {
        
        UIButton *back = [UIButton buttonWithType:UIButtonTypeSystem];
        back.tag = 10+i;
        back.frame = makeRect(10+125*i,310,200, 50);
        back.centerX = ALERT_WIDTH/2;
        back.bottom = ALERT_HEIGHT-40;
        [back setBackgroundImage:[UIImage imageNamed:@"MLTableAlertBackground"] forState:UIControlStateNormal];
        [back setTitle:animation[i] forState:UIControlStateNormal];
        [back setTintColor:score>=2048?[UIColor yellowColor]:[UIColor whiteColor]];
        back.backgroundColor = [UIColor clearColor];
        [back addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:back];
    }
    
    
    //添加拖动手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(processgestureReconizer:)];
    [self addGestureRecognizer:pan];
    
}

//响应手势
- (void)processgestureReconizer:(UIGestureRecognizer *)gesture
{
    UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gesture;
    static CGPoint startCenter;
    
    //获取开始点击坐标
    if (pan.state == UIGestureRecognizerStateBegan)
    {
        startCenter = self.center;
    }
    //获取接受拖动过程中的坐标 并计算出偏移量
    else if (pan.state == UIGestureRecognizerStateChanged)
    {
        CGPoint translation = [pan translationInView:self.superview];
        self.center = CGPointMake(startCenter.x + translation.x, startCenter.y + translation.y);
    }
    //结束拖动  设置当前视图坐标
    else if (pan.state == UIGestureRecognizerStateEnded)
    {
        startCenter = CGPointZero;
    }

}

//重现开始和退出
-(void)buttonPressed:(UIButton *)sender
{
    if(_delegate && [_delegate respondsToSelector:@selector(startOrQuiteGame:)])
    {
        [_delegate startOrQuiteGame:sender.tag-10];
    }
}

















@end
