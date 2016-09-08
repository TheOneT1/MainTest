//
//  TouchIDViewController.m
//  MainTest
//
//  Created by ffss on 16/8/31.
//  Copyright © 2016年 ffss. All rights reserved.
//

#import "TouchIDViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface TouchIDViewController ()

@end

@implementation TouchIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    LAContext *context = [[LAContext alloc] init];
    
    // 指纹识别失败时的右边提示按钮信息
    context.localizedFallbackTitle = @"忘记密码";
    
    NSError *error = nil;
    
     // 是否支持指纹识别
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"请按home键指纹解锁🔓" reply:^(BOOL success, NSError * _Nullable error) {
            
            if (success) {
                
                NSLog(@"成功解锁");
                
                dispatch_async (dispatch_get_main_queue(), ^{
                    
                    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"解锁🔓成功！" preferredStyle:UIAlertControllerStyleAlert];
                    
                    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel
                                                                          handler:^(UIAlertAction * action) {
                                
                                                                          }];
                    
                    [alert addAction:defaultAction];
                    
                    [self presentViewController:alert animated:YES completion:^{
                        
                    }];
                    
                });
                
            }else{
                
                [self fallBackWithError:error];
            }
            
        }];
        
    }else // 不支持指纹识别
    {
        [self touchIDNotSupportWithError:error];
        
        dispatch_async (dispatch_get_main_queue(), ^{
            
         UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"错误提示" message:@"您的设备没有触摸ID." preferredStyle:UIAlertControllerStyleAlert];
            
            [self presentViewController:alert animated:YES completion:^{
                
            }];
          
        });

    }
}

#pragma mark

-(void)touchIDNotSupportWithError:(NSError *)error
{

    NSLog(@"~~~~~~~~~~~~~~~~\n %s\n error ：%@ \n ~~~~~~~~~~",__func__,error.localizedDescription);
    
    switch (error.code) {
        case LAErrorTouchIDNotEnrolled:
        {
            NSLog(@"TouchID is not enrolled");
            break;
        }
        case LAErrorPasscodeNotSet:
        {
            NSLog(@"A passcode has not been set");
            break;
        }
        default:
        {
            NSLog(@"TouchID not available");
            break;
        }
    }

}
-(void)fallBackWithError:(NSError *)error
{
    NSLog(@"~~~~~~~~~~~~~~~~\n %s\n error ：%@ \n ~~~~~~~~~~",__func__,error.localizedDescription);
    
    switch (error.code) {
        {
        case LAErrorSystemCancel:
            {
                NSLog(@"系统取消授权，如其他APP切入");
                break;
            }
        case LAErrorUserCancel:
            {
                NSLog(@"用户取消验证Touch ID");
                break;
            }
        case LAErrorAuthenticationFailed:
            {
                NSLog(@"授权失败");
                break;
            }
        case LAErrorPasscodeNotSet:
            {
                NSLog(@"系统未设置密码");
                break;
            }
        case LAErrorTouchIDNotAvailable:
            {
                NSLog(@"设备Touch ID不可用，例如未打开");
                break;
            }
        case LAErrorTouchIDNotEnrolled:
            {
                NSLog(@"设备Touch ID不可用，用户未录入");
                break;
            }
        case LAErrorUserFallback:
            {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    NSLog(@"用户选择输入密码，切换主线程处理");
                }];
                break;
            }
        default:
            {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    NSLog(@"其他情况，切换主线程处理");
                }];
                break;
            }
        }
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
