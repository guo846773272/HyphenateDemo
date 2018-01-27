//
//  GMYSignInViewModel.h
//  HyphenateDemo
//
//  Created by GMY on 2018/1/26.
//  Copyright © 2018年 gmy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMYSignInViewModel : NSObject

@property (nonatomic, strong) UIButton *signInBtn;

@property (nonatomic, strong) RACSignal *enableSignal;

@end
