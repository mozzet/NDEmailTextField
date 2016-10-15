//
//  AppDelegate.m
//  NDEmailTextFieldDemo
//
//  Created by KimTae jun on 2016. 10. 16..
//  Copyright © 2016년 Mozzet. All rights reserved.
//

#import "AppDelegate.h"

// View controller
#import "NDDemoViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NDDemoViewController *demoController = [[NDDemoViewController alloc] init];
    UINavigationController *rootController = [[UINavigationController alloc] initWithRootViewController:demoController];
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    _window = [[UIWindow alloc] initWithFrame:screenBounds];
    _window.rootViewController = rootController;
    [_window makeKeyAndVisible];
    
    return YES;
}

@end
