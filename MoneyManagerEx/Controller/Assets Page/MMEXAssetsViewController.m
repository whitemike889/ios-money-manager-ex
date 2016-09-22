//
//  MMEXAssetsViewController.m
//  MoneyManagerEx
//
//  Created by taotao on 15/11/7.
//  Copyright © 2015年 taotao. All rights reserved.
//

#import "MMEXAssetsViewController.h"
#import "MMEXAddTransactionViewController.h"
#import "BankAccountViewController.h"

#define CURRENT_CURRENCY @"¥"

@interface MMEXAssetsViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *assetsTable;

@end

@implementation MMEXAssetsViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self _setupSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private method
- (void)_setupSubviews
{
    self.title = NSLocalizedString(@"Assets Summary", nil);
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewTransaction:)];
}

#pragma mark - actions
- (void)addNewTransaction:(id)sender
{
    MMEXAddTransactionViewController *addTransactionVC = [[MMEXAddTransactionViewController alloc] initWithNibName:@"MMEXAddTransactionViewController" bundle:nil];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:addTransactionVC];
    
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (0 == section) {
        return 2;
    }
    else {
        return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"reuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    }
    
    if (0 == indexPath.section) {
        if (0 == indexPath.row) {
            cell.textLabel.text = NSLocalizedString(@"All Assets", nil);
            
            NSString *allAssets = [NSString stringWithFormat:@"%@%@", CURRENT_CURRENCY, @"10000"];
            cell.detailTextLabel.text = allAssets;
        }
        else if (1 == indexPath.row) {
            cell.textLabel.text = NSLocalizedString(@"All Liabilities", nil);
            NSString *liabilities = [NSString stringWithFormat:@"%@%@", CURRENT_CURRENCY, @"-1000"];
            cell.detailTextLabel.text = liabilities;
        }
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else {
        if (0 == indexPath.row) {
            cell.textLabel.text = @"BC Bank";
            cell.detailTextLabel.text = @"6225880134510321";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        }
        else if (1 == indexPath.row) {
            cell.textLabel.text = NSLocalizedString(@"Reconciled", nil);//@"已核实";
            NSString *reconciled = [NSString stringWithFormat:@"%@%@",CURRENT_CURRENCY, @"-3000"];
            cell.detailTextLabel.text = reconciled;
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        else if (2 == indexPath.row) {
            cell.textLabel.text = NSLocalizedString(@"Balance", nil);//@"结余";
            NSString *balance = [NSString stringWithFormat:@"%@%@",CURRENT_CURRENCY, @"2000"];
            cell.detailTextLabel.text = balance;
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // 查询数据库，有多少个section
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (0 == section) {
        return nil;
    }
    else {
        //return @"BC Bank";
        return nil;
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0 == indexPath.section) {
        return 44.0;
    }
    else {
        return 44.0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (0 == section) {
        return 0.1;
    }
    else {
        return 10.0;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (1 == indexPath.section) {
        if (0 == indexPath.row) {
            BankAccountViewController *bankAccountVC = [[BankAccountViewController alloc] initWithNibName:@"BankAccountViewController" bundle:nil];
            bankAccountVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:bankAccountVC animated:YES];
        }
    }
}

@end
