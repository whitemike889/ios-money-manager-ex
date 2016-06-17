//
//  MMEXStartPageViewController.m
//  MoneyManagerEx
//
//  Created by taotao on 15/11/3.
//  Copyright © 2015年 taotao. All rights reserved.
//

#import "MMEXStartPageViewController.h"
#import "MMEXCreateFirstAccountGuideViewController.h"

@interface MMEXStartPageViewController ()
@property (weak, nonatomic) IBOutlet UIButton *createNewAccountBtn;
@property (weak, nonatomic) IBOutlet UIButton *loadFromDBBtn;
- (IBAction)createNewAccountBtnClicked:(id)sender;
- (IBAction)loadFromDBBtnClicked:(id)sender;

@end

@implementation MMEXStartPageViewController

#pragma mark - life circle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - actions

- (IBAction)createNewAccountBtnClicked:(id)sender {
     MMEXCreateFirstAccountGuideViewController *createAccountVC = [[MMEXCreateFirstAccountGuideViewController alloc] initWithNibName:@"MMEXCreateFirstAccountGuideViewController" bundle:nil];
     
     UINavigationController *navController = [[UINavigationController alloc] init];
    navController.navigationBar.translucent = NO;
    [navController pushViewController:createAccountVC animated:YES];
    
    [self presentViewController:navController animated:YES completion:nil];
}

- (IBAction)loadFromDBBtnClicked:(id)sender
{
    
}

@end
