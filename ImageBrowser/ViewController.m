//
//  ViewController.m
//  ImageBrowser
//
//  Created by 曾康 on 15/4/2.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import "ViewController.h"
#import "TransitionAnimationController.h"
#import "ScrollViewController.h"
#import "CollectionViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *list;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.list = [NSArray array];
    [self setupUI];
}

#pragma mark - 创建UI
- (void)setupUI
{
    self.title = @"ImageBrowser";
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark - 懒加载
- (void)setList:(NSArray *)list
{
    _list = list;
    if (_list) {
        _list = @[@"使用转场动画实现", @"使用UIScrollView实现", @"使用UICollectionView实现"];
    }
}

#pragma mark - tableView的数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.list[indexPath.row];
    return cell;
}

#pragma mark - tableView的代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = self.list[indexPath.row];
    if ([str isEqualToString:@"使用转场动画实现"]) {
        TransitionAnimationController *vc = [[TransitionAnimationController alloc]init];
        vc.title = str;
        vc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([str isEqualToString:@"使用UIScrollView实现"])
    {
        if ([str isEqualToString:@"使用UIScrollView实现"]) {
            ScrollViewController *scroll = [[ScrollViewController alloc] init];
            scroll.title = str;
            scroll.view.backgroundColor = [UIColor whiteColor];
            [self.navigationController pushViewController:scroll animated:YES];
        }
    }
    else if ([str isEqualToString:@"使用UICollectionView实现"])
    {
        CollectionViewController *collection = [[CollectionViewController alloc] init];
        collection.title = str;
        collection.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:collection animated:YES];
    }
}
@end
