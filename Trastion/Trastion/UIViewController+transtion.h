//
//  UIViewController+transtion.h
//  Trastion
//
//  Created by ffss on 2016/11/8.
//  Copyright © 2016年 ffss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "transtionType.h"
#import "transtionProperty.h"
@interface UIViewController (transtion) <UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>

typedef void(^YYLTrasitionBlock)(transtionProperty *transitionProperty);

- (void)yyl_presentViewController:(UIViewController *)viewCotrollerToPresent animationType:(YYLTransitionAnimationType) animationType completion:(void (^)(void))completion;

-(void)yyl_presentViewController:(UIViewController *)ViewCotrollerToPresent maskTrasition:(YYLTrasitionBlock)transitionBlock;

-(void)yyl_presentViewController:(UIViewController *)ViewCotrollerToPresent maskTrasition:(YYLTrasitionBlock)transitionBlock completion:(void(^)(void))completion;
@end
