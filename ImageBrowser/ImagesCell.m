//
//  ImagesCell.m
//  ImageBrowser
//
//  Created by 曾康 on 15/4/4.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import "ImagesCell.h"
#import "Images.h"

@interface ImagesCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ImagesCell

- (void)awakeFromNib {
    self.titleLable.textAlignment = NSTextAlignmentCenter;
}

- (void)setImages:(Images *)images
{
    _images = images;
    self.titleLable.text = [NSString stringWithFormat:@"%@", images.title];
    self.imageView.image = [UIImage imageNamed:images.image];
}

+(instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"imagesCell";
    ImagesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    return cell;
}
@end
