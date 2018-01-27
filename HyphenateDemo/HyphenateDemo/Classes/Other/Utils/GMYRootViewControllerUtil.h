//
//  GMYRootViewControllerUtil.h
//  HyphenateDemo
//
//  Created by GMY on 2018/1/25.
//  Copyright © 2018年 gmy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    GMYSignInViewControllerAsRoot,
    GMYTabBarControllerAsRoot
} GMYRootViewControllerStatus;

@interface GMYRootViewControllerUtil : NSObject

@property (nonatomic ,assign) GMYRootViewControllerStatus rootViewControllerStatus;

+ (instancetype)share;

@end
