//
//  CZMicroBlogFrame.h
//  A05-微博
//
//  Created by Apple on 14/12/19.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#define CZNameFont 15
#define CZTextFont 14

//#import <Foundation/Foundation.h>
//#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@class CZMicroBlog;

@interface CZMicroBlogFrame : NSObject

@property (nonatomic, strong) CZMicroBlog *microBlog;

@property (nonatomic, assign, readonly) CGRect iconFrame;
@property (nonatomic, assign, readonly) CGRect nameFrame;
@property (nonatomic, assign, readonly) CGRect vipFrame;
@property (nonatomic, assign, readonly) CGRect textFrame;
@property (nonatomic, assign, readonly) CGRect pictureFrame;

@property (nonatomic, assign, readonly) CGFloat rowHeight;


@end
