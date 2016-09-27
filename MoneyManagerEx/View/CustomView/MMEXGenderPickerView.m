//
//  MMEXPickerView.m
//  MoneyManagerEx
//
//  Created by taotao on 16/9/25.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "MMEXGenderPickerView.h"

@interface MMEXGenderPickerView()<UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) IBOutlet UIButton *sureButton;
@property (nonatomic, strong) IBOutlet UIPickerView *pickerView;

@property (nonatomic, strong) NSArray *genders;

@end

@implementation MMEXGenderPickerView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        _genders = [NSArray arrayWithObjects:NSLocalizedString(@"male", nil), NSLocalizedString(@"female", nil), nil];
    }
    
    return self;
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _genders.count;
}

#pragma mark - UIPickerViewDelegate

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return self.frame.size.width;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _genders[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
//    if (_delegate) {
//        [_delegate didSelectGender:row];
//    }
}

#pragma mark - actions

- (IBAction)confirmButtonPressed:(id)sender
{
    if (_delegate) {
        [_delegate didSelectGender:[self.pickerView selectedRowInComponent:0]];
    }
}

@end
