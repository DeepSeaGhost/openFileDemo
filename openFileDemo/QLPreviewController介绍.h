//  openFileDemo QLPreviewController介绍.h
//  Created 2017/2/23.


//是否可以打开指定路径的文件   item传路径url  进入QLPreviewItem 最后看到NSURL子类遵守了<QLPreviewItem>
+ (BOOL)canPreviewItem:(id <QLPreviewItem>)item;


//代理 数据源
@property(nonatomic, weak, nullable) id <QLPreviewControllerDataSource> dataSource;
@property(nonatomic, weak, nullable) id <QLPreviewControllerDelegate> delegate;


//刷新
- (void)reloadData;


//刷新当前预览视图
- (void)refreshCurrentPreviewItem;



//当前预览地址 在预览地址数组中下标
@property NSInteger currentPreviewItemIndex;


//当前预览地址
@property(readonly, nullable) id <QLPreviewItem> currentPreviewItem;
@end

/*!
 * @abstract The QLPreviewControllerDataSource protocol declares the methods that the Preview Controller uses to access the contents of its data source object.
 */
QL_EXPORT @protocol QLPreviewControllerDataSource

@required

//总预览数组大小
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller;

//预览数组中各下标对应地址对象 （NSURL）
- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index;

@end




QL_EXPORT @protocol QLPreviewControllerDelegate <NSObject>
@optional


//即将离开预览视图
- (void)previewControllerWillDismiss:(QLPreviewController *)controller;

//已经离开预览视图
- (void)previewControllerDidDismiss:(QLPreviewController *)controller;


/*!
 * @abstract Invoked by the preview controller before trying to open an URL tapped in the preview.
 * @result Returns NO to prevent the preview controller from calling -[UIApplication openURL:] on url.
 * @discussion If not implemented, defaults is YES.
 */
- (BOOL)previewController:(QLPreviewController *)controller shouldOpenURL:(NSURL *)url forPreviewItem:(id <QLPreviewItem>)item;

/*!
 * @abstract Invoked when the preview controller is about to be presented full screen or dismissed from full screen, to provide a zoom effect.
 * @discussion Return the origin of the zoom. It should be relative to view, or screen based if view is not set. The controller will fade in/out if the rect is CGRectZero.
 */
- (CGRect)previewController:(QLPreviewController *)controller frameForPreviewItem:(id <QLPreviewItem>)item inSourceView:(UIView * _Nullable * __nonnull)view;

/*!
 * @abstract Invoked when the preview controller is about to be presented full screen or dismissed from full screen, to provide a smooth transition when zooming.
 * @param contentRect The rect within the image that actually represents the content of the document. For example, for icons the actual rect is generally smaller than the icon itself.
 * @discussion Return an image the controller will crossfade with when zooming. You can specify the actual "document" content rect in the image in contentRect.
 */
- (UIImage *)previewController:(QLPreviewController *)controller transitionImageForPreviewItem:(id <QLPreviewItem>)item contentRect:(CGRect *)contentRect;

/*!
 * @abstract Invoked when the preview controller is about to be presented full screen or dismissed from full screen, to provide a smooth transition when zooming.
 * @discussion  Return the view that will crossfade with the preview.
 */
- (UIView* _Nullable)previewController:(QLPreviewController *)controller transitionViewForPreviewItem:(id <QLPreviewItem>)item NS_AVAILABLE_IOS(10_0);
