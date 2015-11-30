//
//  NextViewModel.m
//  BaseProject
//
//  Created by apple-jd09 on 15/11/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NextViewModel.h"
#import "ZhiHuNetManager.h"
@implementation NextViewModel

- (instancetype)init{
    if (self = [super init]) {
        NSAssert1(NO, @"请使用initwithID初始化", __FUNCTION__);
    }
    return self;
}
- (instancetype)initWithID:(NSInteger)ID{
    if (self = [super init]) {
        _ID = ID;
    }
    return self;
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [ZhiHuNetManager getNextID:self.ID CompletionHandle:^(id model, NSError *error) {
        self.nextModel = model;
        completionHandle(error);
    }];
}

- (NSString *)title{
    return self.nextModel.title;
}

- (NSURL *)imageURL{
    return [NSURL URLWithString:self.nextModel.image];
}

- (NSString *)body{
    return self.nextModel.body;
}

- (NSURL *)avatar{
    return [NSURL URLWithString:self.nextModel.recommenders[0].avatar];
}





@end
