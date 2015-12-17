//
//  CZGroupBuyingCell.h
//  A01-团购
//
//  Created by Apple on 14/12/19.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZGroupBuying;

@interface CZGroupBuyingCell : UITableViewCell
@property (nonatomic, strong) CZGroupBuying *groupBuying;

+ (instancetype)groupBuyingCellWithTableView:(UITableView *)tableView;
@end
