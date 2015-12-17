//
//  CZViewController.m
//  A05-微博
//
//  Created by Apple on 14/12/19.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZViewController.h"
#import "CZMicroBlog.h"
#import "CZMicroBlogCell.h"
#import "CZMicroBlogFrame.h"
@interface CZViewController ()

@property (nonatomic, strong) NSArray *microBlogFrames;

@end

@implementation CZViewController

//1 懒加载
- (NSArray *)microBlogFrames
{
    if (!_microBlogFrames) {
        //加载模型数据
        NSArray *microBlogs = [CZMicroBlog microBlogsList];
        NSMutableArray *frames = [NSMutableArray array];
        for (CZMicroBlog *blog in microBlogs) {
            //创建frame模型对象
            CZMicroBlogFrame *frame = [[CZMicroBlogFrame alloc] init];
            frame.microBlog = blog;
            //
            [frames addObject:frame];
        }
        _microBlogFrames = frames;
    }
    return _microBlogFrames;
}

//- (NSArray *)microBlogs
//{
//    if (!_microBlogs) {
//        _microBlogs = [CZMicroBlog microBlogsList];
//    }
//    return _microBlogs;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //2 测试数据
    
//    self.tableView.rowHeight = 200;
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.microBlogFrames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //1 创建可重用的自定义cell
    CZMicroBlogCell *cell = [CZMicroBlogCell microBlogCellWithTableView:tableView];
    //2 设置子控件的值
    CZMicroBlogFrame *frame = self.microBlogFrames[indexPath.row];
    cell.microBlogFrame = frame;
    //3 返回
    return cell;
}

#pragma mark - tableView的代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CZMicroBlogFrame *frame = self.microBlogFrames[indexPath.row];
    return frame.rowHeight;
}



@end
