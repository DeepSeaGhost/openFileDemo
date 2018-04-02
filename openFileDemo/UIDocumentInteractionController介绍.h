//  openFileDemo UIDocumentInteractionController介绍.h
//  Created 2017/2/23.

+ (UIDocumentInteractionController *)interactionControllerWithURL:(NSURL *)url; // 创建并设置文件URL路径

@property(nullable, nonatomic, weak) id<UIDocumentInteractionControllerDelegate> delegate; // 代理

@property(nullable, strong)   NSURL    *URL;             // 文件路径
@property(nullable, nonatomic, copy)     NSString *UTI;             // 不知道干嘛用 可以不用设置 determined from name if set, URL otherwise, override if the name or URL uses a custom scheme and the UTI can't be determined automatically
@property(nullable, copy)               NSString *name;            // 文件名  可以用来设置导航栏的title
@property(nonatomic, readonly) NSArray<UIImage *>  *icons;           // 返回一个对应的文件类型 图标
@property(nullable, nonatomic, strong)   id        annotation;      // 不知道干嘛用 可以不用设置 additional plist information for application to pass to receiver (must be a plist object). default is nil.



//这里必须配合代理方法中的 - (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller;  使用
//显示三行  第三行会显示预览出来  但要配合代理使用
- (BOOL)presentOptionsMenuFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated;
//显示三行 第三行会显示预览出来  但要配合代理使用  参数只需要BarButtonItem  然后是否执行动画效果
- (BOOL)presentOptionsMenuFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated;


//预览方法  必须配合代理方法中  - (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller; 使用
- (BOOL)presentPreviewAnimated:(BOOL)animated;


//显示三行  第三行不会显示预览
- (BOOL)presentOpenInMenuFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated;
//显示三行  第三行不会显示预览
- (BOOL)presentOpenInMenuFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated;


//不怎么使用  以下只是猜测 可以自定义 也可结合gestureRecognizers 这个属性进行操作
//返回到预览
- (void)dismissPreviewAnimated:(BOOL)animated;
//返回到三行提示栏
- (void)dismissMenuAnimated:(BOOL)animated;



// 手势识别数组  可以获取到添加到类中的手势 然后修改点击次数 点击手指个数等信息
@property(nonatomic, readonly) NSArray<__kindof UIGestureRecognizer *> *gestureRecognizers;

@end



//delegate
@optional
//设置返回  返回的控制器  告诉预览的时候 视图该显示在哪里
- (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller;

// If preview is supported, these provide the view and rect that will be used as the starting point for the animation to the full screen preview.
// The actual animation that is performed depends upon the platform and other factors.
// If documentInteractionControllerRectForPreview is not implemented, the specified view's bounds will be used.
// If documentInteractionControllerViewForPreview is not implemented, the preview controller will simply fade in instead of scaling up.
- (CGRect)documentInteractionControllerRectForPreview:(UIDocumentInteractionController *)controller;
- (nullable UIView *)documentInteractionControllerViewForPreview:(UIDocumentInteractionController *)controller;

//即将开始预览
- (void)documentInteractionControllerWillBeginPreview:(UIDocumentInteractionController *)controller;
//已经结束预览
- (void)documentInteractionControllerDidEndPreview:(UIDocumentInteractionController *)controller;

//即将显示三行(带预览) 菜单
- (void)documentInteractionControllerWillPresentOptionsMenu:(UIDocumentInteractionController *)controller;
//已经退出三行(带预览)菜单
- (void)documentInteractionControllerDidDismissOptionsMenu:(UIDocumentInteractionController *)controller;

//即将显示三行(不带预览) 菜单
- (void)documentInteractionControllerWillPresentOpenInMenu:(UIDocumentInteractionController *)controller;
//已经退出三行(不带预览)菜单
- (void)documentInteractionControllerDidDismissOpenInMenu:(UIDocumentInteractionController *)controller;

// Synchronous.  May be called when inside preview.  Usually followed by app termination.  Can use willBegin... to set annotation.
- (void)documentInteractionController:(UIDocumentInteractionController *)controller willBeginSendingToApplication:(nullable NSString *)application;	 // bundle ID
- (void)documentInteractionController:(UIDocumentInteractionController *)controller didEndSendingToApplication:(nullable NSString *)application;

// Used to handle additional menu items that can be performed on the item specified by URL.  Currently only supports the "copy:", "print:" and "saveToCameraRoll:" actions.
- (BOOL)documentInteractionController:(UIDocumentInteractionController *)controller canPerformAction:(nullable SEL)action NS_DEPRECATED_IOS(3_2, 6_0);
- (BOOL)documentInteractionController:(UIDocumentInteractionController *)controller performAction:(nullable SEL)action NS_DEPRECATED_IOS(3_2, 6_0);
