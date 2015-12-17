//
//  CZMicroBlogCell.h
//  A05-微博
//
//  Created by Apple on 14/12/19.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZMicroBlogFrame;
@interface CZMicroBlogCell : UITableViewCell
//@property (nonatomic, strong) CZMicroBlog *microBlog;

@property (nonatomic, strong) CZMicroBlogFrame *microBlogFrame;

+ (instancetype)microBlogCellWithTableView:(UITableView *)tableView;
@end
