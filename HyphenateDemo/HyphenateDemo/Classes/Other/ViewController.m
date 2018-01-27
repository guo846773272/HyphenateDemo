//
//  ViewController.m
//  HyphenateDemo
//
//  Created by GMY on 2018/1/24.
//  Copyright © 2018年 gmy. All rights reserved.
//

#import "ViewController.h"

#import <Hyphenate/Hyphenate.h>
#import <EaseUI/EaseUI.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)signInEM:(id)sender {
    [[EMClient sharedClient] loginWithUsername:@"8001"
                                      password:@"111111"
                                    completion:^(NSString *aUsername, EMError *aError) {
                                        if (!aError) {
                                            NSLog(@"登录成功");
                                        } else {
                                            NSLog(@"登录失败");
                                        }
                                    }];
}
    

- (IBAction)initialSignalChatPage:(id)sender {
    //环信ID:@"8001"
    //聊天类型:EMConversationTypeChat
    EaseMessageViewController *chatController = [[EaseMessageViewController alloc] initWithConversationChatter:@"8001" conversationType:EMConversationTypeChat];
    [self.navigationController pushViewController:chatController animated:YES];
}
    
- (IBAction)createGroup:(id)sender {
    EMError *error = nil;
    EMGroupOptions *setting = [[EMGroupOptions alloc] init];
    setting.maxUsersCount = 500;
    setting.style = EMGroupStylePublicOpenJoin;// 创建不同类型的群组，这里需要才传入不同的类型
    EMGroup *group = [[EMClient sharedClient].groupManager createGroupWithSubject:@"群组名称" description:@"群组描述" invitees:@[@"6001",@"6002"] message:@"邀请您加入群组" setting:setting error:&error];
    if(!error){
        NSLog(@"创建成功 -- %@",group);
    }
}
    
- (IBAction)initialGroupChatPage:(id)sender {
    //群ID:@"groupId"
    //聊天类型:EMConversationTypeGroupChat
    EaseMessageViewController *chatController = [[EaseMessageViewController alloc] initWithConversationChatter:@"groupId" conversationType:EMConversationTypeGroupChat];
    [self.navigationController pushViewController:chatController animated:YES];
}
    
- (IBAction)addContact:(id)sender {
    [[EMClient sharedClient].contactManager addContact:@"8001"
                                               message:@"我想加您为好友"
                                            completion:^(NSString *aUsername, EMError *aError) {
                                                if (!aError) {
                                                    NSLog(@"邀请发送成功");
                                                }
                                            }];
}
- (IBAction)agreeApply:(id)sender {
    //同意好友申请
    [[EMClient sharedClient].contactManager approveFriendRequestFromUser:@"8001"
                                                              completion:^(NSString *aUsername, EMError *aError) {
                                                                  if (!aError) {
                                                                      NSLog(@"同意好友成功");
                                                                  }
                                                              }];
}
    
- (IBAction)refuseApply:(id)sender {
    //同意好友申请
    [[EMClient sharedClient].contactManager approveFriendRequestFromUser:@"8001"
                                                              completion:^(NSString *aUsername, EMError *aError) {
                                                                  if (!aError) {
                                                                      NSLog(@"同意好友成功");
                                                                  }
                                                              }];
}
    
- (IBAction)deleteContact:(id)sender {
    // 删除好友
    [[EMClient sharedClient].contactManager deleteContact:@"8002"
                                     isDeleteConversation: YES
                                               completion:^(NSString *aUsername, EMError *aError) {
                                                   if (!aError) {
                                                       NSLog(@"删除成功");
                                                   }
                                               }];
}
    
- (IBAction)getContact:(id)sender {
    //从服务器获取所有的好友
    [[EMClient sharedClient].contactManager getContactsFromServerWithCompletion:^(NSArray *aList, EMError *aError) {
        if (!aError) {
            NSLog(@"获取成功");
        }
    }];
    //从数据库获取所有的好友
    NSArray *userlist = [[EMClient sharedClient].contactManager getContacts];
    NSLog(@"%@", userlist);
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
