//
//  NDEmailTextField.h
//  NDEmailTextFieldDemo
//
//  Created by KimTae jun on 2016. 10. 16..
//  Copyright © 2016년 Mozzet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NDEmailTextField : UITextField

/**
 * Domain list, be recommended. 
 * If you set this property as nil, it will be reset to default domain list.
 * Default domain list: https://github.com/mailcheck/mailcheck/wiki/List-of-Popular-Domains
 */
@property (null_resettable, strong, nonatomic) NSArray<NSString *> *domains;

/**
 * The text color for the domain.
 * If you set this property as nil, it will be reset to default text color.
 * The default text color is rgba(191, 191, 198, 1).
 */
@property (null_resettable, weak, nonatomic) UIColor *domainTextColor;

/**
 * The insets for the textView.
 * If you set this property as nil, it will be reset to default inset.
 * The default insets is UIEdgeInsetsMake(0, 0, 0, 0).
 */
@property (nonatomic, assign) UIEdgeInsets edgeInsets;

/**
 Initialize and return `NDEmailTextField` with domain list.

 @param domains Domain list, be recommended. If you set this property as nil, this will be reset to default domain list.

 @return `NDEmailTextField`, initialized with domain list.
 */
- (nullable instancetype)initWithDomains:(nullable NSArray<NSString *> *)domains NS_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder NS_UNAVAILABLE;

@end
