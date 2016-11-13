//
//  CreateBankAccountTableViewCellDelegate.h
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/12.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CreateBankAccountTableViewCellDelegate <NSObject>

- (void)setupBankAccountName:(NSString *)name;
- (void)setupBankAccountType:(NSInteger)type;

@end
