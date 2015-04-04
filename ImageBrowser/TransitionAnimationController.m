//
//  TransitionAnimationController.m
//  ImageBrowser
//
//  Created by 曾康 on 15/4/2.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import "TransitionAnimationController.h"

const NSInteger IMAGE_COUNT = 3;

@interface TransitionAnimationController ()
{
    UIImageView *_imageView;
    NSInteger _currentIndex;
}
@end

@implementation TransitionAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI
{
    //定义图片控件
    _imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.image = [UIImage imageNamed:@"0.jpg"];
    [self.view addSubview:_imageView];
    
    //添加手势
    UISwipeGestureRecognizer *leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipe:)];
    leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipeGesture];
    
    UISwipeGestureRecognizer *rightSwipeGesture =[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipe:)];
    rightSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipeGesture];
}

#pragma mark - 左滑
- (void)leftSwipe:(UISwipeGestureRecognizer *)gesture
{
    [self transitionAnimation:YES];
}

#pragma mark - 右滑
- (void)rightSwipe:(UISwipeGestureRecognizer *)gesture
{
    [self transitionAnimation:NO];
}

#pragma mark - 转场动画
- (void)transitionAnimation:(BOOL)isNext
{
    //创建转场动画
    CATransition *transition = [[CATransition alloc] init];
    
    //设置动画类型
    transition.type = @"push";
    
    //设置子类型
    if (isNext) {
        transition.subtype = kCATransitionFromRight;
    }
    else
    {
        transition.subtype = kCATransitionFromLeft;
    }
    
    //设置动画时常
    transition.duration = .8f;
    
    //设置转场后的新视图
    _imageView.image = [self getImage:isNext];
    
    //添加转场动画
    [_imageView.layer addAnimation:transition forKey:nil];
}

#pragma mark - 取得当前图片
- (UIImage *)getImage:(BOOL)isNext
{
    if (isNext) {
        _currentIndex = (_currentIndex + 1) % IMAGE_COUNT;
    }
    else
    {
        _currentIndex = (_currentIndex - 1 + IMAGE_COUNT) % IMAGE_COUNT;
    }
    
    NSString *imageName = [NSString stringWithFormat:@"%ld.jpg", (long)_currentIndex];
    return [UIImage imageNamed:imageName];
}
@end
