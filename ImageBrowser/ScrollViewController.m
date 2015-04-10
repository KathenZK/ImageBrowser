//
//  ScrollViewController.m
//  ImageBrowser
//
//  Created by 曾康 on 15/4/3.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import "ScrollViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
extern NSInteger const IMAGE_COUNT;//图片总数

@interface ScrollViewController () <UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIImageView *_leftImageView;
    UIImageView *_centerImageView;
    UIImageView *_rightImageView;
    UIPageControl *_pageControl;
    NSInteger _currentImageIndex;//当前图片索引
}
@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加滚动控件
    [self addScrollView];
    
    //添加图片控件
    [self addImageView];
    
    //添加分页控件
    [self addPageControl];
    
    //加载默认图片
    [self setDefaultImage];
    
}

#pragma mark - 添加控件
- (void)addScrollView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    [self.view addSubview:_scrollView];
    
    //设置代理
    _scrollView.delegate = self;
    
    //设置contentSize
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * IMAGE_COUNT, SCREEN_HEIGHT);
    
    //设置当前的显示位置为中间的图片
    [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:NO];
    
    //设置分页
    _scrollView.pagingEnabled = YES;
    
    //去掉滚动条
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
}

#pragma mark - 添加imageView
- (void)addImageView
{
    _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _leftImageView.contentMode = UIViewContentModeScaleAspectFit;
//    _leftImageView.backgroundColor = [UIColor redColor];
    [_scrollView addSubview:_leftImageView];
    
    _centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _centerImageView.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_centerImageView];
    
    _rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 2, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_rightImageView];
}

#pragma mark - 设置默认显示图片
- (void)setDefaultImage
{
    //加载默认图片
    _leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg", IMAGE_COUNT - 1]];
    _centerImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",0]];
    _rightImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",1]];
    _currentImageIndex = 0;
    
    //设置当前页
    _pageControl.currentPage = _currentImageIndex;
}

#pragma mark - 添加分页控件
- (void)addPageControl
{
    _pageControl = [[UIPageControl alloc] init];
    
    //此方法可以根据页数返回UIPageControl合适的大小
    CGSize size = [_pageControl sizeForNumberOfPages:IMAGE_COUNT];
    _pageControl.bounds = CGRectMake(0, 0, size.width, size.height);
    _pageControl.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT - 100);
    //设置颜色
    _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:193/255.0 green:219/255.0 blue:249/255.0 alpha:1];
    _pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:0 green:150/255.0 blue:1 alpha:1];

    //设置总页数
    _pageControl.numberOfPages = IMAGE_COUNT;
    
    [self.view addSubview:_pageControl];
}

#pragma mark - 滚动停止事件
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //重新加载图片
    [self reloadImage];
    
    //移动到中间
    [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:NO];
    
    //设置分页
    _pageControl.currentPage = _currentImageIndex;
}

#pragma mark - 重新加载图片
- (void)reloadImage
{
    NSInteger leftImageIndex, rightImageIndex;
    CGPoint offset = _scrollView.contentOffset;
    if (offset.x > SCREEN_WIDTH) {
        //向右滑
        _currentImageIndex = (_currentImageIndex + 1) % IMAGE_COUNT;
    }
    else if (offset.x < SCREEN_WIDTH)
    {
        //向左滑
        _currentImageIndex = (IMAGE_COUNT + _currentImageIndex - 1) % IMAGE_COUNT;
    }
    _centerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%li.jpg",(long)_currentImageIndex]];
    
    //重新设置左右图片
    leftImageIndex = (_currentImageIndex - 1 + IMAGE_COUNT) % IMAGE_COUNT;
    rightImageIndex = (_currentImageIndex + 1) % IMAGE_COUNT;
    _leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%li.jpg",(long)leftImageIndex]];
    _rightImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%li.jpg",(long)rightImageIndex]];
}
@end
