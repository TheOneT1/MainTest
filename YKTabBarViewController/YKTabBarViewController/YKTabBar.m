//
//  YKTabBar.m
//  YKTabBarViewController
//
//  Created by ffss on 2016/10/21.
//  Copyright © 2016年 ffss. All rights reserved.
//

#import "YKTabBar.h"
#import "YKTabBarCommonItem.h"
#import "UIView+Extension.h"
#import "YKTabBarCenterItem.h"

@interface YKTabBar()
/**
 *  选中的按钮
 */
@property (nonatomic, weak) UIButton *selectItemButton;
@property (nonatomic, weak) YKTabBarCenterItem *bigButton;
@end

@implementation YKTabBar
static NSInteger const TabBarTagBaseValue = 12000;


- (void)setItems:(NSArray *)items
{
    _items = items;
    
    for (NSInteger i=0; i < items.count; i++) {
        UITabBarItem *item = items[i];
        
        if (i ==  items.count/2) {
            
            YKTabBarCenterItem *bigBtn = [YKTabBarCenterItem buttonWithType:UIButtonTypeCustom];
            bigBtn.tag = self.subviews.count + TabBarTagBaseValue;
            // 设置图片
            [bigBtn setImage:item.image forState:UIControlStateNormal];
            [bigBtn setImage:item.selectedImage forState:UIControlStateSelected];
            bigBtn.adjustsImageWhenHighlighted = NO;
            
            [bigBtn addTarget:self action:@selector(btnClcik:) forControlEvents:UIControlEventTouchDown];
            
            [self addSubview:bigBtn];
            self.bigButton = bigBtn;
            
        }else{
            
            YKTabBarCommonItem *itemBtn = [YKTabBarCommonItem buttonWithType:UIButtonTypeCustom];
            itemBtn.tag = self.subviews.count + TabBarTagBaseValue;
            // 设置图片
            [itemBtn setImage:item.image forState:UIControlStateNormal];
            [itemBtn setImage:item.selectedImage forState:UIControlStateSelected];
            itemBtn.adjustsImageWhenHighlighted = NO;
            // 设置文字
            [itemBtn setTitle:item.title forState:UIControlStateNormal];
            itemBtn.item = item;
            
            [itemBtn setTitleColor:[UIColor colorWithRed:113/255.0 green:109/255.0 blue:104/255.0 alpha:1] forState:UIControlStateNormal];
            [itemBtn setTitleColor:[UIColor colorWithRed:51/255.0 green:135/255.0 blue:255/255.0 alpha:1] forState:UIControlStateSelected];
            [itemBtn addTarget:self action:@selector(btnClcik:) forControlEvents:UIControlEventTouchDown];
            
            [self addSubview:itemBtn];
            
            if (self.subviews.count == 1) {
                // 默认选中第一个
                [self btnClcik:itemBtn];
            }

        }
        
       
    }
}

- (void)btnClcik:(UIButton *)itemButton
{
    _selectItemButton.selected = NO;
    
    itemButton.selected = YES;
    
    _selectItemButton = itemButton;
    
    if (_delegate && [_delegate respondsToSelector:@selector(tabBar:didSelectButtonItemIndex:)]) {
        
        [_delegate tabBar:self didSelectButtonItemIndex:itemButton.tag -TabBarTagBaseValue];
    }
}

/**
 *  外界设置索引页跟着跳转
 */
- (void)setSeletedIndex:(NSInteger)seletedIndex {
    _selectedYKIndex = seletedIndex;
    UIButton *button = [self viewWithTag:(TabBarTagBaseValue + seletedIndex)];
    [self btnClcik:button];
}

- (void)layoutSubviews
{
    NSUInteger count = self.subviews.count;
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = [UIScreen mainScreen].bounds.size.width/count;
    
    CGFloat h = self.height;
    
    //修改中间按钮的大小
    for (int i = 0; i < count; i++) {
        
        UIButton *btn = self.subviews[i];
        x = i * w;
        if (i == 2) {
            
            y = -10;
            h = self.height + 12;
        }else{
            y = 0;
            h = self.height;
        }
        
        btn.frame = CGRectMake(x, y, w, h);
    }

}
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    // 这里宽度应该跟突出部分的宽度一样，减少点击反应区域
    CGFloat pointW = 48;
    CGFloat pointH = 61;
    CGFloat pointX = ([UIScreen mainScreen].bounds.size.width - pointW) / 2;
    CGFloat pointY = -10;
    CGRect rect = CGRectMake(pointX, pointY+10, pointW, pointH);
    if (CGRectContainsPoint(rect, point)) {
        return self.bigButton;
    }
    
    self.backgroundColor = [UIColor colorWithRed:37/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    return [super hitTest:point withEvent:event];
}
@end
