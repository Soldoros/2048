

//==================================================


//游戏结束界面


//==================================================
#import "GameOverView.h"


@interface GameOverView()<AlertAnimationViewDelegate>
{
     AlertAnimationView *alertAnimateView;
    NSTimer *_timer;
}
@end

@implementation GameOverView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initMainView];
    }
    
    return self;
}


-(void)initMainView
{
    
    self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.25];

    alertAnimateView = [[AlertAnimationView alloc]init];
    alertAnimateView.delegate = self;
    [self addSubview:alertAnimateView];
    //视图出场的动画
    [UIView animateIn:alertAnimateView];
}


//警告动画视图的代理实现
-(void)startOrQuiteGame:(NSInteger)index
{
    
    //消失时候的动画
    if(index == 0){
        [UIView animateOut:alertAnimateView];
        [UIView animateWithDuration:0.5 animations:^{
            self.alpha = 1;
        } completion:^(BOOL finished) {  }];
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.5
        target:self selector:@selector(startTimer) userInfo:nil repeats:NO];

    }
    if(index == 1)
    {
        [self runDelegate:1];
    }

}


-(void)startTimer
{
    [self runDelegate:0];
}

-(void)runDelegate:(int)num
{
    if(_delegate && [_delegate respondsToSelector:@selector(gotoGame:)])
    {
        [_delegate gotoGame:num];
    }
}


//此方法必写  此视图的控制器 对事件有响应 这个视图不能做任何响应  为空
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}















@end
