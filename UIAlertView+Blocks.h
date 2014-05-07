//
//  UIAlertView+Blocks.h
//  FileBrowser
//
//  Created by yanbin on 14-5-3.
//  Copyright (c) 2014 pixeltek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Blocks)

- (void)setBlock:(void (^)(UIAlertView *alert, int buttonIndex)) block;

@end
