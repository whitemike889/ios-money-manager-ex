//
//  TransactionTypeListViewController.m
//  MoneyManagerEx
//
//  Created by taotao on 16/9/18.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "TransactionTypeListViewController.h"
#import "SubTransactionTypeListViewController.h"

@interface TransactionTypeListViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation TransactionTypeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = NSLocalizedString(@"Transaction Type List Title", nil);
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTransactionTypeButtonPressed)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SubTransactionTypeListViewController *subTransactionTypeList = [[SubTransactionTypeListViewController alloc] initWithNibName:@"SubTransactionTypeListViewController" bundle:nil];
    [self.navigationController pushViewController:subTransactionTypeList animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (0 == section) {
        return 5;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"TransactionTypeTableViewCellIdenfier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    cell.textLabel.text = @"Food";
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark - actions

- (void)addTransactionTypeButtonPressed
{
    
}

@end
