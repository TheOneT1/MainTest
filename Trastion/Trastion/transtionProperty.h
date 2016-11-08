//
//  transtionProperty.h
//  Trastion
//
//  Created by ffss on 2016/11/8.
//  Copyright © 2016年 ffss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "transtionType.h"
#include <UIKit/UIKit.h>
@interface transtionProperty : NSObject


// 转场时间
@property (nonatomic,assign) NSTimeInterval ainimationTime;

// 转场方式
@property (nonatomic,assign) YYLTransitionType transitionType;

// 转场动画
@property (nonatomic,assign) YYLTransitionAnimationType animationTye;


//是否支持手势返回
@property (nonatomic,assign) BOOL backGestureEnable;

// 等待动画中的起始图
@property (nonatomic,strong) UIView * startView;

// 等待结束的结束图
@property (nonatomic,strong) UIView * endView;


@end
