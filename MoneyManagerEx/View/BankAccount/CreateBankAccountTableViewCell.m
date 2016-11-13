//
//  CreateBankAccountTableViewCell.m
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/12.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "CreateBankAccountTableViewCell.h"
#import "AccountModel.h"

@interface CreateBankAccountTableViewCell()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *bankAccountNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *bankAccountTypeValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *bankAccountTypeLabel;

@end

@implementation CreateBankAccountTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configTableViewCellData:(NSInteger)section row:(NSInteger)row data:(AccountModel *)data
{
    switch (row) {
        case 0:
        {
            if (data.name) {
                self.bankAccountNameTextField.text = data.name;
            }
            else {
                self.bankAccountNameTextField.placeholder = NSLocalizedString(@"Bank Account Name", nil);
            }
        }
            break;
        case 1:
        {
            self.bankAccountTypeLabel.text = NSLocalizedString(@"Bank Account Type", nil);
            self.bankAccountTypeValueLabel.text = @"";
        }
            break;
        default:
            break;
    }

}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (_delegate && [_delegate respondsToSelector:@selector(setupBankAccountName:)]) {
        [_delegate setupBankAccountName:textField.text];
    }
}

@end
