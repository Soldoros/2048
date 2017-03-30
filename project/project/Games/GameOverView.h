

//==================================================


//游戏结束界面


//==================================================


#import <UIKit/UIKit.h>
#import "AlertAnimationView.h"

@protocol GameOverViewDelegate <NSObject>

@optional
-(void)gotoGame:(int)index;

@end


@interface GameOverView : UIView

@property(nonatomic,assign)id<GameOverViewDelegate>delegate;


@end

