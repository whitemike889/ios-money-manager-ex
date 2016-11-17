//
//  EditInfoViewController.m
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/16.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "EditInfoViewController.h"

@interface EditInfoViewController ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *guideLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, weak) id<EditInfoDelegate> delegate;
@property (nonatomic, strong) NSString *subject;

@end

@implementation EditInfoViewController

- (instancetype)initWithDelegate:(id<EditInfoDelegate>)delegate subject:(NSString *)subject
{
    if (self = [self initWithNibName:@"EditInfoViewController" bundle:nil]) {
        self.delegate = delegate;
        self.subject = subject;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidEndEditingWithNofitication:) name:UITextViewTextDidEndEditingNotification object:nil];
    
    [self initControlConfig];
}

- (void)initControlConfig
{
    self.title = self.subject;
    NSString *tmpSubject = [NSString stringWithFormat:@"%@%@", NSLocalizedString(@"Input the ", nil), self.subject];
    self.guideLabel.text = tmpSubject;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [_textView resignFirstResponder];
}

- (void)textViewDidChange:(UITextView *)textView
{
    
}

#pragma mark - actions

- (void)textViewDidEndEditingWithNofitication:(NSNotification *)notification
{
    
}

- (void)done
{
    [self.textView resignFirstResponder];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(updateEditInfo:)]) {
        [self.delegate updateEditInfo:self.textView.text];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
