//
//  stringsViewController.m
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 20..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "stringsWindowController.h"
#import "rememberDatas.h"

@implementation stringsWindowController

@synthesize newStringBlock;


-(id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
		NSLog(@"initWithWindow");
    }
    
    return self;
}

- (void)windowDidLoad
{
	textView.string = [[rememberDatas sharedInstance] loadString];
}

- (IBAction)done:(id)sender
{
	[[rememberDatas sharedInstance] saveString:textView.string];
	newStringBlock();
	[self close];
}


- (void)changeString:(stringWithBlock)block
{
	self.newStringBlock = block;
}

- (void)loadString
{
	newStringBlock([[rememberDatas sharedInstance] loadString]);
}

- (void)dealloc
{
	[textView release];
	[newStringBlock release];
	[super dealloc];
}

@end
