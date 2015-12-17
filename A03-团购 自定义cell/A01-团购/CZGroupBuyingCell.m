//
//  CZGroupBuyingCell.m
//  A01-团购
//
//  Created by Apple on 14/12/19.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZGroupBuyingCell.h"
#import "CZGroupBuying.h"
@interface CZGroupBuyingCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *priceView;
@property (weak, nonatomic) IBOutlet UILabel *buyCountView;

@end

@implementation CZGroupBuyingCell
//创建自定义可重用的cell对象
+ (instancetype)groupBuyingCellWithTableView:(UITableView *)tableView
{
    static NSString *reuseId = @"gb";
    CZGroupBuyingCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CZGroupBuyingCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

//重写属性的setter方法，给子控件赋值
- (void)setGroupBuying:(CZGroupBuying *)groupBuying
{
    _groupBuying = groupBuying;
    
    self.titleView.text = groupBuying.title;
    self.priceView.text = [NSString stringWithFormat:@"￥ %@",groupBuying.price];
    self.buyCountView.text = [NSString stringWithFormat:@"%@人已购买",groupBuying.buyCount];
    self.iconView.image = [UIImage imageNamed:groupBuying.icon];
}


@end
