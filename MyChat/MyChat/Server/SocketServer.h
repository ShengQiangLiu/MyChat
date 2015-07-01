//
//  SocketServer.h
//  SocketChat
//
//  Created by admin on 15/6/10.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SocketServer : NSObject
+ (SocketServer *)sharedInstance;

// 连接服务器
- (BOOL)connectToServer;

// 断开服务器连接
- (void)disConnectServer;

// 发送消息
- (void)sendMessage;


@end
