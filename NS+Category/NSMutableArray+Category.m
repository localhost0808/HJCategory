//
//  NSMutableArray+Category.m
//  TestDemo
//
//  Created by Hodge on 2018/1/2.
//  Copyright © 2018年 Zs. All rights reserved.
//
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

#import "NSMutableArray+Category.h"
#import <objc/runtime.h>

@implementation NSMutableArray (Category)

- (void)safeAddObject:(id)anObject {
    if (anObject) {
        [self safeAddObject:anObject];
    }else {
        @try {
            [self safeAddObject:anObject];
        }
        @catch (NSException *exception) {
            NSLog(@"\n\n\n\n\n************************ %s-Crash Because Method %s**************\n\n\n\n\n\\n%@\n",class_getName(self.class),__func__,[exception callStackSymbols]);

        }
        DLog(@"object don't save this");
    }
}

- (id)safeObjectAtIndex:(NSUInteger)index {
    if (index < [self count]) {
        return [self safeObjectAtIndex:index];
    }else {
        DLog(@"index beyoud bounds");
        return nil;
    }
}

@end
