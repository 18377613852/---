//
//  NextModel.h
//  BaseProject
//
//  Created by apple-jd09 on 15/11/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class Recommenders;
@interface NextModel : BaseModel

@property (nonatomic, strong) NSArray<Recommenders *> *recommenders;

@property (nonatomic, copy) NSString *imageSource;

@property (nonatomic, copy) NSString *gaPrefix;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, strong) NSArray<NSString *> *css;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *body;

@property (nonatomic, copy) NSString *shareUrl;

@property (nonatomic, strong) NSArray *js;

@end
@interface Recommenders : NSObject

@property (nonatomic, copy) NSString *avatar;

@end

