//
//  BankAccountEditTableViewCell.m
//  MoneyManagerEx
//
//  Created by taotao on 16/9/20.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "BankAccountEditTableViewCell.h"
#import "AccountModel.h"
#import "BankAccountType.h"jupui
#import "MMEX.h"
#import "LoginInfoModel.h"
#import "Merchant.h"
#import "MerchantModel.h"

@interface BankAccountEditTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *nameValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *currencyValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *initialBalanceValueLabel;
@property (weak, nonatomic) IBOutlet UISwitch *defaultAccountSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *favoriteAccountSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *openStatusSwitch;
@property (weak, nonatomic) IBOutlet UILabel *numberValue;
@property (weak, nonatomic) IBOutlet UILabel *heldAtValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *websiteValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *accessInfoValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteValueLabel;

@end

@implementation BankAccountEditTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCellData:(AccountModel *)object withIndexPath:(NSIndexPath *)indexPath
{
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    if (!object) {
        return;
    }
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
                _nameValueLabel.text = object.name;
            }
                break;
            case 1:
            {
                _typeValueLabel.text = [[BankAccountType shareInstance] typeNameOfIndex:[object.type integerValue]];
            }
                break;
            case 2:
            {
//                _currencyValueLabel.text = []
            }
                break;
            case 3:
            {
                _initialBalanceValueLabel.text = [object.initialCapital stringValue];
            }
                break;
            default:
                break;
        }
    }
    else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
            {
                BOOL isDefault = false;
                AccountModel *defaultAccount = [MMEX getLoginAccountMgr].loginInfo.defaultBankAccount;
                if (defaultAccount != nil && [defaultAccount.name isEqualToString:object.name]) {
                    isDefault = YES;
                }
                
                _defaultAccountSwitch.on = isDefault;
                self.selectionStyle = UITableViewCellSelectionStyleNone;
            }
                break;
            case 1:
            {
                _favoriteAccountSwitch.on = [object.favorite boolValue];
                self.selectionStyle = UITableViewCellSelectionStyleNone;
            }
                break;
            case 2:
            {
                _openStatusSwitch.on = [object.status boolValue];
                self.selectionStyle = UITableViewCellSelectionStyleNone;
            }
                break;
            default:
                break;
        }
    }
    else if (indexPath.section == 2) {
        switch (indexPath.row) {
            case 0:
            {
                if (object && object.merchant) {
                    _numberValue.text = object.merchant.number;
                }
            }
                break;
            case 1:
            {
                if (object && object.merchant) {
                    _heldAtValueLabel.text = object.merchant.name;
                }
            }
                break;
            case 2:
            {
                if (object && object.merchant) {
                    _websiteValueLabel.text = object.merchant.webSite;
                }
            }
                break;
            case 3:
            {
                if (object && object.merchant) {
                    _contactValueLabel.text = object.merchant.telphone;
                }
            }
                break;
            case 4:
            {
                if (object && object.merchant) {
                    _accessInfoValueLabel.text = object.merchant.loginInfo;
                }
            }
                break;
            case 5:
            {
                if (object && object.merchant) {
                    _noteValueLabel.text = object.merchant.note;
                }
            }
                break;
            default:
                break;
        }
    }
}

@end
