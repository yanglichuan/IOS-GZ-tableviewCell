//
//  CZMicroBlogFrame.m
//  A05-微博
//
//  Created by Apple on 14/12/19.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZMicroBlogFrame.h"

#import "CZMicroBlog.h"

@implementation CZMicroBlogFrame

//计算文字的大小
- (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize
{
    //    CGSize maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    //计算文本的大小
    CGSize nameSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
    return nameSize;
}


//重写属性的setter方法，取得模型数据 计算frame  计算行高
- (void)setMicroBlog:(CZMicroBlog *)microBlog
{
    _microBlog = microBlog;
    
    CGFloat margin = 10;
    //头像
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    //昵称
//    CGSize maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
//    //计算文本的大小
//    CGSize nameSize = [self.microBlog.name boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    CGSize nameSize = [self sizeWithText:self.microBlog.name maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) fontSize:CZNameFont];
    CGFloat nameX = CGRectGetMaxX(_iconFrame) + margin;
    CGFloat nameY = iconY + (iconH - nameSize.height)/2;
    _nameFrame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    //会员
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    CGFloat vipY = nameY;
    CGFloat vipX = CGRectGetMaxX(_nameFrame) + margin;
    _vipFrame = CGRectMake(vipX, vipY, vipW, vipH);
    //微博内容
    CGSize textSize = [self sizeWithText:self.microBlog.text maxSize:CGSizeMake(355, MAXFLOAT) fontSize:CZTextFont];
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_iconFrame) + margin;
    _textFrame = (CGRect){{textX,textY},textSize}; //CGRectMake(textX, textY, textSize.width, textSize.height);
//    CGSize size = {4,5};
    
    
    //微博图片
    if (self.microBlog.picture) {
        CGFloat pictureW = 100;
        CGFloat pictureH = 100;
        CGFloat pictureX = iconX;
        CGFloat pictureY = CGRectGetMaxY(_textFrame) + margin;
        _pictureFrame = (CGRect){{pictureX,pictureY},{pictureW,pictureH}};

        _rowHeight = CGRectGetMaxY(_pictureFrame) + margin;
    }else{
        _rowHeight = CGRectGetMaxY(_textFrame) + margin;
    }

}

@end
