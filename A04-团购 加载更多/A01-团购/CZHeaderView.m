//
//  CZHeaderView.m
//  A01-团购
//
//  Created by Apple on 14/12/19.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZHeaderView.h"

@interface CZHeaderView ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation CZHeaderView

//类方法，快速初始化一个对象
+ (instancetype)headerView
{
    CZHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"CZHeaderView" owner:nil options:nil] lastObject];

    return headerView;
}

//当xib中的控件加载完成会调用此方法
- (void)awakeFromNib
{
    CGFloat iconW = self.scrollView.frame.size.width;
    CGFloat iconH = self.scrollView.frame.size.height;
    for (int i = 0; i < 5; i++) {
        NSString *imgName = [NSString stringWithFormat:@"ad_%02d",i];
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.scrollView addSubview:iconView];
        
        iconView.image = [UIImage imageNamed:imgName];
        
        
        CGFloat iconX = i * iconW;
        CGFloat iconY = 0;
        iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    }
    self.scrollView.contentSize = CGSizeMake(5 * iconW, 0);
}

@end
