//
//  IndexModel.m
//  BaseProject
//
//  Created by apple-jd09 on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "IndexModel.h"

@implementation IndexModel


+ (NSDictionary *)objectClassInArray{
    return @{@"stories" : [IndexStoriesModel class], @"topStories" : [IndexTopStoriesModel class]};
}
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"topStories":@"top_stories"};
}
@end
@implementation IndexStoriesModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id",@"gaPrefix":@"ga_prefix"};
}
@end


@implementation IndexTopStoriesModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id",@"gaPrefix":@"ga_prefix"};
}
@end


