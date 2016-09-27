//
//  MMEXPickerView.h
//  MoneyManagerEx
//
//  Created by taotao on 16/9/25.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GenderPickerDelegate <NSObject>

- (void)didSelectGender:(NSInteger)gender;

@end

@interface MMEXGenderPickerView : UIView

@property (nonatomic, weak) id<GenderPickerDelegate> delegate;
@property (nonatomic, assign) BOOL invisible;

@end
