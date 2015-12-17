//
//  CZGroupBuying.h
//  A01-团购
//
//  Created by Apple on 14/12/19.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZGroupBuying : NSObject
@property (nonatomic,copy) NSString *buyCount;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSString *title;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)groupBuyingWithDic:(NSDictionary *)dic;

+ (NSArray *)groupBuyingsList;

@end
