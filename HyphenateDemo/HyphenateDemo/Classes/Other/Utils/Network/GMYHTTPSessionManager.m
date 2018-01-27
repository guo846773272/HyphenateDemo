//
//  GMYHTTPSessionManager.m
//  HyphenateDemo
//
//  Created by GMY on 2018/1/25.
//  Copyright © 2018年 gmy. All rights reserved.
//

#import "GMYHTTPSessionManager.h"

@implementation GMYHTTPSessionManager

static GMYHTTPSessionManager *_manager;

+ (instancetype)share {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [GMYHTTPSessionManager manager];
        _manager = [GMYHTTPSessionManager manager];
//        _manager.requestSerializer.timeoutInterval = 5;
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json" ,@"text/javascript", @"text/plain", nil];
    });
    return _manager;
}

- (NSURLSessionDataTask *)GMY_GET:(NSString *)URLString
                       parameters:(id)parameters
                         progress:(void (^)(NSProgress *downloadProgress))downloadProgress
                          success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                          failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    void (^successCallback)(NSURLSessionDataTask *, id) = ^(NSURLSessionDataTask *task, id responseObject) {
        success(task, responseObject);
    };
    void (^failureCallback)(NSURLSessionDataTask *, NSError *) = ^(NSURLSessionDataTask * task, NSError *error) {
        failure(task, error);
    };
    
    NSURLSessionDataTask *task = [[GMYHTTPSessionManager share] GET:URLString parameters:parameters progress:downloadProgress success:successCallback failure:failureCallback];
    return task;
}

@end
