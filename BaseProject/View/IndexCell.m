//
//  IndexCell.m
//  BaseProject
//
//  Created by apple-jd09 on 15/11/25.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "IndexCell.h"

@implementation IndexCell
- (TRImageView *)imageIV {
    if(_imageIV == nil) {
        _imageIV = [[TRImageView alloc] init];
    }
    return _imageIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:15];
        _titleLb.numberOfLines = 0;
    }
    return _titleLb;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.imageIV];
        [self.imageIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(15);
            make.right.mas_equalTo(-15);
            //150..120
            make.size.mas_equalTo(CGSizeMake(kWindowW*0.23, kWindowW*0.18));
//            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.bottom.mas_equalTo(-15);
        }];
        [self.contentView addSubview:self.titleLb];
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(15);
//            make.bottom.mas_equalTo(-15);
            make.right.mas_equalTo(self.imageIV.mas_left).mas_equalTo(-25);
        }];
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
