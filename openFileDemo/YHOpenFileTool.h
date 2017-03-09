//
//  YHOpenFileTool.h
//  FileTest
//
//  Created by zhaohaifang on 2017/2/23.
//  Copyright © 2017年 iOS开发部YH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHOpenFileTool : NSObject

+ (instancetype)sharedOpenfileTool;

//通过自定义按钮点击 开启UIDocumentIntractionController选择打开文件
- (void)openFileWithFilePath:(NSString *)filePath andViewController:(UIViewController *)viewController andNavgationControllerTitleName:(NSString *)name;

//通过导航栏BarButtonItem 开启UIDocumentIntractionController选择打开文件
- (void)openFileWithFilePath:(NSString *)filePath andBarButtonItem:(UIBarButtonItem *)barButtonItem andNavgationControllerTitleName:(NSString *)name andViewController:(UIViewController *)viewController;
@end
