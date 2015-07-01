//
//  SocketServer.m
//  SocketChat
//
//  Created by admin on 15/6/10.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "SocketServer.h"
#import "GCDAsyncSocket.h"
#import "DDLog.h"
#import "DDTTYLogger.h"


const int ddLogLevel = LOG_LEVEL_INFO;
const NSString *HOST = @"0.0.0.0";
const NSInteger PORT = 9997;
const CGFloat TIMEOUT = 3;

@interface SocketServer () <GCDAsyncSocketDelegate> {
    GCDAsyncSocket *_asyncSocket;
    NSTimer *_timer;
}

@end

@implementation SocketServer
+ (SocketServer *)sharedInstance {
    static SocketServer *socketServer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        socketServer = [[self alloc] init];
    });
    
    return socketServer;
}

- (void)dealloc {
    [_timer invalidate];
}

- (instancetype)init {
    if (self = [super init]) {
        [DDLog addLogger:[DDTTYLogger sharedInstance]];
    }
    return self;
}

- (void)heartBeat {
    
    [_asyncSocket readDataWithTimeout:TIMEOUT tag:0];
    
}

- (BOOL)connectToServer {
    
    NSString * host = [NSString stringWithFormat:@"%@", HOST];
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    _asyncSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:mainQueue];
    DDLogInfo(@"Connecting to %@ on part %ld !", host, (long)PORT);
    NSError *error = nil;
    return [_asyncSocket connectToHost:host onPort:PORT withTimeout:TIMEOUT error:&error];
    
}

- (void)disConnectServer {
    
    [_asyncSocket disconnect];
    
}


// 发送消息
- (void)sendMessage {
    
    NSString *messageStr = @"Wo Cao";
    
//    NSData *data = [[NSData alloc] initWithBase64EncodedString:messageStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSData *data = [messageStr dataUsingEncoding:NSUTF8StringEncoding];
    [_asyncSocket writeData:data withTimeout:TIMEOUT tag:1];
    
}

// 接收消息
- (void)receiveMessage {
    
    
    
}


#pragma mark - Socket Delegate
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
    
    DDLogInfo(@"socket:%p didConnectToHost:%@ port:%hu", sock, host, port);
//    _timer = [NSTimer scheduledTimerWithTimeInterval:TIMEOUT target:self selector:@selector(heartBeat) userInfo:nil repeats:YES];
    
    [_asyncSocket readDataWithTimeout:TIMEOUT tag:0];
    
}

- (void)socketDidSecure:(GCDAsyncSocket *)sock {
    
    DDLogInfo(@"socketDidSecure:%p", sock);
    
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    
    DDLogInfo(@"socket:%p didReadData:withTag:%ld", sock, tag);
    NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    DDLogInfo(@"socket Response:\n%@", responseString);
    
}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag {
    DDLogInfo(@"socket:%p didWriteDataWithTag:%ld", sock, tag);
    
}

- (NSTimeInterval)socket:(GCDAsyncSocket *)sock shouldTimeoutReadWithTag:(long)tag
                 elapsed:(NSTimeInterval)elapsed
               bytesDone:(NSUInteger)length {
    DDLogInfo(@"shouldTimeoutReadWithTag:%ld", tag);
    
    return 5;
    
}

- (NSTimeInterval)socket:(GCDAsyncSocket *)sock shouldTimeoutWriteWithTag:(long)tag
                 elapsed:(NSTimeInterval)elapsed
               bytesDone:(NSUInteger)length {
    DDLogInfo(@"shouldTimeoutWriteWithTag:%ld", tag);
    
    return 5;
    
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
    DDLogInfo(@"socket Did Disconnect:%p withError: %@", sock, err);
    
}

@end


