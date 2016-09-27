//
//  CurrentUserBasicInfoViewController.m
//  MoneyManagerEx
//
//  Created by taotao on 16/6/17.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "CurrentUserBasicInfoViewController.h"
#import "EditBasicInfoTableViewCell.h"
#import "MyNameViewController.h"
#import "MMEXGenderPickerView.h"
#import "MMEXDatePickerView.h"

#define AVATAR_ROW_IDENTIFIER @"EditAvatar"
#define NICKNAME_ROW_IDENTIFIER @"EditNickname"
#define TRUENAME_ROW_IDENTIFIER @"EditTrueName"
#define GENDER_ROW_IDENTIFIER @"EditGender"
#define BIRTHDAY_ROW_IDENTIFIER @"EditBirthday"

@interface CurrentUserBasicInfoViewController ()<UITableViewDelegate, UITableViewDataSource, GenderPickerDelegate, DatePickerViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *basicInfoTableView;

@property (nonatomic, strong) MMEXGenderPickerView *genderPickerView;

@property (nonatomic, strong) MMEXDatePickerView *datePickerView;

@property (nonatomic, strong) NSArray *identifiers;

@end

@implementation CurrentUserBasicInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = NSLocalizedString(@"Personal Information", nil);
//    [self initViewEvent];
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
    [self hideGenderPickerView:YES];
    [self hideDatePickerView:YES];
    
    switch (indexPath.row) {
        case 1:
        {
            MyNameViewController *myNameVC = [[MyNameViewController alloc] initWithNibName:@"MyNameViewController" bundle:nil];
            myNameVC.navTitle = NSLocalizedString(@"nickname", nil);
            [self.navigationController pushViewController:myNameVC animated:YES];
        }
            break;
        case 2:
        {
            MyNameViewController *myNameVC = [[MyNameViewController alloc] initWithNibName:@"MyNameViewController" bundle:nil];
            myNameVC.navTitle = NSLocalizedString(@"truename", nil);
            [self.navigationController pushViewController:myNameVC animated:YES];
        }
            break;
        case 3:
        {
            [self hideGenderPickerView:NO];
        }
            break;
        case 4:
        {
            [self hideDatePickerView:NO];
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

#pragma mark - GenderPickerViewDelegate

- (void)didSelectGender:(NSInteger)gender
{
    [self hideGenderPickerView:YES];
    if (0 == gender) {
        
    }
    else if (1 == gender) {
        
    }
}

#pragma mark - DatePickerViewDelegate

- (void)didSelectDate:(NSDate *)date
{
    [self hideDatePickerView:YES];
}

#pragma mark - private method

- (MMEXGenderPickerView *)genderPickerView
{
    if (!_genderPickerView) {
        _genderPickerView = [[[NSBundle mainBundle] loadNibNamed:@"MMEXGenderPickerView" owner:self options:nil] objectAtIndex:0];
        _genderPickerView.frame = CGRectMake(0, self.view.frame.size.height, _genderPickerView.frame.size.width, _genderPickerView.frame.size.height);
        _genderPickerView.delegate = self;
        _genderPickerView.invisible = YES;
        [self.view addSubview:_genderPickerView];
    }
    
    return _genderPickerView;
}

- (MMEXDatePickerView *)datePickerView
{
    if (!_datePickerView) {
        _datePickerView = [[[NSBundle mainBundle] loadNibNamed:@"MMEXDatePickerView" owner:self options:nil] objectAtIndex:0];
        _datePickerView.frame = CGRectMake(0, self.view.frame.size.height, _datePickerView.frame.size.width, _datePickerView.frame.size.height);
        _datePickerView.delegate = self;
        _datePickerView.invisible = YES;
        [self.view addSubview:_datePickerView];
    }
    
    return _datePickerView;
}

- (void)hideGenderPickerView:(BOOL)hide
{
    if (hide && (_genderPickerView == nil)) {
        return;
    }
    
    if (!hide && !_genderPickerView) {
        [self genderPickerView];
    }
    
    if (hide == _genderPickerView.invisible) {
        return;
    }
    
    [UIView animateWithDuration:0.3f
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         CGRect oldRect = self.genderPickerView.frame;
                         CGFloat poistionY = (hide ? self.view.frame.size.height : (self.view.frame.size.height - _genderPickerView.frame.size.height));
                         
                         _genderPickerView.frame = CGRectMake(0, poistionY, oldRect.size.width, oldRect.size.height);
                         _genderPickerView.invisible = hide;
    }
                     completion:nil];
}

- (void)hideDatePickerView:(BOOL)hide
{
    if (hide && (_datePickerView == nil)) {
        return;
    }
    
    if (!hide && !_datePickerView) {
        [self datePickerView];
    }
    
    if (hide == _datePickerView.invisible) {
        return;
    }
    
    [UIView animateWithDuration:0.3f
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         CGRect oldRect = self.datePickerView.frame;
                         CGFloat poistionY = (hide ? self.view.frame.size.height : (self.view.frame.size.height - self.datePickerView.frame.size.height));
                         
                         self.datePickerView.frame = CGRectMake(0, poistionY, oldRect.size.width, oldRect.size.height);
                         self.datePickerView.invisible = hide;
                     }
                     completion:nil];
}

@end
