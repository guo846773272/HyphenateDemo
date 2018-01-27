//
//  GMYHTTPSessionManager.h
//  HyphenateDemo
//
//  Created by GMY on 2018/1/25.
//  Copyright © 2018年 gmy. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface GMYHTTPSessionManager : AFHTTPSessionManager

+ (instancetype)share;

- (NSURLSessionDataTask *)GMY_GET:(NSString *)URLString
                       parameters:(id)parameters
                         progress:(void (^)(NSProgress *downloadProgress))downloadProgress
                          success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                          failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;

@end
