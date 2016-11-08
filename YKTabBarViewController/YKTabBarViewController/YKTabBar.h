//
//  YKTabBar.h
//  YKTabBarViewController
//
//  Created by ffss on 2016/10/21.
//  Copyright © 2016年 ffss. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YKTabBar;
@protocol YKTabBarDelegate <NSObject>

@optional

- (void) tabBar:(YKTabBar *)tabBar didSelectButtonItemIndex:(NSInteger)index;

@end

@interface YKTabBar : UIView
{
    UIButton *firstItem,*secondItems,*thirdItems;
}

@property(nonatomic,weak) id <YKTabBarDelegate> delegate;
@property(nonatomic,assign) NSInteger selectedYKIndex;
@property(nonatomic,strong) NSArray *items;

@end
