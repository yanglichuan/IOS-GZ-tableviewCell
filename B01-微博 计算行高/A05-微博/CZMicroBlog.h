//
//  CZMicroBlog.h
//  A05-微博
//
//  Created by Apple on 14/12/19.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZMicroBlog : NSObject
@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *picture;

@property (nonatomic,assign,getter=isVip) BOOL vip;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)microBlogWithDic:(NSDictionary *)dic;

+ (NSArray *)microBlogsList;
@end

