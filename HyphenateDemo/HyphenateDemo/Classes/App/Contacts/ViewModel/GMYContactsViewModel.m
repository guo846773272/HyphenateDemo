//
//  GMYContactsViewModel.m
//  HyphenateDemo
//
//  Created by GMY on 2018/1/27.
//  Copyright © 2018年 gmy. All rights reserved.
//

#import "GMYContactsViewModel.h"



@interface GMYContactsViewModel ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation GMYContactsViewModel

- (instancetype)init {
    if (self = [super init]) {
        
        [self bind];
    }
    return self;
}

- (void)bind {
    
    @weakify(self)
    self.getContactsRequestCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            
            @strongify(self)
            [self loadNewSuccess:^(NSArray *contactsList) {
                [subscriber sendNext:contactsList];
            } failture:^(EMError *aError) {
                [subscriber sendNext:aError];
            } completed:^{
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }];
}

- (void)loadNewSuccess:(void(^)(NSArray *contactsList))success failture:(void(^)(EMError *aError))failture completed:(void(^)(void))completed {
    
    //从服务器获取所有的好友
    [[EMClient sharedClient].contactManager getContactsFromServerWithCompletion:^(NSArray *aList, EMError *aError) {
        if (!aError) {
            NSLog(@"获取成功");
            success(aList);
        } else {
            failture(aError);
        }
        completed();
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"联系人";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contactsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    NSString *contactIDString = self.contactsList[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", contactIDString];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@(indexPath.row)];
        [subscriber sendCompleted];
        return nil;
    }];
}

@end
