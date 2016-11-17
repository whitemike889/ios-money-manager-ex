//
//  EditInfoViewController.h
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/16.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditInfoDelegate <NSObject>

- (void)updateEditInfo:(NSString *)info;

@end

@interface EditInfoViewController : UIViewController

- (instancetype)initWithDelegate:(id<EditInfoDelegate>)delegate subject:(NSString *)subject;

@end
