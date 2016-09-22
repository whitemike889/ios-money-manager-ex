//
//  EditBasicInfoTableViewCell.m
//  MoneyManagerEx
//
//  Created by taotao on 16/6/17.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "EditBasicInfoTableViewCell.h"

@interface EditBasicInfoTableViewCell()

@property (weak, nonatomic) IBOutlet UIButton *avatarButton;
@property (weak, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (weak, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (weak, nonatomic) IBOutlet UILabel *trueNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *trueNameTextField;
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

- (void)configureCellDataOnSection:(NSInteger)section row:(NSInteger)row
{
    if (section == 0) {
        switch (row) {
            case 0:
            {
//                self.selectionStyle = UITableViewCellSelectionStyleNone;
            }
                break;
            case 1:
            {
                _nicknameLabel.text = NSLocalizedString(@"nickname label", nil);
                _nicknameTextField.text = @"";
//                self.selectionStyle = UITableViewCellSelectionStyleNone;
            }
                break;
            case 2:
            {
                _trueNameLabel.text = NSLocalizedString(@"truename label", nil);
                _trueNameTextField.text = @"";
//                self.selectionStyle = UITableViewCellSelectionStyleNone;
            }
                break;
            case 3:
            {
                _genderLabel.text = NSLocalizedString(@"gender label", nil);
                _genderValue.text = @"";
            }
                break;
            case 4:
            {
                _birthdayLabel.text = NSLocalizedString(@"birthday label", nil);
                _birthdayValue.text = @"";
            }
                break;
            default:
                break;
        }
    }
}

@end
