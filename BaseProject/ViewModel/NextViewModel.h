//
//  NextViewModel.h
//  BaseProject
//
//  Created by apple-jd09 on 15/11/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "NextModel.h"
@interface NextViewModel : BaseViewModel
-(instancetype)initWithID:(NSInteger)ID;
@property(nonatomic)NSInteger ID;
@property(nonatomic,strong)NextModel *nextModel;
@property(nonatomic,strong)NSURL *imageURL;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *body;

@property(nonatomic,strong)NSURL *avatar;


@end
