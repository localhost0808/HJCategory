//
//  NSObject+Assist.h
//  CQSuDaKB
//
//  Created by iOS on 2018/5/31.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Assist)
- (NSArray *)getAllPropertys;//获取类所有的属性

+ (void)swizzWithClass:(Class)class originSel:(SEL)originSel newSel:(SEL)newSel;//交换方法


void getPropertyFromDictionary (NSDictionary *dict);

+ (void)getPropertyFromDictionary:(NSDictionary *)dict;//model 属性复制


@end
