//
//  UIActionSheet+Blocks.m
//  FileBrowser
//
//  Created by yanbin on 14-5-3.
//  Copyright (c) 2014 pixeltek. All rights reserved.
//

#import "UIActionSheet+Blocks.h"
#import <objc/runtime.h>

static NSString *BLOCK_ASS_KEY = @"com.pixeltek.BLOCK";

@interface UIActionSheetBlockObj : NSObject
@property (copy, nonatomic) void (^action)(UIActionSheet *actionSheet, int buttonIndex);
@end
@implementation UIActionSheetBlockObj
@end

@implementation UIActionSheet (Blocks)

- (void)setBlock:(void (^)(UIActionSheet *actionSheet, int buttonIndex)) block
{
    [self setDelegate:self];
    UIActionSheetBlockObj *obj = objc_getAssociatedObject(self, (__bridge const void *)BLOCK_ASS_KEY);
    if (!obj)
    {
        obj = [UIActionSheetBlockObj new];
        obj.action=block;
        objc_setAssociatedObject(self, (__bridge const void *)BLOCK_ASS_KEY, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    obj.action=block;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIActionSheetBlockObj *obj = objc_getAssociatedObject(self, (__bridge const void *)BLOCK_ASS_KEY);
    if (obj.action) {
        obj.action(self, buttonIndex);
    }
    objc_setAssociatedObject(self, (__bridge const void *)BLOCK_ASS_KEY, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end

