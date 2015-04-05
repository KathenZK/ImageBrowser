//
//  ImagesCell.h
//  ImageBrowser
//
//  Created by 曾康 on 15/4/4.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Images;

@interface ImagesCell : UICollectionViewCell

@property (nonatomic, strong) Images *images;

+(instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;
@end
