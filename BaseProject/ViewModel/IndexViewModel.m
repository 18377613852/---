//
//  IndexViewModel.m
//  BaseProject
//
//  Created by apple-jd09 on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "IndexViewModel.h"

@implementation IndexViewModel

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [ZhiHuNetManager getIndexString:self.str CompletionHandle:^(IndexModel *model, NSError *error) {
        if ([self.str isEqualToString:@"latest"]) {
            [self.dataArr removeAllObjects];
            
            
        }
        [self.dataArr addObjectsFromArray:model.stories];
        self.indexPicArr = model.topStories;
        self.indexModel = model;
        completionHandle(error);
    }];
}

- (NSInteger)latestDate{
    return self.indexModel.date.intValue;
}
- (NSInteger)rowNumber{
    return self.dataArr.count;
}
- (NSInteger)indexPicNumber{
    return self.indexPicArr.count;
}
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    NSString *beforeStr = @"before/";
//    NSInteger date = self.indexModel.date.intValue;
    self.latestDate--;
    self.str = [beforeStr stringByAppendingString:[NSString stringWithFormat:@"%ld",self.latestDate]];
    
    [self getDataFromNetCompleteHandle:completionHandle];

}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    self.str = @"latest";
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(IndexStoriesModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
/** 题目 */
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
/** 每行的图片 */
-(NSURL *)iconForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].images[0]];
}

-(NSURL *)IDForRow:(NSInteger)row{
    NSString *path = [NSString stringWithFormat:@"http://daily.zhihu.com/story/%ld",[self modelForRow:row].ID];
    return [NSURL URLWithString:path];
}

-(IndexTopStoriesModel *)topModelForRow:(NSInteger)row{
    return self.indexPicArr[row];
}
/** 头部滚动栏图片 */
-(NSURL *)topIconForRow:(NSInteger)row{
    return [NSURL URLWithString:[self topModelForRow:row].image];
}
/** 头部滚动栏标题 */
-(NSString *)topTitleForRow:(NSInteger)row{
    return [self topModelForRow:row].title;
}


@end











