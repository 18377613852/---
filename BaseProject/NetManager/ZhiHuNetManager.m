//
//  ZhiHuNetManager.m
//  BaseProject
//
//  Created by apple-jd09 on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZhiHuNetManager.h"
#import "IndexModel.h"
#import "NextModel.h"
#define TRIndexPath @"http://news-at.zhihu.com/api/4/stories/"
@implementation ZhiHuNetManager

/** 首页 */
+(id)getIndexString:(NSString *)indexStr CompletionHandle:(void(^)(id model,NSError *error))completionHandle{
    NSString *path = [TRIndexPath stringByAppendingString:indexStr];
    return [self GET:path parameters:@{@"client":@"0"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([IndexModel objectWithKeyValues:responseObj],error);
    }];
}


/** 点击下一页 */
+(id)getNextID:(NSInteger)ID CompletionHandle:(void(^)(id model,NSError *error))completionHandle{
    NSString *path = [NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/story/%ld",ID];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([NextModel objectWithKeyValues:responseObj],error);
    }];
}
@end







