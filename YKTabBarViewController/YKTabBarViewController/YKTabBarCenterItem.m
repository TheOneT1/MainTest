//
//  YKTabarCenterItem.m
//  YKTabBarViewController
//
//  Created by ffss on 2016/10/21.
//  Copyright © 2016年 ffss. All rights reserved.
//

#import "YKTabBarCenterItem.h"
#import "UIView+Extension.h"
@implementation YKTabBarCenterItem

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //设置图片的内容模式
        self.imageView.contentMode = UIViewContentModeCenter;
        
        //        UIView *bgView = [[UIView alloc] init];
        //        bgView.backgroundColor = [UIColor colorWithRed:37/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
        //
        //        [self insertSubview:bgView atIndex:0];
        //
        //        self.bgView = bgView;
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.width = self.currentImage.size.width;
    self.imageView.height = self.currentImage.size.height;
    self.imageView.x = (self.width-self.imageView.width)/2;
    self.imageView.y = self.y/2;
    
    //    self.bgView.width = 48;
    //    self.bgView.height = self.height;
    //    self.bgView.x = (self.width-self.imageView.width)/2;
    //    self.bgView.y = 0;
}

-(void)setHighlighted:(BOOL)highlighted
{
    
}


@end
