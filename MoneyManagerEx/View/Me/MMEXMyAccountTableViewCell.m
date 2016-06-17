//
//  MMEXMyAccountTableViewCell.m
//  MoneyManagerEx
//
//  Created by taotao on 16/6/16.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "MMEXMyAccountTableViewCell.h"

@implementation MMEXMyAccountTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    if (_myAvatar != nil) {
        [_myAvatar.layer setCornerRadius:_myAvatar.frame.size.width/2];
        [_myAvatar setClipsToBounds:YES];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
