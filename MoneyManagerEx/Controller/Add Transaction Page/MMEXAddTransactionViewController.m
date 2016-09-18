//
//  MMEXAddTransactionViewController.m
//  MoneyManagerEx
//
//  Created by taotao on 15/11/7.
//  Copyright © 2015年 taotao. All rights reserved.
//

#import "MMEXAddTransactionViewController.h"

@interface MMEXAddTransactionViewController ()

@end

@implementation MMEXAddTransactionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = NSLocalizedString(@"Add Transaction", nil);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAddTransaction)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - actions

- (void)cancelAddTransaction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)save
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
