//
//  NSObject+DEAdd.m
//  Project
//
//  Created by soldoros on 16/6/27.
//  Copyright © 2016年 soldoros. All rights reserved.
//

#import "NSObject+SSAdd.h"

@implementation NSObject (DEAdd)


//输出对象
-(void)cout{
    NSLog(@"%@",self);
}

//判断字符串长度是否为0
-(BOOL)isEmptyStr{
    if([(NSString *)self isEqualToString:@""])return YES;
    else return NO;
}

//判断对象是否为null
-(BOOL)isNUllStr{
    if([self isEqual:[NSNull null]] || self==nil){
        return YES;
    }
    else return NO;
}


+(NSInteger)getMaxNum:(NSInteger)one other:(NSInteger)two{
    return one>=two?one:two;
}

+(NSInteger)getMinNum:(NSInteger)one other:(NSInteger)two{
    return one<=two?one:two;
}

//发送不带参数的通知
-(void)sendNotifCation:(NSString *)key{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    NSNotification *noti =
    [NSNotification notificationWithName:key object:self];
    [nc postNotification:noti];
}

//发送带参数的通知
-(void)sendNotifCation:(NSString *)key data:(NSDictionary *)dic{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    NSNotification *noti =
    [NSNotification notificationWithName:key object:self userInfo:dic];
    [nc postNotification:noti];
}

//移除通知
-(void)deleteNotifCation{
     [[NSNotificationCenter defaultCenter] removeObserver:self];
}


//返回日期的时间差 (单位:天)
+(double)FromTheNumberOfDaysOne:(NSString *)string1
                        daysTwo:(NSString *)string2
{
    //截取年月日
    NSString *str1 = [string1 substringToIndex:11];
    NSString *str2 = [string2 substringToIndex:11];
    NSArray *stringArr = @[str1,str2];
    NSDate *date1,*date2;
    for(int i = 0; i < 2; ++ i)
    {
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"yyyy-MM-dd"];
        NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        [df setLocale:locale];
        
        if(i == 0)  date1 = [df dateFromString:stringArr[i]];
        else      date2 = [df dateFromString:stringArr[i]];
        
    }
    
    NSTimeInterval timeBetween = [date1 timeIntervalSinceDate:date2];
    
    return timeBetween/(3600*24);
    
}


//根据字符串 限制宽度 字号 行距 得到自适应面积
+(CGRect)getRectWith:(NSString *)string width:(CGFloat)width font:(CGFloat)font spacing:(CGFloat)spacing Row:(CGFloat)row{
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = spacing;
 
 
    CGSize constraintSize = CGSizeMake(width, 10000);
    NSStringDrawingOptions options = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading |
    NSStringDrawingUsesLineFragmentOrigin;
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:font] ,NSParagraphStyleAttributeName:paragraphStyle,NSKernAttributeName:@(row)};
    
    CGRect rect = [string boundingRectWithSize:constraintSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:NULL];

    
    return rect;
}


//获取可变字体
+(NSAttributedString *)getAtString:(NSString *)string Spacing:(CGFloat)spacing Row:(CGFloat)row Font:(CGFloat)font{
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = spacing;

    NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:font],NSParagraphStyleAttributeName : paragraphStyle,NSKernAttributeName:@(row)};

    NSAttributedString *atString = [[NSAttributedString alloc]initWithString:string attributes:dic];
    return atString;
}








@end
