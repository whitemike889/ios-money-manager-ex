//
//  EditBasicInfoTableViewCell.h
//  MoneyManagerEx
//
//  Created by taotao on 16/6/17.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditBasicInfoDelegate.h"
#import "UserInfoModel.h"

@interface EditBasicInfoTableViewCell : UITableViewCell

- (void)configureCellDataOnSection:(NSInteger)section row:(NSInteger)row data:(UserInfoModel *)userInfo;

@property (nonatomic, weak) id<EditBasicInfoDelegate> delegate;

@end
