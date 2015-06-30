//
//  NetworkManager.m
//  MyChat
//
//  Created by admin on 15/6/30.
//  Copyright (c) 2015年 ShengQiangLiu. All rights reserved.
//

#import "NetworkManager.h"
#import "UGGAppNetAPIClient.h"




@implementation NetworkManager

+ (NSURLSessionDataTask *)getUserLoginDataWithBlock:(void (^)(NSArray *posts, NSError *error))block {
    return [[UGGAppNetAPIClient sharedClient] POST:@"" parameters:nil success:^(NSURLSessionDataTask * task, id JSON) {
        
    } failure:^(NSURLSessionDataTask * task, NSError * error) {
        
    }];
}

@end
