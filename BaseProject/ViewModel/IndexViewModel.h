//
//  IndexViewModel.h
//  BaseProject
//
//  Created by apple-jd09 on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "ZhiHuNetManager.h"
#import "IndexModel.h"
@interface IndexViewModel : BaseViewModel
@property(nonatomic)NSInteger latestDate;
@property(nonatomic,strong)NSString *str;
@property(nonatomic,strong)IndexModel *indexModel;
@property(nonatomic,strong)NSArray *indexPicArr;
@property(nonatomic)NSInteger indexPicNumber;
/** 行数 */
@property(nonatomic)NSInteger rowNumber;
/** 题目 */
-(NSString *)titleForRow:(NSInteger)row;
/** 每行的图片 */
-(NSURL *)iconForRow:(NSInteger)row;

-(NSURL *)IDForRow:(NSInteger)row;


/** 头部滚动栏图片 */
-(NSURL *)topIconForRow:(NSInteger)row;
/** 头部滚动栏标题 */
-(NSString *)topTitleForRow:(NSInteger)row;

@end














