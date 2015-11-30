//
//  IndexModel.h
//  BaseProject
//
//  Created by apple-jd09 on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class IndexStoriesModel,IndexTopStoriesModel;
@interface IndexModel : BaseModel

@property (nonatomic, copy) NSString *date;

@property (nonatomic, strong) NSArray<IndexStoriesModel *> *stories;

@property (nonatomic, strong) NSArray<IndexTopStoriesModel *> *topStories;

@end
@interface IndexStoriesModel : NSObject

@property (nonatomic, assign) BOOL multipic;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *gaPrefix;

@property (nonatomic, strong) NSArray<NSString *> *images;

@end

@interface IndexTopStoriesModel : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *gaPrefix;

@end

