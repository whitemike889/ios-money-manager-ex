//
//  BankAccountEditViewController.m
//  MoneyManagerEx
//
//  Created by taotao on 16/9/20.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "BankAccountEditViewController.h"
#import "BankAccountEditTableViewCell.h"
#import "AccountModel.h"
#import "MerchantModel.h"
#import "SCLAlertView.h"
#import "MMEX.h"
#import "IAccountMgr.h"
#import "EditInfoViewController.h"

@interface BankAccountEditViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, EditInfoDelegate>

@property (weak, nonatomic) IBOutlet UITableView *accountInfoTableView;

@property (nonatomic, strong) AccountModel *account;

@end

@implementation BankAccountEditViewController

- (instancetype)initWithAccount:(AccountModel *)account
{
    if (self = [self initWithNibName:@"BankAccountEditViewController" bundle:nil]) {
        self.account = account;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.title = NSLocalizedString(@"Bank Account Edit Page Title", nil);
    self.title = _account.name;
    self.navigationItem.leftBarButtonItem = nil;
    if (!_account) {
        _account = [[AccountModel alloc] init];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ((2 == indexPath.section) && (5 == indexPath.row)) {
        return 84;
    }
    
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (0 == section) {
        return 5.0;
    }
    else if (1 == section) {
        return 15.0;
    }
    else if (2 == section) {
        return 15.0;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *placeHolder;
    NSInteger textFieldTag = 0;
    NSString *title;
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
                placeHolder = NSLocalizedString(@"Enter the bank account name", nil);
                textFieldTag = 1;
                title = NSLocalizedString(@"Account Name", nil);
            }
                break;
            case 1:
            {
                return;
            }
                break;
            case 2:
            {
                return;
            }
                break;
            case 3:
            {
                placeHolder = NSLocalizedString(@"Enter the inital balance", nil);
                textFieldTag = 2;
                title = NSLocalizedString(@"Initial Banlance", nil);
            }
                break;
            default:
                break;
        }
    }
    else if(indexPath.section == 1) {
        return;
    }
    else if (indexPath.section == 2) {
        switch (indexPath.row) {
            case 0:
            {
                placeHolder = NSLocalizedString(@"Enter the bank account number", nil);
                textFieldTag = 3;
                title = NSLocalizedString(@"Bank Account Number", nil);
            }
                break;
            case 1:
            {
                placeHolder = NSLocalizedString(@"Enter the merchant name", nil);
                textFieldTag = 4;
                title = NSLocalizedString(@"Merchant Name", nil);
            }
                break;
            case 2:
            {
                placeHolder = NSLocalizedString(@"Enter the merchant website", nil);
                textFieldTag = 5;
                title = NSLocalizedString(@"Merchant Website", nil);
            }
                break;
            case 3:
            {
                placeHolder = NSLocalizedString(@"Enter the merchant contact information", nil);
                textFieldTag = 6;
                title = NSLocalizedString(@"Merchant Contanct", nil);
            }
                break;
            case 4:
            {
                placeHolder = NSLocalizedString(@"Enter the merchant login information", nil);
                textFieldTag = 7;
                title = NSLocalizedString(@"Merchant Login Information", nil);
                break;
            }
            case 5:
            {
                EditInfoViewController *vc = [[EditInfoViewController alloc] initWithDelegate:self subject:NSLocalizedString(@"note", nil)];
                
                [self.navigationController pushViewController:vc animated:YES];
                return;
            }
                break;
            default:
                break;
        }
    }
    
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    SCLTextView *textField = [alert addTextField:placeHolder];
    textField.delegate = self;
    textField.tag = textFieldTag;
    if ((indexPath.section == 0 && indexPath.row == 3)||
        (indexPath.section == 2 && indexPath.row == 3)) {
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }
    alert.showAnimationType = SCLAlertViewShowAnimationFadeIn;
    alert.hideAnimationType = SCLAlertViewHideAnimationSimplyDisappear;
    alert.shouldDismissOnTapOutside = YES;
    [alert addButton:NSLocalizedString(@"Done", nil) actionBlock:^{
        [textField resignFirstResponder];
        [self.accountInfoTableView reloadData];
    }];
    
    [alert showEdit:self title:title subTitle:nil closeButtonTitle:nil duration:0.0f];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (0 == section) {
        return 4;
    }
    else if (1 == section) {
        return 3;
    }
    else if (2 == section) {
        return 6;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"";
    BankAccountEditTableViewCell *cell = nil;
    
    if ((0 == indexPath.section) && (0 == indexPath.row)) {
        reuseIdentifier = @"BankAccountNameCellIdentifier";
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BankAccountEditTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    else if ((0 == indexPath.section) && (1 == indexPath.row)) {
        reuseIdentifier = @"BankAccountTypeCellIdentifier";
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BankAccountEditTableViewCell" owner:self options:nil] objectAtIndex:1];
    }
    else if ((0 == indexPath.section) && (2 == indexPath.row)) {
        reuseIdentifier = @"BankAccountCurrencyCellIdentifier";
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BankAccountEditTableViewCell" owner:self options:nil] objectAtIndex:2];
    }
    else if ((0 == indexPath.section) && (3 == indexPath.row)) {
        reuseIdentifier = @"BankAccountInitialBalanceCellIdentifier";
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BankAccountEditTableViewCell" owner:self options:nil] objectAtIndex:3];
    }
    else if ((1 == indexPath.section) && (0 == indexPath.row)) {
        reuseIdentifier = @"DefaultBankAccountCellIdentifier";
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BankAccountEditTableViewCell" owner:self options:nil] objectAtIndex:4];
    }
    else if ((1 == indexPath.section) && (1 == indexPath.row)) {
        reuseIdentifier = @"FavoriteBankAccountCellIdentifier";
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BankAccountEditTableViewCell" owner:self options:nil] objectAtIndex:5];
    }
    else if ((1 == indexPath.section) && (2 == indexPath.row)) {
        reuseIdentifier = @"BankAccountStatusCellIdentifier";
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BankAccountEditTableViewCell" owner:self options:nil] objectAtIndex:6];
    }
    else if ((2 == indexPath.section) && (0 == indexPath.row)) {
        reuseIdentifier = @"BankAccountNumberCellIdentifier";
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BankAccountEditTableViewCell" owner:self options:nil] objectAtIndex:7];
    }
    else if ((2 == indexPath.section) && (1 == indexPath.row)) {
        reuseIdentifier = @"BankAccountHeldAtCellIdentifier";
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BankAccountEditTableViewCell" owner:self options:nil] objectAtIndex:8];
    }
    else if ((2 == indexPath.section) && (2 == indexPath.row)) {
        reuseIdentifier = @"BankAccountWebsiteCellIdentifier";
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BankAccountEditTableViewCell" owner:self options:nil] objectAtIndex:9];
    }
    else if ((2 == indexPath.section) && (3 == indexPath.row)) {
        reuseIdentifier = @"BankAccountContactCellIdentifier";
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BankAccountEditTableViewCell" owner:self options:nil] objectAtIndex:10];
    }
    else if ((2 == indexPath.section) && (4 == indexPath.row)) {
        reuseIdentifier = @"BankAccountAccessInfoCellIdentifier";
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BankAccountEditTableViewCell" owner:self options:nil] objectAtIndex:11];
    }
    else if ((2 == indexPath.section) && (5 == indexPath.row)) {
        reuseIdentifier = @"BankAccountNoteCellIdentifier";
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BankAccountEditTableViewCell" owner:self options:nil] objectAtIndex:12];
    }
    
    [cell configureCellData:_account withIndexPath:indexPath];
    
    return cell;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (0 == section) {
        return @"";
    }
    else if (1 == section) {
        return NSLocalizedString(@"Bank Account Status", nil);
    }
    else if (2 == section) {
        return NSLocalizedString(@"Bank Account Bank Info", nil);
    }
    
    return @"";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    switch (textField.tag) {
        case 1:
        {
            NSString *oldName = _account.name;
            _account.name = textField.text;
            [[MMEX getAccountMgr] updateBankAccountName:_account.name byOldName:oldName];
        }
            break;
        case 2:
        {
            _account.initialCapital = [NSNumber numberWithInteger:[textField.text integerValue]];
            [[MMEX getAccountMgr] updateBankAccountInitialBalance:_account.initialCapital byName:_account.name];
        }
            break;
        case 3:
        {
            _account.merchant.number = textField.text;
            [[MMEX getAccountMgr] updateBankAccountNumber:_account.merchant.number byName:_account.name];
        }
            break;
        case 4:
        {
            _account.merchant.name = textField.text;
            [[MMEX getAccountMgr] updateBankAccountMerchantName:_account.merchant.name byName:_account.name];
        }
            break;
        case 5:
        {
            _account.merchant.webSite = textField.text;
            [[MMEX getAccountMgr] updateBankAccountMerchantWebsite:_account.merchant.webSite byName:_account.name];
        }
            break;
        case 6:
        {
            _account.merchant.telphone = textField.text;
            [[MMEX getAccountMgr] updateBankAccountMerchantTel:_account.merchant.telphone byName:_account.name];
        }
            break;
        case 7:
        {
            _account.merchant.loginInfo = textField.text;
            [[MMEX getAccountMgr] updateBankAccountMerchantLoginInfo:_account.merchant.loginInfo byName:_account.name];
        }
            break;
        default:
            break;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - 

- (void)updateEditInfo:(NSString *)info
{
    _account.merchant.note = info;
    [self.accountInfoTableView reloadData];
}

#pragma mark - actions

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
