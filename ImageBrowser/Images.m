//
//  Images.m
//  ImageBrowser
//
//  Created by 曾康 on 15/4/4.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import "Images.h"

@implementation Images

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)imagesWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}
@end
