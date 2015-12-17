//
//  CZMicroBlogCell.m
//  A05-微博
//
//  Created by Apple on 14/12/19.
//  Copyright (c) 2014年 itcast. All rights reserved.
//



#import "CZMicroBlogCell.h"
#import "CZMicroBlog.h"
#import "CZMicroBlogFrame.h"
@interface CZMicroBlogCell ()

@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *nameView;
@property (nonatomic, weak) UIImageView *vipView;
@property (nonatomic, weak) UILabel *textView;
@property (nonatomic, weak) UIImageView *pictureView;

@end

@implementation CZMicroBlogCell

//1 创建可以重用的自定义cell的对象
+ (instancetype)microBlogCellWithTableView:(UITableView *)tableView
{
    static NSString *reuseId = @"blog";
    CZMicroBlogCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    return cell;
}

//2 重写构造方法，初始化（创建自定义cell内部的子控件）
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
       //创建子控件
       //头像
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        //昵称
        UILabel *nameView = [[UILabel alloc] init];
        [self.contentView addSubview:nameView];
        self.nameView = nameView;
        //
        nameView.font = [UIFont systemFontOfSize:CZNameFont];
        //会员
        UIImageView *vipView = [[UIImageView alloc] init];
        [self.contentView addSubview:vipView];
        self.vipView = vipView;
        self.vipView.image = [UIImage imageNamed:@"vip"];
        //微博内容
        UILabel *textView = [[UILabel alloc] init];
        [self.contentView addSubview:textView];
        self.textView = textView;
        textView.font = [UIFont systemFontOfSize:CZTextFont];
        textView.numberOfLines = 0;
        //微博图片
        UIImageView *pictureView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureView];
        self.pictureView = pictureView;
    }
    return self;
}

//3 重写属性的setter方法  设置子控件的值
//- (void)setMicroBlog:(CZMicroBlog *)microBlog
//{
//    _microBlog = microBlog;
//    //设置子控件显示的内容
//    [self setSubViewsContent];
//    //设置子控件的frame
//    [self setSubViewsFrame];
//}
- (void)setMicroBlogFrame:(CZMicroBlogFrame *)microBlogFrame
{
    _microBlogFrame = microBlogFrame;
    //设置子控件显示的内容
    [self setSubViewsContent];
    //设置子控件的frame
    [self setSubViewsFrame];
}


//设置子控件显示的内容
- (void)setSubViewsContent
{
    CZMicroBlog *microBlog = self.microBlogFrame.microBlog;
    self.iconView.image = [UIImage imageNamed:microBlog.icon];
    self.nameView.text = microBlog.name;
    
    
    //如果不是会员，隐藏
    if (!microBlog.isVip) {
        //非会员
        self.vipView.hidden = YES;
        self.nameView.textColor = [UIColor blackColor];
    }else{
        self.vipView.hidden = NO;
        //是会员
        self.nameView.textColor = [UIColor redColor];
    }
    self.textView.text = microBlog.text;
    if(microBlog.picture)
    {
        self.pictureView.image = [UIImage imageNamed:microBlog.picture];
    }
}
//设置子控件的frame
- (void)setSubViewsFrame
{
    self.iconView.frame = self.microBlogFrame.iconFrame;
    self.nameView.frame = self.microBlogFrame.nameFrame;
    self.vipView.frame = self.microBlogFrame.vipFrame;
    self.textView.frame = self.microBlogFrame.textFrame;
    self.pictureView.frame = self.microBlogFrame.pictureFrame;
    
    
//    CGFloat margin = 10;
//    //头像
//    CGFloat iconW = 30;
//    CGFloat iconH = 30;
//    CGFloat iconX = margin;
//    CGFloat iconY = margin;
//    self.iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
//    //昵称
////    CGSize maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
////    //计算文本的大小
////    CGSize nameSize = [self.microBlog.name boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
//    CGSize nameSize = [self sizeWithText:self.microBlog.name maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) fontSize:CZNameFont];
//    CGFloat nameX = CGRectGetMaxX(self.iconView.frame) + margin;
//    CGFloat nameY = iconY + (iconH - nameSize.height)/2;
//    self.nameView.frame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
//    //会员
//    CGFloat vipW = 14;
//    CGFloat vipH = 14;
//    CGFloat vipY = nameY;
//    CGFloat vipX = CGRectGetMaxX(self.nameView.frame) + margin;
//    self.vipView.frame = CGRectMake(vipX, vipY, vipW, vipH);
//    //微博内容
//    CGSize textSize = [self sizeWithText:self.microBlog.text maxSize:CGSizeMake(355, MAXFLOAT) fontSize:CZTextFont];
//    CGFloat textX = iconX;
//    CGFloat textY = CGRectGetMaxY(self.iconView.frame) + margin;
//    self.textView.frame = (CGRect){{textX,textY},textSize}; //CGRectMake(textX, textY, textSize.width, textSize.height);
////    CGSize size = {4,5};
//    
//    CGFloat height;
//    //微博图片
//    if (self.microBlog.picture) {
//        CGFloat pictureW = 100;
//        CGFloat pictureH = 100;
//        CGFloat pictureX = iconX;
//        CGFloat pictureY = CGRectGetMaxY(self.textView.frame) + margin;
//        self.pictureView.frame = (CGRect){{pictureX,pictureY},{pictureW,pictureH}};
//        
//        height = CGRectGetMaxY(self.pictureView.frame) + margin;
//    }else{
//        height = CGRectGetMaxY(self.textView.frame) + margin;
//    }
    
    
    
}
////计算文字的大小
//- (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize
//{
////    CGSize maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
//    //计算文本的大小
//    CGSize nameSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
//    return nameSize;
//}

@end
