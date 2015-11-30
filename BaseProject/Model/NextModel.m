//
//  NextModel.m
//  BaseProject
//
//  Created by apple-jd09 on 15/11/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NextModel.h"

@implementation NextModel


+ (NSDictionary *)objectClassInArray{
    return @{@"recommenders" : [Recommenders class]};
}
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id",@"imageSource":@"image_source",@"gaPrefix":@"ga_prefix",@"shareUrl":@"share_url"};
}
@end
@implementation Recommenders

@end


