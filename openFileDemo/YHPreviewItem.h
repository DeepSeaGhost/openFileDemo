//
//  YHPreviewItem.h
//  FileTest
//
//  Created by zhaohaifang on 2017/2/24.
//  Copyright © 2017年 iOS开发部YH. All rights reserved.

#import <Foundation/Foundation.h>
#import <QuickLook/QuickLook.h>
@interface YHPreviewItem : NSObject<QLPreviewItem>
@property (nonatomic, strong) NSString *previewItemTitle;
@property (nonatomic, strong) NSURL *previewItemURL;
@end
