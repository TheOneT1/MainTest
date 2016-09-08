//
//  ViewController2.m
//  MainTest
//
//  Created by ffss on 16/7/25.
//  Copyright © 2016年 ffss. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController3.h"

@interface ViewController2 ()<UIGestureRecognizerDelegate>

@end

@implementation ViewController2
-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"~~~~~~~~~~~~~~~~\n %s\n ViewController2 ：%@ \n ~~~~~~~~~~",__func__,self);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
//    self.navigationController.interactivePopGestureRecognizer.delegate = self;
//    
//      NSLog(@"~~~~~~~~~~~~~~~~\n %s\n   self.navigationController.viewControllers ：%@ \n ~~~~~~~~~~",__func__,  self.navigationController.viewControllers);
//    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
//    
//    btn.frame = CGRectMake(0, 0, 100, 100);
//    
//    btn.backgroundColor = [UIColor grayColor];
//    
//    [btn addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:btn];
//    
//    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
//    
//    btn1.frame = CGRectMake(120, 0, 100, 100);
//    
//    btn1.backgroundColor = [UIColor grayColor];
//    
//    [btn1 addTarget:self action:@selector(action2) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:btn1];
//    
  


    // Do any additional setup after loading the view.
}

- (void)action
{
    
   
////    NSArray *viewControllers  = self.navigationController.viewControllers;
//    
    NSArray *viewControllers2 = @[self.navigationController.viewControllers[0],[ViewController3 new],[ViewController2 new]];
    
    [self.navigationController setViewControllers:viewControllers2];
}
-(void)action2
{
     [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
