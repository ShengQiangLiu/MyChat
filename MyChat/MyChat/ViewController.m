//
//  ViewController.m
//  MyChat
//
//  Created by admin on 15/6/30.
//  Copyright (c) 2015年 ShengQiangLiu. All rights reserved.
//

#import "ViewController.h"
#import <ShareSDK/ShareSDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

#pragma mark - 第三方登录
- (IBAction)SinaLoginClick:(UIButton *)sender {
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:NO
                                                                scopes:@{@(ShareTypeSinaWeibo): @[@"follow_app_official_microblog"]}
                                                         powerByHidden:YES // 隐藏右上角的图片。。。。。。。
                                                        followAccounts:nil
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:nil];
    
    [ShareSDK getUserInfoWithType:ShareTypeSinaWeibo authOptions:authOptions result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
        NSLog(@"Sina用户资料：%@", [userInfo sourceData]);

//        NSLog(@"%@", [userInfo profileImage]);
    }];
}

- (IBAction)WeChatLoginClick:(UIButton *)sender {
    [ShareSDK getUserInfoWithType:ShareTypeWeixiFav authOptions:nil result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
        NSLog(@"WeChat用户资料：%@", [userInfo sourceData]);

    }];
}

- (IBAction)QQLoginClick:(UIButton *)sender {
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:NO
                                                                scopes:@{@(ShareTypeSinaWeibo): @[@"follow_app_official_microblog"]}
                                                         powerByHidden:YES // 隐藏右上角的图片。。。。。。。
                                                        followAccounts:nil
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:nil];
    // 登录类型传 QQ空间的类型才能使用网页授权 QQ登录
    [ShareSDK getUserInfoWithType:ShareTypeQQSpace authOptions:authOptions result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
        if (result) {
            
            NSLog(@"QQ用户资料：%@", [userInfo sourceData]);
            
            
        } else {
//            NSLog(@"登录错误：%@", [error errorDescription]);
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
