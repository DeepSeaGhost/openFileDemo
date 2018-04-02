//  openFileDemo YHPreviewController.m
//  Created 2017/2/23.

#import "YHPreviewController.h"
#import "YHPreviewItem.h"

@interface YHPreviewController ()<QLPreviewControllerDelegate,QLPreviewControllerDataSource>

@property (nonatomic, strong) NSMutableArray *fileUrlList;
@end

@implementation YHPreviewController

- (NSMutableArray *)fileUrlList {
    if (!_fileUrlList) {
        _fileUrlList = [NSMutableArray array];
    }
    return _fileUrlList;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.dataSource = self;
    [self setNavgationBarAndTabBar];//设置导航栏
}

#pragma mark -- QLPreviewControllerDelegate  QLPreviewControllerDataSource
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller {
    return self.fileUrlList.count;
}
- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index {
    //自定义标题名  不根据文件名设置 感觉并没有什么卵用  多文件还是会显示1/4之类  单文件倒是可以用用 设定个别样的标题栏什么的  不设置的话 系统就会跟着文件名进行设置
//    YHPreviewItem *item = [[YHPreviewItem alloc]init];
//    item.previewItemURL = self.fileUrlList[index];
//    item.previewItemTitle = @"title";
//    return item;
    return self.fileUrlList[index];
}


#pragma mark -- 设置导航栏和底部标签栏
- (void)setNavgationBarAndTabBar {
    //获取导航栏
//    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:[YHPreviewController class], nil];//局部设置
    UINavigationBar *navBar = [UINavigationBar appearance];//全局
    [navBar setBarTintColor:[UIColor whiteColor]];//导航栏颜色
    [navBar setTintColor:[UIColor blackColor]];//按钮颜色
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];//标题颜色
    
    //获取标签栏
    UIToolbar *toolBar = [UIToolbar appearanceWhenContainedIn:[YHPreviewController class], nil];
//    [toolBar setBackgroundImage:[UIImage imageNamed:@"Bar"] forToolbarPosition:UIBarPositionBottom barMetrics:UIBarMetricsDefault];
    [toolBar setTintColor:[UIColor blackColor]];
}

#pragma mark -- 数据加载
//加载数据 同时设置当前预览的文件  多文件
- (void)loadUrlPathList:(NSArray *)urlPathList andCurrentPreVItemIndex:(NSInteger)index {
    for (NSURL *urlPath in urlPathList) {
        if ([YHPreviewController canPreviewItem:urlPath]) {
            [self.fileUrlList addObject:urlPath];
        }
    }
    self.currentPreviewItemIndex = index;
    [self reloadData];
}
//单文件
- (void)loadUrlPath:(NSURL *)fileUrl {
    if ([YHPreviewController canPreviewItem:fileUrl]) {
        [self.fileUrlList addObject:fileUrl];
    }
    [self reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
