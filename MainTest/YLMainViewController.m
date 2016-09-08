//
//  YLMainViewController.m
//  MainTest
//
//  Created by ffss on 16/8/31.
//  Copyright © 2016年 ffss. All rights reserved.
//

#import "YLMainViewController.h"
#import "ViewController.h"
#import "ViewController2.h"
#import "ViewController3.h"
typedef NS_ENUM(NSInteger,MainTabType) {
    FirstVC,
    SecondVC,
    ThirdVC
};

@interface YLMainViewController ()

@end

#define TabbarCount 3
#define TabbarVC @"vc"
#define TabbarTitle @"title"
#define TabbarImage @"image"
#define TabbarSelectedImage @"selectedImage"
#define TabbarItemBadgeValue @"badgeValue"

@implementation YLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self setUpSubNav];
    
    // Do any additional setup after loading the view.
}
-(NSArray *)tabBars
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    for (NSInteger tabar = 0; tabar < TabbarCount; tabar ++) {
        
        [items addObject:@(tabar)]; // @() 初始化对象
    }
    
    return items;
}

-(void)setUpSubNav
{
    NSMutableArray *navArray = [[NSMutableArray alloc] init];
       [self.tabBars enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSDictionary *item = [self vcInfoTabType:[obj integerValue]];
        NSString *vcName = [item objectForKey:@"vc"];
        NSString *vcTitle = item[TabbarTitle];
        NSString *imageName = item[TabbarImage];
        NSString *selectedImageName = item[TabbarSelectedImage];
        Class classzz = NSClassFromString(vcName);
           
        UIViewController *vc = [[classzz alloc] initWithNibName:nil bundle:nil];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:vcTitle image:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        nav.tabBarItem.tag = idx;
        [navArray addObject:nav];
    }];
   
    self.viewControllers = navArray;
}

-(NSDictionary *)vcInfoTabType:(MainTabType)type
{
    
    switch (type) {
            
        case FirstVC:
            return @{
                     
                     TabbarVC            :@"ViewController",
                     TabbarTitle         :@"左边",
                     TabbarImage         :@"",
                     TabbarSelectedImage :@""
                     
                     };
            break;
            case SecondVC:
            return @{
                     
                     TabbarVC            :@"ViewController2",
                     TabbarTitle         :@"中",
                     TabbarImage         :@"",
                     TabbarSelectedImage :@""
                     
                     };
            case ThirdVC:
            return @{
                     
                     TabbarVC            :@"ViewController3",
                     TabbarTitle         :@"右边",
                     TabbarImage         :@"",
                     TabbarSelectedImage :@""
                     
                     };
        default:
            break;
    }
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
