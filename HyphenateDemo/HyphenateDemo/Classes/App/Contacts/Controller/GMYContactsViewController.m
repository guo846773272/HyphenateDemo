//
//  GMYContactsViewController.m
//  HyphenateDemo
//
//  Created by GMY on 2018/1/26.
//  Copyright © 2018年 gmy. All rights reserved.
//

#import "GMYContactsViewController.h"

#import "GMYRefresh.h"

#import "GMYContactsViewModel.h"

#import "GMYChatViewController.h"

@interface GMYContactsViewController ()

@property (nonatomic, strong) GMYContactsViewModel *contactsViewModel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end

@implementation GMYContactsViewController

- (GMYContactsViewModel *)contactsViewModel {
    if (_contactsViewModel == nil) {
        _contactsViewModel = [[GMYContactsViewModel alloc] init];
    }
    return _contactsViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self)
    
    self.tableView.delegate = self.contactsViewModel;
    self.tableView.dataSource = self.contactsViewModel;
    self.tableView.mj_header = [GMYRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewSubscribe)];
    [self.tableView.mj_header beginRefreshing];
    
    [[self.contactsViewModel rac_signalForSelector:@selector(tableView:didSelectRowAtIndexPath:)] subscribeNext:^(RACTuple * _Nullable x) {
        NSIndexPath *indexPath = x[1];
        
        @strongify(self)
        NSString *contactIDString = self.contactsViewModel.contactsList[indexPath.row];
        GMYChatViewController *chatVC = [[GMYChatViewController alloc] initWithConversationChatter:contactIDString conversationType:EMConversationTypeChat];
        chatVC.contactIDString = contactIDString;
        [self.navigationController pushViewController:chatVC animated:YES];
    }];
    
}

- (void)loadNewSubscribe {
    @weakify(self)
    [[self.contactsViewModel.getContactsRequestCommand execute:nil] subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        if ([x isKindOfClass:[NSArray class]]) {
            self.contactsViewModel.contactsList = x;
            [self.tableView reloadData];
        }
    } completed:^{
        [self.tableView.mj_header endRefreshing];
    }];
}

- (void)dealloc {
    GMYLogFunc
}

@end
