//
//  CreateBankAccountViewController.h
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/12.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateBankAccountDelegate.h"

@interface CreateBankAccountViewController : UIViewController

- (instancetype)initWithDelegate:(id<CreateBankAccountDelegate>)delegate;

@end
