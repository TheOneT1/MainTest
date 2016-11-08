//
//  ViewController.m
//  YKTabBarViewController
//
//  Created by ffss on 2016/10/21.
//  Copyright © 2016年 ffss. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame =  CGRectMake(100, 100, 100, 100);
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [self request];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)request
{
    NSMutableURLRequest *requestM = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://api2.mlwancan.com/v1/public/configs"]];
    requestM.HTTPMethod = @"GET";
   
//    NSString *bodystring = [NSString stringWithFormat:@"content=%@&pic=%@",_feedContent,multiPictureString];
//    requestM.HTTPBody = [bodystring dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:requestM completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
             NSLog(@"~~~~~~~~~~~~~~~~\n %s\n dict ：%@ \n ~~~~~~~~~~",__func__,dict);
        }
    } ];
    [dataTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
