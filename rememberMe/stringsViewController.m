//
//  stringsViewController.m
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 20..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "stringsViewController.h"

@implementation stringsViewController

@synthesize newStringBlock;

-(id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
		
    }
    
    return self;
}

- (IBAction)done:(id)sender
{
	[self toggleVisibility:NO];
}

- (void)toggleVisibility:(bool)aVisible
{
	if (aVisible) 
    {
		[self showWindow:self];
	}
	else {
		newStringBlock(textView.string);
		[self close];
		
	}
}

- (void)changeString:(stringWithBlock)block
{
	self.newStringBlock = block;
	
}


@end
