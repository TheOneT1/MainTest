//
//  YKTabBarButton.m
//  YKTabBarViewController
//
//  Created by ffss on 2016/10/21.
//  Copyright © 2016年 ffss. All rights reserved.
//

#import "YKTabBarCommonItem.h"
#import "UIView+Extension.h"
@implementation YKTabBarCommonItem

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.titleLabel.font =        // 1.设置字体
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.adjustsImageWhenHighlighted = NO;
        // 2.图片的内容模式
        self.imageView.contentMode = UIViewContentModeCenter;

    }
    return self;
}


- (void)setItem:(UITabBarItem *)item
{
    _item = item;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 文字位置
    
    self.titleLabel.x = 0;
    self.titleLabel.width = self.width;
    self.titleLabel.height = 16;
    self.titleLabel.y = self.height - self.titleLabel.height;
    
    self.imageView.width = self.currentImage.size.width;
    self.imageView.height = self.currentImage.size.height;
    self.imageView.x = (self.width - self.imageView.width) / 2;
    self.imageView.y = self.titleLabel.y - self.imageView.height - 4;
}

@end
