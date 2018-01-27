//
//  GMYSignInViewController.m
//  HyphenateDemo
//
//  Created by GMY on 2018/1/25.
//  Copyright © 2018年 gmy. All rights reserved.
//

#import "GMYSignInViewController.h"

#import "GMYSignInViewModel.h"
#import "GMYRootViewControllerUtil.h"

@interface GMYSignInViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *signInBtn;

@property (nonatomic, strong) GMYSignInViewModel *signInViewModel;

@end

@implementation GMYSignInViewController

- (GMYSignInViewModel *)signInViewModel {
    if (_signInViewModel == nil) {
        _signInViewModel = [[GMYSignInViewModel alloc] init];
        _signInViewModel.signInBtn = self.signInBtn;
    }
    return _signInViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.signInViewModel.enableSignal = [[RACSignal combineLatest:@[self.usernameTF.rac_textSignal, self.passwordTF.rac_textSignal]] map:^id _Nullable(RACTuple * _Nullable value) {
        return @([value[0] length] > 0 && [value[1] length] > 0);
    }];
    
    [self.signInBtn.rac_command.executionSignals subscribeNext:^(id  _Nullable signal) {
        [signal subscribeNext:^(id  _Nullable x) {
            GMYLog(@"登录获取的信息： %@", x);
            [GMYUserViewModel share].userModel.userID = x;
            [GMYRootViewControllerUtil share].rootViewControllerStatus = GMYTabBarControllerAsRoot;
        }];
    }];
    
}

- (void)dealloc {
    GMYLog(@"%s", __func__);
}


- (IBAction)signInClick:(id)sender {
    
}



@end
