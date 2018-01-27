//
//  GMYConversationListViewController.m
//  HyphenateDemo
//
//  Created by GMY on 2018/1/26.
//  Copyright © 2018年 gmy. All rights reserved.
//

#import "GMYConversationListViewController.h"

@interface GMYConversationListViewController ()

@end

@implementation GMYConversationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    实现上拉加载功能
    self.showRefreshFooter = YES;
//    实现下拉加载（刷新）功能
    self.showRefreshHeader = YES;
}

- (void)tableViewDidTriggerFooterRefresh {
    //子类需要重写此方法
    
}

- (void)tableViewDidTriggerHeaderRefresh {
    //子类需要重写此方法
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    EaseMessageViewController *chatController = [[EaseMessageViewController alloc] initWithConversationChatter:@"8002" conversationType:EMConversationTypeChat];
    [self.navigationController pushViewController:chatController animated:YES];
}



@end
