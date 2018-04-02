//  openFileDemo YHPreviewController.h
//  Created 2017/2/23.
//  使用QLPreviewController 需要导入框架QuickLook.framework

#import <QuickLook/QuickLook.h>
#import <UIKit/UIKit.h>
@interface YHPreviewController : QLPreviewController

//多文件预览
- (void)loadUrlPathList:(NSArray *)urlPathList andCurrentPreVItemIndex:(NSInteger)index;

//单文件预览
- (void)loadUrlPath:(NSURL *)fileUrl;
@end
