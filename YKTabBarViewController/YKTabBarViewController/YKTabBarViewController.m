//
//  YKTabBarViewController.m
//  YKTabBarViewController
//
//  Created by ffss on 2016/10/21.
//  Copyright © 2016年 ffss. All rights reserved.
//
#define KCTTabbarHeight 49
#import "YKTabBarViewController.h"
#import "YKTabBar.h"

#import "ViewController1.h"
@interface YKTabBarViewController() <UITabBarControllerDelegate,YKTabBarDelegate>

@property (nonatomic,strong) YKTabBar *myTabbar;
/** 保存所有控制器对应按钮的内容（UITabBarItem）*/
@property (nonatomic, strong) NSMutableArray *items;
@end
@implementation YKTabBarViewController

-(NSMutableArray *)items
{
    if (_items == nil) {
        
        _items = [NSMutableArray array];
    }
    
    return _items;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 隐藏系统的 tabBar
    self.tabBar.hidden  = YES;
    
    // 移除
    [self.tabBar removeFromSuperview];
    
    //把系统的 tabbar 上的按钮干掉
    for (UIView *childView in self.tabBar.subviews) {
        
        if (![childView isKindOfClass:[YKTabBar class]]) {
            [childView removeFromSuperview];
        }
    }

}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
    
     //添加所有子控制器
    [self addAllChildVC];
    
    //自定义 TabBar
    [self setUpTabBar];
    
}

#pragma mark - 自定义 tabBar
-(void)setUpTabBar
{
    YKTabBar *tabBar = [[YKTabBar alloc] init];
    tabBar.items = self.items;
    tabBar.delegate = self;
    tabBar.backgroundColor = [UIColor colorWithRed:37/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    tabBar.frame = self.tabBar.frame;
    [self.view addSubview:tabBar];
    
    self.myTabbar = tabBar;
}


#pragma mark - 添加所有的子控制器
-(void)addAllChildVC
{
    //初始化子控制器
    ViewController1 *firstVC = [[ViewController1 alloc] init];
    firstVC.view.backgroundColor = [UIColor whiteColor];
    [self addOneChildVC:firstVC title:@"轨迹导航" imageName:@"tabbar_1" SelectedImageName:@"tabbar_1"];
    
    ViewController1 *twoVC = [[ViewController1 alloc] init];
    twoVC.view.backgroundColor = [UIColor grayColor];;
    [self addOneChildVC:twoVC title:@"大数据" imageName:@"tabbar_2" SelectedImageName:@"tabbar_2"];
    
    ViewController1 *centerVC = [[ViewController1 alloc]init];
    centerVC.view.backgroundColor = [UIColor whiteColor];
    [self addOneChildVC:centerVC title:nil imageName:@"funfit"
      SelectedImageName:@"funfit_seleted"];
    
    ViewController1 *fourVC = [[ViewController1 alloc] init];
    fourVC.view.backgroundColor = [UIColor brownColor];
    [self addOneChildVC:fourVC title:@"手表助手" imageName:@"tabbar_3" SelectedImageName:@"tabbar_3"];
    
    ViewController1 *fiveVC = [[ViewController1 alloc] init];
    fiveVC.view.backgroundColor = [UIColor yellowColor];;
    [self addOneChildVC:fiveVC title:@"设置" imageName:@"tabbar_1" SelectedImageName:@"tabbar_1"];
    
}
-(void)addOneChildVC:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imagename SelectedImageName:(NSString *)selectedimageName{
    //设置标题
    childVc.tabBarItem.title = title;
    //设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imagename];
    //设置选中的图片
    UIImage *selectedImage = [UIImage imageNamed:selectedimageName];
    //不要渲染
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;
    
    //记录所有控制器对应按钮的内容
    [self.items addObject:childVc.tabBarItem];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    nav.delegate = self;
    [nav setNavigationBarHidden:YES];
    [self addChildViewController:nav];
}


#pragma mark - 

- (void)tabBar:(YKTabBar *)tabBar didSelectButtonItemIndex:(NSInteger)index
{
    // 调用父类方法实现页面切换
    [super setSelectedIndex:index];
}

-(void)setSelectedIndex:(NSUInteger)selectedIndex
{
    //通过MyTabBar 的通知处理页面切换
    self.myTabbar.selectedYKIndex = selectedIndex;
}

#pragma mark - navigation 代理方法
-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIViewController *root = navigationController.viewControllers.firstObject;
    self.tabBar.hidden = YES;
    if (viewController != root) {
        
        //从 firstController 移除
        [self.myTabbar removeFromSuperview];
        
        //调整 tabBar 的 Y 值
        CGRect dockFrame = self.myTabbar.frame;
        dockFrame.origin.y = root.view.frame.size.height - KCTTabbarHeight;
        if ([root.view isKindOfClass:[UIScrollView class]]) {
            //根控制器是能滚动的
            UIScrollView *scrollView = (UIScrollView *)root.view;
            dockFrame.origin.y += scrollView.contentOffset.y;
        }
        
        self.myTabbar.frame = dockFrame;
        
        //添加 dock 到根控制器界面
        [root.view addSubview:self.myTabbar];
    }
}

/**
 *  安全展示后 调用
 */
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIViewController *root = navigationController.viewControllers.firstObject;

    if (viewController == root) {
        
        // 更改导航控制器view的frame
        navigationController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - KCTTabbarHeight);
        
        // 让Dock从root上移除
        [_myTabbar removeFromSuperview];
        
        //_mytabbar添加dock到HomeViewController
        _myTabbar.frame = self.tabBar.frame;
        [self.view addSubview:_myTabbar];
    }
    
}

@end
