//
//  CurrentUserBasicInfoViewController.m
//  MoneyManagerEx
//
//  Created by taotao on 16/6/17.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "CurrentUserBasicInfoViewController.h"
#import "EditBasicInfoTableViewCell.h"

#define AVATAR_ROW_IDENTIFIER @"EditAvatar"
#define NICKNAME_ROW_IDENTIFIER @"EditNickname"
#define TRUENAME_ROW_IDENTIFIER @"EditTrueName"
#define GENDER_ROW_IDENTIFIER @"EditGender"
#define BIRTHDAY_ROW_IDENTIFIER @"EditBirthday"

@interface CurrentUserBasicInfoViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *basicInfoTableView;

@property (nonatomic, strong) NSArray *identifiers;

@end

@implementation CurrentUserBasicInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = NSLocalizedString(@"Personal Information", nil);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init

- (void)initTableViewCellIdentifier
{
    _identifiers = [[NSArray alloc] initWithObjects:AVATAR_ROW_IDENTIFIER, NICKNAME_ROW_IDENTIFIER, TRUENAME_ROW_IDENTIFIER, GENDER_ROW_IDENTIFIER, BIRTHDAY_ROW_IDENTIFIER, nil];
}

#pragma mark - action



#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 3:
        {
            
        }
            break;
        case 4:
        {
            
        }
            break;
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0 == indexPath.row) {
        return 190;
    }
    else {
        return 60;
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 5;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_identifiers == nil || _identifiers.count <= indexPath.row) {
        NSAssert(@"_identifiers is error", nil);
    }
    
    NSString *reuseIdentifier = [_identifiers objectAtIndex:indexPath.row];
    
    EditBasicInfoTableViewCell *cell = (EditBasicInfoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = (EditBasicInfoTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"EditBasicInfoTableViewCell" owner:self options:nil] objectAtIndex:indexPath.row];
     }

    [cell configureCellDataOnSection:indexPath.section row:indexPath.row];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

@end
