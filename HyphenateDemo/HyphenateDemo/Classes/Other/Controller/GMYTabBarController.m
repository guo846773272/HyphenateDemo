//
//  GMYTabBarController.m
//  HyphenateDemo
//
//  Created by GMY on 2018/1/25.
//  Copyright © 2018年 gmy. All rights reserved.
//

#import "GMYTabBarController.h"

#import "GMYNavigationController.h"
#import "GMYConversationListViewController.h"
#import "GMYContactsViewController.h"
#import "GMYSettingViewController.h"

@interface GMYTabBarController ()

@end

@implementation GMYTabBarController

+ (void)initialize {
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = GMYGlobalPrimaryColor;
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildVc:[[GMYConversationListViewController alloc] init] title:@"会话" image:@"tabbar_message" selectedImage:@"tabbar_message_highlighted"];
    [self setupChildVc:[[GMYContactsViewController alloc] init] title:@"通讯录" image:@"tabbar_app" selectedImage:@"tabbar_app_highlighted"];
    [self setupChildVc:[[GMYSettingViewController alloc] init] title:@"设置" image:@"tabbar_me" selectedImage:@"tabbar_me_highlighted"];
    
    self.selectedIndex = self.childViewControllers.count / 2;
}

- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    GMYNavigationController *nav = [[GMYNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}


@end
