//
//  BankAccountEditViewController.m
//  MoneyManagerEx
//
//  Created by taotao on 16/9/20.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "BankAccountEditViewController.h"
#import "BankAccountEditTableViewCell.h"

@interface BankAccountEditViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation BankAccountEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.title = NSLocalizedString(@"Bank Account Edit Page Title", nil);
    self.title = @"taotao";
    self.navigationItem.leftBarButtonItem = nil;
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
    
    [cell configureCellData:nil withIndexPath:indexPath];
    
    return cell;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (0 == section) {
        return @"";
    }
    else if (1 == section) {
        return @"账户状态";
    }
    else if (2 == section) {
        return @"开户行相关信息";
    }
    
    return @"";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

#pragma mark - actions

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
