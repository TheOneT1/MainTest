//
//  UIViewController+TransitionProperty.h
//  Trastion
//
//  Created by ffss on 2016/11/8.
//  Copyright © 2016年 ffss. All rights reserved.
//

#import <UIKit/UIKit.h>
@class transtionProperty;



@interface UIViewController (TransitionProperty)

typedef void(^YYLtransitionBlock)(transtionProperty *transitionPorperty);

@property (nonatomic, copy) YYLtransitionBlock yyl_callBackTransition;

@property (nonatomic, assign)BOOL yyl_delegateFlag;
@property (nonatomic, assign)BOOL yyl_addTransitionFlag;
@property (nonatomic, weak) id yyl_transitionDelegate;
@property (nonatomic, weak) id yyl_tempNavDelegate;

@end
