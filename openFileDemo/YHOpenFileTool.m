//  openFileDemo YHOpenFileTool.m
//  Created 2017/2/23.

#import <UIKit/UIKit.h>
#import <QuickLook/QuickLook.h>
#import "YHOpenFileTool.h"

@interface YHOpenFileTool ()<UIDocumentInteractionControllerDelegate>

@property (nonatomic, strong) UIDocumentInteractionController *documentIntController;

@property (nonatomic, weak) UIViewController *viewController;

@end

@implementation YHOpenFileTool
static YHOpenFileTool *_openFileTool;
+ (instancetype)sharedOpenfileTool {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _openFileTool = [[self alloc]init];
        [_openFileTool setNavgationBarAndTabBar];
    });
    return _openFileTool;
}


/*
 * parameter  本地文件路径
 * parameter  显示所在控制器
 * parameter  预览导航栏的标题
 */
- (void)openFileWithFilePath:(NSString *)filePath andViewController:(UIViewController *)viewController andNavgationControllerTitleName:(NSString *)name {
    self.viewController = viewController;
    self.documentIntController = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:filePath]];
    self.documentIntController.name = name;
    self.documentIntController.delegate = self;
    
    
//    [self.documentIntController presentOptionsMenuFromRect:viewController.view.bounds inView:viewController.view animated:YES];//显示提示框 再选择是否开启预览
    
    
//    [self.documentIntController presentOpenInMenuFromRect:viewController.view.bounds inView:viewController.view animated:YES];//显示提示框 但是第三行不能选择预览
    
    
    [self.documentIntController presentPreviewAnimated:YES];//直接预览  然后在预览中选择是否使用其他软件打开
}


/*
 * parameter  本地文件路径
 * parameter  点击的导航栏BarButtonItem
 * parameter  显示所在控制器
 * parameter  预览导航栏的标题
 */
- (void)openFileWithFilePath:(NSString *)filePath andBarButtonItem:(UIBarButtonItem *)barButtonItem andNavgationControllerTitleName:(NSString *)name andViewController:(UIViewController *)viewController {
    self.viewController = viewController;
    self.documentIntController = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:filePath]];
    self.documentIntController.name = name;
    self.documentIntController.delegate = self;
    
    
//    [self.documentIntController presentOptionsMenuFromBarButtonItem:barButtonItem animated:YES];//显示提示框 再选择是否开启预览
    
    
//    [self.documentIntController presentOpenInMenuFromBarButtonItem:barButtonItem animated:YES];//显示提示框 但是第三行不能选择预览
    
    
    [self.documentIntController presentPreviewAnimated:YES];//直接预览  然后在预览中选择是否使用其他软件打开
}

#pragma mark -- 设置导航栏和底部标签栏
- (void)setNavgationBarAndTabBar {
    //获取导航栏
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:[QLPreviewController class], nil];//局部设置
    [navBar setBarTintColor:[UIColor whiteColor]];//导航栏颜色
    [navBar setTintColor:[UIColor blackColor]];//按钮颜色
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];//标题颜色
    //获取标签栏
    UIToolbar *toolBar = [UIToolbar appearanceWhenContainedIn:[QLPreviewController class], nil];
    //    [toolBar setBackgroundImage:[UIImage imageNamed:@"Bar"] forToolbarPosition:UIBarPositionBottom barMetrics:UIBarMetricsDefault];
    [toolBar setTintColor:[UIColor blackColor]];
}

#pragma mark -- UIDocumentInteractionControllerDelegate
//返回的控制器  指明预览将在那个控制器上进行 不进行设置 无法进行预览
- (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller {
    return self.viewController;
}


@end
