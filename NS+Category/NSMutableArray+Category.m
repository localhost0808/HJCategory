//
//  NSMutableArray+Category.m
//  TestDemo
//
//  Created by Hodge on 2018/1/2.
//  Copyright © 2018年 Zs. All rights reserved.
//

#import "NSMutableArray+Category.h"

@implementation NSMutableArray (Category)
+ (void)load {
    [super load];
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//
//        id obj = [[self alloc] init];
//
//        [obj swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(safeObjectAtIndex:)];
//        [obj swizzleMethod:@selector(addObject:) withMethod:@selector(safeAddObject:)];
//    });

    //    __NSSingleObjectArrayI (__NSArrayI) 等同于NSArray;
    //      __NSArrayM 等同于NSMutableArray;


    id cls = objc_getClass("__NSArrayM");
    Method origMethod = class_getInstanceMethod(cls, @selector(addObject:));
    Method newMethod = class_getInstanceMethod(cls, @selector(safeAddObject:));

    method_exchangeImplementations(origMethod, newMethod);

}

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

//- (void)swizzleMethod:(SEL)origSelector withMethod:(SEL)newSelector {
//    Class cls = [self class];
//    Method origMethod = class_getInstanceMethod(cls, origSelector);
//    Method newMethod = class_getInstanceMethod(cls, newSelector);
//
//    BOOL didAddMethod = class_addMethod(cls, origSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
//
//    if (didAddMethod) {
//        class_addMethod(cls, newSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
//    }else {
//        method_exchangeImplementations(origMethod, newMethod);
//    }
//}
@end
