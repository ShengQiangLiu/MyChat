//
//  NetworkManager.h
//  MyChat
//
//  Created by admin on 15/6/30.
//  Copyright (c) 2015年 ShengQiangLiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject
+ (NSURLSessionDataTask *)getUserLoginDataWithBlock:(void (^)(NSArray *posts, NSError *error))block;

@end
