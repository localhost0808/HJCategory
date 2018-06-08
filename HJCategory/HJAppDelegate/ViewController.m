//
//  ViewController.m
//  HJCategory
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

    UIView *view = viewCreat().viewAddSuperView(self.view).viewFrame(CGRectMake(20, 100, 100, 50)).viewColor([UIColor redColor]);

    UIView *view1 = viewCreatParam(CGRectMake(20, 200, 100, 50), [UIColor greenColor], self.view).viewRadius(YES);

//    run 

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
