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
@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong) NSArray *groupBuyings;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController


//1 懒加载
- (NSArray *)groupBuyings
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
    
    self.tableView.tableFooterView = footerView;
    
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








@end
