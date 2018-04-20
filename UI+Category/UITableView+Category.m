//
//  UITableView+Category.m
//  TestDemo
//
//  Created by Zs on 16/12/7.
//  Copyright © 2016年 Zs. All rights reserved.
//

#import "UITableView+Category.h"

@implementation UITableView (Category)
- (void)registerClasss:(NSArray<__kindof Class> *)cellClasss {
    for (Class class in cellClasss) {
        NSString *identifier = [NSString stringWithFormat:@"%@",NSStringFromClass(class)];
        [self registerClass:class forCellReuseIdentifier:identifier];
    }
}

- (void)registerClasss:(NSArray<__kindof Class> *)cellClasss forCellReuseIdentifiers:(NSArray<__kindof NSString *> *)identifiers {
        [cellClasss enumerateObjectsUsingBlock:^(__kindof Class  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self registerClass:obj forCellReuseIdentifier:identifiers[idx]];
        }];
}

@end
