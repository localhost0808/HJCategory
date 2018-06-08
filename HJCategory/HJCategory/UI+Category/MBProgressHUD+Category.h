//
//  MBProgressHUD+Category.h
//  TestDemo
//
//  Created by Zs on 16/12/7.
//  Copyright © 2016年 Zs. All rights reserved.
//


#define MBProgressHUD_h NSClassFromString(@"MBProgressHUD")
#ifndef MBProgressHUD_h

#import <MBProgressHUD/MBProgressHUD.h>

/**
    进一步简化提示框的修改
 */
#define MBHUD(id,HJStyle)   [MBProgressHUD alertLableTitle:id Style:HJStyle];
#define MBError             MBHUD([error localizedDescription],HJStyleError);
//[MBProgressHUD alertLableTitle:[error localizedDescription] Style:HJStyleError];
#define MBSuccess           MBHUD(responseObject[@"desc"],HJStyleSuccess);
//[MBProgressHUD alertLableTitle:responseObject[@"desc"] Style:HJStyleSuccess];
#define MBWarning           MBHUD(responseObject[@"desc"],HJStyleWarning);
//[MBProgressHUD alertLableTitle:responseObject[@"desc"] Style:HJStyleWarning];

#define MBWarningTitle(title)           MBHUD(title,HJStyleWarning);
#define MBSuccessTitle(title)           MBHUD(title,HJStyleSuccess);
#define MBErrorTitle(title)             MBHUD(title,HJStyleError);
#define MBNomlTitle(title)              MBHUD(title,HJStyleNoml)

#define MBLoading(title);        [MBProgressHUD loadViewTitle:title];
#define MBCloseLoding(view)            [MBProgressHUD ]

typedef NS_ENUM(NSInteger, HJStyle){
    HJStyleError = 0,
    HJStyleSuccess,
    HJStyleWarning,
    HJStyleNoml = 999,
};

@interface MBProgressHUD (Extends)
+ (MBProgressHUD *)loadViewDF;//默认的HUD “请稍等...”
+ (MBProgressHUD *)loadViewTitle:(NSString *)title;//可以添加文字的HUD

+ (MBProgressHUD *)alertLableTitle:(NSString *)title;//小型HUD
+ (MBProgressHUD *)alertLableTitle:(NSString *)title  Style:(HJStyle)style;/* HUD 可以指定样式，警告、错误、正确。*/
@end

#endif
