//
//  ViewController.m
//  A01-团购
//
//  Created by Apple on 14/12/19.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZGroupBuying.h"
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
    //1 创建可重用的cell
    static NSString *reuseId = @"gb";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
        //从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CZGroupBuyingCell" owner:nil options:nil] lastObject];
        
        //从xib中加载view的另一种方式
//        UINib *nib = [UINib nibWithNibName:@"CZGroupBuyingCell" bundle:nil];
//        cell = [[nib instantiateWithOwner:nil options:nil] lastObject];
    }

    //2 设置cell内部的子控件
    //2.1 获取当前要展示的数据
    CZGroupBuying *gb = self.groupBuyings[indexPath.row];
    //2.2 设置值
//    cell.textLabel.text = gb.title;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"￥%@",gb.price];
//    cell.imageView.image = [UIImage imageNamed:gb.icon];
    
    
    UILabel *titleView = (UILabel *)[cell viewWithTag:10];
    titleView.text = gb.title;
    
    //3 返回
    return cell;
}








@end
