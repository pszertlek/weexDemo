//
//  ViewController.m
//  weexDemo
//
//  Created by apple on 2018/1/11.
//  Copyright © 2018年 BroadLink. All rights reserved.
//

#import "ViewController.h"
#import <OHHTTPStubs/OHHTTPStubs.h>
#import <AFNetworking.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest * _Nonnull request) {
        return YES;
    } withStubResponse:^OHHTTPStubsResponse * _Nonnull(NSURLRequest * _Nonnull request) {
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        NSString *fixture = [bundle pathForResource:@"example"
                                             ofType:@"json"];
        return [OHHTTPStubsResponse responseWithFileAtPath:fixture statusCode:200 headers:@{@"Content-Type":@"application/json"}];
    }];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://idont.know"
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSLog(@"%@", responseObject);
         } failure:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
