//
//  MMEXDatePickerView.m
//  MoneyManagerEx
//
//  Created by taotao on 16/9/27.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "MMEXDatePickerView.h"

@interface MMEXDatePickerView()
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation MMEXDatePickerView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self.datePicker addTarget:self
                            action:@selector(dateValueChanged:)
                  forControlEvents:UIControlEventValueChanged];
    }
    
    return self;
}

- (void)dateValueChanged:(id)sender
{
    
}

- (IBAction)confirmButtonPressed:(id)sender
{
    if (_delegate) {
        [_delegate didSelectDate:self.datePicker.date];
    }
}

@end
