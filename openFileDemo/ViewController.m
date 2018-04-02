//  openFileDemo ViewController.m
//  Created 2017/2/23.

#import "ViewController.h"
#import "YHPreviewController.h"
#import "YHOpenFileTool.h"

@interface ViewController ()<UIDocumentInteractionControllerDelegate>

@property (nonatomic, weak) UIDocumentInteractionController *documentIntController;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //导航栏设置
    self.title = @"message";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"send" style:UIBarButtonItemStyleDone target:self action:@selector(sendClick:)];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    
    
    
    //文件写入沙盒 营造本地文件氛围
    NSString *path = [[NSBundle mainBundle] pathForResource:@"word" ofType:@"doc"];
    NSData *dataWord = [NSData dataWithContentsOfFile:path];
    BOOL resultWord = [dataWord writeToFile:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"word.doc"] atomically:YES];
    if (resultWord) {
        NSLog(@"写入成功word");
    }
    
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"xlse" ofType:@"xlsx"];
    NSData *dataXlsx = [NSData dataWithContentsOfFile:path2];
    BOOL resultXlsx = [dataXlsx writeToFile:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"xlse.xlsx"] atomically:YES];
    if (resultXlsx) {
        NSLog(@"写入成功xlsx");
    }
    
    UIImage *image = [UIImage imageNamed:@"Bar"];
    NSData *dataImage = UIImageJPEGRepresentation(image, 1.0);
    BOOL resultImage = [dataImage writeToFile:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"Bar.png"] atomically:YES];
    if (resultImage) {
        NSLog(@"写入成功png");
    }
    
    NSString *pathPPT = [[NSBundle mainBundle] pathForResource:@"pptx.pptx" ofType:nil];
    NSData *dataPPT = [NSData dataWithContentsOfFile:pathPPT];
    BOOL resultPPT = [dataPPT writeToFile:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"pptx.pptx"] atomically:YES];
    if (resultPPT) {
        NSLog(@"写入成功PPT");
    }
    
    NSString *pathPDF = [[NSBundle mainBundle] pathForResource:@"pdf.pdf" ofType:nil];
    NSData *dataPDF = [NSData dataWithContentsOfFile:pathPDF];
    BOOL resultPDF = [dataPDF writeToFile:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"pdf.pdf"] atomically:YES];
    if (resultPDF) {
        NSLog(@"写入成功PDF");
    }
}



//点击开启文件预览
- (void)sendClick:(UIBarButtonItem *)barBtn {
    //UIDocumentInteractionController
//    [self documentInteractionController:barBtn];
    
    //QLPreviewController
    [self preViewController];
}


//UIDocumentInteractionController
- (void)documentInteractionController:(UIBarButtonItem *)barBtn {
    
    //根据文件名 获取沙盒文件二进制路径
//    NSString *pathPPT = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"pptx.pptx"];
//    //打开文件 进行预览 参数一 文件路径  参数二 预览显示控制器  参数三 导航栏标题
//    [[YHOpenFileTool sharedOpenfileTool] openFileWithFilePath:pathPPT andViewController:self andNavgationControllerTitleName:@"pptx.pptx"];
    
    
//    NSString *pathPDF = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"pdf.pdf"];
//    [[YHOpenFileTool sharedOpenfileTool] openFileWithFilePath:pathPDF andViewController:self andNavgationControllerTitleName:@"如何掌控自己的时间和生活.pdf"];
    
    
//    NSString *pathWord = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"word.doc"];
//    [[YHOpenFileTool sharedOpenfileTool] openFileWithFilePath:pathWord andViewController:self andNavgationControllerTitleName:@"word.doc"];
    

//    NSString *pathPng = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"Bar.png"];
//    [[YHOpenFileTool sharedOpenfileTool] openFileWithFilePath:pathPng andViewController:self andNavgationControllerTitleName:@"Bar.png"];
    
    
    NSString *pathXlsx = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"xlse.xlsx"];
    [[YHOpenFileTool sharedOpenfileTool] openFileWithFilePath:pathXlsx andBarButtonItem:barBtn andNavgationControllerTitleName:@"xlse.xlsx" andViewController:self];
}


//QLPreViewController
- (void)preViewController {
    //获取沙盒二进制文件路径
    NSString *pathPPT = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"pptx.pptx"];
    NSString *pathPDF = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"pdf.pdf"];
    NSString *pathWord = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"word.doc"];
    NSString *pathPng = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"Bar.png"];
    NSString *pathXlsx = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"xlse.xlsx"];

    
    YHPreviewController *pre = [[YHPreviewController alloc]init];//创建对象
    
//    [pre loadUrlPath:[NSURL fileURLWithPath:path]];//单文件预览
    
    [pre loadUrlPathList:@[[NSURL fileURLWithPath:pathWord],[NSURL fileURLWithPath:pathXlsx],[NSURL fileURLWithPath:pathPPT],[NSURL fileURLWithPath:pathPDF],[NSURL fileURLWithPath:pathPng]] andCurrentPreVItemIndex:0];//多文件预览
    
    //跳转
    [self presentViewController:pre animated:YES completion:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //本地沙盒文件路径
    NSString *pathWord = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"word.doc"];
    
    //创建webView
    UIWebView *webV = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:webV];
    
    //设置request
    NSURL *fileUrl = [NSURL fileURLWithPath:pathWord];
    NSURLRequest *request = [NSURLRequest requestWithURL:fileUrl];
    
    //加载request
    [webV loadRequest:request];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
