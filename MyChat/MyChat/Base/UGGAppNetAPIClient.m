//
//  UGGAppNetAPIClient.m
//  MyChat
//
//  Created by admin on 15/6/30.
//  Copyright (c) 2015年 ShengQiangLiu. All rights reserved.
//

#import "UGGAppNetAPIClient.h"

static NSString * const UGGAppNetAPIBaseURLSTring = @"127.0.0.1:/8000";

@implementation UGGAppNetAPIClient

+ (instancetype)sharedClient {
    static UGGAppNetAPIClient *_sharedClient = nil;
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:UGGAppNetAPIBaseURLSTring]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    return _sharedClient;
}

@end
