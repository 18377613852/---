//
//  ZhiHuNetManager.h
//  BaseProject
//
//  Created by apple-jd09 on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

@interface ZhiHuNetManager : BaseNetManager

/** 首页 */
+(id)getIndexString:(NSString *)indexStr CompletionHandle:(void(^)(id model,NSError *error))completionHandle;

/** 点击下一页 */
+(id)getNextID:(NSInteger)ID CompletionHandle:(void(^)(id model,NSError *error))completionHandle;

@end
