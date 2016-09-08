//
//  ViewController.m
//  MainTest
//
//  Created by ffss on 16/7/25.
//  Copyright © 2016年 ffss. All rights reserved.
//

#import "ViewController.h"

#import "ViewController2.h"

#import "TouchIDViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>

@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated
{
   
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
//    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
//    self.navigationController.interactivePopGestureRecognizer.delegate = self;
//
//    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
//    
//    btn.frame = CGRectMake(0, 0, 100, 100);
//    
//    btn.backgroundColor = [UIColor whiteColor];
//    
//    [btn addTarget:self action:@selector(notion3) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:btn];
//    
//     NSLog(@"~~~~~~~~~~~~~~~~\n %s\n   self.navigationController.viewControllers ：%@ \n ~~~~~~~~~~",__func__,  self.navigationController.viewControllers);
//    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)notion
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"initalViewController" object:nil];
}

- (void)notion2
{
    [self.navigationController pushViewController:[ViewController2 new] animated:YES];
}
-(void)notion3
{
    [self.navigationController pushViewController:[TouchIDViewController new] animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@",event);
}
@end
