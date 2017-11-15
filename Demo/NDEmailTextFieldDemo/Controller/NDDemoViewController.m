//
//  NDDemoViewController.m
//  NDEmailTextFieldDemo
//
//  Created by KimTae jun on 2016. 10. 16..
//  Copyright © 2016년 Mozzet. All rights reserved.
//

#import "NDDemoViewController.h"

// View
#import "NDEmailTextField.h"

@interface NDDemoViewController ()

@property (strong, nonatomic) NDEmailTextField *defaultTextField;
@property (strong, nonatomic) NDEmailTextField *customTextField;

@end

@implementation NDDemoViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"NDEmailTextField";
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _defaultTextField = [[NDEmailTextField alloc] init];
    
    _defaultTextField.placeholder = @"Basic text field";
    _defaultTextField.layer.borderWidth = 1;

//    If you want to apply inset
    
//    _defaultTextField.leftView = leftView;
//    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, _defaultTextField.frame.size.height)];
//    _defaultTextField.leftViewMode = UITextFieldViewModeAlways;

//    or
    
    _defaultTextField.edgeInsets = UIEdgeInsetsMake(0, 8, 0, 0);
    
    _customTextField = [[NDEmailTextField alloc] initWithDomains:@[@"mozzet.com"]];
    _customTextField.font = [UIFont fontWithName:@"AmericanTypewriter-CondensedBold" size:20.f];
    _customTextField.textColor = [UIColor redColor];
    _customTextField.domainTextColor = [UIColor purpleColor];
    _customTextField.placeholder = @"Custom text field";
    
    [self.view addSubview:_defaultTextField];
    [self.view addSubview:_customTextField];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [_defaultTextField becomeFirstResponder];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self relayout];
}

#pragma mark - Layout

- (void)relayout
{
    CGFloat textFieldMargin = 10.f;
    CGFloat textFieldWidth = CGRectGetWidth(self.view.frame) - textFieldMargin * 2.0f;
    CGFloat textFieldHeight = 50.f;
    _defaultTextField.frame = CGRectMake(textFieldMargin, 74.f, textFieldWidth, textFieldHeight);
    _customTextField.frame = CGRectMake(textFieldMargin, 134.f, textFieldWidth, textFieldHeight);
}

@end
