//
//  GMYUserViewModel.h
//  HyphenateDemo
//
//  Created by GMY on 2018/1/26.
//  Copyright © 2018年 gmy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GMYUserModel.h"

@interface GMYUserViewModel : NSObject

@property (nonatomic, strong) GMYUserModel *userModel;

+ (instancetype)share;

@end
