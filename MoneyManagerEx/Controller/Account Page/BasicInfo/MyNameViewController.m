//
//  MyNameViewController.m
//  MoneyManagerEx
//
//  Created by taotao on 16/9/24.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "MyNameViewController.h"
#import "MMEX.h"

@interface MyNameViewController ()

@property (weak, nonatomic) IBOutlet UITextField *myNameTextField;

@end

@implementation MyNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = _navTitle;
    self.myNameTextField.placeholder = self.placeHolder;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    [self.myNameTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - actions

- (void)save {
    [self.myNameTextField resignFirstResponder];
    [[MMEX getLoginAccountMgr] updateLoginUserName:self.myNameTextField.text];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)cancel {
    [self.myNameTextField resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
