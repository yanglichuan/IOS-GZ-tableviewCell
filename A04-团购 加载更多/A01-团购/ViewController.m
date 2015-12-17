//
//  ViewController.m
//  A01-团购
//
//  Created by Apple on 14/12/19.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZGroupBuying.h"
#import "CZGroupBuyingCell.h"
#import "CZFooterView.h"
#import "CZHeaderView.h"
@interface ViewController () <UITableViewDataSource,CZFooterViewDelegate>
@property (nonatomic, strong) NSMutableArray *groupBuyings;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController


//1 懒加载
- (NSMutableArray *)groupBuyings
{
    if (_groupBuyings ==nil) {
        _groupBuyings = [CZGroupBuying groupBuyingsList];
    }
    return _groupBuyings;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //2 测试数据
    //设置行高
    self.tableView.rowHeight = 80;
    
    //设置tableView的footer
    CZFooterView *footerView = [CZFooterView footerView];
    
    //
    footerView.delegate = self;
    
    self.tableView.tableFooterView = footerView;
    
    //设置tableView的header
    
    self.tableView.tableHeaderView = [CZHeaderView headerView];
    
}

//3 实现数据源的方法
#pragma mark - tableView数据源的方法
//返回每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.groupBuyings.count;
}
//返回每行显示的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1 创建可重用的自定义的cell
    CZGroupBuyingCell *cell = [CZGroupBuyingCell groupBuyingCellWithTableView:tableView];
    
    //2 设置cell内部的子控件
    CZGroupBuying *gb = self.groupBuyings[indexPath.row];
    cell.groupBuying = gb;
    //3 返回
    return cell;
}


#pragma mark - footerView的代理方法
- (void)footerViewDidClickedLoadMoreBtn:(CZFooterView *)footerView
{
    //
    CZGroupBuying *gb = [[CZGroupBuying alloc] init];
    gb.title = @"牛腩王";
    gb.price = @"15";
    gb.buyCount = @"1000";
    gb.icon = @"2c97690e72365e38e3e2a95b934b8dd2";
    //
    [self.groupBuyings addObject:gb];
    
//    [self.tableView reloadData];
    
    //插入新的cell
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.groupBuyings.count - 1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    //滚动到指定cell的底部
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    
    //重新加载tableView中已经有得cell
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.groupBuyings.count - 1 inSection:0];
//    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}







@end
