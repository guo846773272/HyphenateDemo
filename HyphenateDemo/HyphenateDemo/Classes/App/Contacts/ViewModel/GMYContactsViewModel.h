//
//  GMYContactsViewModel.h
//  HyphenateDemo
//
//  Created by GMY on 2018/1/27.
//  Copyright © 2018年 gmy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMYContactsViewModel : NSObject

@property (nonatomic, strong) RACCommand *getContactsRequestCommand;
@property (nonatomic, strong) NSArray *contactsList;

@end
