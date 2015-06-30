//
//  UGGAppNetAPIClient.h
//  MyChat
//
//  Created by admin on 15/6/30.
//  Copyright (c) 2015年 ShengQiangLiu. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface UGGAppNetAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
