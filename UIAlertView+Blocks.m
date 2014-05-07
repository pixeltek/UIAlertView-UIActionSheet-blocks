//
//  UIAlertView+Blocks.m
//  FileBrowser
//
//  Created by yanbin on 14-5-3.
//  Copyright (c) 2014 pixeltek. All rights reserved.
//

#import "UIAlertView+Blocks.h"
#import <objc/runtime.h>

static NSString *BLOCK_ASS_KEY = @"com.pixeltek.BLOCK";


@interface UIAlertViewBlockObj : NSObject
@property (copy, nonatomic) void (^action)(UIAlertView *alert, int buttonIndex);
@end
@implementation UIAlertViewBlockObj
@end

@implementation UIAlertView (Blocks)

- (void)setBlock:(void (^)(UIAlertView *alert, int buttonIndex)) block
{
    [self setDelegate:self];
    UIAlertViewBlockObj *obj = objc_getAssociatedObject(self, (__bridge const void *)BLOCK_ASS_KEY);
    if (!obj)
    {
        obj = [UIAlertViewBlockObj new];
        obj.action=block;
        objc_setAssociatedObject(self, (__bridge const void *)BLOCK_ASS_KEY, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    obj.action=block;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIAlertViewBlockObj *obj = objc_getAssociatedObject(self, (__bridge const void *)BLOCK_ASS_KEY);
    if (obj.action) {
        obj.action(self, buttonIndex);
    }
    objc_setAssociatedObject(self, (__bridge const void *)BLOCK_ASS_KEY, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
