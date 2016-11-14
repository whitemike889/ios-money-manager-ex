//
//  MMEXDataPickerView.h
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/12.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DataPickerDelegate <NSObject>

- (void)didSelectData:(NSInteger)data;

@end

@interface MMEXDataPickerView : UIView

@property (nonatomic, assign) BOOL invisible;

+ (instancetype)getNewInstanceWithData:(NSArray *)data
                          parentHeight:(CGFloat)height
                              delegate:(id<DataPickerDelegate>)delegate;

- (void)hide:(BOOL)hide;

@end
