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
#import "UserInfoModel.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "MMEX.h"
#import "LoginInfoModel.h"

#define AVATAR_ROW_IDENTIFIER @"EditAvatar"
#define NICKNAME_ROW_IDENTIFIER @"EditNickname"
#define TRUENAME_ROW_IDENTIFIER @"EditTrueName"
#define GENDER_ROW_IDENTIFIER @"EditGender"
#define BIRTHDAY_ROW_IDENTIFIER @"EditBirthday"

#define MyInfoName @"name"

@interface CurrentUserBasicInfoViewController ()<UITableViewDelegate, UITableViewDataSource, GenderPickerDelegate, DatePickerViewDelegate,EditBasicInfoDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, weak) IBOutlet UITableView *basicInfoTableView;

@property (nonatomic, strong) MMEXGenderPickerView *genderPickerView;

@property (nonatomic, strong) MMEXDatePickerView *datePickerView;

@property (nonatomic, strong) NSArray *identifiers;

@property (nonatomic, strong) UIImage *currentAvatar;

@property (nonatomic, strong) UserInfoModel *myInfo;

@end

@implementation CurrentUserBasicInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = NSLocalizedString(@"Personal Information", nil);
//    [self initViewEvent];
    [self initData];
}

- (void)dealloc
{
    [self.myInfo removeObserver:self forKeyPath:@"name"];
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

- (void)initData
{
    
}

#pragma mark - action

#pragma mark - getter and setter
-(UserInfoModel *)myInfo
{
    if (!_myInfo) {
        _myInfo = [MMEX getLoginAccountMgr].loginInfo.user;
        
        [self.myInfo addObserver:self
                           forKeyPath:@"name"
                              options:NSKeyValueObservingOptionNew |NSKeyValueObservingOptionOld
                              context:nil];

    }
    
    return _myInfo;
}

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
            myNameVC.navTitle = NSLocalizedString(@"name", nil);
            myNameVC.placeHolder = self.myInfo.name;
            
            [self.navigationController pushViewController:myNameVC animated:YES];
        }
            break;
//        case 2:
//        {
//            MyNameViewController *myNameVC = [[MyNameViewController alloc] initWithNibName:@"MyNameViewController" bundle:nil];
//            myNameVC.navTitle = NSLocalizedString(@"truename", nil);
//            [self.navigationController pushViewController:myNameVC animated:YES];
//        }
//            break;
        case 2:
        {
            [self hideGenderPickerView:NO];
        }
            break;
        case 3:
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
        return 4;
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
    
    cell.delegate = self;
    [cell configureCellDataOnSection:indexPath.section row:indexPath.row data:self.myInfo];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:((NSString *)kUTTypeImage)]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
        self.myInfo.avatarImg = image;
        [self.basicInfoTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - GenderPickerViewDelegate

- (void)didSelectGender:(NSInteger)gender
{
    [self hideGenderPickerView:YES];
    self.myInfo.gender = [NSNumber numberWithInteger:gender];
    
    [self.basicInfoTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:3 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark - DatePickerViewDelegate

- (void)didSelectDate:(NSDate *)date
{
    [self hideDatePickerView:YES];
    self.myInfo.birthday = [NSNumber numberWithLongLong:[date timeIntervalSince1970]];
    
    [self.basicInfoTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:3 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark - EditBasicInfoDelegate

- (void)avatarBtnPressed
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *takePhoto = [UIAlertAction actionWithTitle:NSLocalizedString(@"Take Photo", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self takePhoto];
    }];
    [alertController addAction:takePhoto];
    UIAlertAction *choosePhoto = [UIAlertAction actionWithTitle:NSLocalizedString(@"Choose Photo", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:choosePhoto];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil) style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:alertAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - kvo

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context
{
    if ([keyPath isEqualToString:@"name"]) {
        [self.basicInfoTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    }
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

- (void)takePhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.allowsEditing = YES;
    // 设置导航默认标题的颜色及字体大小
    picker.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                 NSFontAttributeName : [UIFont boldSystemFontOfSize:18]};
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)choosePhoto
{
    
}

@end
