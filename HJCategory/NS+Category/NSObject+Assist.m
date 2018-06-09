//
//  NSObject+Assist.m
//  CQSuDaKB
//
//  Created by iOS on 2018/5/31.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "NSObject+Assist.h"
#import <objc/runtime.h>

@implementation NSObject (Assist)
+ (void)getPropertyFromDictionary:(NSDictionary *)dict {
    getPropertyFromDictionary(dict);
}

void getPropertyFromDictionary (NSDictionary *dict) {
    NSMutableString *propertyArr = [NSMutableString string];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull propertyName, id  _Nonnull value, BOOL * _Nonnull stop) {
        NSString *code = @"";
        if ([value isKindOfClass:NSClassFromString(@"bolean")]||[value isKindOfClass:NSClassFromString(@"boolean")]||[value isKindOfClass:NSClassFromString(@"__Boolean")]||[value isKindOfClass:NSClassFromString(@"BOOL")]) {

            code = [NSString stringWithFormat:@"@property (nonatomic,assign) BOOL %@;",propertyName];

        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFArray")]||[value isKindOfClass:NSClassFromString(@"__NSSingleObjectArrayI")]) {

            code = [NSString stringWithFormat:@"@property (nonatomic,copy) NSArray *%@;",propertyName];

        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFString")]) {

            code = [NSString stringWithFormat:@"@property (nonatomic,copy) NSString *%@;",propertyName];

        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFDictionary")]||[value isKindOfClass:NSClassFromString(@"__NSDictionaryI")]) {

            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSDictionary *%@;",propertyName];

        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFNumber")]) {

            code = [NSString stringWithFormat:@"@property (nonatomic,assign) NSInteger %@;",propertyName];

        };
        NSString *str =[NSString stringWithFormat:@"/************%@************/",propertyName];
        [propertyArr appendFormat:@"\n%@\n%@\n",str,code];
    }];
    NSLog(@"%@",propertyArr);
}


#pragma mark --- NSObject
- (NSArray *)getAllPropertys {
    unsigned int outCount;
    objc_property_t * propertys = class_copyPropertyList([self class], &outCount);//Copy
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = propertys[i];
        const char *propertyName = property_getName(property);
        [arr addObject:[NSString stringWithUTF8String:propertyName]];
    }
    free(propertys);//释放内存。。。
    return arr;
}
#pragma mark --------交换
+ (void)swizzWithClass:(Class)class originSel:(SEL)originSel newSel:(SEL)newSel{
    
    Method originM = class_getInstanceMethod(class, originSel);
    Method newM = class_getInstanceMethod(class, newSel);
    
    IMP newImp =  method_getImplementation(newM);
    
    BOOL addMethodSucess = class_addMethod(class, newSel, newImp, method_getTypeEncoding(newM));
    
    if (addMethodSucess) {
        class_replaceMethod(class, originSel, newImp, method_getTypeEncoding(newM));
    }else{
        method_exchangeImplementations(originM, newM);
    }
}
@end
