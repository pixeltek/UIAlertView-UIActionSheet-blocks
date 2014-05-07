UIAlertView-UIActionSheet-blocks
================================

A category for UIAlertView/UIActionSheet which allows you to use blocks to handle the pressed button events rather than implementing a delegate.

HOW TO USE IT

UIActionSheet:

    UIActionSheet *sheet=[[UIActionSheet alloc]initWithTitle:nil
                                                    delegate:nil
                                           cancelButtonTitle:@"Cancel"
                                      destructiveButtonTitle:nil
                                           otherButtonTitles:@"Action 1", @"Action 2", nil];
    [sheet setBlock:^(UIActionSheet *actionSheet, int buttonIndex) {
        NSLog(@"action=%d", buttonIndex);
    }];
    [sheet showFromBarButtonItem:sender animated:YES];
    
UIAlertView:

    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"title"
                                                 message:@"message"
                                                delegate:nil
                                       cancelButtonTitle:@"Cancel"
                                       otherButtonTitles:@"button 1",@"button 2",nil];
    [alert setBlock:^(UIAlertView *alert, int buttonIndex) {
        NSLog(@"alert=%d", buttonIndex);
    }];
    [alert show];

 
