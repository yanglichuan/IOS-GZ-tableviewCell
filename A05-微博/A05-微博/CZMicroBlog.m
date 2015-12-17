//
//  CZMicroBlog.m
//  A05-微博
//
//  Created by Apple on 14/12/19.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZMicroBlog.h"

@implementation CZMicroBlog
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


+ (instancetype)microBlogWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *)microBlogsList
{
    //加载plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"microblog" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    
    //字典转模型
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        CZMicroBlog *microBlog = [CZMicroBlog microBlogWithDic:dic];
        [tmpArray addObject:microBlog];
    }
    return tmpArray;
}
@end
