//
//  stringsViewController.h
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 20..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef void (^stringWithBlock)();

@interface stringsWindowController : NSWindowController
{
	IBOutlet NSTextView *textView;
//	NSString *storedString;
}
@property (nonatomic,copy) stringWithBlock newStringBlock;


- (void)loadString;
- (void)changeString:(stringWithBlock)block;
- (IBAction)done:(id)sender;

@end
