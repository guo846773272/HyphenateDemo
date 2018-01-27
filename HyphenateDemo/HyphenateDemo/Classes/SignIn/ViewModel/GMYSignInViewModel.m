//
//  GMYSignInViewModel.m
//  HyphenateDemo
//
//  Created by GMY on 2018/1/26.
//  Copyright © 2018年 gmy. All rights reserved.
//

#import "GMYSignInViewModel.h"

@implementation GMYSignInViewModel

- (instancetype)init {
    if (self = [super init]) {
        
//        [self bind];
    }
    return self;
}

- (void)setEnableSignal:(RACSignal *)enableSignal {
    _enableSignal = enableSignal;
    
    self.signInBtn.rac_command = [[RACCommand alloc] initWithEnabled:enableSignal signalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [[EMClient sharedClient] loginWithUsername:@"8001"
                                              password:@"111111"
                                            completion:^(NSString *aUsername, EMError *aError) {
                                                if (!aError) {
                                                    GMYLog(@"登录成功");
                                                    [subscriber sendNext:aUsername];
                                                } else {
                                                    GMYLog(@"登录失败");
                                                    [subscriber sendNext:aError];
                                                }
                                                [subscriber sendCompleted];
                                            }];
            return nil;
        }];
    }];
}

//- (void)bind {
//}

@end
