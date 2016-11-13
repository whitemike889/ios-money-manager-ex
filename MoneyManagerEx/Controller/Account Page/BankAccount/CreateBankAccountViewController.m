//
//  CreateBankAccountViewController.m
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/12.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "CreateBankAccountViewController.h"
#import "MMEXDataPickerView.h"
#import "AccountModel.h"

@interface CreateBankAccountViewController ()<DataPickerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *bankAccountNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *bankAccountTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *bankAccountTypeValueLabel;
@property (strong, nonatomic) MMEXDataPickerView *dataPickerView;

@property (nonatomic, strong) AccountModel *account;
@property (nonatomic, strong) NSArray *accountTypes;

- (IBAction)accountTypeBtnPressed:(id)sender;

@end

@implementation CreateBankAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initControlConfig];
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initControlConfig
{
    self.title = NSLocalizedString(@"Create Bank Account", nil);
    _bankAccountNameTextField.placeholder = NSLocalizedString(@"Bank Account Name", nil);
    [_bankAccountNameTextField becomeFirstResponder];
    _bankAccountTypeLabel.text = NSLocalizedString(@"Bank Account Type", nil);
    
    _bankAccountTypeValueLabel.text = @"";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelCreateBankAccount)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(saveCreateBankAccount)];
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView)];
    [self.view addGestureRecognizer:tapGR];
}

- (void)initData
{
    _accountTypes = [NSArray arrayWithObjects:@"Cash", @"Invest", nil];
}

#pragma mark - setter

#pragma mark - getter

- (MMEXDataPickerView *)dataPickerView
{
    if (!_dataPickerView) {
        _dataPickerView = [[MMEXDataPickerView alloc] initWithData:_accountTypes parentHeight:self.view.frame.size.height delegate:self];
        
        [self.view addSubview:_dataPickerView];
    }
    
    return _dataPickerView;
}

#pragma mark - action

- (IBAction)accountTypeBtnPressed:(id)sender
{
    [_bankAccountNameTextField resignFirstResponder];
    [self.dataPickerView hide:!self.dataPickerView.invisible];
}

- (void)cancelCreateBankAccount
{
    [_bankAccountNameTextField resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveCreateBankAccount
{
    [_bankAccountNameTextField resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)tapView
{
    [_bankAccountNameTextField resignFirstResponder];
    if (!self.dataPickerView.invisible) {
        [self.dataPickerView hide:YES];
    }
}

#pragma mark - DataPickerDelegate

- (void)didSelectData:(NSInteger)data
{
    [self.dataPickerView hide:YES];
}

@end
