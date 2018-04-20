//
//  UIViewController+Category.m
//  TestDemo
//
//  Created by Hodge on 2018/1/3.
//  Copyright © 2018年 Zs. All rights reserved.
//

#import "UIViewController+Category.h"

@implementation UIViewController (Category)
+ (void)load {
    [super load];
// main 函数执行之前
    // 钩子方法 - 模型方法模式 -》 （抽象的）（具象的-钩子方法）；
        //文件刚加载
    //    runtime -Method ;

//    TestViewController 之前通过方法替换找到的类
    /*  自定义的方法
     ClassName : 传入类名《NSString *》
     OrSel : 系统原本的方法
     SwiSel : 我们自定义的方法
     目的: 替换两个方法的IMP地址
     */
    static dispatch_once_t onceToken; //线程锁
    dispatch_once(&onceToken, ^{

        [self class_exchangeIMPClassName:@"TestViewController" originatedSelector:@selector(viewDidLoad) swizzledSelector:@selector(swizzlingMethod)];//

    });
}

- (void)swizzlingMethod {
    [self swizzlingMethod];// 相当于调用ViewDidLoad 方法

    NSArray * arr = [self getAllPropertys];// 通过打断点找到 我们需要的属性名称 （Key）
    UIView *view = [self valueForKey:arr[0]]; //KVC获取属性名称对应的值
    view.frame = CGRectMake(0, 600, view.frame.size.width, view.frame.size.height);
}

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

//
//+ (void)initialize {
//    //alloc 的时候才会被调用，内部使用的是懒加载；
//}


+ (void)class_exchangeIMPClassName:(NSString *)className originatedSelector:(SEL)originatedSelector swizzledSelector:(SEL)swizzledSelector {

    Class cls = [NSClassFromString(className) class];//获取TestViewController的类

    Method originatedMethod = class_getInstanceMethod(cls, originatedSelector);//获取Tvc的viewDidLoad 方法
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector); //获取本类别中自定义方法

    BOOL isAddMethod = class_addMethod(cls, originatedSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));//添加名称为系统的方法，但是IMP是我们自定义的方法
    if (isAddMethod) {
        class_addMethod(cls, swizzledSelector, method_getImplementation(originatedMethod), method_getTypeEncoding(originatedMethod));//添加名称为我们自定义的方法，但是IMP是 系统 的方法
    }else {
        method_exchangeImplementations(swizzledMethod,originatedMethod);//这个方法是交换已经加载到内存中两个方法的IMP地址
    }
}

@end
