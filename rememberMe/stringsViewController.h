//
//  stringsViewController.h
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 20..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef void (^stringWithBlock)(NSString *string);

@interface stringsViewController : NSWindowController
{
	IBOutlet NSTextView *textView;
}
@property (nonatomic,copy) stringWithBlock newStringBlock;
- (void)changeString:(stringWithBlock)block;
- (void)toggleVisibility:(bool)aVisible;
- (IBAction)done:(id)sender;

@end
