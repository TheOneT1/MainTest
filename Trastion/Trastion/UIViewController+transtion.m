//
//  UIViewController+transtion.m
//  Trastion
//
//  Created by ffss on 2016/11/8.
//  Copyright © 2016年 ffss. All rights reserved.
//

#import "UIViewController+transtion.h"
#import <objc/runtime.h>
@implementation UIViewController (transtion)

+ (void)load

{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method newMethod = class_getClassMethod(self.class, @selector(yyl_dismissViewControllerAnimationed:completion:));
        
        Method oldmethod = class_getClassMethod(self.class, @selector(dismissViewControllerAnimated:completion:));
        
        method_exchangeImplementations(newMethod, oldmethod);
    });
}



- (void)yyl_presentViewController:(UIViewController *)viewCotrollerToPresent completion:(void (^)(void))completion;
{
    [self yyl_presentViewController:viewCotrollerToPresent maskTrasition:nil completion:completion];
}


- (void)yyl_presentViewController:(UIViewController *)viewCotrollerToPresent animationType:(YYLTransitionAnimationType)animationType completion:(void (^)(void))completion
{
    [self yyl_presentViewController:viewCotrollerToPresent maskTrasition:^(transtionProperty *transitionProperty) {
        
        transitionProperty.animationTye = animationType;
        
    } completion:completion];
    
}

-(void)yyl_presentViewController:(UIViewController *)ViewCotrollerToPresent maskTrasition:(YYLTrasitionBlock)transitionBlock completion:(void(^)(void))completion;
{
    
}

-(void)yyl_dismissViewControllerAnimationed:(BOOL)flag completion:(void (^) (void))completion {
    
}

@end
