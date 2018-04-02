//  openFileDemo YHPreviewItem.h
//  Created 2017/2/23.

#import <Foundation/Foundation.h>
#import <QuickLook/QuickLook.h>
@interface YHPreviewItem : NSObject<QLPreviewItem>
@property (nonatomic, strong) NSString *previewItemTitle;
@property (nonatomic, strong) NSURL *previewItemURL;
@end
