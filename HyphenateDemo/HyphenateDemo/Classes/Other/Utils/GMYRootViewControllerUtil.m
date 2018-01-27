//
//  GMYRootViewControllerUtil.m
//  HyphenateDemo
//
//  Created by GMY on 2018/1/25.
//  Copyright © 2018年 gmy. All rights reserved.
//

#import "GMYRootViewControllerUtil.h"

#import <UIKit/UIKit.h>

#import "GMYSignInViewController.h"
#import "GMYTabBarController.h"

@implementation GMYRootViewControllerUtil

static GMYRootViewControllerUtil *_rootViewControllerUtil;

+ (instancetype)share {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _rootViewControllerUtil = [[GMYRootViewControllerUtil alloc] init];
    });
    return _rootViewControllerUtil;
}

- (void)setRootViewControllerStatus:(GMYRootViewControllerStatus)rootViewControllerStatus {
    _rootViewControllerStatus = rootViewControllerStatus;
    
    UIViewController *rootVC = nil;
    
    switch (rootViewControllerStatus) {
            case GMYSignInViewControllerAsRoot: {
                rootVC = [[GMYSignInViewController alloc] init];
            }
            break;
            case GMYTabBarControllerAsRoot: {
                rootVC = [[GMYTabBarController alloc] init];
            }
            break;
            
        default: {
            rootVC = [[GMYTabBarController alloc] init];
        }
            break;
    }
    GMYKeyWindow.rootViewController = rootVC;
}



@end
