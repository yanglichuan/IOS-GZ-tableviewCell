//
//  CZFooterView.h
//  A01-团购
//
//  Created by Apple on 14/12/19.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZFooterView;
//1 定义代理协议
@protocol CZFooterViewDelegate <NSObject>

@optional
- (void)footerViewDidClickedLoadMoreBtn:(CZFooterView *)footerView;

@end

@interface CZFooterView : UIView
//2 定义代理属性
@property (nonatomic, weak) id<CZFooterViewDelegate> delegate;

+ (instancetype)footerView;
@end
