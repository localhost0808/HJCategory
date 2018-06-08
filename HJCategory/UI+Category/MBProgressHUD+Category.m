//
//  MBProgressHUD+Category.m
//  TestDemo
//
//  Created by Zs on 16/12/7.
//  Copyright © 2016年 Zs. All rights reserved.
//
#import "MBProgressHUD+Category.h"

#ifndef MBProgressHUD_h

#define WINDOW_KEY [UIApplication sharedApplication].delegate.window
@implementation MBProgressHUD (Extends)
#pragma mark --页面Loading 默认的，直接调用
+ (MBProgressHUD *)loadViewDF {
    return [[self alloc] initProgressHUDAddTo:nil ContentColor:nil Title:@"请稍等..." backgroundColor:[UIColor colorWithWhite:0. alpha:0.4] Time:1.];
}
#pragma mark --页面Loading ，可以设置标题
+ (MBProgressHUD *)loadViewTitle:(NSString *)title {
    return [[self alloc] initProgressHUDAddTo:nil ContentColor:nil Title:title backgroundColor:[UIColor colorWithWhite:0. alpha:0.4] Time:30.];
}

#pragma mark --页面显示一个Label ，可以设置标题
+ (MBProgressHUD *)alertLableTitle:(NSString *)title {
    return [[self alloc] initAlertLableTitle:title Style:999];
}
#pragma mark --页面显示三种提示类型 ，可以设置标题
+ (MBProgressHUD *)alertLableTitle:(NSString *)title  Style:(HJStyle)style {
    return [[self alloc] initAlertLableTitle:title Style:style];
}

//实例方法
- (instancetype)initAlertLableTitle:(NSString *)title Style:(HJStyle)style {
    self = [self initProgressHUDAddTo:nil ContentColor:nil Title:title backgroundColor:[UIColor clearColor] Time:2.];
    if (style == HJStyleNoml) {
        self.mode = MBProgressHUDModeText;
        return self;
    }
    self.mode = MBProgressHUDModeCustomView;
    
    switch (style) {
        case HJStyleError:
        {
            self.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"error"]];
        }
            break;
            
        case HJStyleSuccess:
        {
            self.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"success"]];
        }
            break;
            
            
        case HJStyleWarning:
        {
            self.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"caveat"]];
        }
            break;
            
        default:
            break;
    }
    
    //    self.minSize= CGSizeMake(300, 100);
    //    self.offset = CGPointMake(0.f, MBProgressMaxOffset);
    return self;
}
//等待 界面
- (instancetype)initLoadTitle:(NSString *)title{
    return [self initProgressHUDAddTo:nil ContentColor:nil Title:title backgroundColor:[UIColor colorWithWhite:0. alpha:0.4] Time:1.];
    
}

//原型
- (instancetype)initProgressHUDAddTo:(UIView *)view ContentColor:(UIColor *)color Title:(NSString *)title backgroundColor:(UIColor *)backgroundColor Time:(unsigned int)time {
    self = [super init];
    [MBProgressHUD hideHUDForView:WINDOW_KEY animated:YES];
    if (self) {
        self = [MBProgressHUD showHUDAddedTo:WINDOW_KEY animated:YES];
        self.contentColor = color;
        self.backgroundColor = backgroundColor;
        self.label.numberOfLines = 0;
        self.label.text = title;
        [self hideForTime:time];
        //        self.superview.userInteractionEnabled = NO;
    }
    return self;
}

- (void)hideForTime:(unsigned int)time {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        sleep(time);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self hideAnimated:YES];
        });
    });
}

//- (void)hideAnimated:(BOOL)animated {
//    [self hideAnimated:animated];
//    self.superview.userInteractionEnabled = YES;
//}

@end

#endif


