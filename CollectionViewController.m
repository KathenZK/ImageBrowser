//
//  CollectionViewController.m
//  ImageBrowser
//
//  Created by 曾康 on 15/4/4.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import "CollectionViewController.h"
#import "ImagesCell.h"
#import "Images.h"

@interface CollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *images;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"ImagesCell" bundle:nil] forCellWithReuseIdentifier:@"imagesCell"];
    
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:500 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
}

- (NSArray *)images
{
    if (!_images) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"images" ofType:@"plist"];
        NSArray *dataArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *mArr = [NSMutableArray array];
        for (NSDictionary *dic in dataArr) {
            Images *image = [Images imagesWithDic:dic];
            [mArr addObject:image];
        }
        _images = mArr;
    }
    return _images;
}

#pragma mark - collectionView的数据源代理
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count * 1000;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImagesCell *cell = [ImagesCell cellWithCollectionView:collectionView indexPath:indexPath];
    cell.images = self.images[indexPath.item % self.images.count];
    return cell;
}
@end
