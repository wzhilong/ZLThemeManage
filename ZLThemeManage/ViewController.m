//
//  ViewController.m
//  ZLThemeManage
//
//  Created by Apple on 2017/12/21.
//  Copyright © 2017年 zhilong. All rights reserved.
//

#import "ViewController.h"
#import "ZLThemeManage.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [ZLThemeManage addThemeTarget:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
