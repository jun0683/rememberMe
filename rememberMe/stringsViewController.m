//
//  stringsViewController.m
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 20..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "stringsViewController.h"
#import "rememberDatas.h"

@implementation stringsViewController

@synthesize newStringBlock;


-(id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
    }
    
    return self;
}

- (void)windowDidLoad
{
	textView.string = [[rememberDatas sharedInstance] loadString];
}

- (IBAction)done:(id)sender
{
	newStringBlock(textView.string);
	[[rememberDatas sharedInstance] saveString:textView.string];
	[self toggleVisibility:NO];
}

- (void)toggleVisibility:(bool)aVisible
{
	if (aVisible) 
    {
		[self showWindow:self];
	}
	else {
		
		[self close];
		
	}
}

- (void)changeString:(stringWithBlock)block
{
	self.newStringBlock = block;
}

- (void)loadString
{
	newStringBlock([[rememberDatas sharedInstance] loadString]);
}


@end
