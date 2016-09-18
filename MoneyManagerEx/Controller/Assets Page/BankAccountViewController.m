//
//  BankAccountViewController.m
//  MoneyManagerEx
//
//  Created by taotao on 16/9/18.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "BankAccountViewController.h"

@interface BankAccountViewController ()

@end

@implementation BankAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = _bankAccountName;
    self.navigationItem.leftBarButtonItem = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
