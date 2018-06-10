//
//  ViewController.m
//  HJCategoryDemo
//
//  Created by Harry on 2018/6/8.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import "ViewController.h"
#import "HJCategoryHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    viewCreateParamMore(CGRectMake(0, 0, 100, 30), [UIColor greenColor], self, @selector(viewClick:), self.view);

    buttonCreateParam(CGRectMake(0, 50, 200, 44), @"按钮", nil, self, @selector(viewClick:), self.view).viewRadius(YES).viewColor([UIColor redColor]);



}

- (void)viewClick:(id)view {

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
