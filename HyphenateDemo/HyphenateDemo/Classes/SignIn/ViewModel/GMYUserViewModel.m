//
//  GMYUserViewModel.m
//  HyphenateDemo
//
//  Created by GMY on 2018/1/26.
//  Copyright © 2018年 gmy. All rights reserved.
//

#import "GMYUserViewModel.h"

@implementation GMYUserViewModel

static GMYUserViewModel *_userViewModel;

+ (instancetype)share {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _userViewModel = [[GMYUserViewModel alloc] init];
    });
    return _userViewModel;
}


@end
