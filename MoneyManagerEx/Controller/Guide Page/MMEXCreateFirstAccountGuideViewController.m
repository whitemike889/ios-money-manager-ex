//
//  MMEXCreateFirstAccountGuideViewController.m
//  MoneyManagerEx
//
//  Created by taotao on 15/11/1.
//  Copyright © 2015年 taotao. All rights reserved.
//

#import "MMEXCreateFirstAccountGuideViewController.h"
#import "MMEXSelectDefaultCurrencyViewController.h"
#import "MMEXDoneSettingGuideProtocol.h"

@interface MMEXCreateFirstAccountGuideViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *inputDescription;

@property (weak, nonatomic) IBOutlet UITextField *accountName;

- (IBAction)nextStepClicked:(id)sender;

@end

@implementation MMEXCreateFirstAccountGuideViewController

#pragma mark - life circle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupSubviews];
    [_accountName becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private method
- (void)setupSubviews
{
    //self.title = NSLocalizedString(@"create new count title", nil);//@"create new account";
    self.navigationItem.title = NSLocalizedString(@"create new count title", nil);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissCurrentPage)];
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    [self.view addGestureRecognizer:tapGR];
}

#pragma mark - actions

- (void)dismissCurrentPage
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)nextStepClicked:(id)sender
{
    MMEXSelectDefaultCurrencyViewController *selectDefaultCurrencyPage = [[MMEXSelectDefaultCurrencyViewController alloc] initWithNibName:@"MMEXSelectDefaultCurrencyViewController" bundle:nil];
    [self.navigationController pushViewController:selectDefaultCurrencyPage animated:YES];
}

- (void)keyboardHide:(UIGestureRecognizer *)gestureRecognizer
{
    [_accountName resignFirstResponder];
}


#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self keyboardHide:nil];
    [self nextStepClicked:nil];
    
    return YES;
}
@end
