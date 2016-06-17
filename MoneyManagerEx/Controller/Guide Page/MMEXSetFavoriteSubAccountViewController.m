//
//  MMEXSetFavoriteSubAccountViewController.m
//  MoneyManagerEx
//
//  Created by taotao on 15/11/8.
//  Copyright © 2015年 taotao. All rights reserved.
//

#import "MMEXSetFavoriteSubAccountViewController.h"
#import "AppDelegate.h"
#import "MobileDeviceHelper.h"

#define ACCOUNT_TYPE_PICKER_ROW_HEGIHT 30

@interface MMEXSetFavoriteSubAccountViewController ()<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *accountName;
@property (weak, nonatomic) IBOutlet UIButton *subAccountType;
@property (weak, nonatomic) IBOutlet UIPickerView *accountTypePicker;
@property (weak, nonatomic) IBOutlet UIView *selectAccountTypeView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewContentWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewContentHeight;

@property (nonatomic, strong) NSArray *accountTypes;

- (IBAction)showSelectionView:(id)sender;

- (IBAction)didChangeTypeOfAccount:(id)sender;

@end

@implementation MMEXSetFavoriteSubAccountViewController

#pragma mark - life circle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        _accountTypes = [NSArray arrayWithObjects:@"Checking", @"Term", @"Investment", nil];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self _setupSubviewProperties];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    _subAccountType.imageEdgeInsets = UIEdgeInsetsMake(_subAccountType.imageEdgeInsets.top, _subAccountType.frame.size.width - 15 - 8, _subAccountType.imageEdgeInsets.bottom, 15);
    //_subAccountType.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods
- (void)_setupSubviewProperties
{
    // navigation item
//    self.title = NSLocalizedString(@"set favorite sub account", nil);
    self.navigationItem.title = NSLocalizedString(@"set favorite sub account", nil);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneSetting:)];
    self.navigationItem.leftBarButtonItem = nil;
    [_subAccountType setImage:[UIImage imageNamed:@"right_arrow"] forState:UIControlStateNormal];
    
    // view
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    [self.view addGestureRecognizer:tapGR];
    
    // scroll view
    [_scrollView setContentOffset:CGPointMake(0, 0)];
    
    // account name textfield
    
    // 初始化账号类型选择项
    [_subAccountType setTitle:_accountTypes[0] forState:UIControlStateNormal];
    
    _accountTypePicker.showsSelectionIndicator = YES;
    [_selectAccountTypeView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [_selectAccountTypeView.layer setBorderWidth:0.5];
}

#pragma mark - actions
- (IBAction)showSelectionView:(id)sender
{
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat scrollViewContentOffsetHeight = 0;
    if (height < IPHONE_5_HEIGHT) {
        scrollViewContentOffsetHeight = 110;
    }
    else if (height > IPHONE_5_HEIGHT) {
        scrollViewContentOffsetHeight = 0;
    }
    else {
        scrollViewContentOffsetHeight = 20;
    }
    [_scrollView setContentOffset:CGPointMake(0, scrollViewContentOffsetHeight)];
    [_scrollView setScrollEnabled:NO];
    
    _selectAccountTypeView.hidden = NO;
}

- (IBAction)didChangeTypeOfAccount:(id)sender
{
    NSInteger selectIndex = [_accountTypePicker selectedRowInComponent:0];
    [_subAccountType setTitle:_accountTypes[selectIndex] forState:UIControlStateNormal];
    
    _selectAccountTypeView.hidden = YES;
    [_scrollView setContentOffset:CGPointMake(0, 0)];
    [_scrollView setScrollEnabled:YES];
}

- (void)doneSetting:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    UIApplication *application = [UIApplication sharedApplication];
    
    AppDelegate *appDelegate = (AppDelegate *)(application.delegate);
    [appDelegate showHomePage];
}

- (void)keyboardHide:(UIGestureRecognizer *)gestrueRecognizer
{
    if ([_accountName isFirstResponder]) {
        [_accountName resignFirstResponder];
    }
    else if (![_accountTypePicker isHidden]) {
        [_selectAccountTypeView setHidden:YES];
        [_scrollView setContentOffset:CGPointMake(0, 0)];
    }
}

#pragma mark - UIPickerDelegate
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return ACCOUNT_TYPE_PICKER_ROW_HEGIHT;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return _accountTypePicker.frame.size.width;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if (0 == component) {
        return _accountTypes[row];
    }
    
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{

}

#pragma mark - UIPickerDatasource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (0 == component) {
        return _accountTypes.count;
    }
    
    return 0;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


@end
