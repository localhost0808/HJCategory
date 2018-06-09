//
//  UITableView+Category.h
//  TestDemo
//
//  Created by Zs on 16/12/7.
//  Copyright © 2016年 Zs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Category)
+ (instancetype)tablViewFrame:(CGRect)frame style:(UITableViewStyle)style;
- (void)registerClasss:(NSArray<__kindof Class> *)cellClasss;
- (void)registerClasss:(NSArray<__kindof Class> *)cellClasss forCellReuseIdentifiers:(NSArray<__kindof NSString *> *)identifiers;
@end
