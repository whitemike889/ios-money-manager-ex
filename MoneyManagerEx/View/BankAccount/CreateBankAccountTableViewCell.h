//
//  CreateBankAccountTableViewCell.h
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/12.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateBankAccountTableViewCellDelegate.h"

@class AccountModel;

@interface CreateBankAccountTableViewCell : UITableViewCell

@property (nonatomic, weak) id<CreateBankAccountTableViewCellDelegate> delegate;

- (void)configTableViewCellData:(NSInteger)section row:(NSInteger)row data:(AccountModel *)data;

@end
