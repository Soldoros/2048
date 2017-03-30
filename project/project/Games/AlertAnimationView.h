//
//  AlertAnimationView.h
//  2048
//
//  Created by scihi on 14/12/2.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AlertAnimationViewDelegate <NSObject>

@optional
-(void)startOrQuiteGame:(NSInteger)index;

@end


@interface AlertAnimationView : UIView

@property(nonatomic,assign)id<AlertAnimationViewDelegate>delegate;

@end
