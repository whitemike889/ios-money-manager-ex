//
//  MMEXSelectDefaultCurrencyViewController.m
//  MoneyManagerEx
//
//  Created by taotao on 15/11/7.
//  Copyright © 2015年 taotao. All rights reserved.
//

#import "MMEXSelectDefaultCurrencyViewController.h"
#import "MMEXSetFavoriteSubAccountViewController.h"

@interface MMEXSelectDefaultCurrencyViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *currencyTable;

@end

@implementation MMEXSelectDefaultCurrencyViewController

#pragma mark - life circle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupSubviews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.currencyTable selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIndentifier = @"CurrencyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIndentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIndentifier];
    }
    
    cell.textLabel.text = @"RMB";
    if ((indexPath.row == 0) && (indexPath.section == 0)) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        cell.selected = YES;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selected = NO;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark - setup subviews
- (void)setupSubviews
{
//    self.title = NSLocalizedString(@"Select default currency", nil);
    self.navigationItem.title = NSLocalizedString(@"Select default currency", nil);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"next", nil) style:UIBarButtonItemStylePlain target:self action:@selector(doneClicked)];
    self.navigationItem.leftBarButtonItem = nil;
}

#pragma mark - actions

- (void)doneClicked
{
    MMEXSetFavoriteSubAccountViewController *setFavoriteSubAccountVC = [[MMEXSetFavoriteSubAccountViewController alloc] initWithNibName:@"MMEXSetFavoriteSubAccountViewController" bundle:nil];
    
    [self.navigationController pushViewController:setFavoriteSubAccountVC animated:YES];
}

@end
