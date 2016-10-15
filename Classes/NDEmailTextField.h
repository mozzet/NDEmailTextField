//
//  NDEmailTextField.h
//  NDEmailTextFieldDemo
//
//  Created by KimTae jun on 2016. 10. 16..
//  Copyright © 2016년 Mozzet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NDEmailTextField : UITextField

@property (null_resettable, strong, nonatomic) NSArray<NSString *> *domains;
@property (null_resettable, weak, nonatomic) UIColor *domainTextColor;

- (nullable instancetype)initWithDomains:(nullable NSArray<NSString *> *)domains NS_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder NS_UNAVAILABLE;

@end
