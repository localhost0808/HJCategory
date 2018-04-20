//
//  UIView+Category.m
//  TestDemo
//
//  Created by Zs on 16/12/7.
//  Copyright © 2016年 Zs. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)
- (void)addSubviews:(NSArray<__kindof UIView *> *)views {
    for (UIView *view in views) {
        [self addSubview:view];
    }
}
@end
