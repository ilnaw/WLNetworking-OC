//
//  ViewController.m
//  WLNetworking
//
//  Created by wanli on 16/9/22.
//  Copyright © 2016年 wanli. All rights reserved.
//

#import "ViewController.h"
#import "WLNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSString *url = @"http://itunes.apple.com/lookup?id=1032652386";
//    [WLNetworking Get:url success:^(NSDictionary *object) {
//        NSLog(@"%@",object);
//    } fail:^(id object) {
//        
//    }];
    
//    NSString *url = @"http://www.didoxy.com/v2.3/api/userBalance?";
//    NSDictionary *dic = @{@"userID":@"13"};
//    [WLNetworking Post:url param:dic success:^(NSDictionary *object) {
//        NSLog(@"%@",object);
//    } fail:^(id object) {
//        NSLog(@"%@",object);
//    }];
    
    NSString *url = @"http://120.27.44.129:8080/ddong/mobile/index/updateUserHeadImg.shtml";
    UIImage *image = [UIImage imageNamed:@"hehe.jpg"];
    [WLNetworking UploadImage:url param:@{@"id":@"d2PYea76h8o="} name:@"file" imageArray:@[image] progress:^(int64_t completedUnitCount, int64_t totalUnitCount) {

    } success:^(NSDictionary *object) {
        NSLog(@"%@",object);
    } error:^(id object) {
        
    }];
}


@end
