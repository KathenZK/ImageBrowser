//
//  Images.h
//  ImageBrowser
//
//  Created by 曾康 on 15/4/4.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Images : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *image;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)imagesWithDic:(NSDictionary *)dic;

@end
