//
//  UIActionSheet+Blocks.h
//  FileBrowser
//
//  Created by yanbin on 14-5-3.
//  Copyright (c) 2014 pixeltek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActionSheet (Blocks) <UIActionSheetDelegate>

- (void)setBlock:(void (^)(UIActionSheet *actionSheet, int buttonIndex)) block;

@end
