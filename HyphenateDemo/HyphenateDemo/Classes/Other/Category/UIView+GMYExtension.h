//
//  UIView+GMYExtension.h
//  daydao
//
//  Created by GMY on 2017/3/2.
//  Copyright © 2017年 Mingk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GMYExtension)

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

+ (instancetype)viewFromNib;

@end
