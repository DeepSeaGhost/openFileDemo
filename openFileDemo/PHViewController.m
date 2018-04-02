//  openFileDemo PHViewController.m
//  Created 2018/3/9.
/**
 思路：将加载的预览视图抽离出来 加载到新的控制器上面
 */

#import "PHViewController.h"
#import "YHPreviewController.h"

@interface PHViewController ()

@end

@implementation PHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //文件写入沙盒
    NSString *path = [[NSBundle mainBundle] pathForResource:@"word" ofType:@"doc"];
    NSData *dataWord = [NSData dataWithContentsOfFile:path];
    BOOL resultWord = [dataWord writeToFile:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"word.doc"] atomically:YES];
    if (resultWord) {
        NSLog(@"写入成功");
    }
    [self navigationBar];
}
- (void)navigationBar {
    self.navigationItem.title = @"文章浏览";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(done)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"查看文章" style:UIBarButtonItemStyleDone target:self action:@selector(preview)];
}
- (void)done {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)preview {
    NSString *pathWord = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"word.doc"];
    YHPreviewController *pre = [[YHPreviewController alloc]init];//创建对象
    [pre loadUrlPath:[NSURL fileURLWithPath:pathWord]];//单文件预览
    [self addChildViewController:pre];
    pre.view.frame = CGRectMake(0, -44, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - self.navigationController.navigationBar.bounds.size.height - [[UIApplication sharedApplication] statusBarFrame].size.height);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //延迟一秒显示 文件貌似需要调整
        [self.view addSubview:pre.view];//视图抽离与添加
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
