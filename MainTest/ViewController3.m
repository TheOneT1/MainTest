//
//  ViewController3.m
//  MainTest
//
//  Created by ffss on 16/8/26.
//  Copyright © 2016年 ffss. All rights reserved.
//

#import "ViewController3.h"
#import "TouchIDViewController.h"
#define VCName @"vcName"
#define VCTitle  @"VCTitle"
@interface ViewController3 ()<UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *table;
@property (nonatomic,strong)NSMutableArray *cellDataSource;
@end

@implementation ViewController3
-(NSMutableArray *)cellDataSource
{
    if (_cellDataSource == nil) {
        
        _cellDataSource = [NSMutableArray arrayWithCapacity:0];
        
        [_cellDataSource addObject:[self configVCname:NSStringFromClass([TouchIDViewController class]) VCtitle:@"指纹解锁🔓"]];
        
    }
    
    return _cellDataSource;
}
-(NSDictionary *)configVCname:(NSString *)vcName VCtitle:(NSString *)vcTitle
{
    return @{VCName : vcName, VCTitle:vcTitle};
}
-(UITableView *)table
{
    if (_table == nil) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0,64,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:0];
        _table.backgroundColor = [UIColor brownColor];
        _table.delegate = self;
        _table.dataSource = self;
    }
    return _table;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.table];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    btn.frame = CGRectMake(0, 0, 100, 100);
    
    btn.backgroundColor = [UIColor grayColor];
    
    [btn addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];

    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    NSLog(@"~~~~~~~~~~~~~~~~\n %s\n   self.navigationController.viewControllers ：%@ \n ~~~~~~~~~~",__func__,  self.navigationController.viewControllers);
    
}
#pragma mark - tableDelegate&Datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return  self.cellDataSource.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:1 reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    NSDictionary *vcInfo = self.cellDataSource[indexPath.row];
    NSString *vcTitle = vcInfo[VCTitle];
    cell.textLabel.text = vcTitle;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *vcInfo = self.cellDataSource[indexPath.row];
    NSString *vcName = vcInfo[VCName];
    Class vcClass = NSClassFromString(vcName);
    UIViewController *vc = [[vcClass alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark
- (void)action
{
//    [self.navigationController pushViewController:[ViewController3 new] animated:YES];
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
