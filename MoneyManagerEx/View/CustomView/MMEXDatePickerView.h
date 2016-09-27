//
//  MMEXDatePickerView.h
//  MoneyManagerEx
//
//  Created by taotao on 16/9/27.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickerViewDelegate <NSObject>

- (void)didSelectDate:(NSDate *)date;

@end

@interface MMEXDatePickerView : UIView

@property (nonatomic, weak) id<DatePickerViewDelegate> delegate;

@property (nonatomic, assign) BOOL invisible;

@end
