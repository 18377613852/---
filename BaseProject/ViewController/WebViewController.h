//
//  WebViewController.h
//  BaseProject
//
//  Created by apple-jd09 on 15/11/28.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
-(instancetype)initWithURL:(NSURL *)url;
@property(nonatomic,strong)NSURL *url;
@property(nonatomic)NSInteger ID;
@end
