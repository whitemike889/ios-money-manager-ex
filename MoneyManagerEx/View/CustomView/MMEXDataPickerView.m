//
//  MMEXDataPickerView.m
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/12.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "MMEXDataPickerView.h"

@interface MMEXDataPickerView()<UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) IBOutlet UIButton *sureButton;
@property (nonatomic, strong) IBOutlet UIPickerView *pickerView;

@property (nonatomic, strong) NSArray *data;
@property (nonatomic, weak) id<DataPickerDelegate> delegate;
@property (nonatomic, assign) CGFloat  parentHeight;

@end

@implementation MMEXDataPickerView

+ (instancetype)getNewInstanceWithData:(NSArray *)data
                          parentHeight:(CGFloat)height
                              delegate:(id<DataPickerDelegate>)delegate
{
    MMEXDataPickerView *dataPickerView = [[[NSBundle mainBundle] loadNibNamed:@"MMEXDataPickerView" owner:delegate options:nil] objectAtIndex:0];
    dataPickerView.frame = CGRectMake(0, height, dataPickerView.frame.size.width, dataPickerView.frame.size.height);
    dataPickerView.delegate = delegate;
    dataPickerView.invisible = YES;
    dataPickerView.data = data;
    dataPickerView.parentHeight = height;
    
    return dataPickerView;
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _data.count;
}

#pragma mark - UIPickerViewDelegate

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return self.frame.size.width;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _data[row];
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
        [_delegate didSelectData:[self.pickerView selectedRowInComponent:0]];
    }
}

- (void)hide:(BOOL)hide
{
    [UIView animateWithDuration:0.3f
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         CGRect oldRect = self.frame;
                         CGFloat poistionY = (hide ? _parentHeight : (_parentHeight - self.frame.size.height));
                         
                         self.frame = CGRectMake(0, poistionY, oldRect.size.width, oldRect.size.height);
                         self.invisible = hide;
                     }
                     completion:nil];
}

@end
