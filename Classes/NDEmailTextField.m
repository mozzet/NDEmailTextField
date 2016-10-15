//
//  NDEmailTextField.m
//  NDEmailTextFieldDemo
//
//  Created by KimTae jun on 2016. 10. 16..
//  Copyright © 2016년 Mozzet. All rights reserved.
//

#import "NDEmailTextField.h"

@interface NDEmailTextField ()

@property (strong, nonatomic) UILabel *domainLabel;

@end

@implementation NDEmailTextField

- (instancetype)init
{
    return [self initWithDomains:nil];
}

- (instancetype)initWithDomains:(NSArray<NSString *> *)domains
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.domains = domains;
        [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [self initWithDomains:nil];
    self.frame = frame;
    return self;
}

- (void)initialize
{
    self.keyboardType = UIKeyboardTypeEmailAddress;
    self.autocorrectionType = UITextAutocorrectionTypeNo;
    self.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    [self addTarget:self
             action:@selector(nd_emailEditingChanged:)
   forControlEvents:UIControlEventEditingChanged];
    [self addTarget:self
             action:@selector(nd_emailEditingEnded:)
   forControlEvents:UIControlEventEditingDidEnd];
    [self addTarget:self
             action:@selector(nd_emailEditingEnded:)
   forControlEvents:UIControlEventEditingDidEndOnExit];
    
    _domainTextColor = [self.class defaultDomainTextColor];
    
    _domainLabel = [[UILabel alloc] init];
    _domainLabel.font = self.font;
    _domainLabel.textColor = _domainTextColor;
    
    [self addSubview:_domainLabel];
}

#pragma mark - Action

- (void)nd_emailEditingChanged:(id)sender
{
    if (!self.text.length) {
        _domainLabel.text = @"";
        return;
    }
    if (![self.text containsString:@"@"]) {
        _domainLabel.text = @"";
        return;
    }
    
    NSString *recommendDomain = [self.class recommentDomainWithText:self.text
                                                          inDomains:_domains];
    NSString *writtenDomain = [self.text componentsSeparatedByString:@"@"].lastObject;
    
    NSString *domain = [recommendDomain stringByReplacingOccurrencesOfString:writtenDomain withString:@""];
    _domainLabel.text = domain;
    CGFloat textWidth = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}].width;
    
    _domainLabel.frame = CGRectMake(textWidth, .0f, CGRectGetWidth(self.frame) - textWidth, CGRectGetHeight(self.frame));
}

- (void)nd_emailEditingEnded:(id)sender
{
    _domainLabel.text = @"";
    if (!self.text.length) {
        return;
    }
    if (![self.text containsString:@"@"]) {
        return;
    }
    
    NSString *recommendDomain = [self.class recommentDomainWithText:self.text
                                                          inDomains:_domains];
    NSString *writtenDomain = [self.text componentsSeparatedByString:@"@"].lastObject;
    NSString *remainDomain = [recommendDomain stringByReplacingOccurrencesOfString:writtenDomain withString:@""];
    
    if (remainDomain.length) {
        self.text = [self.text stringByAppendingString:remainDomain];
    }
}

#pragma mark - Setter

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    _domainLabel.font = font;
    [self nd_emailEditingChanged:self];
}

- (void)setDomains:(NSArray<NSString *> *)domains
{
    _domains = domains ? domains : [self.class defaultDomains];
}

- (void)setDomainTextColor:(UIColor *)domainTextColor
{
    if (!domainTextColor) {
        domainTextColor = [self.class defaultDomainTextColor];
    }
    _domainTextColor = domainTextColor;
    
    _domainLabel.textColor = _domainTextColor;
    [self nd_emailEditingChanged:self];
}

#pragma mark - Data utility

+ (NSString *)recommentDomainWithText:(NSString *)text
                            inDomains:(NSArray *)domains
{
    NSString *writtenDomain = [text componentsSeparatedByString:@"@"].lastObject;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith %@", writtenDomain];
    NSArray *filteredDomains = [domains filteredArrayUsingPredicate:predicate];
    NSString *recommendDomain = filteredDomains.firstObject;
    if (!writtenDomain.length) {
        recommendDomain = domains.firstObject;
    }
    return recommendDomain;
}

+ (NSArray<NSString *> *)defaultDomains
{
    // Default domain list from `Mailcheck WIKI.`
    // https://github.com/mailcheck/mailcheck/wiki/List-of-Popular-Domains
    
    return @[@"aol.com", @"att.net", @"comcast.net", @"facebook.com", @"gmail.com", @"gmx.com", @"googlemail.com", @"google.com", @"hotmail.com", @"hotmail.co.uk", @"mac.com", @"me.com", @"mail.com", @"msn.com", @"live.com", @"sbcglobal.net", @"verizon.net", @"yahoo.com", @"yahoo.co.uk", @"email.com", @"games.com", @"gmx.net", @"hush.com", @"hushmail.com", @"icloud.com", @"inbox.com", @"lavabit.com", @"love.com", @"outlook.com", @"pobox.com", @"rocketmail.com", @"safe-mail.net", @"wow.com", @"ygm.com", @"ymail.com", @"zoho.com", @"fastmail.fm", @"yandex.com", @"bellsouth.net", @"charter.net", @"comcast.net", @"cox.net", @"earthlink.net", @"juno.com", @"btinternet.com", @"virginmedia.com", @"blueyonder.co.uk", @"freeserve.co.uk", @"live.co.uk", @"ntlworld.com", @"o2.co.uk", @"orange.net", @"sky.com", @"talktalk.co.uk", @"tiscali.co.uk", @"virgin.net", @"wanadoo.co.uk", @"bt.com", @"sina.com", @"qq.com", @"naver.com", @"hanmail.net", @"daum.net", @"nate.com", @"yahoo.co.jp", @"yahoo.co.kr", @"yahoo.co.id", @"yahoo.co.in", @"yahoo.com.sg", @"yahoo.com.ph", @"hotmail.fr", @"live.fr", @"laposte.net", @"yahoo.fr", @"wanadoo.fr", @"orange.fr", @"gmx.fr", @"sfr.fr", @"neuf.fr", @"free.fr", @"gmx.de", @"hotmail.de", @"live.de", @"online.de", @"t-online.de", @"web.de", @"yahoo.de", @"mail.ru", @"rambler.ru", @"yandex.ru", @"ya.ru", @"list.ru", @"hotmail.be", @"live.be", @"skynet.be", @"voo.be", @"tvcablenet.be", @"telenet.be", @"hotmail.com.ar", @"live.com.ar", @"yahoo.com.ar", @"fibertel.com.ar", @"speedy.com.ar", @"arnet.com.ar", @"hotmail.com", @"gmail.com", @"yahoo.com.mx", @"live.com.mx", @"yahoo.com", @"hotmail.es", @"live.com", @"hotmail.com.mx", @"prodigy.net.mx", @"msn.com", @"yahoo.com.br", @"hotmail.com.br", @"outlook.com.br", @"uol.com.br", @"bol.com.br", @"terra.com.br", @"ig.com.br", @"itelefonica.com.br", @"r7.com", @"zipmail.com.br", @"globo.com", @"globomail.com", @"oi.com.br"
             ];
}

#pragma mark - View utility

+ (UIColor *)defaultDomainTextColor
{
    return [UIColor colorWithRed:191.f/255.f
                           green:191.f/255.f
                            blue:198.f/255.f alpha:1.f];
}

@end
