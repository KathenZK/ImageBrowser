//
//  ViewController.m
//  ImageBrowser
//
//  Created by 曾康 on 15/4/2.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:tableView];
}
@end
