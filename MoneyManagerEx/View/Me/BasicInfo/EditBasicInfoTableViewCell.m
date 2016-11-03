//
//  EditBasicInfoTableViewCell.m
//  MoneyManagerEx
//
//  Created by taotao on 16/6/17.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "EditBasicInfoTableViewCell.h"
#import "UIImage+Crop.h"
#import "NSDate+Format.h"

@interface EditBasicInfoTableViewCell()

@property (weak, nonatomic) IBOutlet UIButton *avatarButton;
@property (weak, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (weak, nonatomic) IBOutlet UILabel *nicknameValue;
@property (weak, nonatomic) IBOutlet UILabel *trueNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *trueNameValue;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderValue;
@property (weak, nonatomic) IBOutlet UILabel *birthdayLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthdayValue;



@end

@implementation EditBasicInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCellDataOnSection:(NSInteger)section row:(NSInteger)row data:(UserInfoModel *)userInfo
{
    if (section == 0) {
        switch (row) {
            case 0:
            {
                if (userInfo && userInfo.avatarImg) {
                    UIImage *circleImage = [userInfo.avatarImg circleImage];
                    [self.avatarButton setImage:circleImage forState:UIControlStateNormal];
                }
                self.selectionStyle = UITableViewCellSelectionStyleNone;
            }
                break;
            case 1:
            {
                _nicknameLabel.text = NSLocalizedString(@"name label", nil);
                if (userInfo && userInfo.name) {
                    _nicknameValue.text = userInfo.name;
                }
            }
                break;
//            case 2:
//            {
//                _trueNameLabel.text = NSLocalizedString(@"truename label", nil);
//                _trueNameValue.text = @"Teresa";
//            }
//                break;
            case 2:
            {
                _genderLabel.text = NSLocalizedString(@"gender label", nil);
                if (userInfo && userInfo.gender) {
                    if ([userInfo.gender integerValue] == 0) {
                        _genderValue.text = NSLocalizedString(@"male", nil);
                    }
                    else {
                        _genderValue.text = NSLocalizedString(@"female", nil);
                    }
                }
                else {
                    _genderValue.text = NSLocalizedString(@"male", nil);
                }
            }
                break;
            case 3:
            {
                _birthdayLabel.text = NSLocalizedString(@"birthday label", nil);
                if (userInfo && userInfo.birthday) {
                    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[userInfo.birthday longLongValue]];
                    
                    _birthdayValue.text = [date getChineseDate];
                }
            }
                break;
            default:
                break;
        }
    }
}

- (IBAction)changeAvatar:(id)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(avatarBtnPressed)]) {
        [_delegate avatarBtnPressed];
    }
}

@end
