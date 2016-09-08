//
//  AppDelegate.m
//  MainTest
//
//  Created by ffss on 16/7/25.
//  Copyright © 2016年 ffss. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

#import "ViewController2.h"

#import "YLMainViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) UINavigationController *rootViewController;

@end

@implementation AppDelegate

-(UINavigationController *)rootViewController
{
    if (!_rootViewController) {
        
        _rootViewController = [[UINavigationController alloc] initWithRootViewController:[[YLMainViewController alloc] init]];
        
        _rootViewController.navigationBarHidden = YES;
        
    }
    
    return _rootViewController;

}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(initalViewController) name:@"initalViewController" object:nil];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self semaphoneSychronous]; //信号量实现同步加载
    
    self.window.rootViewController = self.rootViewController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}
-(void)initalViewController
{
    [self.rootViewController setViewControllers:@[[ViewController2 new]] animated:YES];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 利用信号量同步加载网络数据
- (void)semaphoneSychronous
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);//创建信号量
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://mlwc.dev.miaotu.net/v1/public/configs"]];
    
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSLog(@"dic = %@",dic);
        
        dispatch_semaphore_signal(semaphore);
    }];
    
    [dataTask resume];
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    NSLog(@"数据加载完成！");
    

}

@end
